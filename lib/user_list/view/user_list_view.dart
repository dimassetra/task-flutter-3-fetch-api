part of "user_list_page.dart";

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: const Color(0xFF1E2A47), // Dark blue shade for app bar
        centerTitle: true,
      ),
      body: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          if (state is UserListSuccess) {
            // Success
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  var user = state.users[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFF6C7B8B), // Muted slate blue for avatar
                        child: Text(
                          user.title.substring(0, 1).toUpperCase(),
                          style: const TextStyle(color: Color(0xFF00B0FF)), // Light blue text for avatar
                        ),
                      ),
                      title: Text(
                        user.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF1E2A47), // Dark blue for text
                        ),
                      ),
                      subtitle: Text(
                        user.body.length > 50
                            ? user.body.substring(0, 50) + '...'
                            : user.body,
                        style: const TextStyle(color: Color(0xFF99AAB5)), // Light gray for subtitle
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserDetailPage(user: user),
                          ),
                        );
                      },
                      onLongPress: () {
                        _showDeleteConfirmationDialog(context, user);
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is UserListError) {
            // Error
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: const Color(0xFFF44336), // Red for error icon
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Color(0xFF1C1C1C)), // Dark gray for error text
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    label: const Text("Reload Data"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E2A47), // Dark blue for button
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () =>
                        context.read<UserListCubit>().fetchUser(),
                  ),
                ],
              ),
            );
          } else if (state is UserListLoading) {
            // Loading
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF6C7B8B), // Muted slate blue for loading indicator
              ),
            );
          } else {
            // Initial / First time
            return Center(
              child: ElevatedButton.icon(
                label: const Text("Reload Data"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E2A47), // Dark blue for button background
                ),
                onPressed: () =>
                    context.read<UserListCubit>().fetchUser(),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserListCubit>().fetchUser(),
        backgroundColor: const Color(0xFF6C7B8B), // Muted slate blue for FAB
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // Function to display a confirmation dialog before deletion
  void _showDeleteConfirmationDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to remove this post?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog without deleting
              },
            ),
            TextButton(
              child: const Text("Remove"),
              onPressed: () {
                context.read<UserListCubit>().removeData(user);
                Navigator.of(context).pop(); // Close dialog after deletion
              },
            ),
          ],
        );
      },
    );
  }
}
