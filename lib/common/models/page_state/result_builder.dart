import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/empty_widget.dart';
import '../../../features/app/presentation/widgets/error_widget.dart';
import '../../../features/app/presentation/widgets/loading_widget.dart';
import 'page_state.dart';

class PageStateBuilder<T> extends StatelessWidget {
   PageStateBuilder({
    Key? key,
    Widget ?init,
    required this.success,
     this.onError,
    this.loading=const LoadingWidget(),
    this.error,
    required this.result,
    this.empty=const EmptyWidget(),
  }):
        init = init??Container(),
      super(key: key);

  final PageState<T> result;
  final Widget init;
  final Widget ?loading;
  final Widget Function(T data) success;
  final Widget Function(Exception? error) ?error;
  final Widget ?empty;
  final VoidCallback ?onError;

  @override
  Widget build(BuildContext context) {
    assert((error != null || onError != null)&&(error == null || onError == null));

    late final Widget next;
    result.when(
      init: () => next = init,
      loading: () => next = loading!,
      loaded: (data) => next = success(data),
      error: (e,m) => next = error!=null?error!(e):ErrorWidgetPage(onPressed: onError!,),
      empty: () => next = empty!,
    );
    return next;
  }
}
