class HabitData {
  final String label, image, inscription, begin, end;

  HabitData({
    required this.label,
    required this.inscription,
    required this.image,
    required this.begin,
    required this.end,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HabitData &&
        runtimeType == other.runtimeType &&
        label == other.label &&
        image == other.image;
  }

  @override
  int get hashCode => label.hashCode ^ image.hashCode;
}
