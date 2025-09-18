import 'package:chef_mate/utils/command.dart';
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
    required Widget loadingWidget, 
    required Widget errorWidget
  }) : 
  _command = command, 
  _successWidget = successWidget, 
  _loadingWidget = loadingWidget, 
  _errorWidget = errorWidget;
  
  
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