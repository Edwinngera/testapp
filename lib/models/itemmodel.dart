class Item {
  final String title;
  final String description;

  Item({
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Item(title: $title, description: $description)';
  }
}
