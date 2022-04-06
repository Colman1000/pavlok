class HabitData {
  final String label, image;

  HabitData({
    required this.label,
    required this.image,
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
