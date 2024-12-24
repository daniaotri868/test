import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_customer/common/models/page_state/page_state.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/animated_dialog.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/empty_widget.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/loading_widget.dart';
import 'package:restaurant_customer/features/profile/data/model/profile_model.dart';
import 'package:restaurant_customer/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:restaurant_customer/features/profile/presentation/widgets/dialog_logout.dart';

import '../../../../generated/l10n.dart';
import '../../../app/data/repositories/prefs_repository_impl.dart';
import '../../../app/presentation/controllers/app_bloc/app_bloc.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/error_widget.dart';
import '../widgets/general_setting.dart';
import '../widgets/my_account.dart';
import '../widgets/profile_header_section.dart';
import '../widgets/user_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static String get name => "/ProfilePage";

  static String get path => "/ProfilePage";

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   ProfileBloc _profileBloc=GetIt.I<ProfileBloc>() ;
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) async{

      if(context.read<AppBloc>().state.isToken){
        _profileBloc.add(GetProfileEvent());}
    });

        super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _profileBloc,
      child: AppScaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              46.verticalSpace,
              ProfileHeaderSection(),
              23.verticalSpace,
              if(context.read<AppBloc>().state.isToken)
              BlocSelector<ProfileBloc,ProfileState,PageState<ProfileModel>>(
                  selector: (state) => state.getProfileState
                  , builder:(context,state)=>
              PageStateBuilder(
                  init: Container(),
                  success: (data) =>     MyAccount(
                    bloc: _profileBloc,
                    data:data,),
                   loading: const LoadingWidget(),
                  error: (Exception? error) {

                    return ErrorWidgetPage(
                      onPressed: () {
                        _profileBloc.add(GetProfileEvent());
                      },
                    );
                  } ,
              result:state ,
                  empty: const EmptyWidget())

              ),
              GeneralSetting(),
              const UserInformation(),
              if(context.read<AppBloc>().state.isToken)
              FractionallySizedBox(
                widthFactor: 0.9,
                  child: AppButton.dark(title:S.current.Logout,onPressed: () {
                    AnimatedDialog.show(context, child: DialogLogout());
                  },)),
            ],
          ),
        ),

      ),
    );
  }
}
