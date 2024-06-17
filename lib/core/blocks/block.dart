class Block {
  final String name;
  final Map<String, dynamic> properties;
  final List<Block> children;

  const Block({
    this.name = "",
    this.properties = const {},
    this.children = const [],
  });
}
