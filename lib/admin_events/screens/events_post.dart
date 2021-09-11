import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_events/bloc/admin_events_bloc.dart';
import 'package:hagerawi_app/admin_events/bloc/admin_events_event.dart';
import 'package:hagerawi_app/admin_events/bloc/admin_events_state.dart';
import 'package:hagerawi_app/admin_events/repository/admin_event_repo.dart';

class PostEvents extends StatelessWidget {
  PostEvents({Key? key}) : super(key: key);
  static const String routeName = "/PostEvents";

  final postedBy = TextEditingController();
  final title = TextEditingController();
  final content = TextEditingController();
  final location = TextEditingController();
  final attendees = TextEditingController();
  final imgUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          title: Center(
              child: Text(
            'New Events',
            style: TextStyle(fontSize: 30),
          )),
        ),
        body: BlocProvider(
          create: (context) => AdminEventBloc(AdminEventRepo()),
          child: BlocBuilder<AdminEventBloc, AdminEventState>(
            builder: (ctx, state) {
              final adminBloc = BlocProvider.of<AdminEventBloc>(ctx);

              if (state is EventsUploaded) {
                return Center(
                  child: Text("Posted events successfully"),
                );
              } else if (state is EventsUploading) {
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
                          "Posting events...",
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
                    theItems(imgUrl, "imgUrl"),
                    SizedBox(height: 10),
                    theItems(attendees, "attendees"),
                    SizedBox(height: 10),
                    theItems(postedBy, "postedBy"),
                    SizedBox(height: 10),
                    theItems(title, "title"),
                    SizedBox(height: 10),
                    theItems(location, "location"),
                    SizedBox(height: 10),
                    theItems(content, "content"),
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
                          adminBloc.add(
                            PostEventsEvent(
                                imgUrl.text,
                                attendees.text,
                                postedBy.text,
                                title.text,
                                location.text,
                                content.text),
                          );
                        },
                        child: Text("Post"),
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
