import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../../common/models/page_state/result_builder.dart';
import '../../../../generated/l10n.dart';
import '../../../address/presentation/controllers/address_bloc/address_bloc.dart';
import '../../../address/presentation/pages/location_page.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/empty_widget.dart';
import '../../../app/presentation/widgets/error_widget.dart';
import '../../../app/presentation/widgets/loading_widget.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/card_saved_address.dart';

class MyAddress extends StatefulWidget {
  const MyAddress({super.key});

  static String get name => "MyAddress";

  static String get path => "MyAddress";

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  late AddressBloc _addressBloc;

  @override
  void initState() {
    _addressBloc = GetIt.I<AddressBloc>();
    _addressBloc.add(GetAllAddressEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _addressBloc,
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            return PageStateBuilder(
                init: Container(),
                success: (data) => AppScaffold(
                    appBar: AppAppBar(
                      label:S.current.MyAddress,
                      leading: InkWell(
                          onTap:()=>context.pop(context),
                          child: Icon(Icons.arrow_back_ios,color: context.colorScheme.onSurface.withOpacity(.8),)),
                    ),
                      body: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => CardSavedAddress(
                          data: data[index],
                        ),
                      ),
                    bottomNavigationBar: Padding(
                      padding:REdgeInsetsDirectional.only(start: 20,end: 20,bottom: 20),
                      child: AppButton.dark(title:S.current.AddNewAddress,onPressed: ()=>context.pushNamed(LocationPage.name,extra: AddLocationPageParams(profileOrCart: true))
                        ,),

                    ),

                    ),
                loading: AppScaffold(body: const LoadingWidget()),
                error: (Exception? error) {
                  return ErrorWidgetPage(
                    onPressed: () {
                      _addressBloc.add(GetAllAddressEvent());
                    },
                  );
                },
                result: state.getAllAddressState,
                empty: const EmptyWidget());
          },
        )
    );
  }
}
