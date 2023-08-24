import 'package:flutter/src/material/ink_well.dart';

class Data {
  String? id;
  String? genericName;
  String? labelerName;
  String? brandName;
  String? activeIngredients;
  String? strenght;
  String? description;

  //Now let's create the constructor
  Data(
      {this.id,
      this.genericName,
      this.labelerName,
      this.brandName,
      this.activeIngredients,
      this.strenght,
      this.description,
      });

  //And now let's create the function that will map the json into a list
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['product_ndc'],
      genericName: json['generic_name'],
      labelerName: json['labeler_name'],
      brandName: json['brand_name'],
      activeIngredients: json['active_ingredients'][0]['name'],
      strenght: json['active_ingredients'][0]['strenght'],
      description: json['packaging'][0]['description'],
      
    );
  }
}
