import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:segmentation_flutter_client/services/base_service.dart';

part 'image_processing_store.g.dart';

class ImageProcessingStore = _ImageProcessingStore with _$ImageProcessingStore;

abstract class _ImageProcessingStore with Store {
  @observable
  File? selectedImage;

  @observable
  File? processedImage;

  final picker = ImagePicker();

  ///////////////////////////////////////////////////

  @observable
  ObservableFuture<File?> fetchSegmentationFuture = emptySegmentationResponse;

  @computed
  bool get hasSegmentation =>
      fetchSegmentationFuture != emptySegmentationResponse &&
      fetchSegmentationFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<File?> emptySegmentationResponse = ObservableFuture.value(null);

  ///////////////////////////////////////////////////

  @observable
  ObservableFuture<PickedFile?> fetchImageSelectionFuture = emptyImageSelectionResponse;

  @computed
  bool get hasImageSelection =>
      fetchImageSelectionFuture != emptyImageSelectionResponse &&
      fetchImageSelectionFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<PickedFile?> emptyImageSelectionResponse = ObservableFuture.value(null);

  ///////////////////////////////////////////////////

  @action
  Future<File?> selectImage() async {
    selectedImage = null;
    processedImage = null;
    final future = picker.getImage(source: ImageSource.gallery);
    fetchImageSelectionFuture = ObservableFuture(future);
    final pickedFile = await future;
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
    }
    return selectedImage;
  }

  @action
  Future<File?> segmentRetinaVessels({required File imageFile}) async {
    processedImage = null;
    final future = imageProcessingService.segmentRetinaVessels(imageFile);
    fetchSegmentationFuture = ObservableFuture(future);
    processedImage = await future;
    return processedImage;
  }
}
