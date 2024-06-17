import 'package:fleaze/core/blocks/block.dart';

abstract class BlockFactory<T> {
  Block parseWidget(T widget);
  T parseBlock(Block block);
}
