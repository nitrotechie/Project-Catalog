import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class Document extends StatefulWidget {
  const Document({Key? key}) : super(key: key);

  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        backgroundColor: Theme.of(context).canvasColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download),
          )
        ],
      ),
      body: PdfViewer.openAsset(
        "assets/pdf/190303105027_Practical_1.pdf",
      ),
    );
  }
}
