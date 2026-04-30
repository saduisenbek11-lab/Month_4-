import 'package:equatable/equatable.dart';

class CoinModel extends Equatable {
  final String symbol;
  final double price;
  final double change24h;
  final String imageUrl;

  const CoinModel({
    required this.symbol,
    required this.price,
    required this.change24h,
    required this.imageUrl,
  });

  factory CoinModel.fromJson(String symbol, Map<String, dynamic> json) {
    return CoinModel(
      symbol: symbol,
      price: (json['PRICE'] as num).toDouble(),
      change24h: (json['CHANGEPCT24HOUR'] as num).toDouble(),
      imageUrl: 'https://www.cryptocompare.com${json['IMAGEURL']}',
    );
  }

  @override
  List<Object?> get props => [symbol, price, change24h, imageUrl];
}