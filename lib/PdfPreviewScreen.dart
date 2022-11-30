import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class PdfPreviewScreen extends StatelessWidget {
  final String path;
  const PdfPreviewScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      path: this.path,
    );
  }
}
