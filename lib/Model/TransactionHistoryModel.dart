class TransactionHistoryModel {
  final String carname;
  final String plugtype;
  final String location;
  final String dateandtime;
  final String status;
  final  int charginghours;
  final String amount;

  TransactionHistoryModel({
    required this.carname,
    required this.plugtype,

    required this.location,
    required this.dateandtime,
    required this.status,
    required this.charginghours,

    required this.amount,
  });
}