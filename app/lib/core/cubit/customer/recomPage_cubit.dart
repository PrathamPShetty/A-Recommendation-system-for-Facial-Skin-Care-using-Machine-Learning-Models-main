import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:farm_link_ai/consts/host.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'state_cubit.dart';

class SkinCareCubit extends Cubit<SkinCareState> {
  SkinCareCubit() : super(SkinCareInitial());

  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;

  /// Choose an image file from the gallery
  Future<void> chooseFile() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _selectedFile = File(image.path);
        emit(SkinCareFileSelected(file: _selectedFile!));
      } else {
        emit(SkinCareError(message: 'No file selected.'));
      }
    } catch (e) {
      emit(SkinCareError(message: 'Failed to pick an image.'));
    }
  }

  /// Capture an image using the camera
  Future<void> captureFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        _selectedFile = File(image.path);
        emit(SkinCareFileSelected(file: _selectedFile!));
      } else {
        emit(SkinCareError(message: 'No photo captured.'));
      }
    } catch (e) {
      emit(SkinCareError(message: 'Failed to capture an image.'));
    }
  }

  /// Upload the image and get skin care recommendations
  Future<void> recommendSkinCare() async {
    final prefs = await SharedPreferences.getInstance();
    final host = prefs.getString('host') ?? '';
    if (host.isEmpty) {
      emit(SkinCareError(message: 'Host not set. Please configure the host.'));
      return;
    }
    if (_selectedFile == null) {
      emit(SkinCareError(message: 'No file selected or captured.'));
      return;
    }

    try {
      emit(SkinCareLoading());

      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(_selectedFile!.path),
      });

      Dio dio = Dio();
      final response = await dio.post(
        '$host/upload',
        data: formData,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['skin_type'] != null && data['acne_type'] != null) {
          emit(SkinCareResult(
            skinType: data['skin_type'],
            acneType: data['acne_type'],
          ));
        } else {
          emit(SkinCareError(message: 'Failed to analyze skin. Invalid response.'));
        }
      } else {
        emit(SkinCareError(message: 'Failed to load recommendations.'));
      }
    } catch (e) {
      emit(SkinCareError(message: 'An error occurred while analyzing the skin.'));
    }
  }

  /// Reset the state to initial
  void resetState() {
    _selectedFile = null;
    emit(SkinCareInitial());
  }
}
