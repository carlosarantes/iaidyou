class HelpCategory {

    int id;
    String name;

    HelpCategory();

    HelpCategory.fromJson(Map<String, dynamic> json) : 
      id = json['id'],
      name = json['name'];

    Map<String, dynamic> toJson() => {
      'id' : id,
      'name' : name,
    };
}