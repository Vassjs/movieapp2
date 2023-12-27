import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';

class Trending extends StatelessWidget {
  const Trending({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context){
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Erro: ${snapshot.error}');
    } else if (!snapshot.hasData || snapshot.data == null) {
      return Text('Nenhum filme encontrado.');
    }

    List<Movie> movies = snapshot.data as List<Movie>;

    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 10,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: .55,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
        itemBuilder: (context, itemIndex, pageViewIndex){
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                'https://image.tmdb.org/t/p/w200${movies[itemIndex].posterPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}