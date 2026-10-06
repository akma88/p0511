import 'package:flutter/material.dart';
import 'offices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Offices',
      home: const OfficesPage(),
    );
  }
}

class OfficesPage extends StatefulWidget {
  const OfficesPage({super.key});

  @override
  State<OfficesPage> createState() => _OfficesPageState();
}

class _OfficesPageState extends State<OfficesPage> {
  late Future<OfficesList> officeData;

  @override
  void initState() {
    super.initState();
    officeData = loadOffices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Offices'), centerTitle: true),
      body: FutureBuilder<OfficesList>(
        future: officeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          if (snapshot.hasData) {
            final offices = snapshot.data!.offices;

            return ListView.builder(
              itemCount: offices.length,
              itemBuilder: (context, index) {
                final office = offices[index];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      office.image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      office.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(office.address),
                  ),
                );
              },
            );
          }

          return const Center(child: Text('No offices found'));
        },
      ),
    );
  }
}
