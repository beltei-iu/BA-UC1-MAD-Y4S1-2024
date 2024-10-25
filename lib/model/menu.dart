
class Menu {

  String? name;
  String? nameKh;

  Menu(this.name, this.nameKh);

  factory Menu.fromJson(Map<String,dynamic> json) => Menu(json["name"], json["nameKh"]);

  Map<String,dynamic> toJson() => {
    "name": name,
    "nameKh" : nameKh
  };

}