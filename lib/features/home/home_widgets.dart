import 'package:fleaze/core/index.dart';
import 'package:fleaze/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _ContextItem {
  final String name;
  final IconData data;
  final String link;

  const _ContextItem({
    required this.name,
    required this.data,
    required this.link,
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
    contextItems = [
      _ContextItem(
        name: "Add New Widget",
        data: Icons.add_rounded,
        link: Pages.search,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    bool isDark = context.isDark;

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

            return GestureDetector(
              onTap: () {
                context.router
                    .pushNamed(item.link)
                    .then((_) => Navigator.of(context).pop());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      color: isDark ? var2 : var3,
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
              ),
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
