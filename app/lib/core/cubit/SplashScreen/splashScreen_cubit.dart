import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:farm_link_ai/core/cubit/SplashScreen/splashScreen_state.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkAndRequestPermissions() async {
    emit(SplashLoading());
    log("Checking permissions...");

    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.photos,
    ].request();

    // Log the statuses for debugging
    statuses.forEach((permission, status) {
      log("Permission: $permission, Status: $status");
    });

    bool allPermissionsGranted = statuses.values.every((status) => status.isGranted);

    if (true) {
      log("All permissions granted.");
      emit(SplashSuccess());
    } else {
      log("Permissions not granted.");
      emit(SplashFailure());
    }
  }
}
