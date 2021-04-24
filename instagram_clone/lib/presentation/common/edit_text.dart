import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/generated/l10n.dart';
import 'package:instagram_clone/presentation/common/instagram_clone_colors.dart';

import 'input_status_vm.dart';

class EditText extends StatelessWidget {
  const EditText(
    this.editTextController,
    this.statusStream,
    this.focusNode,
    this.onChanged, {
    this.emptyErrorMessage,
    this.invalidErrorMessage,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.onEditingComplete,
    this.obscureText,
    this.initialValue,
    this.hint,
  });

  final Stream<InputStatusVM> statusStream; //InputStatus do form
  //Útil quando queremos ter um callback(ação) sempre que o texto muda
  final TextEditingController editTextController;
  final FocusNode focusNode; //possibilita obter o foco
  final String? emptyErrorMessage;
  final String? invalidErrorMessage;
  final String? labelText;
  final TextInputType? keyboardType; //tipo do teclado
  final TextInputAction? textInputAction;
  final ValueChanged<String> onChanged; //novo valor do form
  final VoidCallback? onEditingComplete; //O que fazer quando acabar de editar
  final bool? obscureText;
  final String? initialValue; //valor inicial, se for null, é ""
  final String? hint;

  @override
  Widget build(BuildContext context) => StreamBuilder<InputStatusVM>(
        stream: statusStream,
        builder: (context, snapshot) {
          final status = snapshot.data;
          String? errorMessage;

          if (status == InputStatusVM.invalid) {
            errorMessage = invalidErrorMessage ?? S.of(context).default_invalid_text_error_message;
          } else if (status == InputStatusVM.empty) {
            errorMessage = emptyErrorMessage ?? S.of(context).default_empty_text_error_message;
          }

          return TextField(
            controller: editTextController,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelText: labelText,
              errorText: errorMessage,
              fillColor: InstagramCloneColors.lynxWhite,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: InstagramCloneColors.darkGray,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: InstagramCloneColors.darkGray,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: InstagramCloneColors.darkGray,
                ),
              ),
              hintText: hint,
            ),
            cursorColor: Colors.black87,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
          );
        },
      );
}
