import 'package:go_router/go_router.dart';
import 'package:notes_app/views/Login/login_view.dart';
import 'package:notes_app/views/Splash/presentation/splash_view.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRuter {
  static const kNotesView = '/notesView';
  static const kEditNoteView = '/editNoteView';
  static const kLoginView = '/loginView';
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kNotesView,
        builder: (context, state) => const NotesView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(),
      ),
    ],
    redirect: (context, state) async {
      final isLogged = await isLoggedIn();
      if (state.fullPath == '/') {
        return null;
      }
      if (state.fullPath == kNotesView && !isLogged) {
        return kLoginView;
      }
      if (state.fullPath == kLoginView && isLogged) {
        return kNotesView;
      } else {
        return null;
      }
    },
  );
}
