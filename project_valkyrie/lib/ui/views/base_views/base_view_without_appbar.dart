import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseViewWithoutAppbar<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;
  BaseViewWithoutAppbar({Key key, this.builder, this.model, this.child, this.onModelReady}) : super(key: key);

  _BaseViewWithoutAppbarState<T> createState() => _BaseViewWithoutAppbarState<T>();
}

class _BaseViewWithoutAppbarState<T extends ChangeNotifier> extends State<BaseViewWithoutAppbar<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
