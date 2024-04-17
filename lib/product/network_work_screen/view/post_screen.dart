import 'package:auto_route/auto_route.dart';
import 'package:demo/core/utilty/padding_items.dart';
import 'package:demo/product/network_work_screen/model/post_model.dart';
import 'package:demo/product/network_work_screen/viewmodel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<PostModel>? liste;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) async {
        await context.read<PostViewModel>().fetchData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen"),
      ),
      body: context.watch<PostViewModel>().isLoading
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            )
          : _listViewBuilderPost(context.watch<PostViewModel>().liste),
    );
  }

  Widget _listViewBuilderPost(List<PostModel>? liste) {
    return liste == null
        ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("null geldi "),
              ),
            ],
          )
        : ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: PaddingItem.small.str(),
                child: Card(
                  child: Padding(
                    padding: PaddingItem.small.str(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("id :${liste[index].id}"),
                        Padding(
                          padding: PaddingItem.topSmall.str(),
                          child: Text("başlık :\n${liste[index].title}"),
                        ),
                        Padding(
                          padding: PaddingItem.topSmall.str(),
                          child: Text("içerik\n${liste[index].body}"),
                        ),
                        Padding(
                          padding: PaddingItem.topSmall.str(),
                          child: Text("User id :${liste[index].userId}"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
