// lib/screens/chapter0/chapter0_screen.dart
import '../../data/chapters_repository.dart';
import '../../themes/app_colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/section_header.dart';
import '../../widgets/quiz_card.dart';
import '../../widgets/chapter0/chapter0_widgets.dart'; // todos los demás widgets
import '../../data/chapter0/chapter0_data.dart';
import '../../data/chapter0/chapter0_quizzes.dart';
import '../../models/chapter_model.dart';
import '../../widgets/next_chapter_button.dart';

class Chapter0Screen extends StatelessWidget {
  final Chapter chapter;

  const Chapter0Screen({super.key, required this.chapter});

  double _getImageHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1200) return 320; // Escritorio grande
    if (width >= 800) return 280; // Escritorio pequeño / tablet horizontal
    if (width >= 600) return 240; // Tablet vertical / móvil grande
    return 200; // Móvil pequeño
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capítulo: ${chapter.title}'),
        backgroundColor: AppColors.azulPrimario,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final previous = ChaptersRepository.getPreviousChapter(chapter);
            if (previous != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ChaptersRepository.getScreenForChapter(previous),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── ENCABEZADO (título de bienvenida dentro del contenido) ──
              _buildIntroHeader(context),
              const SizedBox(height: 16),

              // ── FOTO 1: Panorámica de Moscú ──
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/intro/intro_moscow_panorama.jpg',
                  height: _getImageHeight(context),
                  width: double.infinity,
                  fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio sin deformarse
                  cacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round(),
                  cacheHeight: (_getImageHeight(context) * MediaQuery.of(context).devicePixelRatio).round(),  
                ),
              ),

              // ── SECCIÓN 1: BIENVENIDA ──
              const SectionHeader(
                title: '¡Bienvenido al país más grande del mundo!',
                emoji: '👋',
              ),
              _buildWelcomeContent(),
              const SizedBox(height: 40),

              // ── QUIZ 1 ──
              QuizCard(quiz: quiz1),
              const SizedBox(height: 40),

              // ── SECCIÓN 2: DATOS DE RUSIA ──
              const SectionHeader(
                title: 'Rusia en números: datos que te volarán la cabeza',
                emoji: '🤯',
              ),
              _buildStatsContent(),
              const SizedBox(height: 24),

              // ── FOTO 2: Metro de Moscú ──
              
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/intro/intro_moscow_metro.jpg',
                  height: _getImageHeight(context),
                  width: double.infinity,
                  fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio sin deformarse
                  cacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round(),
                  cacheHeight: (_getImageHeight(context) * MediaQuery.of(context).devicePixelRatio).round(),  
                ),
              ),

              // ── SECCIÓN 3: MITOS ──
              const SectionHeader(
                title: 'Mitos sobre Rusia: lo que nadie te cuenta',
                emoji: '🕵️',
              ),
              _buildMythsContent(),
              const SizedBox(height: 24),

              // ── FOTO 3: Invierno ruso ──
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/intro/intro_russian_winter.jpg',
                  height: _getImageHeight(context),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  cacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round(),
                  cacheHeight: (_getImageHeight(context) * MediaQuery.of(context).devicePixelRatio).round(),  
                ),
              ),

              // ── SECCIÓN 4: IDIOMA ──
              const SectionHeader(
                title: 'Primeras palabras que te salvarán la vida',
                emoji: '🗣️',
              ),
              _buildLanguageContent(),
              const SizedBox(height: 24),

              // ── FOTO 4: Letreros en cirílico ──
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/intro/intro_cyrillic_signs.jpg',
                  height:  _getImageHeight(context),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  cacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round(),
                  cacheHeight: (_getImageHeight(context) * MediaQuery.of(context).devicePixelRatio).round(),  
                ),
              ),

              // ── QUIZZES 2, 3, 4a/4b, 5 ──
              QuizCard(quiz: quiz2),
              const SizedBox(height: 24),
              QuizCard(quiz: quiz3),
              const SizedBox(height: 24),
              QuizCard(quiz: quiz4a),
              const SizedBox(height: 24),
              QuizCard(quiz: quiz4b),
              const SizedBox(height: 24),
              QuizCard(quiz: quiz5),
              const SizedBox(height: 40),

              // ── SECCIÓN 5: CHOQUE CULTURAL ──
              const SectionHeader(
                title: 'Prepárate para el choque cultural',
                emoji: '🌍',
              ),
              _buildCulturalShockContent(),
              const SizedBox(height: 24),

              // ── FOTO 5: Mesa con comida rusa ──
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/intro/intro_russian_food.jpg',
                  height: _getImageHeight(context),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  cacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round(),
                  cacheHeight: (_getImageHeight(context) * MediaQuery.of(context).devicePixelRatio).round(),  
                ),
              ),

              // ── FOTO 6: Noches blancas de San Petersburgo ──
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  'assets/images/intro/intro_white_nights.jpg',
                  height: _getImageHeight(context),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  cacheWidth: (MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio).round(),
                  cacheHeight: (_getImageHeight(context) * MediaQuery.of(context).devicePixelRatio).round(),  
                ),
              ),

              // ── SECCIÓN 6: CÓMO USAR LA GUÍA ──
              const SectionHeader(
                title: '¿Cómo funciona esta guía?',
                emoji: '📖',
              ),
              _buildHowToUseContent(),
              const SizedBox(height: 40),

              // ── CIERRE MOTIVACIONAL ──
              const ClosingCard(),
              const SizedBox(height: 40),

             // Botón de siguiente capítulo
             const SizedBox(height: 40),
             NextChapterButton(currentChapter: chapter),
             const SizedBox(height: 40),      
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────
  // Métodos privados para construir cada sección
  // ─────────────────────────────────────────────────────────

  Widget _buildIntroHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(child: Text('🇷🇺', style: TextStyle(fontSize: 56))),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Bienvenido a Rusia',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1A1A1A),
                ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            'Tu guía de supervivencia, sin rodeos y (casi) sin dramas.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            width: 48,
            height: 2,
            color: Colors.grey[300],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyText(
          'Seamos honestos: probablemente nadie te avisó bien. Quizás te dijeron '
          '"ah, Rusia, ¿no hace mucho frío allá?" o "¿y no hablan todo en ruso?". '
          'Y sí, ambas cosas son verdad. Pero eso no es todo lo que hay que saber, ni de lejos.',
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Color(0xFF2C2C2A), height: 1.75),
            children: [
              const TextSpan(
                text:
                    'Rusia es el país más extenso del planeta. Ocupa once zonas horarias — once — '
                    'lo que significa que cuando en Moscú son las 12 del mediodía, en Vladivostok '
                    'ya es medianoche. Si crees que España es grande, España cabe en ella aproximadamente ',
              ),
              highlightSpan('38 veces'),
              const TextSpan(text: '. Sí, leíste bien.'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        bodyText(
          'Esta guía existe por una razón muy concreta: llegar a Rusia sin preparación '
          'puede ser la diferencia entre una experiencia increíble y una semana de puro '
          'estrés existencial. No exageramos. El metro de Moscú no tiene letras latinas. '
          'Los documentos oficiales están en cirílico. La gente no sonríe a los desconocidos '
          'en la calle — y eso no significa que sean antipáticos, ya lo entenderás.',
        ),
        const SizedBox(height: 12),
        bodyText(
          'Pero tranquilo. Para eso estamos aquí. Esta app es tu compañero de ruta, '
          'tu intérprete de emergencia, tu manual de instrucciones para vivir (o sobrevivir) '
          'en Rusia. Capítulo a capítulo, irás de "¿qué está pasando?" a "oye, esto no está tan mal".',
        ),
        const SizedBox(height: 14),
        const RuWordChip(
          ru: 'Русь',
          trans: 'Rus\'',
          meaning: 'antiguo nombre de la región de donde viene la palabra "Rusia"',
          prefixNote: '💡 Dato curioso: la palabra Rusia viene de ',
        ),
      ],
    );
  }

  Widget _buildStatsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyText(
          'Antes de entrar en lo práctico, unos datos rápidos para que entiendas '
          'con qué estás tratando. Spoiler: es mucho.',
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 2.2,
          children: russiaStats
              .map(
                (stat) => StatCard(
                  number: stat['num']!,
                  label: stat['label']!,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Color(0xFF2C2C2A), height: 1.75),
            children: [
              const TextSpan(
                text: 'Y a todo esto hay que añadir: metro de Moscú con más de ',
              ),
              highlightSpan('260 estaciones'),
              const TextSpan(
                text:
                    ', caviar, ballet de fama mundial, vodka (sí, es un cliché, pero también es real), '
                    'y uno de los sistemas de metro más ',
              ),
              boldSpan('bonitos del mundo'),
              const TextSpan(
                text:
                    '. Hay estaciones que parecen museos. En serio, si no has visto fotos del metro '
                    'de Moscú, para un momento y búscalas. Te esperamos.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMythsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyText(
          'Antes de que tu cerebro construya una imagen de Rusia basada en películas '
          'de los años 80 y noticias de televisión, aclaremos algunos malentendidos.',
        ),
        const SizedBox(height: 16),
        ...myths.map(
          (m) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: MythCard(myth: m['myth']!, reality: m['reality']!),
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Color(0xFF2C2C2A), height: 1.75),
            children: [
              const TextSpan(
                text:
                    'El ruso tiene fama de ser difícil. Y en parte es verdad: tiene ',
              ),
              boldSpan('seis casos gramaticales'),
              const TextSpan(
                text:
                    ', el género de las palabras cambia las terminaciones, y hay sonidos '
                    'que en español no existen. PERO — y esto es importante — para moverte '
                    'por el día a día no necesitas dominar la gramática. Necesitas unas pocas '
                    'palabras clave y aprender el alfabeto cirílico básico.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        bodyText('Empecemos por lo más importante: los saludos.'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: GreetingCard(
                ru: 'Привет',
                trans: 'Privet',
                meaning: 'Hola (informal)',
                note: 'Con amigos, conocidos, gente joven',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GreetingCard(
                ru: 'Здравствуйте',
                trans: 'Zdravstvuyte',
                meaning: 'Hola (formal)',
                note: 'Con desconocidos, mayores, situaciones oficiales',
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        bodyText(
          'Aquí va tu vocabulario de supervivencia. Memoriza estas y ya puedes sobrevivir el primer día:',
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.9,
          children: vocabulary
              .map((v) => VocabCard(ru: v[0], trans: v[1], spanish: v[2]))
              .toList(),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8E7),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFFAC775).withValues(alpha: 0.6)),
          ),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: Color(0xFF5C4A00), height: 1.6),
              children: [
                const TextSpan(text: '💡 '),
                boldSpan('Consejo: '),
                const TextSpan(
                  text:
                      'no te agobies con pronunciar perfecto desde el primer día. '
                      'Los rusos aprecian enormemente que intentes hablar en su idioma, '
                      'aunque sea con acento. Un simple "Спасибо" con sonrisa sincera '
                      'abre más puertas que muchas palabras en inglés.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCulturalShockContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyText(
          'Todas las culturas tienen sus particularidades. '
          'Y Rusia tiene las suyas bien marcadas. '
          'Aquí van las que más sorprenden a los recién llegados:',
        ),
        const SizedBox(height: 16),
        ...culturalShocks.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CulturalShockItem(
              icon: item['icon']!,
              title: item['title']!,
              body: item['body']!,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHowToUseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bodyText(
          'Esta app está dividida en capítulos. '
          'Cada uno cubre un área esencial para vivir o viajar en Rusia:',
        ),
        const SizedBox(height: 14),
        ...appChapters.map(
          (ch) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ChapterRow(icon: ch[0], chapter: ch[1], desc: ch[2]),
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Color(0xFF2C2C2A), height: 1.75),
            children: [
              const TextSpan(text: 'Al final de cada sección encontrarás '),
              boldSpan('mini quizzes'),
              const TextSpan(
                text:
                    ' como los que ya has probado. No son exámenes: son para que el '
                    'aprendizaje quede fijo. Las respuestas siempre están en ruso, '
                    'porque eso es lo que necesitarás en la calle.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        bodyText(
          'Puedes leer la guía de principio a fin, o ir directamente al capítulo '
          'que más necesitas. Aunque recomendamos empezar desde el inicio si eres nuevo en el país.',
        ),
      ],
    );
  }
}