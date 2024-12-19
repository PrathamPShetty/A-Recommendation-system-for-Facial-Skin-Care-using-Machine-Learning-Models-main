
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:farm_link_ai/consts/host.dart';

part 'state_cubit.dart';

class SkinCareCubit extends Cubit<SkinCareState> {
  SkinCareCubit() : super(SkinCareInitial());

  final ImagePicker _picker = ImagePicker();
  File? _selectedFile;

  Future<void> chooseFile() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _selectedFile = File(image.path);
        emit(SkinCareFileSelected(file: _selectedFile!));
      }
    } catch (e) {
      emit(SkinCareError(message: 'Failed to pick an image.'));
    }
  }

  Future<void> recommendSkinCare() async {
    if (_selectedFile == null) {
      emit(SkinCareError(message: 'No file selected.'));
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
          emit(SkinCareError(message: 'Failed to analyze skin.'));
        }
      } else {
        emit(SkinCareError(message: 'Failed to load recommendations.'));
      }
    } catch (e) {
      emit(SkinCareError(message: 'An error occurred while analyzing the skin.'));
    }
  }
}
