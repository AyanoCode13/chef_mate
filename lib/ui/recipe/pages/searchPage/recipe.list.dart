import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_mate/ui/recipe/viewModels/recipe.search.page.viewModel.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatefulWidget {
  final RecipeSearchPageViewModel _viewModel;

  const RecipeList({super.key, required RecipeSearchPageViewModel viewModel}) : _viewModel = viewModel;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final ScrollController _scrollController = ScrollController();
  int _offset = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_scrollListener);
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
    
  }
  Future<void> _scrollListener() async {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      setState(() {
        _offset +=10;  
      }); // Trigger 200px before bottom
      await widget._viewModel.loadMore.execute(arg: _offset);
    }
  }


  @override
  Widget build(BuildContext context) {
    
    
    // TODO: implement build
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget._viewModel.recipes.length,
      itemBuilder: (context, index){
        final crtItem = widget._viewModel.recipes.elementAt(index);
        return ListTile(
          title: Text(crtItem.title),
          leading: Image(
            image: CachedNetworkImageProvider(crtItem.imageUrl),
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
         
        );
      }
    );
  }
}