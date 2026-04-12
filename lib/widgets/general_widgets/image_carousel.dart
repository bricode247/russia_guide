import 'package:flutter/material.dart';
import 'package:russia_guide/data/chapter5/chapter5_data.dart';

class ImageCarousel extends StatelessWidget {
  final List<CarouselItem> items;
  final String title; // Título del bloque (ej. "Tutorial visual: Мой МТС")

  const ImageCarousel({super.key, required this.items, required this.title});

  void _openFullScreen(BuildContext context, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _FullScreenCarousel(items: items, initialIndex: initialIndex, title: title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título del bloque
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xFFD1170E),
          ),
        ),
        const SizedBox(height: 12),
        // Carrusel horizontal de miniaturas
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _openFullScreen(context, index),
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      items[index].imagePath,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 120,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Visor a pantalla completa con navegación horizontal
class _FullScreenCarousel extends StatefulWidget {
  final List<CarouselItem> items;
  final int initialIndex;
  final String title;

  const _FullScreenCarousel({required this.items, required this.initialIndex, required this.title});

  @override
  State<_FullScreenCarousel> createState() => _FullScreenCarouselState();
}

class _FullScreenCarouselState extends State<_FullScreenCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.items.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) {
                return Center(
                  child: Image.asset(
                    widget.items[index].imagePath,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          SafeArea(
            bottom: true,
            top: false,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withValues(alpha: 0.8),
              child: Column(
                children: [
                  Text(
                    '${_currentPage + 1} / ${widget.items.length}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.items[_currentPage].title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.items[_currentPage].description,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}  