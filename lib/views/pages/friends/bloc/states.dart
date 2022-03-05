abstract class FriendsStates {}

class FriendsInitialState extends FriendsStates {}

class GetSearchSuccessState extends FriendsStates {}

class GetSearchLoadingState extends FriendsStates {}

class GetSearchErrorState extends FriendsStates {
  final String error;

  GetSearchErrorState(this.error);
}

class GetFriendsSuccessState extends FriendsStates {}

class GetFriendsLoadingState extends FriendsStates {}

class GetFriendsErrorState extends FriendsStates {
  final String error;

  GetFriendsErrorState(this.error);
}
