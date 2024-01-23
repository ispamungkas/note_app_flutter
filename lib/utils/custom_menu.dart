import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/note_controller.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();
  final get = Get.put(NoteController());

  String? _title;
  double? _buttonwidth;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: MenuContainer(
                width: _buttonwidth,
                callback: (value) {
                  print(value);
                  get.changeTitleText(value);
                },
              ),
            ),
          );
        },
        child: Obx(
          () => ButtonMenu(
            onTap: onTap,
            child: Text((get.titleText.value == '')
                ? "Select type of note"
                : get.titleText.value),
          ),
        ),
      ),
    );
  }

  void onTap() {
    _buttonwidth = context.size?.width;
    _tooltipController.toggle();
  }
}

class ButtonMenu extends StatelessWidget {
  const ButtonMenu(
      {super.key, this.height = 48, this.width, this.onTap, this.child});
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black12)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  MenuContainer({super.key, this.width, required this.callback});
  final double? width;
  Function(dynamic value) callback = (value) {};
  String? _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200,
      height: 300,
      margin: const EdgeInsets.only(top: 20),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.black26,
            width: 1.5,
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                callback("coabs");
              },
              child: const Text("hasil"),
            ),
          ],
        ),
      ),
    );
  }
}
