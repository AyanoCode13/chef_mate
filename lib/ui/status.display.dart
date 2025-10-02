import 'package:chaf_mate_2/utils/command.dart';
import 'package:flutter/material.dart';

class StatusDisplay extends StatelessWidget {
  final Command _command;
  final Widget _successWidget;
  final Widget _loadingWidget;
  final Widget _errorWidget;

  const StatusDisplay({
    super.key, 
    required Command command, 
    required Widget successWidget, 
    Widget? loadingWidget, 
    Widget? errorWidget
  }) : 
  _command = command, 
  _successWidget = successWidget, 
  _loadingWidget = loadingWidget ?? const Center(child: CircularProgressIndicator()), 
  _errorWidget = errorWidget ?? const Text("An error occurred");
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListenableBuilder(
      listenable: _command,
      builder: (context, child){
        if(_command.running){
          return _loadingWidget;
        }
        if(_command.failed){
          return _errorWidget;
        }
        return _successWidget;
      },
    );
  }

}