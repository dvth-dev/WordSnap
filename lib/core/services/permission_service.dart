import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static final PermissionService _instance = PermissionService._();

  static PermissionService get instance => _instance;

  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      final result = await Permission.camera.request();
      return result.isGranted;
    }

    if (status.isPermanentlyDenied) {
      return false;
    }

    return false;
  }

  Future<bool> isCameraPermanentlyDenied() async {
    return await Permission.camera.isPermanentlyDenied;
  }

  Future openSettings() async {
    await openAppSettings();
  }
}
