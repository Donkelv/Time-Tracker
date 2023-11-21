import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:time_tracker/network_manager/domain/inetwork_manager.dart';

class NetworkManager implements INetworkManager {
  @override
  Future<bool> get isConnected async {
    final res = await Connectivity().checkConnectivity();
    return res != ConnectivityResult.none;
  }
}
