import 'package:evitarx/component/list_title.dart';
import 'package:flutter/material.dart';

import '../model/record_data.dart';
import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final records = <RecordModel>[];
  List<RecordModel> _filteredRecords = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  bool _showNoDataMessage = false;

  @override
  void initState() {
    super.initState();
    _filteredRecords.addAll(recordData);
  }

  void _filterRecords() {
    setState(() {
      _filteredRecords = recordData.where((record) {
        final nameMatch = record.name.toLowerCase().contains(_nameController.text.toLowerCase());
        final phoneMatch = record.phoneNo.toLowerCase().contains(_phoneController.text.toLowerCase());
        final cityMatch = record.city.toLowerCase().contains(_cityController.text.toLowerCase());
        return nameMatch && phoneMatch && cityMatch;
      }).toList();

      _showNoDataMessage = _filteredRecords.isEmpty;
    });
  }

  void _resetFilter() {
    setState(() {
      _nameController.clear();
      _phoneController.clear();
      _cityController.clear();
      _filteredRecords.clear();
      _filteredRecords.addAll(recordData);
      _showNoDataMessage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Filter Data'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: 'Phone'),
                        ),
                        TextField(
                          controller: _cityController,
                          decoration: InputDecoration(labelText: 'City'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _resetFilter();
                          Navigator.of(context).pop();
                        },
                        child: Text('Clear'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _filterRecords();
                          Navigator.of(context).pop();
                        },
                        child: Text('Filter'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: _showNoDataMessage
          ? Center(
              child: Text('No data found.'),
            )
          : ListView.builder(
              itemCount: _filteredRecords.length,
              itemBuilder: (context, index) {
                return RecordItem(
                  record: _filteredRecords[index],
                  onUpdate: (newRupee) {
                    setState(() {
                      _filteredRecords[index].rupee = newRupee;
                    });
                  },
                  index: index,
                );
              },
            ),
    );
  }
}
