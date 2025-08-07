// lib/services/camera_manager.dart

import 'dart:io';

import 'package:eaat/core/managers/permission_manager.dart';
import 'package:image_picker/image_picker.dart';

class CameraManager {
  static final ImagePicker _picker = ImagePicker();

  /// Open camera and return captured image as a File
  static Future<File?> openCameraAndGetImage() async {
    final hasPermission = await AppPermissionManager.requestCameraPermission();

    if (!hasPermission) return null;

    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
