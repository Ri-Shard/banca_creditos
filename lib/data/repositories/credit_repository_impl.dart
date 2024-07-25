import 'package:banca_creditos/domain/entities/credit.dart';
import 'package:banca_creditos/domain/repositories/credit_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreditRepositoryImpl extends CreditRepositoryInterface {
  final supabase = Supabase.instance.client;

  @override
  Future<List<Credit>> getCredits() async {
    try {
      return await supabase
          .from('credits')
          .select()
          .eq('userId', supabase.auth.currentSession!.user.email!)
          .then((data) {
        List<Credit> credits = [];
        data.forEach((element) {
          Credit credit = Credit(element['userId'],
              amount: element['amount'],
              date: element['date'],
              quota: element['quota'],
              interest: double.parse(element['interest']));
          credits.add(credit);
        });
        return credits;
      });
    } catch (e) {
      return [];
    }
  }

  @override
  Future<String> saveCredit(Credit credit) async {
    credit.userId = supabase.auth.currentSession!.user.email!;
    try {
      await supabase.from('credits').insert(credit.toJson());

      return 'Guardado';
    } catch (e) {
      return 'Error al guardar';
    }
  }
}
