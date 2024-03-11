class CategoryDm {
  const CategoryDm({
    required this.title,
    required this.item,
  });

  final String title;
  final List<String> item;
}

List<CategoryDm> categoryList = [
  const CategoryDm(title: 'Entertainment', item: [
    'All',
    'WorkShops',
    'Music',
    'Business',
    'Sports',
  ]),
  const CategoryDm(title: 'Arts & Theatre', item: [
    'Fine Arts',
    'Theatre',
    'Literary Arts',
    'Crafts',
    'Photography',
    'Cooking',
  ]),
  const CategoryDm(title: 'More', item: [
    'Fine Arts',
    'Theatre',
    'Literary Arts',
    'Crafts',
    'Photography',
    'Cooking',
    'Performances',
    'Comedy',
    'Dance,'
  ]),
];
