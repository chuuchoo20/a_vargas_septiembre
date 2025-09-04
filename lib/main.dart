import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jorge Alis',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Youtube(),
    );
  }
}

class Youtube extends StatelessWidget {
  const Youtube({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(Icons.arrow_back, color: Colors.white),
          title: const Text('Jorge Alis', style: TextStyle(color: Colors.white)),
          actions: [
            Icon(Icons.cast, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.more_vert, color: Colors.white),
            SizedBox(width: 8),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white, 
            labelColor: Colors.white, 
            unselectedLabelColor: Colors.white70, 
            tabs: [
              Tab(text: 'PRINCIPAL'),
              Tab(text: 'VIDEOS'),
              Tab(text: 'EN VIVO'),
              Tab(text: 'LISTAS DE REPRODUCCIÓN'),
            ],
          ),
        ),
        body: Column(
          children: [
            // Filtros
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                children: [
                  Chip(
                    label: const Text(
                      'Subidos recientemente',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: const Text(
                      'Popular',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  ),
                ],
              ),
            ),
            // margen de los chips y los videos
            const SizedBox(height: 2),
            // Lista de videos
            Expanded(
              child: ListView(
                children: [
                  Video(
                    thumbnail: '',
                    title: 'HISTORIAS DE CALLE -BELLAVISTA',
                    views: '1.2 K vistas',
                    date: 'hace 12 días',
                    duration: '18:53',
                  ),
                  Video(
                    thumbnail: '',
                    title: 'PODCAST QL - ESPECIAL HALLOWEEN',
                    views: '2.2 K vistas',
                    date: 'hace 1 mes',
                    duration: '15:32',
                  ),
                  Video(
                    thumbnail: '',
                    title: 'DEBATE PRESIDENCIAL QL',
                    views: '14 K vistas',
                    date: 'hace 1 año',
                    duration: '3:12',
                  ),
                  Video(
                    thumbnail: '',
                    title: 'FILOSOFONDA - PAYAS 2021',
                    views: '28 K vistas',
                    date: 'hace 1 año',
                    duration: '3:20',
                  ),
                  Video(
                    thumbnail: '',
                    title: 'SIN DOCUMENTOS',
                    views: '15 K vistas',
                    date: 'hace 1 año',
                    duration: '2:02',
                  ),
                  Video(
                    thumbnail: '',
                    title: 'Show Premios "Caleuche" (Chile Actores) 2021',
                    views: '18 K vistas',
                    date: 'hace 1 año',
                    duration: '2:45', 
                  ),
                ],
              ),
            ),
            // la botombar
            BottomNavigationBar(
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Principal',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_arrow),
                  label: 'Shorts',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions),
                  label: 'Suscripciones',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  label: 'Biblioteca',
                ),
              ],
              currentIndex: 1,
              onTap: (index) {},
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class Video extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String views;
  final String date;
  final String duration;

  const Video({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.views,
    required this.date,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 160, 
                height: 90, 
                color: Colors.grey[800],
                child: thumbnail.isNotEmpty
                    ? Image.network(
                        thumbnail,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(),
                      )
                    : Container(),
              ),
              if (duration.isNotEmpty)
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    color: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: Text(
                      duration,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$views · $date',
                    style: const TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 26),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
