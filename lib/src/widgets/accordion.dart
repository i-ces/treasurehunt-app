import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;
  final String? image;

  const Accordion({
    super.key,
    this.image,
    required this.title,
    required this.content,
  });

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: AnimatedContainer(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 142,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: _isExpanded
                  ? const BorderRadius.vertical(top: Radius.circular(12))
                  : BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      // Ensures square shape and clipped corners
                      borderRadius: BorderRadius.circular(12.0),
                      child: widget.image != null && widget.image!.isNotEmpty
                          ? FadeInImage.assetNetwork(
                              width: 120,
                              placeholder: 'assets/placeholder.png',
                              image: widget.image!,
                              fit: BoxFit.cover,
                            )
                          : SvgPicture.asset(
                              width: 100,
                              'assets/logo.svg',
                              color: Colors.white,
                            ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
              child: Align(
                heightFactor: _heightFactor.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    widget.content,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
