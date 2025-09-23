import 'package:chef_mate/data/query/search.recipe.query.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:chef_mate/ui/status.display.dart';
import 'package:flutter/material.dart';

class LoadMoreButton extends StatefulWidget {
  final RecipeSearchPageViewModel _viewModel;

  const LoadMoreButton({super.key, required RecipeSearchPageViewModel viewModel}) : _viewModel = viewModel;
  @override
  State<LoadMoreButton> createState() => _LoadMoreButtonState();
}

class _LoadMoreButtonState extends State<LoadMoreButton> {
  int _offset = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StatusDisplay(
      command: widget._viewModel.loadMore,
      loadingWidget: CircularProgressIndicator(),
      errorWidget: Text("Error"),
      successWidget: TextButton(
        onPressed: () async {
          await widget._viewModel.loadMore.execute(
            arg: _offset
          );
          setState(() {
            _offset += 10;
          });
        },
        child: Text("Load More"),
      ),
    );
  }
}
