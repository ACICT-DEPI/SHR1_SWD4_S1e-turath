class PriceItem {
  final String name;
  final int quantity; // Assuming quantity is an integer
  final double itemCostDollars; // Ensure this is a double
  final String price; // إذا كنت تريد الاحتفاظ بـ price كجزء من الكلاس
  final String image; // إذا كنت تريد الاحتفاظ بـ image كجزء من الكلاس

  PriceItem({
    required this.name,
    required this.quantity,
    required this.itemCostDollars,
    required this.price,
    required this.image,
  });
}

