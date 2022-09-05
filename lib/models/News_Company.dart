class NewsCompany {
    String? date;
    String? description;
    String? descriptionuz;
    int? id;
    String? imagepath;
    String? title;
    String? titleuz;

    NewsCompany(
        {this.date,
            this.description,
            this.descriptionuz,
            this.id,
            this.imagepath,
            this.title,
            this.titleuz});

    factory NewsCompany.fromJson(Map<String, dynamic> json) {
        return NewsCompany(
            date: json['date'],
            description: json['description'],
            descriptionuz: json['descriptionuz'],
            id: json['id'],
            imagepath: json['imagepath'],
            title: json['title'],
            titleuz: json['titleuz']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['description'] = this.description;
        data['descriptionuz'] = this.descriptionuz;
        data['id'] = this.id;
        data['imagepath'] = this.imagepath;
        data['title'] = this.title;
        data['titleuz'] = this.titleuz;
        return data;
    }
}