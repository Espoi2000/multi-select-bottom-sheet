
import 'package:flutter/material.dart';
import 'package:multi_select_bottom_sheetsx_example/input_step_form_text_validation.dart';
import 'package:multi_select_bottom_sheetsx_example/view_bottom_sheet.dart';

class MultiSelectottomSheet extends StatefulWidget {
  const MultiSelectottomSheet({
    Key? key,
    required this.size,
    this.fontFamily,
    required this.title,
    this.surfaceBottomColor,
    required this.width,
    required this.enterList,
    this.backgroundColorItem,
    this.borderColordItem,
    this.primaryBrownColor,
    required this.selectedItemColor,
    required this.selectedItemStyle,
    required this.unSelectedItemStyle,
    required this.titleTextStyle,
    required this.iconShowBottonSheet,
    required this.errorText,
    required this.textEditingController,
    required this.surfaceContainerColor,
    required this.radiusContainerValue,
    required this.isRequired,
    required this.erroTextStyle,
    required this.icon,
  }) : super(key: key);
  final Size size;
  final String? fontFamily;
  final String title;
  final Color? surfaceBottomColor;
  final double width;
  final List<dynamic> enterList;
  final Color? backgroundColorItem;
  final Color? borderColordItem;
  final Color? primaryBrownColor;
  final Widget icon;
  final Color selectedItemColor;
  final TextStyle? selectedItemStyle;
  final TextStyle? unSelectedItemStyle;
  final TextStyle? titleTextStyle;
  final Widget iconShowBottonSheet;
  final String errorText;
  final TextEditingController textEditingController;
  final Color surfaceContainerColor;
  final double radiusContainerValue;
  final bool isRequired;
  final TextStyle? erroTextStyle;
  @override
  State<MultiSelectottomSheet> createState() => _MultiSelectottomSheetState();
}

class _MultiSelectottomSheetState extends State<MultiSelectottomSheet> {
  bool isSelected = false;
  List<dynamic> shoWSelectedList = [];
  bool isNoEmpty = false;
  bool showListIsEmpty = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.all(Radius.circular(widget.radiusContainerValue)),
            border: Border.all(
              width: 2,
              color: widget.isRequired && showListIsEmpty
                  ? Colors.red
                  : Colors.transparent,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: widget.titleTextStyle,
                  ),
                  GestureDetector(
                    child: widget.iconShowBottonSheet,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return BottomSheetView(
                            size: widget.size,
                            surfaceBottomColor: widget.surfaceBottomColor!,
                            width: widget.width,
                            enterList: widget.enterList,
                            textEditingController: widget.textEditingController,
                            backgroundColorItem: widget.backgroundColorItem!,
                            borderColordItem: widget.backgroundColorItem,
                            unSelectedItemStyle: widget.unSelectedItemStyle!,
                            icon: widget.icon,
                            callBack: (table) {
                              setState(() {
                                shoWSelectedList = table;
                                if (shoWSelectedList.isNotEmpty) {
                                  setState(() {
                                    showListIsEmpty = false;
                                  });
                                } else {
                                  setState(() {
                                    showListIsEmpty = true;
                                  });
                                }
                              });
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: widget.width,
                child: Column(
                  children: [
                    InputFormStepValidation(
                      errorText: widget.errorText,
                      inputController: widget.textEditingController,
                      readOnly: true,
                      contentPadding: const EdgeInsets.only(),
                      isRequired: widget.isRequired,
                    ),
                    SizedBox(
                      width: widget.width,
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: shoWSelectedList.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                shoWSelectedList
                                    .removeWhere((element) => element == e);
                                widget.textEditingController.text =
                                    shoWSelectedList.toString();
                              });
                              if (shoWSelectedList.isNotEmpty) {
                                setState(() {
                                  showListIsEmpty = false;
                                });
                              } else {
                                setState(() {
                                  showListIsEmpty = true;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: widget.primaryBrownColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    e == '[]' ? "" : e,
                                    style: widget.selectedItemStyle,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  widget.icon
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        widget.isRequired && showListIsEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.errorText,
                      style: widget.erroTextStyle,
                    ),
                  ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
