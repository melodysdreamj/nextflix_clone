import 'package:tmdb_api/tmdb_api.dart';

late TMDB tmdb;
readtForTMDB() async{
  tmdb = TMDB( //TMDB instance
    ApiKeys('f98cf7f4e9a3a1442e1c602b24c65788', 'apiReadAccessTokenv4'),//ApiKeys instance with your keys,
  );
}