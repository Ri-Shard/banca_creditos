import 'package:banca_creditos/domain/entities/credit.dart';

abstract class CreditRepositoryInterface {
  Future<String> saveCredit(Credit credit);
  Future<List<Credit>> getCredits();
}
