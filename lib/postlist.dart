import 'package:crud_http/post_details.dart';
import 'package:flutter/material.dart';
import 'http.dart';


class PostList extends StatelessWidget {
  PostList({super.key});
  final Future<List<Map>> _future = HTTPhrlper().fetchitem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: FutureBuilder<List<Map>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("Some error${snapshot.error}");
          }
          if (snapshot.hasData) {
            List<Map> post = snapshot.data;

            return ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) {
                Map thisItem = post[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: const Color.fromARGB(255, 247, 252, 249),
                    title: Text(
                      thisItem["title"],
                      style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      thisItem["body"],
                      style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetails(
                              thisItem["id"].toString(),
                            ),
                          ));
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}