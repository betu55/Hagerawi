
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EventPost());
}

class EventPost extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Events post',
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text('Post Events'),
        ),
        body: Center(
            child: Container(
              child: ListView(
  padding: const EdgeInsets.all(40),
  children: <Widget>[
    
    Container(
      height: 100,
      
      child: Center(
        
        child: Row(
        children:const <Widget>[
        Expanded(
          child: Padding(padding:
          EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: const Align(
            alignment:Alignment.centerRight,
            child:Text('Event Name',
          style: TextStyle(
            fontSize: 25
            )
          )
          )),
          ),
        Expanded(
          child: TextField(
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
        children:const <Widget>[
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
        children:const <Widget>[
        Expanded(
          child: Padding(padding:
          EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: const Align(
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
        children:const <Widget>[
        Expanded(
          child: Padding(padding:
          EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: const Align(
            alignment:Alignment.centerRight,
            child:Text('Date',
          style: TextStyle(
            fontSize: 25
            )
          )
          )),
          ),
        Expanded(
          child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Date',
          
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
          ElevatedButton(
            
            style: ButtonStyle(
              
              alignment: Alignment.centerRight,
            ),
            onPressed:haya,
            child: const Text('Submit'),
          ),
        ],
      )
      
      
    ),
    
     
  ],
)
)
  
            ,)
            ,
        )

  
        );
    
  }
}
void haya(){
    print("text");
  
  }

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  // While the @required checks for whether a named parameter is passed in,
  // it doesn't check whether the object passed in is null. We check that
  // in the assert statement.
