import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart'; // Add this package
import '../../../core/cubit/customer/recomPage_cubit.dart';
import 'package:farm_link_ai/ui/Customer/resultpage/page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SkinCareCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI Skin Recommendation'),
        ),
        body: BlocConsumer<SkinCareCubit, SkinCareState>(
          listener: (context, state) {
            if (state is SkinCareError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is SkinCareResult) {
              // Navigate to ResultPage when results are available
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    skinType: state.skinType,
                    acneType: state.acneType,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<SkinCareCubit>();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Take a photo after washing face',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: cubit.chooseFile, // Choose file from gallery
                    child: const Text('Choose File'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: cubit.captureFromCamera, // Capture using the camera
                    child: const Text('Capture Photo'),
                  ),
                  const SizedBox(height: 20),
                  if (state is SkinCareFileSelected)
                    Column(
                      children: [
                        const Text('Selected File:'),
                        const SizedBox(height: 10),
                        Image.file(
                          state.file,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: cubit.recommendSkinCare,
                    child: const Text('Get Recommendations'),
                  ),
                  const SizedBox(height: 20),
                  if (state is SkinCareLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
