import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hagerawi_app/components/sidebar.dart';
import 'package:hagerawi_app/components/fields.dart';
import 'package:hagerawi_app/components/cards.dart';
import 'package:hagerawi_app/event/bloc/blocs.dart';
import 'package:hagerawi_app/event/models/program_model.dart';
import 'package:hagerawi_app/event/repository/program_repository.dart';

// ignore: camel_case_types
class ProgramsPage extends StatefulWidget {
  const ProgramsPage({Key? key}) : super(key: key);
  static const String routeName = '/programs';

  @override
  _ProgramsPageState createState() => _ProgramsPageState();
}

class _ProgramsPageState extends State<ProgramsPage> {
  final _myKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blueGrey.shade900,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   appBarTheme: AppBarTheme(
      //     backwardsCompatibility: false, // 1
      //     systemOverlayStyle: SystemUiOverlayStyle.dark, // 2
      //   ),
      // ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _myKey,
        drawer: Navbar(),
        body: BlocProvider(
          create: (context) => ProgramBloc(ProgramRepository()),
          child: SafeArea(
            child:
                BlocBuilder<ProgramBloc, ProgramState>(builder: (ctx, state) {
              // the first time we get to feeds page
              final programBloc = BlocProvider.of<ProgramBloc>(ctx);

              if (state is ProgramLoading) {
                programBloc.add(LoadProgramsEvent());

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
                          "Loading events...",
                          style: TextStyle(
                              fontSize: 15, color: Colors.blueGrey.shade200),
                        ),
                        // SizedBox(height: 14),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       // feedBloc.add(FetchFeedsEvent());
                        //     },
                        //     child: Text("go to feeds"))
                      ],
                    ),
                  ),
                );
              }
              if (state is ProgramLoaded) {
                // thi is the list of feeds

                List<ProgramModel> theFeeds = state.getEvents;

                return Stack(
                  children: [
                    //main background
                    Container(
                      color: Colors.grey.shade800,
                    ),

                    Expanded(
                      child: ListView.builder(
                          itemCount: theFeeds.length,
                          itemBuilder: (BuildContext context, i) {
                            return TheCard(
                              title: "",
                              author: "",
                              description: "",
                            );
                          }),
                    ),
                  ],
                );
              }
              throw ProgramsNotLoaded();
            }),
          ),
        ),
      ),
    );
  }
}
