import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipesFab extends StatelessWidget {
  const RecipesFab({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      onPressed: (){
        showGeneralDialog(context: context, pageBuilder: (context,_,_){
          return Dialog.fullscreen(
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Fliter 1"),
                        Text("Filter 2")
                      ],
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){}, 
                        child: Text("Apply Filters")
                      ),
                      TextButton(
                        onPressed: (){
                          context.pop();
                        }, 
                        child: Text("Cancel")
                      )
                    ],
                  )
                ],
              ),
            )
          );
        });
      }, 
      child: Icon(Icons.filter_list_alt)
    );
  }
  
}