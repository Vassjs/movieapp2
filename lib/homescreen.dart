import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/services/movie_api.dart';
import 'package:movieapp/widgets/movie_slider.dart';
import 'package:movieapp/widgets/trend.dart';

import 'models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> trendingMovies;

  @override
  void initState(){
    super.initState();
    trendingMovies = Api().fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Movies'),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Em Destaque",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 25
                  )
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    } else if(snapshot.hasData){
                      //final data = snapshot.data;
                      return Trending(snapshot: snapshot);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Melhores Classificados',
                style: GoogleFonts.aboreto(
                    fontSize: 25
                ),
              ),
              const SizedBox(height: 32),
              MovieSlider(),
              const SizedBox(height: 32),
              Text(
                'Melhores Classificados',
                style: GoogleFonts.aboreto(
                    fontSize: 25
                ),
              ),
              MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }




}