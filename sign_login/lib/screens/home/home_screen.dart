import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.signOut();
              if (context.mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${user?.displayName ?? 'User'}!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Email: ${user?.email ?? 'N/A'}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32.0),
            const Text(
              'You are now signed in. This is your home screen where you can add new features.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                subtitle: const Text('View your dashboard'),
                onTap: () {
                  // Navigate to dashboard page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dashboard coming soon!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                subtitle: const Text('Update your profile'),
                onTap: () {
                  // Navigate to profile page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile page coming soon!')),
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            Card(
              elevation: 2.0,
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                subtitle: const Text('Adjust app settings'),
                onTap: () {
                  // Navigate to settings page
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Settings page coming soon!')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new item or navigate to a new page
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add new item functionality coming soon!'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
