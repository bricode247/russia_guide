import 'package:flutter/material.dart';

class ThreeLayersWidget extends StatelessWidget {
  const ThreeLayersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const layers = [
      {
        'num': '1ª Capa',
        'subtitle': 'Térmica (base)',
        'desc': 'Camiseta y malla larga térmica. Materiales: poliéster técnico o lana merino. Va pegada al cuerpo. Su función: retener el calor corporal.',
        'color': Color(0xFF185FA5),
        'light': Color(0xFFE6F1FB),
      },
      {
        'num': '2ª Capa',
        'subtitle': 'Aislante (media)',
        'desc': 'Forro polar, suéter de lana grueso o chaqueta de plumas fina. Su función: crear una cámara de aire caliente.',
        'color': Color(0xFF3B6D11),
        'light': Color(0xFFEAF3DE),
      },
      {
        'num': '3ª Capa',
        'subtitle': 'Exterior (escudo)',
        'desc': 'Parka o anorak impermeable y cortavientos. Debe cubrir la cadera. Su función: proteger del viento y la nieve.',
        'color': Color(0xFF993C1D),
        'light': Color(0xFFFAECE7),
      },
    ];

    return Column(
      children: layers
          .map(
            (layer) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: (layer['light'] as Color),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: (layer['color'] as Color).withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: layer['color'] as Color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          layer['num'] as String,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          layer['subtitle'] as String,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: layer['color'] as Color),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          layer['desc'] as String,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF2C2C2A),
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}