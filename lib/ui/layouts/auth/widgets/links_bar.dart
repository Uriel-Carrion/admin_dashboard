import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: size.height * 0.05,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: 'About', onPressed: ()=>print('object'),)
          ],
      ),
    );
  }
}
