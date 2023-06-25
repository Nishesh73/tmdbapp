import 'package:flutter/material.dart';
import 'package:movie_poster/moviedescription_screen.dart';

class MovieList extends StatefulWidget {
  List emptyPopularMoviesLists;
  MovieList({super.key, required this.emptyPopularMoviesLists});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String queory = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "Search movie name",
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38)),
              hintStyle: TextStyle(color: Colors.white)),
          onChanged: (value) {
            setState(() {
              queory = value;
            });
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * .99,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.emptyPopularMoviesLists.length,
            itemBuilder: (context, index) {
              if (queory.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                  releaseDate: widget
                                      .emptyPopularMoviesLists[index]
                                          ["release_date"]
                                      .toString(),
                                  moviePhoto:
                                      "https://image.tmdb.org/t/p/w500/" +
                                          widget.emptyPopularMoviesLists[index]
                                              ["poster_path"],
                                  averageRating: widget
                                      .emptyPopularMoviesLists[index]
                                          ["vote_average"]
                                      .toString(),
                                  title: widget.emptyPopularMoviesLists[index]
                                      ["title"],
                                  overView:
                                      widget.emptyPopularMoviesLists[index]
                                          ["overview"])));
                    },
                    child: ListTile(
                      leading: Container(
                        height: 130,
                        width: 50,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.yellow)),
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/" +
                                  widget.emptyPopularMoviesLists[index]
                                      ["poster_path"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      title: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.emptyPopularMoviesLists[index]["title"] ?? "",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              }
              // else if(queory.startsWith(widget.emptyPopularMoviesLists[index]["title"].toString().toLowerCase()))
              else if (widget.emptyPopularMoviesLists[index]["title"]
                  .toString()
                  .toLowerCase()
                  .startsWith(queory.toLowerCase())) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDescription(
                                  releaseDate: widget
                                      .emptyPopularMoviesLists[index]
                                          ["release_date"]
                                      .toString(),
                                  moviePhoto:
                                      "https://image.tmdb.org/t/p/w500/" +
                                          widget.emptyPopularMoviesLists[index]
                                              ["poster_path"],
                                  averageRating: widget
                                      .emptyPopularMoviesLists[index]
                                          ["vote_average"]
                                      .toString(),
                                  title: widget.emptyPopularMoviesLists[index]
                                      ["title"],
                                  overView:
                                      widget.emptyPopularMoviesLists[index]
                                          ["overview"])));
                    },
                    child: ListTile(
                      leading: Container(
                        height: 130,
                        width: 50,
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: Colors.yellow)),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/" +
                                widget.emptyPopularMoviesLists[index]
                                    ["poster_path"],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(
                        widget.emptyPopularMoviesLists[index]["title"] ?? "",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }

              return Text("");
            }),
      ),
    );
  }
}
