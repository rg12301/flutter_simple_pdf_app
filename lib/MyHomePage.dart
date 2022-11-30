import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_simple_pdf_app/PdfPreviewScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MyHomePage extends StatelessWidget {
  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return <pw.Widget>[
            pw.Header(
                level: 0,
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('Geeksforgeeks', textScaleFactor: 2),
                    ])),
            pw.Header(level: 1, text: 'What is Lorem Ipsum?'),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. '),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. '),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. '),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. '),
            pw.Header(level: 1, text: 'This is Header'),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Consectetur adipiscing elit duis tristique sollicitudin nibh sit. '),
            pw.Paragraph(
                text:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nunc mi ipsum faucibus vitae aliquet nec. Nibh cras pulvinar mattis nunc sed blandit libero volutpat. Vitae elementum curabitur vitae nunc sed velit. Nibh tellus molestie nunc non blandit massa. Bibendum enim facilisis gravida neque. Arcu cursus euismod quis viverra nibh cras pulvinar mattis. Enim diam vulputate ut pharetra sit. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum. Consectetur adipiscing elit duis tristique sollicitudin nibh sit. '),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Table.fromTextArray(context: context, data: const <List<String>>[
              <String>['Year', 'Sample', 'Color', 'Marks'],
              <String>['SN0', 'GFG1', 'Black', '654'],
              <String>['SN1', 'GFG2', 'Green', '786'],
              <String>['SN2', 'GFG3', 'Orange', '363'],
              <String>['SN3', 'GFG4', 'White', '323'],
            ]),
          ];
        }));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/example.pdf");
    file.writeAsBytesSync(List.from(await pdf.save()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Test Application"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  'Preview PDF',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                onPressed: () async {
                  writeOnPdf();
                  await savePdf();

                  Directory documentDirectory =
                      await getApplicationDocumentsDirectory();
                  String documentPath = documentDirectory.path;
                  String fullPath = "$documentPath/example.pdf";

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfPreviewScreen(
                                path: fullPath,
                              )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
