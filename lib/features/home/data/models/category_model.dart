class CategoryModel {
  final String name, text;
  final void Function()? onTap;

  CategoryModel({
    required this.name,
    required this.text,
    this.onTap,
  });
}
