import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/models/Generic.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['LaundryApp']['pages']
    ['EditInfoView']['components']['LanguageSelectorComponent'];

typedef bool OnChangeShouldUpdateLang(
  LanguageType languageType,
);

class LanguageSelectorComponent extends StatefulWidget {
  const LanguageSelectorComponent({
    Key? key,
    required this.languageValue,
    required this.onChangeShouldUpdateLang,
    this.showDeleteIcon = false,
  }) : super(key: key);

  final Rxn<LanguageType> languageValue;
  final OnChangeShouldUpdateLang onChangeShouldUpdateLang;
  final bool showDeleteIcon;

  @override
  State<LanguageSelectorComponent> createState() =>
      _LanguageSelectorComponentState();
}

class _LanguageSelectorComponentState extends State<LanguageSelectorComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<LanguageType>(
        builder: (FormFieldState<LanguageType> state) {
          return Obx(
            () => InputDecorator(
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                filled: true,
                fillColor: Colors.grey.shade200,
                isDense: true,
                contentPadding: EdgeInsets.all(5),
                label: Text("${_i18n()["none"]}"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: (widget.showDeleteIcon &&
                        widget.languageValue.value != null)
                    ? IconButton(
                        onPressed: () {
                          widget.languageValue.value = null;
                        },
                        icon: Icon(Icons.close))
                    : null,
              ),
              isEmpty: widget.languageValue.value == null,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LanguageType>(
                  value: widget.languageValue.value,
                  isDense: true,
                  dropdownColor: Colors.grey.shade200,
                  onChanged: (LanguageType? newValue) {
                    if (newValue != null) {
                      final bool result =
                          widget.onChangeShouldUpdateLang(newValue);

                      if (result) {
                        widget.languageValue.value = newValue;
                        widget.languageValue.refresh();
                      }
                    }
                  },
                  items: [
                    LanguageType.EN,
                    LanguageType.ES,
                  ].map((LanguageType value) {
                    return DropdownMenuItem<LanguageType>(
                      value: value,
                      child: (value.toLanguageName() != null)
                          ? Text(value.toLanguageName()!)
                          : Container(),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
