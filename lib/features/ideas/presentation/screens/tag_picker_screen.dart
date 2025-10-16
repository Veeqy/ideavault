import 'package:flutter/material.dart';

class TagPickerScreen extends StatefulWidget {
  const TagPickerScreen({super.key});

  @override
  State<TagPickerScreen> createState() => _TagPickerScreenState();
}

class _TagPickerScreenState extends State<TagPickerScreen> {
  List<String> selectedTags = [];

  List<String> options = [
    'Flutter',
    'Dart',
    'Mobile Development',
    'UI/UX',
    'Backend',
    //more options can be added here
    'Web Development',
    'Machine Learning',
    'Data Science',
    'Cloud Computing',
    'DevOps',
    'Cybersecurity',
    'Game Development',
    'AR/VR',
    'Blockchain',
    'IoT',
    'AI',
    'Big Data',
    'Networking',
    'Databases',
    'APIs',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiselect')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Text(
              selectedTags.isNotEmpty
                  ? 'Selected Tags: ${selectedTags.join(', ')}'
                  : 'No Tags Selected',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Expanded(child:
            //  ListView.builder(
            //   itemCount: options.length,
            //   itemBuilder: (context, index) {
            //     final tag = options[index];
            //     final isSelected = selectedTags.contains(tag);
            //     return
            //      ListTile(
            //       title: Text(tag),
            //       trailing: isSelected
            //           ? const Icon(Icons.check_box)
            //           : const Icon(Icons.check_box_outline_blank),
            //       onTap: () {
            //         setState(() {
            //           if (isSelected) {
            //             selectedTags.remove(tag);
            //           } else {
            //             selectedTags.add(tag);
            //           }
            //         });
            //       },
            //     );
            //   },
            // ))
         Wrap(
          spacing: 8.0,
          runSpacing: 12.0,
          children: [
            for (var tag in options)
              FilterChip(
                label: Text(tag),
                selected: selectedTags.contains(tag),
                onSelected: (isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedTags.add(tag);
                    } else {
                      selectedTags.remove(tag);
                    }
                  });
                },
              ),
          ]
          )
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:multiselect/multiselect.dart';

// class TagPickerScreen extends StatefulWidget {
//   const TagPickerScreen({super.key});

//   @override
//   State<TagPickerScreen> createState() => _TagPickerScreenState();
// }

// class _TagPickerScreenState extends State<TagPickerScreen> {
//   List<String> selectedTags = [];
//   List<String> options = [
//     'Flutter',
//     'Dart',
//     'Mobile Development',
//     'UI/UX',
//     'Backend',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: DropDownMultiSelect(
//             onChanged: (List<String> x) {
//               setState(() {
//                 selectedTags = x;
//               });
//             },
//             options: options,
//             selectedValues: selectedTags,
//             childBuilder: (selectedValues) => Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(selectedValues.join(', ')),
//             ),
//             isDense: false,
//             hint: const Text('Select Tags'),

//             // whenEmpty: 'Select Something',
//           ),
//         ),
//       ),
//     );
//   }
// }
