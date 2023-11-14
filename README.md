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

- 1. Titulo de la App
- 2. Texto Catalogo
- 3. Titulo del trailer
- 4. Informacion de la pelicula
- 5. Card de la lista
- 6. Imagen de la pelicula
- 7. Informacion y valoración
- 8. Descripción
- 9. Botones de acción




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

### Home_Screen
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


#### Movie_Screen
##### Movie_Actions

 ```
import 'package:flutter/material.dart';
import 'package:app_video/models/movie_model.dart';
import 'movie_player_screen.dart';

class MovieActions extends StatelessWidget {
  final Movie movie;
  final BuildContext context;

  const MovieActions({Key? key, required this.context, required this.movie})
      : super(key: key);
 
 ```
 Importamos tanto los widgets de flutter, el modelo de los datos de las peliculas y el reproductor de video. Esto nos permite manejar las acciones relacionadas con la interfaz de la pelicula.
 

 ```
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWatchLaterButton(context),
            const SizedBox(width: 10),
            _buildWatchMovieButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWatchLaterButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        backgroundColor: const Color(0xFFFF7272),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.425,
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () {
        // Implementar funcionalidad para "Ver más tarde"
      },
      child: const Text(
        'Ver más tarde',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
 ```
 Nos permite realizar la interfaz de la sección de los bontones, este en especifico es el de "Ver más tarde." 
 
```
Widget _buildWatchMovieButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0), backgroundColor: const Color.fromARGB(255, 227, 14, 14),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.425,
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePlayerScreen(movie: movie),
          ),
        );
      },
      child: const Text(
        'Ver Película',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```
Y este codigo nos permitio crear y darle la funcionalidad al boton de "Ver Pelicula." ya que al momento de presionarlo nos permite reproducir la pelicula seleccionada.

#### Movie_background

```
import 'package:flutter/material.dart';
import 'package:app_video/models/movie_model.dart';

class MovieBackground extends StatelessWidget {
  final Movie movie;
  final BuildContext context;

  const MovieBackground({Key? key, required this.context, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          color: const Color(0xFF000B49),
        ),
        Image.network(
          movie.imagePath,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color(0xFF000B49),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
```
Con esto conseguimos construir el fondo visual de la pantalla, aplicando una decoración en la sección de la pelicula.

#### Movie_Information

```
import 'package:flutter/material.dart';

import 'package:app_video/models/movie_model.dart';



class MovieInformation extends StatelessWidget {
  final Movie movie;

  const MovieInformation({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.name, // Este texto es estático, pero viene del objeto movie.
              style: const TextStyle(
                color: Color.fromARGB(255, 247, 244, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${movie.year} | ${movie.category} | ${_formatDuration(movie.duration)}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            _buildStaticRatingBar(),
            const SizedBox(height: 8),
            const Text(
              "Este es un video de prueba para ver la descripción de los videos prueba que colocaremos en el proyecto.",
              style: TextStyle(
                color: Color.fromARGB(255, 248, 244, 244),
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticRatingBar() {
    // Crear una barra de clasificación estática con 3.5 estrellas
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < 3 || (index == 3 && index < 3.5) ? Icons.star : Icons.star_border,
          color: index < 3 || (index == 3 && index < 3.5) ? Colors.amber : Colors.grey,
          size: 20,
        );
      }),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m";
  }
}
```
Nos permite dentro de la pantalla de la pelicula, encontrar la información necesaria y detallada de la misma, en este caso pasamo los datos de nombre, año, categoria, duración, a su vez entregando una clasificación por estrellas y una breve descripción de máximo 3 lineas.


#### Movie_player_screen

```
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:app_video/models/movie_model.dart';

class MoviePlayerScreen extends StatefulWidget {
  final Movie movie;

  const MoviePlayerScreen({Key? key, required this.movie}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MoviePlayerScreenState createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
      ..initialize().then((_) => setState(() {}));
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(controller: chewieController),
      ),
    );
  }
}

```
Importamos las bibliotecas necesarias tanto de los widgets de flutter, el reproductor de video de Chewie y un controlador de video.
Creamos la clase "MoviePlayerScreen", con el fin de recibir la instancia de "Movie" como un parámetro, y posteriormente creamos "MoviePlayerScreenState", que es una clase estado de "MoviePlayerScreen", la inicializamos con el controlador de video, cargando los datos a traves de la ruta proporcionada en donde se encuentra la pelicula, para luego usar Chewie más el controlador de video estableciendo asi la interfaz de reproducción.
Creando de esta manera la pantalla mostrando un video reproduciendose a traves de la clase "Movie", siendo esta proporcionada y controlada por el controlador de video y el de Chewie para gestionar el reproductor de video.

#### Movie_Screen

```
import 'package:flutter/material.dart';
import 'package:app_video/models/movie_model.dart';
import 'movie_actions.dart';
import 'movie_information.dart';
import 'movie_background.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MovieBackground(context: context, movie: movie),
          MovieInformation(movie: movie),
          MovieActions(context: context, movie: movie),
        ],
      ),
    );
  }
}

```
Con esto reunimos todo lo que creamos anteriormente tanto "MovieBackground", "MovieInformation" y "MovieAction", para mostrar toda esta informacion en la pantalla principal de la pelicula.


### Widgets
#### Movie_List_Item

```
import 'package:flutter/material.dart';
import 'parallax_flow_delegate.dart';

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;
  final GlobalKey backgroundImageKey = GlobalKey();

  MovieListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: [
              Flow(
                delegate: ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                  backgroundImageKey: backgroundImageKey,
                ),
                children: [
                  Image.network(
                    imageUrl,
                    key: backgroundImageKey,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // ignore: prefer_const_literals_to_create_immutables
                      stops: [0.6, 0.95],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      information,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
```
Importamos las bibliotecas de los widgets de flutter y parallax_flow_delegate, que nos permite dar un efecto al scroll en la pantalla.
A este recibe tanto la imagen, nombre y la información de la pelicula, para ponernos a construir primero garantizando tener un tamaño de 16:9 en el aspecto de la pelicula, a este comenzamos a decorar obteniendo los datos tanto de imagen, nombre y la informacion adicional e implementando en estos cuadros el efecto de scroll, creando asi la lista de las peliculas de la aplicación.

#### Parallax_Flow_Delegate

```
import 'package:flutter/material.dart';

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    final backgroundSize = (backgroundImageKey.currentContext!.findRenderObject() as RenderBox).size;
    final listItemSize = context.size;
    final childRect = verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    context.paintChild(
      0,
      transform: Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(covariant ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
```
Con esto nos permite dar la sensación de un scroll mucho más fluido y dandole ese efecto a la lista de peliculas, ajustamos la posicion vertical de los elementos en respuesta al desplazamiento que realizamos, dandonos la sensación de paralaje en el scroll de la aplicación.

### Models
#### Movie_Model

```
class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;

  const Movie(
      {required this.name,
      required this.imagePath,
      required this.videoPath,
      required this.category,
      required this.year,
      required this.duration});

  static const List<Movie> movies = [
    Movie(
      name: 'Video Prueba',
      imagePath: 'https://img.desmotivaciones.es/202106/memes-imagenes-34.jpg',
      videoPath: 'assets/videos/example.mp4',
      category: 'Comedia',
      year: 2023,
      duration: Duration(hours: 0, minutes: 1),
    ),
    Movie(
      name: 'Rápidos y furiosos 10',
      imagePath:
          'https://i.imgur.com/x0uYMFJ.jpeg',
      videoPath: 'assets/videos/rapidoyfuriososx.mp4',
      category: 'Acción',
      year: 2022,
      duration: Duration(hours: 2, minutes: 21),
    ),
    Movie(
      name: 'El señor de los anillos',
      imagePath: 'https://i0.wp.com/carlosjeguren.com/wp-content/uploads/2012/12/El-Se25C325B1or-de-los-Anillos-La-Comunidad-del-Anillo.jpg?ssl=1',
      videoPath: 'assets/videos/elsenordelosanillos.mp4',
      category: 'Acción',
      year: 2001,
      duration: Duration(hours: 2, minutes: 58),
    ),
    Movie(
      name: 'Harry Potter y la piedra filosofal',
      imagePath: 'https://larepublica.cronosmedia.glr.pe/original/2021/10/28/617b0722cd5ff4650728ef2d.jpg',
      videoPath: 'assets/videos/harrypotterylapiedrafilosofal.mp4',
      category: 'Cine de terror',
      year: 2001,
      duration: Duration(hours: 2, minutes: 32),
    ),
    Movie(
      name: 'Elementos',
      imagePath: 'https://lumiere-a.akamaihd.net/v1/images/eu_xx_elemental_dplus_mob_m_60031c24.jpeg?region=0,0,1600,1200',
      videoPath: 'assets/videos/elementos.mp4',
      category: 'Comedia Romántica',
      year: 2023,
      duration: Duration(hours: 1, minutes: 42),
      
    ),
  ];
}
```
La clase "Movie", representa la información de las peliculas, tanto su nombre, ruta de su imagen, ruta de su video, la categoria, año y duración.
Las esta nos permite listar la colección de peliculas que tenemos, teniendo que colocar cada uno de los detalles de la misma, los videos se guardan de manera local en la carpeta assets y las imagenes son obtenidas desde internet, a su vez permitiendonos indicar la información detallada de cada pelicula almacenada y creada en la aplicación
 
---

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

[![](https://markdown-videos.deta.dev/youtube/JV6yIT3XcNE&ab_channel=NicolásIgnacioGonzálezQuiñones)](https://youtu.be/JV6yIT3XcNE?si=aWh3CHmdql8n6IJj)






