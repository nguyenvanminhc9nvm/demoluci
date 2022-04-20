import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final double? iconSize;
  final Alignment alignment;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final Widget? icon;
  final String? src;
  final Color? background;

  const SvgIcon({
    Key? key,
    this.iconSize,
    this.alignment = Alignment.center,
    this.color,
    this.padding = const EdgeInsets.all(4.0),
    this.icon,
    this.src,
    this.background,
  })  : assert(icon == null || src == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    var iconSize = this.iconSize ?? iconTheme.size;
    var border = iconSize != null ? BorderRadius.circular(iconSize) : null;

    return Container(
      padding: padding,
      decoration: BoxDecoration(color: background, borderRadius: border),
      child: SizedBox(
        height: iconSize ?? iconTheme.size,
        width: iconSize ?? iconTheme.size,
        child: Align(
          alignment: alignment,
          child: _icon(color ?? iconTheme.color),
        ),
      ),
    );
  }

  Widget _icon(Color? color) {
    if (icon != null) return icon!;

    if (src != null) {
      return SvgPicture.asset(src!, color: color);
    }

    return const SizedBox();
  }
}
