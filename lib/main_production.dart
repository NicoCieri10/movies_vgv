import 'package:movies_vgv/app/app.dart';
import 'package:movies_vgv/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
