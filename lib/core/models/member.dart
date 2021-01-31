class Member {

  final String name;
  final int currentScore;

  Member(this.name, this.currentScore);

  Member.fromJSON(Map<String, dynamic> json)
  : name = json["name"],
  currentScore = json["current_score"];

  Map<String, dynamic> toJSON() =>
      {
        'name': name,
        'current_score': currentScore
      };
}