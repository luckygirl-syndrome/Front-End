import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ttobaba/features/home/models/dashboard_model.dart';
import 'package:ttobaba/features/home/repositories/home_repository.dart';

part 'home_lists_provider.g.dart';

@riverpod
Future<List<ConsideringListItem>> consideringList(
    ConsideringListRef ref) async {
  final repository = ref.watch(homeRepositoryProvider);
  final data = await repository.getConsideringList();
  return data.map((item) => ConsideringListItem.fromJson(item)).toList();
}

@riverpod
Future<List<ReceiptListItem>> unboughtReceiptsList(
    UnboughtReceiptsListRef ref) async {
  final repository = ref.watch(homeRepositoryProvider);
  final data = await repository.getUnboughtReceiptsList();
  return data.map((item) => ReceiptListItem.fromJson(item)).toList();
}

@riverpod
Future<ReceiptDetail> receiptDetail(
    ReceiptDetailRef ref, int userProductId) async {
  final repository = ref.watch(homeRepositoryProvider);
  final data = await repository.getReceiptDetail(userProductId);
  return ReceiptDetailResponse.fromJson(data).data;
}
