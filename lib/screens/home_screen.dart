import 'package:cinemas/models/movie_model.dart';
import 'package:cinemas/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> movies = [];
  bool isLoading = true;
  // final Future<List<MovieModel>> comingSoonMovies = ApiService.getComingSoon();

  void waitForMovies() async {
    movies = await ApiService.getComingSoon();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForMovies();
  }

  @override
  Widget build(BuildContext context) {
    print(movies);
    print(isLoading);
    return Scaffold(
      body: Center(
        child: Text('${movies.length}'),
      ),
    );
  }
}
