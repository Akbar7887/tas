import 'OptionConstant.dart';

class OptionSet {
    int? id;
    OptionConstant? optionConstant;
    String? optionname;

    OptionSet({ this.id,  this.optionConstant,  this.optionname});

    factory OptionSet.fromJson(Map<String, dynamic> json) {
        return OptionSet(
            id: json['id'], 
            optionConstant: json['optionConstant'] != null ? OptionConstant.fromJson(json['optionConstant']) : null, 
            optionname: json['optionname'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['optionname'] = this.optionname;
        if (this.optionConstant != null) {
            data['optionConstant'] = this.optionConstant?.toJson();
        }
        return data;
    }
}