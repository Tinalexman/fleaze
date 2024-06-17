
import 'package:fleaze/core/blocks/block.dart';
import 'package:fleaze/core/blocks/factory/block_factory.dart';
import 'package:flutter/material.dart';

class SizedBoxFactory extends BlockFactory<SizedBox> {


  @override
  SizedBox parseBlock(Block block) {
    return SizedBox();
  }

  @override
  Block parseWidget(SizedBox widget) {

    return Block();
  }

}