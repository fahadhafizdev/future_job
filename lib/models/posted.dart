class Posted {
  String id;
  String jobName;
  String imageUrl;
  String company;
  String category;
  String companyLogo;
  String location;
  List about;
  List qualifications;
  List responsibilities;
  int createdAt;
  int updatedAt;

  Posted({
    this.id,
    this.jobName,
    this.company,
    this.imageUrl,
    this.category,
    this.companyLogo,
    this.location,
    this.about,
    this.qualifications,
    this.responsibilities,
    this.createdAt,
    this.updatedAt,
  });

  Posted.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobName = json['name'];
    category = json['category'];
    company = json['companyName'];
    companyLogo = json['companyLogo'];
    location = json['location'];
    about = json['about'];
    qualifications = json['qualifications'];
    responsibilities = json['responsibilities'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': jobName,
      'category': category,
      'companyName': company,
      'companyLogo': companyLogo,
      'location': location,
      'about': about,
      'qualifications': qualifications,
      'responsibilities': responsibilities,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
