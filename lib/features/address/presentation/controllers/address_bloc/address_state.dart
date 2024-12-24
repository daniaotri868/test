part of 'address_bloc.dart';

@immutable
class AddressState {

  final PageState<List<AddressModel>> getAllAddressState;
  final PageState addAddress;
  final PageState updateAddress;
  final BlocStatus deleteLocation;

  const AddressState({
    this.getAllAddressState = const PageState.init(),
    this.deleteLocation=const BlocStatus.initial(),
    this.addAddress=const PageState.init(),
    this.updateAddress=const PageState.init(),

  });

  AddressState copyWith({
    final PageState<List<AddressModel>>? getAllAddressState,
    final BlocStatus? deleteLocation,
    final PageState? addAddress,
    final PageState? updateAddress,

  }) {
    return AddressState(
      getAllAddressState: getAllAddressState??this.getAllAddressState,
        deleteLocation: deleteLocation??this.deleteLocation,
      addAddress: addAddress??this.addAddress,
        updateAddress:updateAddress??this.updateAddress,

    );
  }
}
