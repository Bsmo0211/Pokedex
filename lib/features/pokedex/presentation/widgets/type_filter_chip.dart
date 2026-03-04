import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/get_type_colors.dart';
import 'package:pokedex/core/utils/get_type_translator.dart';

class TypeFilterChip extends StatelessWidget {
  final String typeKey;
  final StateSetter setModalState;
  final List<String> selectedTypes;
  final VoidCallback onChanged;
  const TypeFilterChip({
    super.key,
    required this.setModalState,
    required this.typeKey,
    required this.selectedTypes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedTypes.contains(typeKey);
    final typeColor = GetTypeColors.getTypeColor(typeKey);

    return FilterChip(
      label: Text(
        TypeTranslator.translate(context, typeKey),
        style: TextStyle(
          color: isSelected ? Colors.white : typeColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      selected: isSelected,
      onSelected: (bool selected) {
        setModalState(() {
          if (selected) {
            selectedTypes.add(typeKey);
          } else {
            selectedTypes.remove(typeKey);
          }
        });
        onChanged();
      },
      selectedColor: typeColor,
      backgroundColor: typeColor.withValues(alpha: 0.1),
      checkmarkColor: Colors.white,
      shape: StadiumBorder(side: BorderSide(color: typeColor)),
      showCheckmark: true,
    );
  }
}
