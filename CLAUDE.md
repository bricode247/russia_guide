# Russia Guide (РОССИЯ ГАЙД) - Contexto del Proyecto

## 1. Meta del Proyecto
Aplicación multiplataforma (Android, iOS, Windows) para viajeros/inmigrantes en Rusia. Es una guía informativa con gestión de apuntes y quizzes interactivos.

## 2. Estructura de Carpetas (¡IMPORTANTE!)
- `lib/screens/`: Contiene las pantallas principales (`splash/`, `home/`, `chapter0 `, `chapter1/`, ...).
- `lib/widgets/`: Componentes reutilizables.
  - `lib/widgets/general_widgets/`: Widgets universales (ej. `quiz_card.dart`).
  - `lib/widgets/chapter0/`: Widgets específicos del capítulo introductorio.
  - `lib/widgets/chapter1/`: Widgets específicos del capítulo 1.
- `lib/data/`: Repositorios y datos estáticos.
- `lib/models/`: Modelos de datos (ej. `quiz_model.dart`).
- `lib/themes/`: Estilos globales (colores, etc.).
- `assets/`: Recursos multimedia (imágenes, videos).

## 3. Convenciones de Código
- **Importación de Widgets**: Siempre usa la ruta absoluta con `package:russia_guide/...`. Esto evita errores de rutas relativas.
  - *Correcto*: `import 'package:russia_guide/models/quiz_model.dart';`
- **Widgets de Quizzes**: El widget reutilizable es `QuizCard` (ubicado en `general_widgets/quiz_card.dart`). Espera recibir un objeto `QuizData`.
- **Modelo `QuizData`**: Debe contener `question`, `correctAnswer`, `options` (List<String>) y `explanation`.

## 4. Reglas de Navegación
- La navegación principal entre pantallas se define en `lib/screens/home/home_screen.dart`.
- La navegación entre capítulos (anterior/siguiente) se gestiona con `ChaptersRepository` en `lib/data/chapters_repository.dart`.

## 5. Al generar nuevo código
- **Si el código es para un nuevo capítulo**: Crea el archivo de la pantalla en `lib/screens/chapterX/` y los widgets específicos en `lib/widgets/chapterX/`. No mezcles widgets de diferentes capítulos.
- **Si el código es un widget reutilizable**: Colócalo en `lib/widgets/general_widgets/`.
- **Siempre usa la nomenclatura lowerCamelCase** para los nombres de las funciones (ej. `_getImageHeight` en lugar de `_GetImageHeight`).
- **Usa `LayoutBuilder` con `constraints.maxWidth`** para manejar imágenes responsivas en lugar de `MediaQuery.of(context).size.width`.