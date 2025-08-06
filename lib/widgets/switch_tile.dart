import 'package:eaat/utils/themes/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchTile extends StatefulWidget {
  final String title;
  final bool? value;
  final ValueChanged<bool> onChanged;

  const SwitchTile({
    super.key,
    required this.title,
    this.value,
    required this.onChanged,
  });

  @override
  State<SwitchTile> createState() => _SwitchTileState();
}

class _SwitchTileState extends State<SwitchTile> {
  bool value = false;

  @override
  void initState() {
    value = widget.value ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: TextStyles.const15.w500.black),
            const SizedBox(width: 20),
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: value,
                onChanged: (bool value) {
                  setState(() {
                    this.value = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
