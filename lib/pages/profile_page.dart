import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../consts/strings.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage(
      {this.userID = "-1", Key? key})
      : super(key: key);

  final String userID;


  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  // ignore: prefer_typing_uninitialized_variables
  late final userProvider; // at the initState type can be change that's why we ignore: prefer_typing_uninitialized_variables
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    AsyncValue<dynamic> user = ref.watch(userProvider);
    return Scaffold(
      body: CustomScrollView(slivers: [
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
                    data.image != null
                        ? CircleAvatar(
                      backgroundImage: NetworkImage(data.image),
                    )
                        : const CircleAvatar(
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
                    error: (error, stack) => const Text(Strings.error),
                  ),
                ),

              ],
            ),
          ),
        ),
        user.when(
            data: (data) =>
                SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                        children: [
                        ],
                      ),
                    ])),
            loading: () =>
                SliverList(
                  delegate: SliverChildListDelegate([
                  ]),
                ),
            error: (error, stack) =>
                SliverList(
                    delegate: SliverChildListDelegate([
                      const Center(
                        child: Text(Strings.error),
                      ),
                    ]))),
      ]),
    );
  }
}

