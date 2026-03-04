import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/type_filter_chip.dart';
import 'package:pokedex/l10n/app_localizations.dart';

class FilterBar extends StatefulWidget {
  final List<String> selectedTypes;
  String searchQuery;

  final Function(String) onSearchChanged;
  final VoidCallback onFiltersChanged;
  FilterBar({
    super.key,
    required this.selectedTypes,
    required this.searchQuery,

    required this.onFiltersChanged,
    required this.onSearchChanged,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  void _showFilterModal(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.filterTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children:
                            [
                                  'bug',
                                  'dark',
                                  'dragon',
                                  'electric',
                                  'fairy',
                                  'fighting',
                                  'fire',
                                  'flying',
                                  'ghost',
                                  'grass',
                                  'ground',
                                  'ice',
                                  'normal',
                                  'poison',
                                  'psychic',
                                  'rock',
                                  'steel',
                                  'water',
                                ]
                                .map(
                                  (type) => TypeFilterChip(
                                    typeKey: type,
                                    setModalState: setModalState,
                                    selectedTypes: widget.selectedTypes,
                                    onChanged: widget.onFiltersChanged,
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        l10n.filterApply,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() => widget.selectedTypes.clear());
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          l10n.filterCancel,
                          style: const TextStyle(
                            color: Colors.white,

                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: widget.onSearchChanged,
              decoration: InputDecoration(
                hintText: l10n.searchHint,
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => _showFilterModal(context),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const Icon(Icons.tune, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
