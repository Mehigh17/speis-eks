class Links {
  final String missionPatch;
  final String missionPatchSmall;
  final String redditCampaign;
  final String redditLaunch;
  final String redditRecovery;
  final String redditMedia;
  final String presskit;
  final String articleLink;
  final String wikipedia;
  final String videoLink;
  final String youtubeId;
  final List<String> flickrImages;

  Links({
    this.missionPatch,
    this.missionPatchSmall,
    this.redditCampaign,
    this.redditLaunch,
    this.redditRecovery,
    this.redditMedia,
    this.presskit,
    this.articleLink,
    this.wikipedia,
    this.videoLink,
    this.youtubeId,
    this.flickrImages,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
        missionPatch: json["mission_patch"],
        missionPatchSmall: json["mission_patch_small"],
        redditCampaign: json["reddit_campaign"],
        redditLaunch: json["reddit_launch"],
        redditRecovery: json["reddit_recovery"],
        redditMedia: json["reddit_media"],
        presskit: json["presskit"],
        articleLink: json["article_link"],
        wikipedia: json["wikipedia"],
        videoLink: json["video_link"],
        youtubeId: json["youtube_id"],
        flickrImages: List<String>.from(json["flickr_images"]));
  }
}
