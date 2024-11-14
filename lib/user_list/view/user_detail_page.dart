import 'package:flutter/material.dart';
import 'package:flutter_user_list_cubit/user_list/user_list.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.title,
          style: const TextStyle(color: Color(0xFFFAF3E0)), // Light cream for app bar text
        ),
        backgroundColor: const Color(0xFF264653), // Deep greenish-blue for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              user.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF2A9D8F), // Sea green for title
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              user.body,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: const Color(0xFF606C38), // Olive green for body text
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the previous post logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE9C46A), // Warm yellow for button background
                    foregroundColor: const Color(0xFF264653), // Deep greenish-blue for text
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Prev"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next post logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE9C46A), // Warm yellow for button background
                    foregroundColor: const Color(0xFF264653), // Deep greenish-blue for text
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logic for removing the current post
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE76F51), // Coral for delete button
                foregroundColor: const Color(0xFFFAF3E0), // Light cream for text
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text("Remove"),
            ),
          ],
        ),
      ),
    );
  }
}
