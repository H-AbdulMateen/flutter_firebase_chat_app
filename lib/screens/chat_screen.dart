
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('chats/cdxhDjL22F3QOHCL8BRY/messages').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator(),);
          } else{
              var document = snapshot.data.documents;
              return ListView.builder(
                  itemCount: document.length,
                  itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(8.0),
                      child: Text(document[index]['text'])));
            }
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Firestore.instance.collection('chats/cdxhDjL22F3QOHCL8BRY/messages').add({
            'text': 'Data added by clicking button!'
          });
        },
      ),
    );
  }
}
