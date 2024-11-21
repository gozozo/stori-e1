
# Stori - iOS Technical Test

## Descripción del Proyecto

Esta aplicación utiliza los servicios de [The Movie Database (TMDb)](https://www.themoviedb.org/) para mostrar películas mejor calificadas ("Top Rated Movies") y sus detalles. La implementación sigue principios de arquitectura nativa y un diseño modular.

## Configuración del Proyecto

### Pre-requisitos

1. Xcode instalado (versión mínima recomendada: 13).
2. Crear una cuenta y registrar una aplicación en [The Movie Database (TMDb)](https://www.themoviedb.org/).
3. Obtener las API Keys necesarias para consumir los servicios.

### Instrucciones de Configuración

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone git@github.com:gozozo/stori-e1.git
   cd stori-e1
   ```

2. Copia el archivo `.env.example` a `.env` utilizando uno de los siguientes métodos:

   #### Opción 1: Usar `cp` en la terminal
   ```bash
   cp .env.example .env
   ```

   #### Opción 2: Usar el Explorador de Archivos
   - Encuentra el archivo `.env.example` en la raíz del proyecto.
   - Duplica el archivo y renómalo como `.env`.

   #### Opción 3: Crear el archivo manualmente
   - Crea un archivo nuevo llamado `.env` en la raíz del proyecto.
   - Copia y pega el contenido de `.env.example` en este archivo.

3. Abre el archivo `.env` y configura tus credenciales con las API Keys obtenidas de [The Movie Database (TMDb)](https://www.themoviedb.org/):
   ```
   API_KEY=[YOUR_API_KEY]
   ```

4. Abre el proyecto en Xcode:
   ```bash
   open Stori.xcodeproj
   ```

5. Ejecuta el proyecto seleccionando un simulador o dispositivo físico.

## Recursos y Referencias

- [The Movie Database (TMDb) API](https://developer.themoviedb.org/reference/intro/getting-started)
- [Servicio de Películas Mejor Calificadas](https://developer.themoviedb.org/reference/movie-top-rated-list)

---
