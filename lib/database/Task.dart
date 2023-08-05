class Task{
  late int id;
  late String title;
  late String des;
  late String date;
  late String time;
  late String type;

  Task({required this.id,
    required this.time,
    required this.des,
    required this.date,
    required this.title,
    required this.type});

  Task.fromMap(Map<String,dynamic> data){
    id = data['id'];
    title = data['title'];
    des = data['des'];
    date = data['date'];
    time = data['Time'];
    type=data['TYPE'];
  }

}