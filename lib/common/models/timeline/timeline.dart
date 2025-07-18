import '../../index.dart';
import 'like.dart';
import 'video.dart';

class TimelineModel {
  String? id;
  List<String>? images;
  VideoModel? video;
  String? content;
  String? postType;
  UserModel? user;
  String? publishDate;
  String? location;
  bool? isLike;
  List<LikeModel>? likes;
  List<CommentModel>? comments;

  TimelineModel({
    this.id,
    this.images,
    this.video,
    this.content,
    this.postType,
    this.user,
    this.publishDate,
    this.location,
    this.isLike,
    this.likes,
    this.comments,
  });

  factory TimelineModel.fromJson(Map<String, dynamic> json) => TimelineModel(
    id: json['id'] as String?,
    images: (json['images'] as List<dynamic>?)?.cast<String>(),
    video:
        json['video'] == null
            ? null
            : VideoModel.fromJson(json['video'] as Map<String, dynamic>),
    content: json['content'] as String?,
    postType: json['post_type'] as String?,
    user:
        json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    publishDate: json['publishDate'] as String?,
    location: json['location'] as String?,
    isLike: json['is_like'] as bool?,
    likes:
        (json['likes'] as List<dynamic>?)
            ?.map((e) => LikeModel.fromJson(e as Map<String, dynamic>))
            .toList(),
    comments:
        (json['comments'] as List<dynamic>?)
            ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'images': images,
    'video': video?.toJson(),
    'content': content,
    'post_type': postType,
    'user': user?.toJson(),
    'publishDate': publishDate,
    'location': location,
    'is_like': isLike,
    'likes': likes?.map((e) => e.toJson()).toList(),
    'comments': comments?.map((e) => e.toJson()).toList(),
  };
}
