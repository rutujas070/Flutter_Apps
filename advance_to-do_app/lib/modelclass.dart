class TodoClass{
  final int? id;
  final String? title;
  final String? description;
  final String? date;
  TodoClass({
     
     this.id,
     this.title,
     this.description,
     this.date
  });
  Map<String,dynamic>todoData(){
    return{
      "id":id,
      "title":title,
      "description":description,
      "date":date
    };
  }
}