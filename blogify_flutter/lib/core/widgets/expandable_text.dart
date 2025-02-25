import 'package:blogify_flutter/core/theme/app_color.dart';
import 'package:flutter/material.dart';

extension ExpandableTextExtension on Widget {
  Widget toExpandableText({int maxLines = 2}) {
    return ExpandableTextWrapper(
      textWidget: this,
      maxLines: maxLines,
    );
  }
}

class ExpandableTextWrapper extends StatefulWidget {
  final Widget textWidget;
  final int maxLines;

  const ExpandableTextWrapper({
    super.key,
    required this.textWidget,
    this.maxLines = 2,
  });

  @override
  _ExpandableTextWrapperState createState() => _ExpandableTextWrapperState();
}

class _ExpandableTextWrapperState extends State<ExpandableTextWrapper> {
  bool _isExpanded = false;
  late String _fullText;
  late TextStyle? _textStyle;

  @override
  void initState() {
    super.initState();
    if (widget.textWidget is Text) {
      final textWidget = widget.textWidget as Text;
      _fullText = textWidget.data ?? "";
      _textStyle = textWidget.style;
    } else {
      throw ArgumentError("Only Text widgets are supported.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: _fullText, style: _textStyle),
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflowing = textPainter.didExceedMaxLines;

        return InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _fullText,
                maxLines: _isExpanded ? null : widget.maxLines,
                overflow:
                    _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                style: _textStyle,
              ),
              if (isOverflowing)
                Text(
                  _isExpanded ? "Show Less" : "Show More",
                  style: const TextStyle(
                      color: AppColor.primary, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        );
      },
    );
  }
}
