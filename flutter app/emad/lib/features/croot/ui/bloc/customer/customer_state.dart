part of 'customer_bloc.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = Initial;
  const factory CustomerState.loading() = Loading;
  const factory CustomerState.endLoading() = EndLoading;
  const factory CustomerState.created() = Created;
  const factory CustomerState.data({required List<Customer>data}) = Data;
  const factory CustomerState.createFailure() = CreateFailure;

}
