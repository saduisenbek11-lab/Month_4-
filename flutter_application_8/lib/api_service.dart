import 'package:dio/dio.dart';
import 'money_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _url = "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV,LTC,BOND,BETA,WING,TWT,DOGE,FORTH,TRX,MLN,LINK,BICO,CAKE,LQTY,POND&tsyms=USD";

  Future<List<CoinModel>> getCoins() async {
    try {
      final response = await _dio.get(_url);
      final Map<String, dynamic> rawData = response.data['RAW'];
      
      return rawData.entries.map((entry) {
        return CoinModel.fromJson(entry.key, entry.value['USD']);
      }).toList();
      
    } catch (e) {
      throw Exception("Проблема в : $e");
    }
  }
}