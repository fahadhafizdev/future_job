class Job {
  String id;
  String jobName;
  String imageUrl;
  int createdAt;
  int updatedAt;

  Job({
    this.id,
    this.jobName,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
  });

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobName = json['name'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': jobName,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
