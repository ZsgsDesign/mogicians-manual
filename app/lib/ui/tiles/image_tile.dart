import 'package:flutter/material.dart';
import 'package:mogicians_manual/data/list_items.dart';
import 'package:mogicians_manual/ui/image_viewer.dart';
import 'package:mogicians_manual/utils/share_helper.dart';


class ImageTile extends StatefulWidget {
  ImageTile(this.item, this.isTablet);

  final ImageItem item;
  final bool isTablet;

  @override
  State createState() => _ImageTileState();
}

const double paddingTablet = 8.0;
const double paddingPhone = 4.0;

class _ImageTileState extends State<ImageTile> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.all(widget.isTablet ? paddingTablet : paddingPhone),
      child: Card(
        shape: BeveledRectangleBorder(),
        color: Colors.white,
        elevation: 2,
        child: InkWell(
          onTap: () => _openImageViewer(),
          onLongPress: () => shareImage(widget.item),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: Text(
                widget.item.title,
                style: Theme.of(context).textTheme.caption.copyWith(
                  color: Colors.black,
                  fontSize: widget.isTablet ? 15 : 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FadeInImage(
                placeholder: AssetImage(widget.item.path),
                image: AssetImage(widget.item.path))
          ]),
        ),
        margin: EdgeInsets.all(0),
      ));

  void _openImageViewer() {
    Navigator.push(
        context,
        MaterialPageRoute(builder:
            (context) => ImageViewer(widget.item)));
  }
}
