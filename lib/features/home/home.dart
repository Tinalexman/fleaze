import 'package:fleaze/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_widgets.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  void initState() {
    super.initState();
  }

  void showContextMenu() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const ContextMenuModal(),
      elevation: 1.0,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.h,
        backgroundColor: var10,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: var10,
      body: InteractiveViewer(
        maxScale: 4,
        onInteractionStart: (details) {},
        onInteractionUpdate: (details) {},
        onInteractionEnd: (details) {},
        child: Transform.scale(
          scale: 0.75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: SizedBox(
              width: 390.w,
              height: 800.h,
              child: Scaffold(
                body: SafeArea(
                  child: SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showContextMenu,
        child: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }
}
