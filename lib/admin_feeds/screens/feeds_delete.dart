import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_feeds/bloc/admin_feeds_bloc.dart';
import 'package:hagerawi_app/admin_feeds/bloc/admin_feeds_event.dart';
import 'package:hagerawi_app/admin_feeds/bloc/admin_feeds_state.dart';
import 'package:hagerawi_app/admin_feeds/repository/admin_feeds_repo.dart';

class PostEvents extends StatelessWidget {
  PostEvents({Key? key}) : super(key: key);
  static const String routeName = "/deleteFeed";

  final id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          title: Center(
            child: Text(
              'Delete Feed',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => AdminFeedBloc(AdminFeedRepo()),
          child: BlocBuilder<AdminFeedBloc, AdminFeedState>(
            builder: (ctx, state) {
              final adminBloc = BlocProvider.of<AdminFeedBloc>(ctx);

              if (state is FeedsUploaded) {
                return Center(
                  child: Text("Deleted feed successfully"),
                );
              } else if (state is FeedsUploading) {
                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.grey.shade600,
                          Colors.blueGrey.shade800,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.blueGrey.shade200,
                        ),
                        SizedBox(height: 14),
                        Text(
                          "Deleting feed...",
                          style: TextStyle(
                              fontSize: 15, color: Colors.blueGrey.shade200),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    theItems(id, "ID of feed to delete..."),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      height: 45,
                      margin:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey,
                        ),
                        onPressed: () {
                          print("at the post button");
                          adminBloc.add(DeleteFeedEvent(id.toString()));
                        },
                        child: Text("Delete"),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget theItems(ctr, String hint) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade800,
          ),
          width: 300,
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          child: TextField(
            controller: ctr,
            cursorHeight: 45,
            style: TextStyle(fontSize: 25, color: Colors.white24),
            decoration: InputDecoration(hintText: hint),
          ),
        ),
      ],
    );
  }
}
