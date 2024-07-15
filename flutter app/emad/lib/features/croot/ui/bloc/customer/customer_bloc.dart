// import 'package:bloc/bloc.dart';
import 'dart:developer';

import 'package:emad/features/croot/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasource/datasource.dart';

part 'customer_event.dart';
part 'customer_state.dart';
part 'customer_bloc.freezed.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final DataSource _dataSource;
  final String tName = 'customers';
  CustomerBloc( DataSource dataSource) :_dataSource=dataSource, super(const CustomerState.initial()) {
    on<Started>(_onStarted);
    on<CreateCustomerEvent>(_onCreate);
    on<CreateCustomerEventEnded>((ev,em){
      if (ev.status) {
      }
      em(const EndLoading());
    });
  }

  _onCreate(CreateCustomerEvent event, emit) {
    emit(const Loading());
    create(event.name, event.phone)
    .then((a){
      // if (a) {
      //   emit(const Created());
      // }else{
      //   emit(const CreateFailure());
      // }
      add( CreateCustomerEventEnded(status:a));
      // add(const Started());
    });
    // TODO: implement event handler
  }
  _onStarted(event, emit) async{
    final old = state;
    emit(const Loading());
    await a();
    // final data = await _dataSource.all(tName);
    emit(const EndLoading());

  }
  Future<void>a()async{
    await Future.delayed(const Duration(seconds: 1));
  }



  Future<bool> create(String name,String phone)async{

    await Future.delayed(const Duration(seconds: 2));
    final c = Customer(name: name,).toJson();
    c.remove('id');
    log(c.toString());
    // _dataSource.create(c, tName);
    return true;
  }
}
