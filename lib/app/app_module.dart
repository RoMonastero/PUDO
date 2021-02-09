import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gofast/app/app_controller.dart';
import 'package:flutter_gofast/app/interfaces/auth_repository_interface.dart';
import 'package:flutter_gofast/app/interfaces/shared_repository_interface.dart';
import 'package:flutter_gofast/app/modules/scanner/scanner2_module.dart';
import 'package:flutter_gofast/app/reposiories/auth_repository.dart';
import 'package:flutter_gofast/app/reposiories/shared_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/camera/camera_module.dart';
import 'modules/entregar/confirma_module.dart';
import 'modules/entregar/entregar_module.dart';
import 'modules/receber/receber_module.dart';
import 'app_widget.dart';
import 'controllers/auth/auth_controller.dart';
import 'core/consts/routers_consts.dart';
import 'modules/home_module.dart';
import 'modules/login_module.dart';
import 'modules/entregar/confirmar_entrega_module.dart';
import 'modules/register/register_module.dart';
import 'modules/scanner/scanner_module.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  List<Bind> get binds => [
        // Repositories
        Bind<ISharedRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind<IAuthRepository>(
          (i) => AuthRepository(firebaseAuth),
        ),
        // Controllers
        Bind(
          (i) => AppController(),
        ),
        Bind(
          (i) => AuthController(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          RoutersConst.login,
          module: LoginModule(),
        ),
        ModularRouter(
          RoutersConst.register,
          module: RegisterModule(),
        ),
        ModularRouter(
          RoutersConst.home,
          module: HomeModule(),
        ),
        ModularRouter(
          RoutersConst.receber,
          module: ReceberModule(),
        ),
        ModularRouter(
          RoutersConst.entregar,
          module: EntregarModule(),
        ),
        ModularRouter(
          RoutersConst.camera,
          module: CameraModule(),
        ),
        ModularRouter(
          RoutersConst.confirma,
          module: ConfirmaEntregaModule(),
        ),
        ModularRouter(
          RoutersConst.confirmaPage,
          module: ConfirmaModule(),
        ),
        ModularRouter(
          RoutersConst.scanner,
          module: ResultProductModule(),
        ),
        ModularRouter(
          RoutersConst.scanner2,
          module: ScannerModule(),
        ),
      ];
}
