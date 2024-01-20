import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter/material.dart';
import 'package:segmentation_flutter_client/screens/image_processing_store.dart';

import '../widgets/oops_widget.dart';

class ImageProcessing extends StatefulWidget {
  const ImageProcessing({super.key});

  @override
  ImageProcessingState createState() => ImageProcessingState();
}

class ImageProcessingState extends State<ImageProcessing> {
  late ImageProcessingStore store;

  @override
  void initState() {
    store = ImageProcessingStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retina Segmentation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Center(child: _buildRawImage())),
            _selectImageButton(),
            _segmentRetinaVesselsButton(),
            Expanded(child: Center(child: _buildProcessedImage())),
          ],
        ),
      ),
    );
  }

  Widget _buildRawImage() {
    return Observer(
      builder: (_) {
        switch (store.fetchImageSelectionFuture.status) {
          case FutureStatus.pending:
            return const Center(child: CircularProgressIndicator.adaptive());
          case FutureStatus.rejected:
            return const OopsWidget();
          case FutureStatus.fulfilled:
            return store.selectedImage == null
                ? const Text('No selected image')
                : Image.file(store.selectedImage!);
        }
      },
    );
  }

  Widget _selectImageButton() {
    return ElevatedButton(
      onPressed: () => store.selectImage(),
      child: const Text('Select the retina image'),
    );
  }

  Widget _segmentRetinaVesselsButton() {
    return ElevatedButton(
      onPressed: () => store.selectedImage != null
          ? store.segmentRetinaVessels(imageFile: store.selectedImage!)
          : null,
      child: const Text('Segment Retina Vessels'),
    );
  }

  Widget _buildProcessedImage() {
    return Observer(
      builder: (_) {
        switch (store.fetchSegmentationFuture.status) {
          case FutureStatus.pending:
            return const Center(child: CircularProgressIndicator.adaptive());
          case FutureStatus.rejected:
            return const OopsWidget();
          case FutureStatus.fulfilled:
            return store.processedImage == null
                ? const Text('No segmented image.')
                : Image.file(store.processedImage!);
        }
      },
    );
  }
}
