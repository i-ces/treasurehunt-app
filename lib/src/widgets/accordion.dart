import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class Accordion extends StatefulWidget {
  // final String sponsorType;
  final String sponsorName;
  final String sponsorImage;
  final String sponsorDescription;

  const Accordion({
    super.key,
    // required this.sponsorType,
    required this.sponsorName,
    required this.sponsorImage,
    required this.sponsorDescription,
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

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
            height: 140,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  // Ensures square shape and clipped corners
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      widget.sponsorImage,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    widget.sponsorName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: AppColors.AccentColor,
                  ),
                ),
              ],
            ),
            // decoration: BoxDecoration(
            //   color: Colors.orangeAccent,
            //   borderRadius: _isExpanded
            //       ? const BorderRadius.vertical(top: Radius.circular(12))
            //       : BorderRadius.circular(12),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.black.withOpacity(0.1),
            //       blurRadius: 10,
            //       offset: const Offset(0, 5),
            //     ),
            //   ],
            // ),
            // padding: const EdgeInsets.all(20),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         ClipRRect(
            //           // Ensures square shape and clipped corners
            //           borderRadius: BorderRadius.circular(12.0),
            //           child: widget.sponsorImage.isNotEmpty
            //               ? Container(
            //                   color: Colors.white,
            //                   child: Image.asset(
            //                     widget.sponsorImage,
            //                     width: 100,
            //                     height: 100,
            //                     fit: BoxFit.contain,
            //                   ),
            //                 )
            //               : SvgPicture.asset(
            //                   width: 100,
            //                   height: 100,
            //                   'assets/logo.svg',
            //                   color: Colors.white,
            //                 ),
            //         ),
            //         const SizedBox(width: 20),
            //         Center(
            //           child: FittedBox(
            //             child: AutoSizeText(
            //               widget.sponsorName,
            //               textAlign: TextAlign.center,
            //               style: const TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold,
            //                 color: Colors.white,
            //               ),
            //               maxLines: 3,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            // Container(
            //   decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.white,
            //   ),
            //   child: Icon(
            //     _isExpanded ? Icons.expand_less : Icons.expand_more,
            //     color: AppColors.AccentColor,
            //   ),
            // ),
            //   ],
            // ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedBuilder(
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
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      widget.sponsorDescription,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
