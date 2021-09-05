class WatchAdRewardModel {
  String watchTime;
  String createTime;
  String rewardAmount;

  WatchAdRewardModel({this.watchTime, this.createTime, this.rewardAmount});

  WatchAdRewardModel.fromJson(Map<String, dynamic> json) {
    watchTime = json['watchTime'];
    createTime = json['createTime'];
    rewardAmount = json['rewardAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['watchTime'] = this.watchTime;
    data['createTime'] = this.createTime;
    data['rewardAmount'] = this.rewardAmount;
    return data;
  }
}