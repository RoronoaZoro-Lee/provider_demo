class RewardModel {
  num watchAdReward;
  num creationReward;
  num fansReward;

  RewardModel() {
    // init some variables
  }

  RewardModel.create(
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
