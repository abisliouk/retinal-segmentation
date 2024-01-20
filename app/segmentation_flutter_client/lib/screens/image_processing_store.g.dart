// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_processing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageProcessingStore on _ImageProcessingStore, Store {
  Computed<bool>? _$hasSegmentationComputed;

  @override
  bool get hasSegmentation =>
      (_$hasSegmentationComputed ??= Computed<bool>(() => super.hasSegmentation,
              name: '_ImageProcessingStore.hasSegmentation'))
          .value;
  Computed<bool>? _$hasImageSelectionComputed;

  @override
  bool get hasImageSelection => (_$hasImageSelectionComputed ??= Computed<bool>(
          () => super.hasImageSelection,
          name: '_ImageProcessingStore.hasImageSelection'))
      .value;

  late final _$selectedImageAtom =
      Atom(name: '_ImageProcessingStore.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$processedImageAtom =
      Atom(name: '_ImageProcessingStore.processedImage', context: context);

  @override
  File? get processedImage {
    _$processedImageAtom.reportRead();
    return super.processedImage;
  }

  @override
  set processedImage(File? value) {
    _$processedImageAtom.reportWrite(value, super.processedImage, () {
      super.processedImage = value;
    });
  }

  late final _$fetchSegmentationFutureAtom = Atom(
      name: '_ImageProcessingStore.fetchSegmentationFuture', context: context);

  @override
  ObservableFuture<File?> get fetchSegmentationFuture {
    _$fetchSegmentationFutureAtom.reportRead();
    return super.fetchSegmentationFuture;
  }

  @override
  set fetchSegmentationFuture(ObservableFuture<File?> value) {
    _$fetchSegmentationFutureAtom
        .reportWrite(value, super.fetchSegmentationFuture, () {
      super.fetchSegmentationFuture = value;
    });
  }

  late final _$fetchImageSelectionFutureAtom = Atom(
      name: '_ImageProcessingStore.fetchImageSelectionFuture',
      context: context);

  @override
  ObservableFuture<PickedFile?> get fetchImageSelectionFuture {
    _$fetchImageSelectionFutureAtom.reportRead();
    return super.fetchImageSelectionFuture;
  }

  @override
  set fetchImageSelectionFuture(ObservableFuture<PickedFile?> value) {
    _$fetchImageSelectionFutureAtom
        .reportWrite(value, super.fetchImageSelectionFuture, () {
      super.fetchImageSelectionFuture = value;
    });
  }

  late final _$selectImageAsyncAction =
      AsyncAction('_ImageProcessingStore.selectImage', context: context);

  @override
  Future<File?> selectImage() {
    return _$selectImageAsyncAction.run(() => super.selectImage());
  }

  late final _$segmentRetinaVesselsAsyncAction = AsyncAction(
      '_ImageProcessingStore.segmentRetinaVessels',
      context: context);

  @override
  Future<File?> segmentRetinaVessels({required File imageFile}) {
    return _$segmentRetinaVesselsAsyncAction
        .run(() => super.segmentRetinaVessels(imageFile: imageFile));
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
processedImage: ${processedImage},
fetchSegmentationFuture: ${fetchSegmentationFuture},
fetchImageSelectionFuture: ${fetchImageSelectionFuture},
hasSegmentation: ${hasSegmentation},
hasImageSelection: ${hasImageSelection}
    ''';
  }
}
