part of '../screen_browser.dart';

class _UiField extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSearch;

  const _UiField({
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          constraints: const BoxConstraints(
            maxHeight: 40.0,
          ),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
          fillColor: Colors.white,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          labelText: labelUrlField,
          suffixIcon: IconButton(
            onPressed: onSearch,
            icon: const Icon(
              Icons.search,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
