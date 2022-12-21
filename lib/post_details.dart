import 'package:flutter/material.dart';
import 'http.dart';

class PostDetails extends StatefulWidget {
  PostDetails(this.itemId, {Key? key}) : super(key: key) {
    _futurePost = HTTPhrlper().getItem(itemId);
  }

  String itemId;
  late Future<Map> _futurePost;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  late Map post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
             ),
      body: SafeArea(
        child: FutureBuilder<Map>(
          future: widget._futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Some error occurred ${snapshot.error}'));
            }

            if (snapshot.hasData) {
              post = snapshot.data!;

              return Container(
                color: const Color.fromARGB(255, 246, 248, 248),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        post["title"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        post["body"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}