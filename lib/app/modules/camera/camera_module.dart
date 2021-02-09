import 'package:flutter_gofast/app/views/pages/camera/prescription.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CameraModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CameraController(),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => PrescriptionScreen(),
        ),
      ];

  static Inject get to => Inject<CameraModule>.of();
}

class CameraController {}
