import 'package:fleaze/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _ContextItem {
  final String name;
  final IconData data;

  const _ContextItem({
    required this.name,
    required this.data,
  });
}

class ContextMenuModal extends StatefulWidget {
  const ContextMenuModal({super.key});

  @override
  State<ContextMenuModal> createState() => _ContextMenuModalState();
}

class _ContextMenuModalState extends State<ContextMenuModal> {
  late List<_ContextItem> contextItems;

  @override
  void initState() {
    super.initState();
    contextItems = const [
      _ContextItem(
        name: "Add New Widget",
        data: Icons.add_rounded,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 390.w,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: ListView.separated(
          itemBuilder: (_, index) {
            if (index == 0) {
              return SizedBox(
                height: 40.h,
                child: Center(
                  child: Text(
                    "Menu",
                    style: context.textTheme.headlineSmall,
                  ),
                ),
              );
            }

            _ContextItem item = contextItems[index - 1];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 32.r,
                  height: 32.r,
                  decoration: BoxDecoration(
                    color: var2,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Icon(
                    item.data,
                    size: 26.r,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  item.name,
                  style: context.textTheme.titleSmall,
                ),
              ],
            );
          },
          separatorBuilder: (_, __) => SizedBox(height: 20.h),
          itemCount: contextItems.length + 1,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}

class _AddWidgetModal extends StatelessWidget {
  const _AddWidgetModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
