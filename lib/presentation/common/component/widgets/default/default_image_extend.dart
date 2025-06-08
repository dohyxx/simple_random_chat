import 'package:simple_random_chat/presentation/common/component/assets/icons/app_icons.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageExtend extends ConsumerWidget {
  final String imageUrl;
  final Widget? loading;
  final BoxFit boxFit;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShape? boxShape;
  final double? height;
  final double? width;
  final Widget? failedImage;
  final bool cache;
  final bool clearMemoryCache;

  const ImageExtend({
    required this.imageUrl,
    this.loading,
    this.boxFit = BoxFit.cover,
    this.border,
    this.borderRadius,
    this.boxShape,
    this.height,
    this.width,
    this.failedImage,
    this.cache = true,
    this.clearMemoryCache = true,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExtendedImage.network(
      imageUrl,
      fit: boxFit,
      shape: boxShape,
      width: width,
      height: height,
      border: border,
      cache: cache,
      borderRadius: borderRadius,
      clearMemoryCacheWhenDispose: clearMemoryCache,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return SizedBox();
          case LoadState.completed:
            break;
          case LoadState.failed:
            return SizedBox();
        }
        return null;
      },
    );
  }
}
