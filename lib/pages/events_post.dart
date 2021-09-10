import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_bloc.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_event_and_state.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_repo.dart';
import 'package:hagerawi_app/pages/quiz.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_state.dart';
import 'package:hagerawi_app/admin_feeds/admin_feeds_model.dart';
import 'package:hagerawi_app/pages/feeds.dart';


class AdminEvents extends StatelessWidget {
  static const String routeName = '/admin_events';
  AdminEvents({Key? key}) : super(key: key);

  final titleTextController = TextEditingController();
  final imgUrlController = TextEditingController();
  final descController = TextEditingController();
  final authorController = TextEditingController();
  final detailedTextController = TextEditingController();

 
  //final formKey = GlobalKey<FormState>();
  final _myKey2 = GlobalKey<ScaffoldState>();
  Future<AdminFeedsModel>? _futureFeed;

  Widget build(BuildContext context) {
     final ButtonStyle style =
        ElevatedButton.styleFrom(
    primary: Colors.grey.shade200.withAlpha(120), // background
    onPrimary: Colors.white, 
    alignment: Alignment.centerRight// foreground
  );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
        body: BlocProvider(
          create: (context) => AdminFeedBloc(AdminFeedRepo()),

          child: SafeArea(
            child: BlocBuilder<AdminFeedBloc,AdminFeedState>
            (builder: (ctx,state) {

              final adminFeedBloc = BlocProvider.of<AdminFeedBloc>(ctx);

              if (state is FeedsUploaded){  
                Navigator.pushNamed(context, Feeds.routeName);
               } else if (state is AdminFeedsNotUploaded){
                  return Center(
                  child: Text("${state.errorMsg}"),
                );
               }
              return Center(
            
                  child: Container(
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
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                    child: ListView(
              padding: const EdgeInsets.all(40),
              children: <Widget>[
                
                Container(
                  height: 100,
                  child: Center(
              
              child: Row(
              children:<Widget>[
              Expanded(
                child: Padding(padding:
                EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Align(
                  alignment:Alignment.centerRight,
                  child:Text('Event Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25
                  )
                )
                )),
                ),
              Expanded(
                child: TextField(
                  controller: titleTextController ,
                  cursorHeight: 15,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2,
                    
                  ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Event Name',
                
                ),
                )
              )
              ],
              
                    
              ),
              )
                ),
                
                Container(
                  height: 100,
                  
                  child: Center(
              
              child: Row(
              children: <Widget>[
              Expanded(
                child: Padding(padding:
                EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: const Align(
                  alignment:Alignment.centerRight,
                  child:Text('Place',
                style: TextStyle(
                  fontSize: 25
                  )
                )
                )),
                ),
              Expanded(
                child: TextField(
                  controller: detailedTextController ,
                  cursorHeight: 15,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2,
                    
                  ),
                decoration: InputDecoration(
                  
                  
                  border: OutlineInputBorder(),
                  labelText: 'Place',
                
                ),
                )
              )
              ],
              
                    
              ),
              )
                ),
                Container(
                  height: 100,
                  
                  child: Center(
              
              child: Row(
              children:<Widget>[
              Expanded(
                child: Padding(padding:
                EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Align(
                  alignment:Alignment.centerRight,
                  child:Text('Description',
                style: TextStyle(
                  fontSize: 25
                  )
                )
                )),
                ),
              Expanded(
                child: TextField(
                  controller: descController ,
                  cursorHeight: 15,
                  style: TextStyle(
                    fontSize: 15,
                    height: 2,
                  ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                
                ),
                )
              )
              ],
              ),
              )
                ),
               
                
          Container(
            height: 100,
            child: Center(
              child: Row(
              children:<Widget>[
              Expanded(
                child: Padding(padding:
                EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Align(
                  alignment:Alignment.centerRight,
                  child:Text('Author',
                style: TextStyle(
                  fontSize: 25
                  )
                )
                )),
                ),
              Expanded(
                child: TextField(
                  controller: authorController ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Author',
                
                ),
                )
              )
              ],
              
                    
              ),
              )
              
                ),
                
                
                Container(
                  height: 500,
                  alignment: Alignment.topCenter,
                  child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                 BlocConsumer<AdminFeedBloc, AdminFeedState>(
                      listener: (ctx, adminFeedState) {
                        if (adminFeedState is PostAdminFeedsEvent) {
                          Navigator.of(context).pushNamed(Quiz.routeName);
                        }
                      },
                      builder: (ctx, adminFeedState) {
                        Widget buttonChild = Text("Login");
                    
                        if (adminFeedState is FeedsUploading) {
                          buttonChild = SizedBox(
                            height: 20,
                            width: 20,
                            child: Text("logging in"),
                            //CircularProgressIndicator(
                             // color: Colors.white,
                           // ),
                          );
                        }
                    
                        if (adminFeedState is AdminFeedsNotUploaded) {
                          buttonChild = Text(adminFeedState.errorMsg);
                        }
                    
                        return ElevatedButton(
                          onPressed: () {
                            adminFeedBloc.add(PostAdminFeedsEvent(
                              titleTextController.text,
                              descController.text,
                              detailedTextController.text,
                              authorController.text));
                          },
                          child: buttonChild,
                        );
                      },
                    ),
                  
              ],
                  ),
                ),
                
              ],
                    ),
                    ),
                  );
            },
            ),
          ),
        ),
        );
    
  }
}
void haya(){
    print("text");
  
  }
