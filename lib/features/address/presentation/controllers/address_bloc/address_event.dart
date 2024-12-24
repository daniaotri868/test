part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}


class GetAllAddressEvent extends AddressEvent {

  GetAllAddressEvent();
}

class DeleteAddressEvent extends AddressEvent {
 final String id;
 final VoidCallback onSuccess;
  DeleteAddressEvent({required this.id,required this.onSuccess});
}

class AddAddressEvent extends AddressEvent {
  final AddAddressParam param;
  final Function(String) onSuccess;
  AddAddressEvent({required this.param, required this.onSuccess});
}

class UpdateAddressEvent extends AddressEvent {
  final UpdateAddressParam param;
  final VoidCallback onSuccess;
  UpdateAddressEvent({required this.param, required this.onSuccess});
}

