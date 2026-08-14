import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  final VoidCallback onBack;

  const MePage({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // Back button
        leading: IconButton(
          onPressed: onBack,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),

        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile picture
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(4),

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ),
              ),

              child: ClipOval(
                child: Image.asset(
                  'assets/images/app_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Researcher',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'TARI Disease Detector',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            // Account
            _profileItem(
              icon: Icons.person_outline,
              title: 'My Account',
              subtitle: 'Manage your personal information',
              onTap: () {},
            ),

            // Scan History
            _profileItem(
              icon: Icons.history,
              title: 'Scan History',
              subtitle: 'View your previous disease scans',
              onTap: () {},
            ),

            // Notifications
            _profileItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Manage notifications',
              onTap: () {},
            ),

            // Security
            _profileItem(
              icon: Icons.lock_outline,
              title: 'Security',
              subtitle: 'Manage password and security',
              onTap: () {},
            ),

            // About
            _profileItem(
              icon: Icons.info_outline,
              title: 'About',
              subtitle: 'About TARI Disease Detector',
              onTap: () {},
            ),

            const SizedBox(height: 20),

            // Logout
            SizedBox(
              width: double.infinity,
              height: 50,

              child: OutlinedButton.icon(
                onPressed: () {
                  // Logout will be implemented here
                },

                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),

                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.red,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Powered by TARI',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,

        borderRadius: BorderRadius.circular(12),

        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: ListTile(
        onTap: onTap,

        leading: Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: Colors.green,
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),

        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
      ),
    );
  }
}