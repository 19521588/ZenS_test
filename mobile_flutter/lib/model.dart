class JokeDataModel{
  //data Type
  int? id;
  String? joke;
  String? voted;


// constructor
  JokeDataModel(
      {
       this.id,
      this.joke,
      this.voted
      }
   );

  //method that assign values to respective datatype vairables
  JokeDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    joke =json['joke'];
    voted = json['voted'];
    
  }
}
