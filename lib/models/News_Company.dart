class NewsCompany {
    String date;
    String description;
    int id;
    String imagepath;
    String title;

    NewsCompany({required this.date, required this.description, required this.id, required this.imagepath, required this.title});

    factory NewsCompany.fromJson(Map<String, dynamic> json) {
        return NewsCompany(
            date: json['date'], 
            description: json['description'], 
            id: json['id'], 
            imagepath: json['imagepath'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['description'] = this.description;
        data['id'] = this.id;
        data['imagepath'] = this.imagepath;
        data['title'] = this.title;
        return data;
    }
}