import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TechViz',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('Project Name'),
                      _buildSectionContent('Techviz'),
                      _buildSectionTitle('Team Leader Name'),
                      _buildSectionContent('Harshit Kumar'),
                      _buildSectionContentWithLink(
                        'Know about the whole team',
                        'https://google.com/', // Actual URL for team info
                      ),
                      _buildSectionTitle('Institute Name'),
                      _buildSectionContent('UIET, Panjab University, Chandigarh'),
                      _buildSectionTitle('Theme Name'),
                      _buildSectionContent('Health Tech'),
                      _buildSectionTitle('Problem'),
                      _buildSectionContent(
                          'Daily tasks become intricate puzzles, from navigating busy streets to reading the evening news. '
                              'Blindness creates a barrier to information and independence.\n'
                              'Blind people face challenges navigating unfamiliar spaces, relying on senses like touch and hearing.\n'
                              'Reading text, using computers, and staying informed can be difficult without sight.\n'
                              'Simple actions like cooking, getting dressed, and managing money require creative solutions without vision.'),
                      _buildSectionTitle('Solution'),
                      _buildSectionContent(
                          'We have developed a wristband that can scan objects/obstacles ahead of the user and give information '
                              'about what lies ahead through audio signals.\n'
                              'The person is not only dependent on the camera sensors. We have embedded ultrasonic sensor, Lidar Sensor, '
                              'Thermal sensor etc. so that user can rely on the output provided by the wrist band.'),
                      _buildSectionTitle('Features'),
                      _buildSectionContent(
                          '★ Taking user surroundings data through camera modules and different sensors.\n'
                              '★ Analyzing surroundings data and give right output to the user via audio signal.\n'
                              '★ Different modes available to switch between object detection mode (useful in room), Sensor mode (useful when sitting outdoors), '
                              'and Dual mode (useful in walking).\n'
                              '★ Integration of ChatGPT & Google Assistant to communicate and stay updated through latest happenings in the world.\n'
                              '★ App: User can update distance threshold and other sensor settings. User can also update their surroundings to the portal which creates custom dataset for the device.\n'
                              '★ User can remove the camera module from the device and place it anywhere on the body within a range of 3 meters.'),
                      _buildSectionTitle('Path to Integration'),
                      _buildSectionContent(
                          '★ National Finalist Eyantra Innovation Challenge 23, IIT Bombay. One of the top 10 finalists out of 490 teams.\n'
                              '★ R&D being funded by Design and Innovation Centre, Panjab University.\n'
                              '★ RUSA Panjab University Funded project\n'
                              '★ Technology readiness level (TRL) 8'),
                      _buildSectionTitle('Collaboration with Government Initiatives and Special Schools for Differently-Abled'),
                      _buildSectionContent(
                          'TechViz plans to collaborate with government initiatives and special schools dedicated to differently-abled individuals. '
                              'By partnering with government agencies, TechViz can gain access to a broader network of potential customers and leverage existing channels for distribution and awareness.\n'
                              'B2B2C (Business-to-Government-to-Consumer) Market Approach.'),
                      _buildSectionTitle('Reaching Customers'),
                      _buildSectionContent('TechViz: Illuminating Possibilities for an Inclusive Tomorrow'),
                      SizedBox(height: 20),
                      _buildContactInfo(),
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            Image.asset('assets/img.png', height: 50),
                            SizedBox(height: 8),
                            Text('TechViz', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildSectionContentWithLink(String text, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
    );
    }


  void _launchURL(String url) async {
    try {
      await launch(url, forceSafariVC: false); // Launch in a browser
    } catch (e) {
      print('Error launching URL: $e');
      // Handle or log the error as needed
    }
  }


  void _launchEmail(String url) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'teamtechviz@gmail.com',
    );

    final String _url = _emailLaunchUri.toString();

    if (await canLaunch(_url)) {
      await launch(_url, forceSafariVC: false);
    } else {
      throw 'Could not launch $_url';
    }
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Contact Us'),
        _buildContactItem('Email', 'teamtechviz@gmail.com', Icons.email),
        _buildContactItem('Address', 'MDART, Sbi Atm, Block 3, UIET, Panjab University, Sector 25, Chandigarh, India', Icons.location_on),
      ],
    );
  }

  Widget _buildContactItem(String label, String value, IconData icon) {
    if(label == 'Email' ){

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => _launchEmail(value),
                    child: Text(
                      "teamtechviz@gmail.com",
                      style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    else {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }
}


// Developed by Ayush Mishra :)