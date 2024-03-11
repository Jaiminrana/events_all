enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == NetworkState.idle;

  bool get isLoading => this == NetworkState.loading;

  bool get isSuccessful => this == NetworkState.success;

  bool get isFailed => this == NetworkState.error;
}

enum EventCategory {
  workshops,
  all,
  music,
  business,
  sports;
}

enum BottomNavPage {
  explore,
  feed,
  profile;

  bool get isExplore => this == BottomNavPage.explore;

  bool get isFeed => this == BottomNavPage.feed;

  bool get isProfile => this == BottomNavPage.profile;

  static BottomNavPage parse(int index) {
    if (index == BottomNavPage.profile.index) {
      return BottomNavPage.profile;
    } else if (index == BottomNavPage.feed.index) {
      return BottomNavPage.feed;
    } else {
      return BottomNavPage.explore;
    }
  }
}
