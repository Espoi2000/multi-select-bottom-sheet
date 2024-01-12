import 'package:flutter/material.dart';

class BottomSheetView extends StatefulWidget {
  const BottomSheetView(
      {required this.size,
      required this.surfaceBottomColor,
      required this.width,
      required this.enterList,
      required this.textEditingController,
      required this.backgroundColorItem,
      required this.borderColordItem,
      required this.unSelectedItemStyle,
      required this.icon,
      required this.callBack,
      super.key});

  final Size size;
  final Color surfaceBottomColor;
  final double width;
  final List<dynamic> enterList;
  final TextEditingController textEditingController;
  final Color backgroundColorItem;
  final Color? borderColordItem;
  final TextStyle unSelectedItemStyle;
  final Widget icon;
  final Function(List<dynamic> table) callBack;

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  List<dynamic> shoWSelectedList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height / 2,
      width: widget.size.width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: widget.surfaceBottomColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: 100,
                width: widget.width,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: widget.enterList.map((dynamic e) {
                    return GestureDetector(
                      onTap: () {
                        if (shoWSelectedList.contains(e)) {
                          setState(() {
                            shoWSelectedList
                                .removeWhere((element) => element == e);
                            widget.textEditingController.text =
                                shoWSelectedList.toString();
                          });
                        } else {
                          setState(() {
                            shoWSelectedList.add(e);
                            widget.textEditingController.text =
                                shoWSelectedList.toString();
                          });
                        }
                        widget.callBack( shoWSelectedList);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: widget.backgroundColorItem,
                          border: Border.all(
                            color: widget.borderColordItem!,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              e.toString(),
                              style: widget.unSelectedItemStyle,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            shoWSelectedList
                                    .where((element) => element == e)
                                    .toList()
                                    .isNotEmpty
                                ? widget.icon
                                : const SizedBox()
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
