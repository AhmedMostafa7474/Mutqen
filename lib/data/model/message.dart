class message
{
  String content;
  String type;
  String owner;
  DateTime time;

  message(this.content, this.type, this.owner, this.time);
}
List<message> messages = [message("اهلا علاء","text" ,"receiver", DateTime.now()),
  message("اهلا وسهلا", "text","sender", DateTime.now()),
  message("كيف حالك ؟","text","receiver", DateTime.now()),
];