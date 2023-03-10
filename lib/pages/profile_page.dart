import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_db/models/past_order.dart';
import 'package:project_db/models/user.dart';
import 'package:project_db/repos/authenticated_user_repo.dart';
import 'package:project_db/services/data_service.dart';

import '../components/error.dart';
import '../components/load_indicator.dart';
import '../consts/strings.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({this.userID = "-1", Key? key}) : super(key: key);

  final String userID;

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  // ignore: prefer_typing_uninitialized_variables


  @override
  Widget build(BuildContext context) {
    AsyncValue<User> user = ref.watch(userFromDatabase);
    debugPrint(user.toString());


    return SafeArea(
        child: Scaffold(
            body: RefreshIndicator(
                onRefresh: () async {
                  user = ref.refresh(userFromDatabase);
                },
                child: CustomScrollView(slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                          onPressed: () {
                            //TODO edit will be add
                          },
                          icon: const Icon(Icons.edit))
                    ],
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          user.when(
                              data: (data) =>

                              const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              loading: () =>
                              const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              error: (error, stack) =>
                              const CircleAvatar(
                                child: Icon(Icons.error, color: Colors.red),
                              )),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Expanded(
                                child: user.when(
                                  data: (data) =>
                                      Text(
                                        data.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                  loading: () => const CircularProgressIndicator(),
                                  error: (error, stack) =>
                                  const Text(Strings.error),
                                ),
                              ),
                              Text(
                                user.when(
                                  data: (data) => data.score.toString(),
                                  loading: () => '',
                                  error: (error, stack) => '',
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  user.when(
                      data: (data) {
                        final Future<List<PastOrder>> pastOrders = ref.watch(dataServiceProvider).getPastOrders(data.id);


                        return SliverList(
                              delegate: SliverChildListDelegate([
                                Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.email),
                                      title: Text(data.email),
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.phone),
                                      title: Text(data.phone),
                                    ),

                                  FutureBuilder<List<PastOrder>>(
                                    future: pastOrders,
                                    builder: (context, AsyncSnapshot<List<PastOrder>> snapshot) {

                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        debugPrint("console: $snapshot");
                                        return Column(
                                          children: [
                                            const Text("Past Orders"),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: snapshot.data == null
                                                  ? 0
                                                  : snapshot.data!.length,
                                              itemBuilder: (context, index) {
                                                debugPrint(snapshot.data![index].toString());
                                                return ListTile(
                                                  leading: Image.network(snapshot.data![index].imageUrl),
                                                  title: Text(snapshot.data![index].name),
                                                  subtitle: Text(snapshot.data![index].price.toString()),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        debugPrint("console: $snapshot");
                                        return const Text("Ürün bulunamadı");
                                      }
                                      return const LoadIndicator();
                                    },

                                    )

                                  ],
                                ),
                              ]));
                      },
                      loading: () =>
                          SliverList(
                            delegate: SliverChildListDelegate([
                              const LoadIndicator(),
                            ]),
                          ),
                      error: (error, stack) =>
                          SliverList(
                              delegate:
                              SliverChildListDelegate(
                                  [ErrorView(error: error)]))),
                ]))));
  }
}
