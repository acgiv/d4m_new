import 'dart:async';

import 'package:d4m_new/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;

  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectityResult) {
      if (connectityResult.contains(ConnectivityResult.wifi)) {
        emitInternetConnected(ConnectionType.Wifi);
      } else if (connectityResult.contains(ConnectivityResult.mobile)) {
        emitInternetConnected(ConnectionType.Mobile);
      } else if (connectityResult.contains(ConnectivityResult.none)) {
        emitInternetDisconnected();
      }
    });
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }

  // metodo di stato che notifica la connessione (wifi, mobile)
  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  // metodo di stato che notifica il dopositivo si sia disconnesso
  void emitInternetDisconnected() => emit(InternetDisconnected());
}
