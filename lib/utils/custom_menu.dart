import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/crud_note_controller.dart';
import 'package:note_app/controller/note_controller.dart';
import 'package:note_app/utils/custom_fontstyle.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key, this.isCanEdit});
  final isCanEdit;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();
  final get = Get.put(NoteController());

  // ignore: unused_field
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
            child: Text(
              (get.titleText.value == '')
                  ? "Select type of note"
                  : get.titleText.value,
              style: CustomStyle.titleMedium(context),
            ),
          ),
        ),
      ),
    );
  }

  void onTap() {
    if(widget.isCanEdit){
      _buttonwidth = context.size?.width;
      _tooltipController.toggle();
    } else {
      return;
    }
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

// ignore: must_be_immutable
class MenuContainer extends StatelessWidget {
  MenuContainer({super.key, this.width, required this.callback});
  final double? width;
  Function(dynamic value) callback = (value) {};

  // Note Controller instance
  final get = Get.put(NoteController());

  // Crud Note Controller instance
  final crud = Get.put(CrudNoteController());
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200,
      height: 190,
      margin: const EdgeInsets.only(top: 20),
      decoration: ShapeDecoration(
        color: Colors.grey.withOpacity(0.9),
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
            offset: Offset(10, 20),
            spreadRadius: -20,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      get.changeOptionState(1);
                      get.changeTitleText("Journal");
                      crud.setOfNote("Journal");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: (get.optionState.value == 1)
                                  ? Border.all(color: Colors.black, width: 1)
                                  : null,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Obx(
                                () => Container(
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: (get.optionState.value == 1)
                                        ? Colors.black
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Center(child: Text("Journal")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      get.changeOptionState(2);
                      get.changeTitleText("Quick Note");
                      crud.setOfNote("Quick Note");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: (get.optionState.value == 2)
                                  ? Border.all(color: Colors.black, width: 1)
                                  : null,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Obx(
                                () => Container(
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: (get.optionState.value == 2)
                                        ? Colors.black
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Center(child: Text("Quick Note")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      get.changeOptionState(3);
                      get.changeTitleText("To-do List");
                      crud.setOfNote("To-do List");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: (get.optionState.value == 3)
                                  ? Border.all(color: Colors.black, width: 1)
                                  : null,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Obx(
                                () => Container(
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: (get.optionState.value == 3)
                                        ? Colors.black
                                        : Colors.transparent,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Center(child: Text("To-do List")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
