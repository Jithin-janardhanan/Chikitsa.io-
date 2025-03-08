import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and profile

              _buildHeader(context),

              // Settings items
              _buildSettingsItems(),

              // Device section
              _buildSectionTitle('Device'),
              _buildDeviceSection(),

              // Caretakers section
              _buildCaretakersSection(),

              // Doctor section
              _buildSectionTitle('Doctor'),
              _buildDoctorSection(),

              // Legal links
              _buildLegalLinks(),

              // Log out button
              _buildLogoutButton(),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  'https://t3.ftcdn.net/jpg/03/02/88/46/360_F_302884605_actpipOdPOQHDTnFtp4zg4RtlWzhOASp.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.person)),
                ),
              ),
            ),
            // Back arrow positioned above the avatar

            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Take Care!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Richa Bose',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildSettingsItems() {
    return Column(
      children: [
        _buildSettingItem(Icons.notifications_outlined, 'Notification',
            'Check your medicine notification'),
        _buildSettingItem(
            Icons.volume_up_outlined, 'Sound', 'Ring, Silent, Vibrate'),
        _buildSettingItem(Icons.person_outline, 'Manage Your Account',
            'Password, Email ID, Phone Number'),
        _buildSettingItem(Icons.notifications_outlined, 'Notification',
            'Check your medicine notification'),
        _buildSettingItem(Icons.notifications_outlined, 'Notification',
            'Check your medicine notification'),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: Colors.grey[600]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildDeviceSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 253),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildSettingItem(Icons.bluetooth, 'Connect', 'Bluetooth, Wi-Fi'),
          _buildSettingItem(Icons.volume_up_outlined, 'Sound Option',
              'Ring, Silent, Vibrate'),
        ],
      ),
    );
  }

  Widget _buildCaretakersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
          child: Text(
            'Caretakers: 03',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(36),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 236, 236, 253),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCaretaker('Dipa Luna'),
                _buildCaretaker('Roz Sodi...'),
                _buildCaretaker('Sunny Tu...'),
                _buildAddCaretaker(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCaretaker(String name) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://via.placeholder.com/50',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.person)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCaretaker() {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 253),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Container(
              width: 60,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Add Your Doctor',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Or use invite link',
            style: TextStyle(
              fontSize: 14,
              color: Colors.orange[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegalLinks() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _buildLegalLink('Privacy Policy'),
          _buildLegalLink('Terms of Use'),
          _buildLegalLink('Rate Us'),
          _buildLegalLink('Share'),
        ],
      ),
    );
  }

  Widget _buildLegalLink(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey[300]!),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Log Out',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
