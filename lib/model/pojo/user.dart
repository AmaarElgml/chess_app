import '../../consts.dart';

class AppUser {
  final String id;
  final String email;
  final String? name;
  final String? image;
  final int rating;
  List? friends;
  List? friendRequests;

  AppUser({required this.id, required this.email, this.name, this.image, this.rating = 1200, friends, friendRequests}) {
    this.friends = friends ?? [];
    this.friendRequests = friendRequests ?? [];
  }

  AppUser.fromMap(Map<String, dynamic> data)
      : id = data[kUserID],
        email = data[kUserEmail],
        name = data[kUsername],
        image = data[kUserImage],
        rating = data[kUserRating],
        friends = data[kUserFriends],
        friendRequests = data[kUserRequests];

  toMap() => {
        kUserID: id,
        kUserEmail: email,
        kUsername: name,
        kUserImage: image,
        kUserRating: rating,
        kUserFriends: friends,
        kUserRequests: friendRequests,
      };
}
