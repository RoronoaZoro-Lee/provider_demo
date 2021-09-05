class RewardState {
  num watchAdReward;
  num creationReward;
  num fansReward;

  RewardState() {
    // init some variables
  }

  RewardState.create(
    num watchAdReward,
    num creationReward,
    num fansReward,
  ) {
    this.watchAdReward = watchAdReward;
    this.creationReward = creationReward;
    this.fansReward = fansReward;
  }

  @override
  String toString() {
    return "watchAdReward:$watchAdReward, creationReward:$creationReward, fansReward:$fansReward ,";
  }
}
