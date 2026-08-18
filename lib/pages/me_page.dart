import 'package:flutter/material.dart';
import '../services/api_services/api_services.dart';

import 'home_page.dart';
class MePage extends StatefulWidget {
  final VoidCallback onBack;

  const MePage({
    super.key,
    required this.onBack,
  });

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  Map<String, dynamic>? user;

  bool isLoading = true;

  String? errorMessage;

  @override
  void initState() {
    super.initState();

    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data =
          await ApiServices.getCurrentUser();

      if (!mounted) return;

      setState(() {
        user = data;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage =
            e.toString().replaceFirst(
          'Exception: ',
          '',
        );

        isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    await ApiServices.logout();

    if (!mounted) return;

    widget.onBack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: widget.onBack,
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

      body: RefreshIndicator(
        onRefresh: _loadUser,

        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(),

          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              const SizedBox(height: 20),

              // PROFILE IMAGE
              Container(
                width: 100,
                height: 100,
                padding:
                    const EdgeInsets.all(4),

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

              // USER DATA
              if (isLoading)
                const Padding(
                  padding:
                      EdgeInsets.all(20),

                  child:
                      CircularProgressIndicator(),
                )
              else if (errorMessage != null)
                Column(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 40,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Unable to load profile',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      errorMessage!,
                      textAlign:
                          TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),

                    TextButton(
                      onPressed: _loadUser,
                      child:
                          const Text('Retry'),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Text(
                      user?['fullName'] ??
                          'User',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      user?['email'] ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      user?['phone'] ?? '',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 30),

              _profileItem(
                icon: Icons.person_outline,
                title: 'My Account',
                subtitle:
                    user?['fullName'] ??
                        'Manage your personal information',
                onTap: () {},
              ),

              _profileItem(
                icon: Icons.history,
                title: 'Scan History',
                subtitle:
                    'View your previous disease scans',
                onTap: () {},
              ),

              _profileItem(
                icon:
                    Icons.notifications_outlined,
                title: 'Notifications',
                subtitle:
                    'Manage notifications',
                onTap: () {},
              ),

              _profileItem(
                icon: Icons.lock_outline,
                title: 'Security',
                subtitle:
                    'Manage password and security',
                onTap: () {},
              ),

              _profileItem(
                icon: Icons.info_outline,
                title: 'About',
                subtitle:
                    'About TARI Disease Detector',
                onTap: () {},
              ),

              const SizedBox(height: 20),

              // LOGOUT
              SizedBox(
                width: double.infinity,
                height: 50,

                child:
                    OutlinedButton.icon(
                  // onPressed: _logout,
                    onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                               HomePage(
 
),
   ),
                              );
                              },

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),

                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  style:
                      OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.red,
                    ),

                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                              12),
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
      margin:
          const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,

        borderRadius:
            BorderRadius.circular(12),

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

            borderRadius:
                BorderRadius.circular(10),
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