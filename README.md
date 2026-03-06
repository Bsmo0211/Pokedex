#  Pokédex App

## Instrucciones de Instalación
1. **Clonar el repositorio:**
   `git clone <url-de-tu-repo>`
2. **Instalar dependencias:**
   `flutter pub get`
3. **Generar código (obligatorio para Freezed/Riverpod):**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   
##  Arquitectura del Proyecto
El proyecto está organizado en capas para separar responsabilidades y facilitar la escalabilidad:

* **Domain:** Entidades puras (`Pokemon`) que definen el modelo de datos sin dependencias externas.
* **Data:** Implementación de repositorios y fuentes de datos utilizando **Dio**. Aquí se realiza el mapeo y transformación de los modelos de datos.
* **Presentation:** Interfaz de usuario reactiva, gestionada con **Riverpod** y arquitectura basada en estados para asegurar una UI fluida y predecible.

## Stack Tecnológico
* **State Management:** `Riverpod` (con anotaciones).
* **Data Layer:** `Dio` (Cliente HTTP).
* **Models:** `Freezed` (inmutabilidad y generación de código).
* **Internacionalización:** `flutter_localizations` (I18n).
* **Configuración:** `flutter_dotenv` (variables de entorno).
  
## Inteligencia Artificial   
**Durante el desarrollo del proyecto, integré Gemini y GitHub Copilot como asistentes de ingeniería bajo los siguientes criterios:**

* Asistencia en el Boilerplate: Utilicé IA para acelerar la escritura de código repetitivo (boilerplate), como las estructuras base de modelos con Freezed y los providers de Riverpod. Esto permitió enfocar el tiempo de desarrollo en la lógica de negocio y la arquitectura.
* Refactorización y Clean Code: La IA fue clave para aplicar principios SOLID y DRY, sugiriendo mejoras en la legibilidad del código y optimizando peticiones asíncronas con Future.wait para un mejor rendimiento en la carga de datos.
* Arquitectura y Seguridad: Consulté modelos de IA para definir la estructura de capas (Clean Architecture) y validar la implementación de capas de seguridad (uso de flutter_dotenv y manejo de .gitignore), asegurando que la configuración siguiera los estándares de la industria.
* Validación Humana: Mi regla fundamental fue la validación manual. Todo el código generado por IA fue revisado, testeado y adaptado personalmente al contexto específico de mi aplicación para asegurar que no contuviera código innecesario o dependencias no deseadas. Entiendo la IA como una herramienta de apoyo, no como el autor final de la lógica del proyecto.

## Capas de Seguridad
* Abstracción de infraestructura: Uso de flutter_dotenv para gestionar endpoints, evitando el hardcoding de configuraciones sensibles.
* Control de versiones: El archivo .env ha sido excluido mediante .gitignore para prevenir fugas de datos al repositorio público.
* Inmutabilidad: Uso de Freezed para garantizar la integridad de los datos en tiempo de ejecución.

## Mejoras sobre el Diseño (UI/UX)
**Para asegurar una experiencia de usuario (UX) óptima, realicé las siguientes adaptaciones sobre el diseño original de Figma:**

* Paleta de colores: Implementé un esquema minimalista en blanco y negro para mejorar la legibilidad y el enfoque en el contenido visual (Modo claro y modo oscuro).

* Manejo de estados de error: Añadí una validación robusta que detecta cuando la API no responde o no entrega datos. En estos casos, se muestra un widget informativo de "Intenté más tarde" en lugar de dejar la pantalla vacía, evitando frustraciones al usuario.

* Navegación intuitiva: Integré iconos descriptivos en la navegación principal (inicio) para facilitar el flujo de usuario.

* UX de filtrado: Optimizamos la forma de filtrar por categorías de Pokémon, haciendo que el proceso sea más rápido y eficiente comparado con la propuesta inicial de diseño.
