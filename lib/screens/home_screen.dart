import 'package:flutter/material.dart';
import 'package:facdet/utils/custom_button.dart';
import 'package:facdet/constants/color_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accent,
      appBar: AppBar(
        title: const Text(
          "Let's Detect Your Face",
          style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            const Text(
              "Take a clear photo of your face to begin the analysis",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 30),
            
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.file(_image!, fit: BoxFit.cover),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.face_retouching_natural,
                            size: 80,
                            color: AppColors.primary.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "No Image Selected",
                            style: TextStyle(color: AppColors.textSecondary),
                          ),
                        ],
                      ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    icon: Icons.camera_alt_rounded,
                    label: "Click Photo",
                    isOutlined: true,
                    vertical: true,
                    height: 60,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    icon: Icons.photo_library_rounded,
                    label: "Gallery",
                    isOutlined: true,
                    vertical: true,
                    height: 60,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            if (_image != null)
              CustomButton(
                label: "Analyze & Continue",
                onPressed: () => context.push('/report'),
              ),
          ],
        ),
      ),
    );
  }
}
