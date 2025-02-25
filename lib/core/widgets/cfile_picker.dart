import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:myapp/core/widgets/ctext_field.dart';
import 'package:myapp/utils/helpers/validation_helper.dart';

class CFilePicker extends StatefulWidget {
  const CFilePicker({super.key, required this.onFilePicked});
  final ValueChanged<PlatformFile?> onFilePicked;

  @override
  State<CFilePicker> createState() => _CFilePickerState();
}

class _CFilePickerState extends State<CFilePicker> {
  PlatformFile? _uploadedFile;

  @override
  Widget build(BuildContext context) {
    return CTextField(
      onTap: _pickFile,
      readOnly: true,
      controller: TextEditingController(text: _uploadedFile?.name),
      labelText: _uploadedFile?.name == null ? null : "Select file to upload",
      hintText:
          _uploadedFile == null ? "Select file to upload" : _uploadedFile?.name,
      suffixIcon: Icon(Icons.upload_file),
      validator: FormValidation.validateRequiredField,
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile pickedFile = result.files.single;
      if (_isValidFile(pickedFile)) {
        widget.onFilePicked.call(pickedFile);
        setState(() => _uploadedFile = pickedFile);
      } else {
        _showError('Invalid file type or size exceeds 5MB');
      }
    }
  }

  bool _isValidFile(PlatformFile file) {
    final validExtensions = ['pdf', 'png', 'jpg', 'gif'];
    final fileExtension = file.name.split('.').last.toLowerCase();
    if (!validExtensions.contains(fileExtension)) {
      return false;
    }
    final fileSize = file.size;
    if (fileSize > 5 * 1024 * 1024) {
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
