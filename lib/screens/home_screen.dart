import 'package:cinemas/models/movie_model.dart';
import 'package:cinemas/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  //* future type이 있기 때문에 const 가 올 수 없다.

  final Future<List<MovieModel>> comingSoonMovies = ApiService.getComingSoon();
  final Future<List<MovieModel>> nowPlayingMovies = ApiService.getNowPlaying();
  final Future<List<MovieModel>> popularMovies = ApiService.getPopular();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: makeList(snapshot),
                        )
                      ],
                    );
                  }
                  return const CircularProgressIndicator.adaptive();
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Coming soon',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 300.0,
                          child: makeList(snapshot),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              )
            ],
          ),
        ));
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        const basePosterUrl = 'https://image.tmdb.org/t/p/w500';
        var movie = snapshot.data![index];
        return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
            child: Image.network("$basePosterUrl${movie.posterPath}"));
      },
    );
  }
}
