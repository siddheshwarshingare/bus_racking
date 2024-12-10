import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<SearchScreen> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by bus number or route...',
              hintStyle: TextStyle(color: Colors.grey[600]),
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('buses_list').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final searchQueryLower = searchQuery.toLowerCase();
          final buses = snapshot.data!.docs.where((doc) {
            final busName = doc['busName'].toString().toLowerCase();
            final busNumber = doc['busNumber'].toString().toLowerCase();
            final route = doc['busRoute'].toString().toLowerCase();
            return busName.contains(searchQueryLower) ||
                busNumber.contains(searchQueryLower) ||
                route.contains(searchQueryLower);
          }).toList();

          if (searchQuery.isEmpty) {
            return const Center(
              child: Text('Enter a search term to filter the bus list.'),
            );
          }

          if (buses.isEmpty) {
            return const Center(
              child: Text('No buses match the search criteria.'),
            );
          }

          return ListView(
            children: buses.map((bus) {
              return ListTile(
                title: Text('${bus['busName']} (${bus['busNumber']})'),
                subtitle: Text('Route: ${bus['busRoute']}'),
                leading:
                    const Icon(Icons.directions_bus, color: Colors.deepPurple),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
