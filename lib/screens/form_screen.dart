import 'package:facdet/utils/custom_textfield.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  String gender = "Male";

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Please Enter Your Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [

              CustomTextField(
                label: "Full Name",
                controller: nameController,
                keyboardType: TextInputType.name,
                icon: Icons.person,
              ),

              const SizedBox(height: 16),

              CustomTextField(
                label: "Age",
                controller: ageController,
                keyboardType: TextInputType.number,
                icon: Icons.cake,
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: gender,
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(
                  value: g,
                  child: Text(g),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  print(nameController.text);
                  print(ageController.text);
                  print(gender);
                },
                child: const Text("Continue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
