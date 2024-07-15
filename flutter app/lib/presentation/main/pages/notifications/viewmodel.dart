import 'dart:async';
import 'dart:ffi';

// import 'package:emad_app/domain/model/models.dart';
import 'package:emad_app/data/data_source/db/sqlite.dart';
import 'package:emad_app/domain/model/models.dart';
import 'package:emad_app/domain/usecase/home_usecase.dart';
import 'package:emad_app/presentation/base/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../data/data_source/db/models.dart';
import '../../../../domain/usecase/product_usecase.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';

// import '../../../../common/state_renderer/state_renderer.dart';
// import '../../../../common/state_renderer/state_renderer_impl.dart';

class ProductViewModel extends BaseViewModel
    with ViewModelInput, ViewModelOutput {
  final _dataStreamController = BehaviorSubject<ViewObject>();

  final ProductUseCase _productUseCase;

  ProductViewModel(this._productUseCase);

  // --  inputs
  @override
  void start() {
    _getData();
  }
  List data=[

  ];

  _getData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _productUseCase.execute(Void)).fold(
        (l) => inputState.add(ErrorState(
                StateRendererType.fullScreenErrorState, l.message)),
            (data) {
          print(ViewObject(data.products));
                inputState.add(ContentState());
                inputData.add(ViewObject(data.products));
            });




  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputData => _dataStreamController.sink;

  // -- outputs
  @override
  Stream<ViewObject> get outputData =>
      _dataStreamController.stream.map((data) => data);
}

abstract mixin class ViewModelInput {
  Sink get inputData;
}

abstract mixin class ViewModelOutput {
  Stream<ViewObject> get outputData;
}

class ViewObject {
  // HomeObject homeObject;
  List<Product>products;
  ViewObject(this.products);
}
