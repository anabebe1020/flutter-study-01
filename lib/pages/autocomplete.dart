import 'package:dydx_flutter_study_01/components/autocomplete.dart';
import 'package:dydx_flutter_study_01/components/scaffold.dart';
import 'package:flutter/material.dart';

class AutocompletePage extends StatefulWidget {
  const AutocompletePage({super.key});

  @override
  State<AutocompletePage> createState() => _AutocompletePageState();
}

class _AutocompletePageState extends State<AutocompletePage> {
  // サジェストのリスト
  List<SelectItemModel> options = [
    SelectItemModel(label: 'アイテム1', value: 'item1'),
    SelectItemModel(label: 'アイテム2', value: 'item2'),
  ];
  // 表示するテキスト
  String text = '';
  // フォーカス
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // ページ全体をFocusで覆う
    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.unfocus, // これでフォーカスが外れる
        child: MyScaffold(
          title: 'Autocomplete',
          persistentFooterButtons: [
            // サジェストのリストの追加
            IconButton.filled(
              color: Colors.white,
              onPressed: () {
                options.add(
                  SelectItemModel(label: '追加アイテム', value: 'itemAdd'),
                );
              },
              icon: const Icon(Icons.add),
            )
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Autocomplete
                MyAutocomplete(
                  options: options,
                  onSubmit: (item) {
                    setState(() {
                      text = item.label;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // 選択したテキストの表示
                Text(text, style: const TextStyle(fontSize: 24)),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
