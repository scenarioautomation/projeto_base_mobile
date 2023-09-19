import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController {

  Future<String?> selectImage({
    required ImageSource imageSource,
    bool crop = true,
  }) async {
    final pickedImage = await _pickImage(imageSource);
    if (pickedImage == null) return null;
    if (crop) return (await _cropImage(pickedImage));
    return pickedImage.path;
  }

  Future<XFile?> _pickImage(ImageSource imageSource) async {
    return ImagePicker().pickImage(source: imageSource,imageQuality: 50);
  }

  Future<String?> _cropImage(XFile pickedFile) async {
    return (await ImageCropper().cropImage(sourcePath: pickedFile.path,
      cropStyle: CropStyle.rectangle,
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
    ))?.path;
  }
}
