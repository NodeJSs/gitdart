class User{
  String name;
  String location;
  String bio;
  int publicRepos;
  int followers;
  int following;

  User({
    this.name,
    this.bio,
    this.followers,
    this.following,
    this.location,
    this.publicRepos
  });


  User.fromJson(Map<String, dynamic> json){
    this.name = json["name"];
    this.location = json["location"];
    this.following = json["following"];
    this.followers = json["followers"];
    this.bio = json["bio"];
    this.publicRepos = json["public_repos"] ?? json["publicRepos"];
  }

  Map<String, dynamic> toJson(){
    return {
      "name": this.name,
      "bio": this.bio,
      "following": this.following,
      "followers": this.followers,
      "publicRepos": this.publicRepos
    };
  }
}