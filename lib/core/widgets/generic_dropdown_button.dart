// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors_manager.dart';
import '../theme/text_styles.dart';
import 'app_spacer.dart';

class GenericDropdownButton<T> extends StatefulWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T item) itemLabel;
  final ValueChanged<T?>? onChanged;
  final bool isReadOnly;
  final String? name;
  final bool isRequired;
  final String? hint;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;
  final GlobalKey<FormFieldState>? formFieldKey;

  const GenericDropdownButton({
    super.key,
    required this.items,
    this.selectedItem,
    required this.itemLabel,
    this.onChanged,
    this.isReadOnly = false,
    this.isRequired = false,
    this.name,
    this.hint,
    this.prefixIcon,
    this.validator,
    this.formFieldKey,
  });

  @override
  _GenericDropdownButtonState<T> createState() =>
      _GenericDropdownButtonState<T>();
}

class _GenericDropdownButtonState<T> extends State<GenericDropdownButton<T>> {
  T? selectedValue;
  List<T> uniqueItems = [];

  @override
  void initState() {
    super.initState();
    uniqueItems = widget.items.toSet().toList();
    selectedValue = widget.selectedItem ?? selectedValue;
  }

  @override
  void didUpdateWidget(GenericDropdownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem != oldWidget.selectedItem) {
      selectedValue = widget.selectedItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      key: widget.formFieldKey,
      initialValue: selectedValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator ??
          (widget.isRequired
              ? (value) => value == null ? 'This field is required' : null
              : null),
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.name != null)
              Row(
                children: [
                  Text(widget.name!, style: TextStyles.regular14),
                  if (widget.isRequired)
                    Text(
                      ' *',
                      style: TextStyles.regular14.copyWith(color: Colors.red),
                    ),
                ],
              ),
            if (widget.name != null) SizedBox(height: 8.h),
            Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 4.0.h),
              decoration: BoxDecoration(
                color: Color(0xFFF7F7F7),
                border: Border.all(
                  color: state.hasError ? Colors.red : ColorsManager.grey,
                  width: state.hasError ? 1.0 : 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0.r),
              ),
              child: Row(
                children: [
                  if (widget.prefixIcon != null) ...[
                    widget.prefixIcon!,
                    AppSpacer(widthRatio: 1.2),
                  ],
                  Expanded(
                    child: DropdownButton<T>(
                      isExpanded: true,
                      icon:
                          Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                      hint: Text(
                        widget.hint ?? "Select an option",
                        style: TextStyles.regular14.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      value: selectedValue,
                      onChanged: widget.isReadOnly
                          ? null
                          : (T? newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                              state.didChange(newValue);
                              if (widget.onChanged != null) {
                                widget.onChanged!(newValue);
                              }
                            },
                      items: uniqueItems.map((T item) {
                        return DropdownMenuItem<T>(
                          value: item,
                          child: Text(
                            widget.itemLabel(item),
                            style: TextStyles.regular14.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      disabledHint: selectedValue != null
                          ? Text(
                              widget.itemLabel(selectedValue as T),
                              style: TextStyles.regular14.copyWith(
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              "no value selected",
                              style: TextStyles.regular14.copyWith(
                                color: Colors.black,
                              ),
                            ),
                      underline: const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 4.w),
                child: Text(
                  state.errorText!,
                  style: TextStyles.regular12.copyWith(color: Colors.red),
                ),
              ),
          ],
        );
      },
    );
  }
}
