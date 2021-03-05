import 'package:flutter/material.dart';
import 'package:pics/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return buildImgesList(images);
  }

  Widget buildImgesList(List<ImageModel> images) {
    // images.forEach((image) {});
    // images.map((e) => e != null ? Text(e.title) : Container());
    return ListView.separated(
      itemCount: images.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.network(image.url),
          SizedBox(height: 10),
          Text(image.title),
        ],
      ),
    );
  }
}
