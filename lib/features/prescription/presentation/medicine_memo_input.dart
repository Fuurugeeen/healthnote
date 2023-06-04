import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/prescription_entry_model.dart';
import '../domain/prescription_entry_provider.dart';

class MedicineMemoInput extends ConsumerWidget {
  const MedicineMemoInput({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // メモ用
    return InputText(
      inputProvider: inputProvider,
    );
  }
}

class InputText extends ConsumerStatefulWidget {
  const InputText({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputTextState();
}

class _InputTextState extends ConsumerState<InputText> {
  late TextEditingController textEdit;

  @override
  void initState() {
    super.initState();

    final text = ref.read(widget.inputProvider).memo;
    textEdit = TextEditingController(
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEdit,
      onChanged: (value) {
        ref.read(widget.inputProvider.notifier).setMedicineMemo(
              text: value,
            );
      },
    );
  }
}
