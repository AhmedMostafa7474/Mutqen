import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutqen/resources/assets_manager.dart';
import '../../data/model/message.dart';
class chatroom_page extends StatefulWidget {
  const chatroom_page({Key? key}) : super(key: key);

  @override
  State<chatroom_page> createState() => _chatroom_pageState();
}

class _chatroom_pageState extends State<chatroom_page> {
  var Message= TextEditingController();
 // final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
          appBar: AppBar(
        backgroundColor: const Color(0xFF00796B),
    actions: [

      Row(
    children: [
    Text("${"الميسر"}", style: TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600)),
      SizedBox(width: 5.0,),
      CircleAvatar(
        backgroundImage: AssetImage(ImageAssets.meetingimage),
        maxRadius: 20.0,
      ),
      SizedBox(width: 20,),
    ],
    ),
        ],
          ),
    body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: SingleChildScrollView(
            reverse: true,
            child: ListView.builder(
                itemCount:messages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 14),
                    child: Align(
                      alignment:messages[index].owner == "receiver"?
                      Alignment.topLeft:Alignment.topRight,
                      child: Row(
                        mainAxisAlignment:messages[index].owner
                            == "receiver"?MainAxisAlignment.end:MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color:messages[index].type  == "img"?Colors.transparent:messages[index].owner  ==
                                        "receiver"?Colors.grey.shade200:const Color(0xFF00796B)
                                ),
                                padding: EdgeInsets.all(16.0),
                                child:messages[index].type  == "img"? Container(
                                  height:250 ,
                                  width:250 ,
                                  child: Image(image: NetworkImage(
                                      messages[index].content),
                                    fit: BoxFit.cover,
                                  ),
                                ):
                                Container(
                                  child: Text(messages[index].content,
                                    style: TextStyle(fontSize: 15,
                                      color: messages[index].owner  == "receiver"?
                                      Colors.black:Colors.white
                                      ,),
                                    maxLines: 20,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 2.0,),
                          messages[index].owner == "receiver"?  CircleAvatar(
                            backgroundImage: AssetImage(ImageAssets.meetingimage),
                            maxRadius: 20.0,
                          ):SizedBox(width: 0.0,),
                        ],
                      ),
                    ),);
                }),
          ),
        ),

        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(
                left: 10.0, bottom: 10.0, right: 10.0),
            height: 60.0,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    controller: Message,
                    decoration: InputDecoration(
                        hintText: "اكتب رسالتك...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                FloatingActionButton(
                  onPressed: () async {
                    if(Message.text.isNotEmpty) {
                      messages.add(message(
                          Message.text, "text", "sender", DateTime.now()));
                      Message.clear();
                    }
                    setState(() {

                    });
                  },
                  child: Icon(Icons.send, color: Colors.white,
                    size: 18,),
                  backgroundColor: const Color(0xFF00796B),
                  elevation: 0,
                ),
              ],
            ),
          ),
        )
      ],
    )
          )
      );
  }
}
