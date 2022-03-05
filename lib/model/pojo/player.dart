abstract class Player {
  bool whiteSide = false;
  bool humanPlayer = false;
  String? name;
  String? image;
  int? rating;
}

class ComputerPlayer extends Player {
  ComputerPlayer(bool whiteSide, int rating) {
    this.whiteSide = whiteSide;
    this.humanPlayer = true;
    this.rating = rating;
    this.name = 'Computer';
    this.image = 'assets/robot.png';
  }
}

class HumanPlayer extends Player {
  HumanPlayer(bool whiteSide, int rating, String name, {String image = 'assets/man.png'}) {
    this.whiteSide = whiteSide;
    this.humanPlayer = false;
    this.rating = rating;
    this.name = name;
    this.image = image;
  }
}
