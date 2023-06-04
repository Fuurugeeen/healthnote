import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/prescription_entry_model.dart';
import '../domain/prescription_entry_provider.dart';

class MedicineDetailsSelect extends ConsumerWidget {
  const MedicineDetailsSelect({
    super.key,
    required this.inputProvider,
  });

  final NotifierProvider<PrescriptionEntryNotifier, PrescriptionEntryModel>
      inputProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 内、薬名は最大３つまで。
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return InputText(
          id: index,
          inputProvider: inputProvider,
        );
      },
    );
  }
}

class InputText extends ConsumerStatefulWidget {
  const InputText({
    super.key,
    required this.id,
    required this.inputProvider,
  });

  final int id;
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

    final text = ref.read(widget.inputProvider).medicineDetails[widget.id];
    textEdit = TextEditingController(
      text: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEdit,
      onChanged: (value) {
        ref.read(widget.inputProvider.notifier).setMedicineDetail(
              id: widget.id,
              text: value,
            );
      },
    );
  }
}
