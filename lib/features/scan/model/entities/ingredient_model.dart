// models/IngredientModel.dart

class IngredientModel {
  final String title;
  final String imageUrl;
  final int initialQty;

  IngredientModel({
    required this.title,
    required this.imageUrl,
    this.initialQty = 1,
  });
}

final List<IngredientModel> dummyIngredientModels = [
  IngredientModel(
    title: 'Tomatoes',
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/03/05/19/02/tomatoes-1238253_1280.jpg',
    initialQty: 2,
  ),
  IngredientModel(
    title: 'Carrots',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/04/22/50/carrots-3193032_1280.jpg',
    initialQty: 1,
  ),
  IngredientModel(
    title: 'Apples',
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/01/20/15/06/apples-1995056_1280.jpg',
    initialQty: 5,
  ),
  IngredientModel(
    title: 'Bananas',
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/01/15/07/51/bananas-3088456_1280.jpg',
    initialQty: 3,
  ),
  IngredientModel(
    title: 'Potatoes',
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/12/21/23/40/potatoes-575698_1280.png',
    initialQty: 4,
  ),
];
