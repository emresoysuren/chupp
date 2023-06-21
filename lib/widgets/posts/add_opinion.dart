import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddOpinion extends StatefulWidget implements PreferredSizeWidget {
  const AddOpinion({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  State<AddOpinion> createState() => _AddOpinionState();
}

class _AddOpinionState extends State<AddOpinion> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Utils.theme.current.primaryBg,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            4,
            16,
            MediaQuery.of(context).viewInsets.bottom + 4,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                  style: Styles.text,
                  decoration: InputDecoration(
                    hintText: "Add your opinion...",
                    hintStyle: Styles.subText,
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (text.isNotEmpty)
                SingleButton(
                  child: FaIcon(
                    FontAwesomeIcons.solidPaperPlane,
                    color: Utils.theme.current.primaryItem,
                    size: 22,
                  ),
                  onPressed: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}
