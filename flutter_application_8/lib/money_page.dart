import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_service.dart';
import 'money_bloc.dart';
import 'money_event.dart';
import 'money_state.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final MoneyBloc _moneyBloc;

  @override
  void initState() {
    _moneyBloc = MoneyBloc(ApiService());
    _moneyBloc.add(GetMoneyEvent());
    super.initState();
  }

  @override
  void dispose() {
    _moneyBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Крипто валюта для чайников')),
      body: BlocBuilder<MoneyBloc, MoneyState>(
        bloc: _moneyBloc,
        builder: (context, state) {
          if (state is LoadedMoney) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final coin = state.list[index];
                return ListTile(
                  leading: Image.network(coin.imageUrl, width: 30),
                  title: Text(coin.symbol),
                  subtitle: Text('${coin.change24h.toStringAsFixed(2)}%'),
                  trailing: Text('\$${coin.price.toStringAsFixed(2)}'),
                );
              },
            );
          }
          if (state is ErrorMoney) return const Center(child: Text("Error"));
          if (state is LoadingMoney) return const Center(child: CircularProgressIndicator());
          return const SizedBox();
        },
      ),
    );
  }
}