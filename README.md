# Evaluación II: Implementación de una característica en Flutter



Curso: Electivo I: Desarrollo de Aplicaciones Móviles: Android e iOS
Docente: Bruno Faúndez Valenzuela 


## Proyecto: TRAILERAMA

### Equipo

-  Javier Elgueta Arriagada, Diseñador
-  Nicolas Gonzalez Quiñones, Desarrollador 
-  Gabriel Castro Muñoz, Arquitecto de software



## Caso de uso:
### El caso de uso principal:
El caso de uso de nuestro proyecto es la creación de una plataforma de video que permite a los usuarios explorar y ver tráilers de películas. La plataforma ofrece una experiencia de usuario intuitiva y amigable, donde los usuarios pueden navegar a través de una lista de películas destacadas, seleccionar un tráiler para obtener más información y luego ver el tráiler seleccionado.

### Característica a Implementar:
La característica principal a implementar es un reproductor de video dentro de una plataforma que permite a los usuarios explorar y visualizar tráilers de películas. La interfaz de usuario se divide en tres componentes clave:

- __Menú de Películas Destacadas:__ Una interfaz que lista tráilers destacados, proporcionando información crucial como el título de la película, el año de lanzamiento, el género y la duración del tráiler.

- __Detalle del Tráiler:__ Al seleccionar un tráiler, los usuarios son dirigidos a una página de detalles que ofrece una sinopsis extendida de la película, la opción de agregarla a una lista de deseos, y la posibilidad de valorar el tráiler con un sistema de estrellas.

- __Reproducción del Tráiler:__ El reproductor de video se activa al elegir un tráiler, ofreciendo a los usuarios controles básicos para reproducir, pausar y navegar por el video.


## Diseño:
Para el apartado de la pagina principal (imagen izquierda), se uso un listviews que recorre todas las peliculas disponibles y siendo capaz de hacer scroll para vizualizar las demas opciones, ademas de que cada card contenga datos de la pelicula y este tenga  un tamaño acorde a la disposición de la pantalla. 

Al entrar en la pelicula (imagen derecha), debe contener la imagen de la pelicula seleccionada con su informacion, valoracion, descripcion y los botones de acción para ver el trailer o ver mas tarde. 



<img src="https://github.com/nicolasgonzalezq14/App_Video/blob/main/docs/Pantalla%20Principal.png"  style="margin-right:10px" width="300"/> <img src="https://github.com/nicolasgonzalezq14/App_Video/blob/main/docs/2da%20pantalla.png"  width="300"/>






### Contenidos:

- \1. Titulo de la App
- \2. Texto Catalogo
- \3. Titulo del trailer
- \4. Informacion de la pelicula
- \5. Card de la lista
- \6. Imagen de la pelicula
- \7. Informacion y valoración
- \8. Descripción
- \9. Botones de acción




---
## Implementacion:

#### main.dart
La aplicación consiste en un reproductor de peliculas, donde de manera local se almacenan los videos para poder reproducirlos en la aplicación.

El apartado principal de la aplicación comienza con el main.dart, lo cual nos permite realizar las siguiente acciones:

 ```
 import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movies App UI',
      home: HomeScreen(),
    );
  }
} 
 ```
Importamos tanto "marterial.dart" que contiene los widgets de Material Design, y "home_screen.dart", la que nos sirve para implementar la pantalla de inicio de la aplicación.

Void Main lo usamos para ejecutar la aplicación, tomando un widget para instanciar la clase "MyApp".

La clase "MyApp", este widget es la puerta de entrada a la aplicación, donde crea la estructura basica y define tanto temas, idiomas y dirección de la pagina principal.

#### Home_Screen

```
import 'package:app_video/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/movie_list_item.dart';
import '../models/movie_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
//color texto y card
  @override
  Widget build(BuildContext context) {
    List<Movie> movies = Movie.movies;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF000B49),
            child: Center(
              child: Text(
                'TRAILERAMA',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
      ),    

```
Importamos las bibliotecas y archivos necesarios para construir la pantalla de inicio.

Creamos la clase HomeScreen para para extenderla en la pantalla de inicio, siendo esta sin ningun estado mutable, lo que significa que es inmutable despues de ser construida.
Usamos el metodo "built" con el fin de crear la lista de la clase "Movie".
Configuramos "AppBar", "CliPath" y el "Container" con la finalidad de dejar el titulo "TRAILERAMA" con el diseño mostrado en las imagenes.


```
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headlineLarge,
                  children: [
                    TextSpan(
                      text: 'Catalogo',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: 'Peliculas'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              for (final movie in movies)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieScreen(movie: movie)),
                    );
                  },
                  child: MovieListItem(
                    imageUrl: movie.imagePath,
                    name: movie.name,
                    information:
                        '${movie.year} | ${movie.category}  | ${movie.duration.inHours}h  | ${movie.duration.inMinutes.remainder(60)}m',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

```
Ahora extendemos el cuerpo creado anteriormente con el fin de dar una secuencia en la pantalla de inicio, incluimos el texto de "Catalogo Peliculas", a su vez permitimos la funiconalidad de desplazamiento dentro de la pantalla, y ordenarlo secuencialmente uno encima de otro en forma de columna, para posteriormente crear las casillas donde se almacenan las peliculas, cuando se toca la pelicula pueda navegar en ella, y el widget "MovieListItem", lo usamos para pasarle la imformación de la pelicula, su imagen, nombre, año, duración y año.

```
class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldCLipper) {
    return true;
  }
}

```
Para finalizar el apartado de HomeScreen se define un clip personalizado sirve para darle una apariencia visual al "AppBar" en la pantalla de inicio dando de forma resultante una curva cóncava en la parte inferior.


#### Movie_list_item

 ```

 
 ```
 




## Arquitectura: 


### Estructura de Archivos
El proyecto sigue una estructura modular por funcionalidad, organizando los archivos en directorios que representan cada parte de la aplicación:

- __lib/:__ Directorio principal de código fuente Dart de Flutter.
- - __models/:__ Contiene las definiciones de los modelos de datos.
- - - __movie_model.dart:__ Define la estructura de datos para una película.
- - __screens/:__ Contiene los diferentes pantallas (vistas) de la aplicación.
- - - __home_screen/:__ Carpeta específica para la pantalla principal.
- - - - __home_screen.dart:__ Define la interfaz de usuario de la pantalla de inicio, mostrando una lista de películas.
- - - __movie_screen/:__ Carpeta para la pantalla de detalles de la película.
- - - - __movie_actions.dart:__ Contiene los botones de acción para las películas (como "Ver más tarde" y "Ver Película").
- - - - __movie_background.dart:__ Define el fondo con imagen y gradiente para la pantalla de detalles de la película.
- - - - __movie_information.dart:__ Muestra la información detallada de la película.
- - - - __movie_player_screen.dart:__ Se asume que es el lugar donde se reproducirá el video de la película.
- - - - __movie_screen.dart:__ Combina los componentes de fondo, información y acciones para mostrar los detalles de una película.
- - __widgets/:__ Contiene widgets reutilizables que pueden ser compartidos a través de la aplicación.
- - - __movie_list_item.dart:__ Define la apariencia y el comportamiento de un único elemento en la lista de películas.
- - - __parallax_flow_delegate.dart:__ maneja el efecto en la lista de películas.
- __main.dart:__ Punto de entrada de la aplicación, configura la aplicación y muestra la pantalla principal (HomeScreen).



![Screenshot 3](https://github.com/nicolasgonzalezq14/App_Video/blob/main/docs/arquitectura_app.jpg)


### La arquitectura de la aplicación
La arquitectura de la aplicación está basada en el patrón de diseño MVVM (Modelo-Vista-VistaModelo), que es común en aplicaciones Flutter, aunque no se especifica explícitamente un ViewModel, se puede inferir la estructura a partir de los archivos:

- __Modelo (Movie en movie_model.dart):__ Representa los datos. En este caso, el Movie contiene información sobre las películas y una lista estática como fuente de datos.

- __Vista (HomeScreen, MovieScreen, MovieListItem):__ Muestra la interfaz de usuario y recibe interacciones del usuario. Estos archivos contienen la definición de cómo se presenta la información del modelo al usuario.

- __VistaModelo(movie_actions.dart, movie_information.dart):__ cómo se maneja la navegación y presentación de la información.

Además, se construye la interfaz de usuario a partir de bloques de construcción más pequeños y reutilizables.

La aplicación también muestra un enfoque responsivo al utilizar MediaQuery para adaptar el diseño a diferentes tamaños de pantalla.

## Video usando la App

{%youtube JV6yIT3XcNE %}






