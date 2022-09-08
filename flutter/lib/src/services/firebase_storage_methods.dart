import 'package:firebase_storage/firebase_storage.dart';
import 'package:lingo/src/shared/utils/basic_utils.dart';

class StorageMethods {
  final storage = FirebaseStorage.instance;

  final storageRef = FirebaseStorage.instance.ref();

  // Get a non-default Storage bucket
  final storageRef2 = FirebaseStorage.instanceFor(bucket: "gs://lingo-efd2f.appspot.com");

  // // Points to "lingo_files"
  // Reference? lingoFiles = storageRef.child("lingo_files");
  // Reference? lingoFilesImages = storageRef.child("lingo_files/lingo_images");
  // Reference? lingoFilesVideos = storageRef.child("lingo_files/lingo_videos");

  static String getHttpsImageUrl(String gsURI)  {
    String uri = customSplit(gsURI, 5, '/');
    String url = 'https://firebasestorage.googleapis.com/v0/b/lingo-efd2f.appspot.com/o/lingo_files%2Flingo_images%2F$uri?alt=media&token=4b265b11-566e-4e0a-b9f5-a095f072c186';
    return url;
  }

  static String getHttpsVideoUrl(String gsURI)  {
    String uri = customSplit(gsURI, 5, '/');
    String url = 'https://firebasestorage.googleapis.com/v0/b/lingo-efd2f.appspot.com/o/lingo_files%2Flingo_videos%2F$uri?alt=media&token=be8077e2-9f75-4a13-a75e-59a167016da0';
    return url;
  }
}
