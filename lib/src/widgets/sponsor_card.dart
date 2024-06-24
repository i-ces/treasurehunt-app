import 'package:flutter/material.dart';

class SponsorCard extends StatefulWidget {
  final String sponsorType;
  final String sponsorName;
  final String sponsorImage;
  final String sponsorDescription;

  const SponsorCard({
    Key? key,
    required this.sponsorType,
    required this.sponsorName,
    required this.sponsorImage,
    required this.sponsorDescription,
  }) : super(key: key);

  @override
  _SponsorCardState createState() => _SponsorCardState();
}

class _SponsorCardState extends State<SponsorCard> {
  bool isExpanded = false;

  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sponsorType,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Image.asset(
                    //   widget.sponsorImage,
                    //   height: 50,
                    // ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.sponsorName,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                        color: Colors.orange,
                      ),
                      onPressed: toggleExpand,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.sponsorDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
