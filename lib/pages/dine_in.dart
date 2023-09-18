import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tab_order_taking/components/app_button.dart';
import '../main.dart';

class DineIn extends StatefulWidget {
  const DineIn({super.key});

  @override
  State<DineIn> createState() => _DineInState();
}

class _DineInState extends State<DineIn> {
  TextEditingController table = TextEditingController();
  TextEditingController covers = TextEditingController();
  TextEditingController menu = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController instruction = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  final List<String> _dataList = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grapes',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Pineapple',
    'Plum',
    'Strawberry',
    'Watermelon',
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {
      _searchResults = _dataList
          .where((e) =>
              e.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchResults.clear();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          body: Form(
            autovalidateMode: autoValidateMode,
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  const Text(
                    'TABLE ORDER',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: primaryColor),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _searchController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryColor,
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Search for fruits...',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                              onPressed: _clearSearch,
                            )
                          : null,
                    ),
                  ),
                  Visibility(
                    visible: _searchController.text.isNotEmpty,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_searchResults[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                      visible: _searchController.text.isEmpty,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Order posted Time:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('--:--:-- --',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('GST: 0%=',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('        ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('S.C: 5%= ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('        ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Gross:',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('        ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('Total: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Text('        ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Table no: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border:
                                          OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text('Covers: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                Expanded(
                                  child: TextFormField(
                                    // Add your TextFormField properties here
                                    decoration: const InputDecoration(
                                      border:
                                          OutlineInputBorder(), // Customize the border as needed
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    // Text color
                                    padding: const EdgeInsets.all(16.0),
                                    // Button padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Button border radius
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Start",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    // Text color
                                    padding: const EdgeInsets.all(16.0),
                                    // Button padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Button border radius
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "New",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('Menu: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                SizedBox(width: 50,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text('Qty: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                                SizedBox(width: 50,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text('Rs: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),
                              ],
                            ), const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text('Instructions: ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor)),

                                Expanded(
                                  child: TextFormField(
                                    // Add your TextFormField properties here
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(), // Customize the border as needed
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    // Text color
                                    padding: const EdgeInsets.all(16.0),
                                    // Button padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Button border radius
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "ADD",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ), const SizedBox(height: 10),
                            const Text(
                              'ORDER LIST',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  color: primaryColor),
                            ),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: const BouncingScrollPhysics(),
                            //   itemCount: _dataList.length,
                            //   itemBuilder: (context, index) {
                            //     return ListTile(
                            //       title: Text(_dataList[index]),
                            //     );
                            //   },
                            // ),
                            const SizedBox(height: 100.0),
                            AppButtonWidget(label: "POST ORDER", onTap: (){})

                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
