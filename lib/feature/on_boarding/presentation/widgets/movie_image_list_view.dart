import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/test_assets_extention/assets.dart';
import 'movie_image_item.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key, required this.isReverse});
  final bool isReverse;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<String> Images = [
    MyAssets.assetsImagesImage1,
    MyAssets.assetsImagesImage2,
    MyAssets.assetsImagesImage3,
    MyAssets.assetsImagesImage4,
    MyAssets.assetsImagesImage5,
    MyAssets.assetsImagesImage6,
  ];
  late ScrollController _scrollController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;

        if (_scrollController.offset >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(_scrollController.offset + 1);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 183.h,
      child: ListView.separated(
        reverse: widget.isReverse,
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: Images.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          return MovieImageItem(image: Images[index]);
        },
      ),
    );
  }
}
