import 'package:flutter/material.dart';
import 'package:spently/core/constants/app_radius.dart';
import 'package:spently/core/constants/app_sizes.dart';

class ColorPicker extends StatefulWidget {
  final Color? selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ColorPicker({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final ScrollController _scrollController = ScrollController();

  bool _showLeftShade = false;
  bool _showRightShade = true;

  static const List<Color> _colors = [
    Color(0xFF000000), // Black
    Color(0xFFE53935), // Red
    Color(0xFFD81B60), // Pink
    Color(0xFF8E24AA), // Purple
    Color(0xFF5E35B1), // Deep Purple
    Color(0xFF3949AB), // Indigo
    const Color(0xFF1E88E5), // Blue
    const Color(0xFF039BE5), // Light Blue
    const Color(0xFF00ACC1), // Cyan
    const Color(0xFF00897B), // Teal
    const Color(0xFF43A047), // Green
    const Color(0xFF7CB342), // Light Green
    const Color(0xFFC0CA33), // Lime
    const Color(0xFFFDD835), // Yellow
    const Color(0xFFFFB300), // Amber
    const Color(0xFFFB8C00), // Orange
    const Color(0xFFF4511E), // Deep Orange
    const Color(0xFF6D4C41), // Brown
    const Color(0xFF757575), // Grey
    const Color(0xFF546E7A), // Blue Grey
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final max = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;

    setState(() {
      _showLeftShade = offset > 5;
      _showRightShade = offset < max - 5;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppRadius.radius24),
            ),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _colors.length,
              itemBuilder: (context, index) {
                final color = _colors[index];
                final isSelected = widget.selectedColor == color;

                final double size = isSelected ? 46 : 40;

                return GestureDetector(
                  onTap: () => widget.onColorSelected(color),
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(right: 2),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    width: size, // фиксируем ячейку
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: color.withValues(alpha: .35),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ]
                            : [],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // LEFT SHADE
          if (_showLeftShade)
            Align(
              alignment: Alignment.centerLeft,
              child: _buildShade(left: true),
            ),

          // RIGHT SHADE
          if (_showRightShade)
            Align(
              alignment: Alignment.centerRight,
              child: _buildShade(left: false),
            ),
        ],
      ),
    );
  }

  Widget _buildShade({required bool left}) {
    return IgnorePointer(
      child: Container(
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.radius24),
          gradient: LinearGradient(
            begin: left ? Alignment.centerLeft : Alignment.centerRight,
            end: left ? Alignment.centerRight : Alignment.centerLeft,
            colors: [Colors.grey.withValues(alpha: 0.2), Colors.transparent],
          ),
        ),
      ),
    );
  }
}
