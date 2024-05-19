import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class ImgProvider extends ChangeNotifier {
  Uint8List? _selectedImage;
  String? _fileName;
  Uint8List? get selectedImage => _selectedImage;
  String? get fileName => _fileName;
  void selecteImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      _selectedImage = result.files.first.bytes!;
      _fileName = result.files.first.name;
    } else {
      // User canceled the picker
    }
    notifyListeners();
  }

  void clearImage() {
    _selectedImage = null;
    _fileName = null;
    notifyListeners();
  }
}
