import 'package:banca_creditos/domain/entities/credit.dart';
import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreditRepositoryImpl extends CreditRepositoryInterface {
  final supabase = Supabase.instance.client;

  @override
  Future<List<Credit>> getCredits() {
    throw UnimplementedError();
  }

  @override
  Future<String> saveCredit(Credit credit) async {
    try {
      await supabase.from('credits').insert({
        'amount': credit.amount,
        'date': credit.date,
        'interest': credit.interest,
        'fee': credit.fee,
        'userid': credit.userId,
      });

      return 'Guardado';
    } catch (e) {
      return 'Error al guardar';
    }
  }
}
