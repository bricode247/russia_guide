import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class ReaderScreen extends StatefulWidget {
  final String chapterTitle;
  final int chapterNumber;
  // Por ahora usaremos un PDF de prueba fijo; más adelante cada capítulo tendrá su ruta
  const ReaderScreen({
    super.key,
    required this.chapterTitle,
    required this.chapterNumber,
  });

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  String? _localPath;
  int _currentPage = 1;
  int _totalPages = 0;
  bool _isReady = false;
  final String _pdfAsset = 'assets/capitulo1.pdf'; // PDF de prueba

  @override
  void initState() {
    super.initState();
    _preparePdf();
  }

  // Copia el PDF desde assets a un directorio accesible
  Future<void> _preparePdf() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/capitulo${widget.chapterNumber}.pdf');
    if (!await file.exists()) {
      // Copiar desde assets
      final byteData = await rootBundle.load(_pdfAsset);
      await file.writeAsBytes(byteData.buffer.asUint8List());
    }
    setState(() {
      _localPath = file.path;
      _isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chapterTitle),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        actions: [
          // Menú con opciones (⋮)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'note') {
                // Aquí luego abriremos el editor de apuntes con referencia
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Crear apunte desde aquí (próximamente)')),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'note',
                child: Text('Crear apunte desde aquí'),
              ),
            ],
          ),
        ],
      ),
      body: _isReady && _localPath != null
          ? Stack(
              children: [
                PDFView(
                  filePath: _localPath!,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      _currentPage = (page ?? 0) + 1;
                      _totalPages = total ?? 0;
                    });
                  },
                ),
                // Indicador de página actual
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$_currentPage / $_totalPages',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}