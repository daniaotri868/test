import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_customer/common/models/page_state/bloc_status.dart';
import 'package:restaurant_customer/features/address/data/models/address_model.dart';

import '../../../../../common/models/page_state/page_state.dart';
import '../../../../../core/helper/helper_function.dart';
import '../../../domain/use_case/add_address_use_case.dart';
import '../../../domain/use_case/delete_address_use_case.dart';
import '../../../domain/use_case/get_all_address_use_case.dart';
import '../../../domain/use_case/update_address_use_case.dart';


part 'address_event.dart';

part 'address_state.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final GetAllAddressUseCase getAllAddressUseCase;
  final DeleteAdressUseCase deleteAdderssUseCase;
  final AddAddressUseCase addAddressUseCase;
  final UpdateAddressUseCase updateAddressUseCase;
  AddressBloc( this.getAllAddressUseCase, this.deleteAdderssUseCase, this.addAddressUseCase, this.updateAddressUseCase, ) : super(const AddressState()) {
    on<GetAllAddressEvent>(_onGetAllAddressEvent);
    on<DeleteAddressEvent>(_onDeleteAddressEvent);
    on<AddAddressEvent>(_onAddAddressEvent);
    on<UpdateAddressEvent>(_onUpdateAddressEvent);
  }


  FutureOr<void> _onUpdateAddressEvent(
      UpdateAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(updateAddress: const PageState.loading()));
    final result = await updateAddressUseCase(event.param);
    emit(state.copyWith(
        updateAddress: HelperFunctions.mapEitherToPageState(
            either: result,
            onSuccess:(data) => event.onSuccess()
        )));
  }


  Future<void> _onDeleteAddressEvent(DeleteAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(deleteLocation: const BlocStatus.loading()));
    final result = await deleteAdderssUseCase(event.id);
    emit(state.copyWith(
        deleteLocation: HelperFunctions.mapEitherToBlocStatus(
          either: result,
         onSuccess: event.onSuccess
        )));
  }



  Future<void> _onGetAllAddressEvent(AddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(getAllAddressState: const PageState.loading()));
    final result = await getAllAddressUseCase();

    emit(state.copyWith(
        getAllAddressState: HelperFunctions.mapEitherToPageState(
          either: result,
            emptyChecker:(data)=>(data??[]).isEmpty

        )));
  }

  FutureOr<void> _onAddAddressEvent(
      AddAddressEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(addAddress: const PageState.loading()));
    final result = await addAddressUseCase(event.param);
    emit(state.copyWith(
        addAddress: HelperFunctions.mapEitherToPageState(
          either: result,
          onSuccess: (data) => event.onSuccess(data)
        )));
  }
}
