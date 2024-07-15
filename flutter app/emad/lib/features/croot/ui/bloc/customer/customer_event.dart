part of 'customer_bloc.dart';

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.started() = Started;
  const factory CustomerEvent.create({required String name,required String phone}) = CreateCustomerEvent;
  const factory CustomerEvent.created({required bool status}) = CreateCustomerEventEnded;


}
