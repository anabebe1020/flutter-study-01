import 'package:flutter/material.dart';

/// Autocompleteのサジェストで使用する型、defaultはただのString
class SelectItemModel {
  final String label;
  final String value;

  SelectItemModel({required this.label, required this.value});

  // サジェストのvalueとitemsの比較で、以下の記述がないと同じオブジェクトとして認識されない
  @override
  bool operator ==(Object other) {
    // valueで比較する
    return other is SelectItemModel && value == other.value;
  }

  @override
  int get hashCode {
    return value.hashCode;
  }
}

/// Autocomplete
class MyAutocomplete extends StatelessWidget {
  // サジェストに使用するリスト
  final List<SelectItemModel>? options;
  // アイテムを選択した時に実行される関数
  final void Function(SelectItemModel) onSubmit;

  const MyAutocomplete({
    super.key,
    required this.options,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    // 用意した型を指定
    return Autocomplete<SelectItemModel>(
      // サジェストの表示条件
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (options == null || options!.isEmpty) {
          return const Iterable<SelectItemModel>.empty();
        }
        // optionsの中から入力内容(textEditingValue)に一致するものサジェストとして表示する
        final found = options!.where(
          (option) => option.label.contains(textEditingValue.text),
        );
        return found;
      },
      // サジェストの選択結果
      onSelected: (item) => onSubmit(item),
      // サジェストのUI
      optionsViewBuilder: (context, onSelected, opts) {
        return Container(
          margin: const EdgeInsets.only(right: 48, bottom: 600),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: opts.length,
            itemBuilder: (_, i) {
              final option = opts.elementAt(i);
              // サジェストのアイテム
              return _SuggestListItem(
                label: option.label,
                onSelected: () => onSelected(option),
              );
            },
          ),
        );
      },
      // フォームの表示内容（デフォルトでない型を扱う場合は必要）
      displayStringForOption: (item) => item.label,
      // フォームのUI
      // fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
      //   return TextFormField(
      //     省略
      //   );
      // },
    );
  }
}

/// サジェストのリストのアイテム
class _SuggestListItem extends StatelessWidget {
  final String label;
  final void Function() onSelected;
  const _SuggestListItem({required this.label, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: onSelected,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            border: const Border(
              top: BorderSide(width: 1, color: Colors.white),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
