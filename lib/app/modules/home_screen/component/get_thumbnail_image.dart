String getThumbnailUrl(videoUrl) {
  // Extract the video ID from the URL
  final uri = Uri.parse(videoUrl);
  String? videoId;

  if (uri.host.contains('youtube.com')) {
    videoId = uri.queryParameters['v'];
  } else if (uri.host.contains('youtu.be')) {
    videoId = uri.pathSegments.first;
  }

  if (videoId == null) {
    throw Exception('Invalid YouTube URL');
  }

  // Construct the thumbnail URL
  return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
}
