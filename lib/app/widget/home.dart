import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // variables for user data
  String username = 'José Souza';
  String position = 'Motorista';

  void _handleMenuSelection(String value) {
    switch (value) {
      case 'profile':
        print('Profile selected');
        break;
      case 'settings':
        print('Settings selected');
        break;
      case 'logout':
        print('Logout selected');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 2, // top section
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(30, 58, 138, 1), // Top color
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 3, // bottom section
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(59, 130, 246, 1), // bottom color
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          // menu icon
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: PopupMenuButton<String>(
                              onSelected: _handleMenuSelection,
                              icon: const Icon(Icons.menu, size: 35),
                              itemBuilder: (BuildContext context) => [
                                const PopupMenuItem(
                                  value: 'profile',
                                  child: Text('Profile'),
                                ),
                                const PopupMenuItem(
                                  value: 'settings',
                                  child: Text('Settings'),
                                ),
                                const PopupMenuItem(
                                  value: 'logout',
                                  child: Text('Logout'),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Agendamentos',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: const Text('Conteúdo'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // agendamento
          print("Add button clicked!");
        },
        child: const Icon(Icons.add), 
        backgroundColor: Color.fromRGBO(59, 130, 246, 1), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
