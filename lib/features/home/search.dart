import 'package:fleaze/core/index.dart';
import 'package:fleaze/core/ui/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  late List<String> filteredWidgets;

  @override
  void initState() {
    super.initState();
    filteredWidgets = allWidgets.toList();

  }


  void filterWidgets(String text) {
    if(text.isNotEmpty) {
      String lower = text.toLowerCase();
      List<String> result = allWidgets.where((w) {
        return w.toLowerCase().contains(lower);
      }).toList();
      setState(() => filteredWidgets = result);
    } else {
      setState(() => filteredWidgets = allWidgets);
    }
  }


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.chevron_left_rounded),
          iconSize: 26.r,
        ),
        title: Text(
          "Widget Store",
          style: context.textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              FleazeTextField(
                controller: searchController,
                width: 390.w,
                height: 40.h,
                hint: "Search for a widget...",
                onChange: filterWidgets,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) => Text(
                    filteredWidgets[index],
                    style: context.textTheme.bodyLarge,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: 20.h),
                  itemCount: filteredWidgets.length,
                  padding: EdgeInsets.only(bottom: 10.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
