class CategoryModel {
  final int id;
  final String title;

  CategoryModel({
    required this.title,
    required this.id,
  });

  

  @override
  String toString() => 'CategoryModel(id: $id, title: $title)';

  CategoryModel copyWith({
    int? id,
    String? title,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'title': title,
    };
  }

  factory CategoryModel.fromJson(Map<String, Object?> map) {
    return CategoryModel(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }


}
