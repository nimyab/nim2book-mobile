import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  final _logger = Logger(printer: SimplePrinter(colors: false));

  @override
  void onCreate(final BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    _logger.i('Cubit/Bloc created: ${bloc.runtimeType}');
  }

  @override
  void onChange(final BlocBase<dynamic> bloc, final Change<dynamic> change) {
    super.onChange(bloc, change);
    // Уменьшаем нагрузку: не сериализуем огромные состояния в логах
    _logger.d('onChange(${bloc.runtimeType})');
  }

  @override
  void onTransition(
    final Bloc<dynamic, dynamic> bloc,
    final Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    _logger.d('onTransition(${bloc.runtimeType}): $transition');
  }

  @override
  void onError(
    final BlocBase<dynamic> bloc,
    final Object error,
    final StackTrace stackTrace,
  ) {
    _logger.e(
      'onError(${bloc.runtimeType}): $error',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(final BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    _logger.i('Cubit/Bloc closed: ${bloc.runtimeType}');
  }
}
