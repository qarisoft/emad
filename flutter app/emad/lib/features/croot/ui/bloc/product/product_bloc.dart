// import 'package:flutter_bloc/bloc.dart';

import 'dart:developer';

import 'package:emad/features/croot/data/datasource/datasource.dart';
import 'package:emad/features/croot/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final DataSource _dataSource;
  final String tName = 'products';
  
  ProductBloc(DataSource dataSource) :_dataSource=dataSource, super(const ProductState.initial()) {
    on<_Started>(_onStarted);
  }
  start(){
    add(const _Started());
  }
  _onCreate(_CreateProduct event, emit){
    try{
     final a = Product(name: event.name,price: event.price,active: event.active).toJson();
     a.remove('id');
      _dataSource.create(a, tName).then((res){
        if (res is int && res>0) {
          _fetch(emit);
        }
      });
    }catch(e){
      log('');
    }
  }
  _onUpdate(_UpdateProduct event, emit){
    try{
      final a = event.product.toJson();
      a.remove('id');
      _dataSource.update(a, tName,event.product.id).then((res){
        if (res is int && res>0) {
          _fetch(emit);
        }
      });
    }catch(e){
      log('');
    }
  }

  _fetch(emit){
    try{
      _dataSource.all(tName).then((res){
        emit(AllProducts(products: res.map((el)=>Product.fromDb(el)).toList()));
      });
    }catch(e){
      emit(const AllProducts(products:[]));
    }
  }
  
  _onStarted(event, emit){
    _fetch(emit);
  }
  _onDelete(_DeleteProduct event, emit){

    try{
      _dataSource.delete( tName, event.id).then((res){
        if (res is int && res>0) {
          // _fetch(emit);
        }
      });
    }finally{
      _fetch(emit);

    }
  }
  
  
}
