import 'package:flutter/material.dart';
import 'package:treasurehunt/src/widgets/accordion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Accordion(
        title: "i-CES ",
        content:
            "i-CES is working for the IOE PASCHIMANCHAL campus students for the several years in the past. It is an non-political anti social platform what to do I don't know what the hell I'm writing and why the hell I'm writing I've no fking idea. Lmao, why don't I write the Lorem ipsum  ,is it because I don't know how to write",
      ),
    );
  }
}
