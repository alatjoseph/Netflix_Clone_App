import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Presentation/mainScreen/mainScreen.dart';
import 'package:netflix/application/downloads/bloc/downloads_bloc.dart';
import 'package:netflix/application/home/bloc/home_bloc.dart';
import 'package:netflix/application/new&hot/commig_soon/comming_soon_bloc.dart';
import 'package:netflix/application/new&hot/everyone_watching/everyone_watching_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(HomeLoadedEvent()),
        ),
        BlocProvider(
          create: (context) => CommingSoonBloc()..add(CommingSoonLoadedEvent()),
        ),
        BlocProvider(
          create: (context) =>
              EveryoneWatchingBloc()..add(EveryoneWatchingLoadedEvent()),
        ),
        BlocProvider(
          create: (context) =>
              SearchBloc()..add(const SearchidleEvent(query:'')),
        ),
        BlocProvider(
          create: (context) => DownloadsBloc()..add(DownloadImageEvent()),
        ),
      ],
      child:  MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.black,
            // fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
                bodyMedium: TextStyle(color: Colors.white),
                bodySmall: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: Mainscreen(),
        //videoUrl: 'https://www.youtube.com/watch?v=RY5aH21ohU4',
      ),
    );
  }
}
