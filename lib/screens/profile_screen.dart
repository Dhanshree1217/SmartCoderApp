import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user_data_manager.dart';
import 'login_screen.dart';
import '../main.dart';
import '../auth_database.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'User';
  String userEmail = '';
  String? userPhotoPath;
  int totalPoints = 0;
  int userLevel = 1;
  int streak = 0;
  int completedTopics = 0;
  String userRank = "";
  Map<String, int> languageProgress = {};

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    userName = await UserDataManager.getUserName();
    userEmail = await UserDataManager.getUserEmail();
    userPhotoPath = await UserDataManager.getUserPhoto();
    totalPoints = await UserDataManager.getTotalPoints();
    userLevel = await UserDataManager.getUserLevel();
    streak = await UserDataManager.getStreak();
    completedTopics = await UserDataManager.getCompletedTopicsCount();
    userRank = await UserDataManager.getUserRank();
    languageProgress = await UserDataManager.getLanguageProgress();
    
    // Update achievements when profile loads
    await UserDataManager.checkAndUnlockAchievements();
    
    setState(() {});
  }

  Future<void> pickImage() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose Photo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  await UserDataManager.saveUserPhoto(image.path);
                  setState(() {
                    userPhotoPath = image.path;
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  await UserDataManager.saveUserPhoto(image.path);
                  setState(() {
                    userPhotoPath = image.path;
                  });
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.emoji_emotions),
              title: Text('Avatar'),
              onTap: () {
                Navigator.pop(context);
                _showAvatarSelection();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAvatarSelection() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose Avatar'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      userPhotoPath = 'avatar1';
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Text('👨‍💻', style: TextStyle(fontSize: 30)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      userPhotoPath = 'avatar2';
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text('👩‍💻', style: TextStyle(fontSize: 30)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      userPhotoPath = 'avatar3';
                    });
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purple,
                    child: Text('🧑‍💻', style: TextStyle(fontSize: 30)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editProfile() async {
    final nameController = TextEditingController(text: userName);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await UserDataManager.saveUserName(nameController.text);
              setState(() {
                userName = nameController.text;
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 105, 174, 231), Color.fromARGB(255, 92, 164, 235)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.white),
                          onPressed: editProfile,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: pickImage,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage: userPhotoPath != null && 
                                            userPhotoPath != 'avatar1' && 
                                            userPhotoPath != 'avatar2' && 
                                            userPhotoPath != 'avatar3' &&
                                            File(userPhotoPath!).existsSync()
                                ? FileImage(File(userPhotoPath!))
                                : null,
                            child: userPhotoPath == 'avatar1'
                                ? Text('👨💻', style: TextStyle(fontSize: 60))
                                : userPhotoPath == 'avatar2'
                                    ? Text('👩💻', style: TextStyle(fontSize: 60))
                                    : userPhotoPath == 'avatar3'
                                        ? Text('🧑💻', style: TextStyle(fontSize: 60))
                                        : (userPhotoPath == null || !File(userPhotoPath!).existsSync())
                                            ? Icon(Icons.person, size: 60, color: Color(0xFF2196F3))
                                            : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (userEmail.isNotEmpty)
                      Text(
                        userEmail,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 20),
                          SizedBox(width: 5),
                          Text(
                            'Level $userLevel',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          'Total Points',
                          '$totalPoints',
                          Icons.emoji_events,
                          Colors.amber,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          'Streak',
                          '$streak Days',
                          Icons.local_fire_department,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          'Completed',
                          '$completedTopics Topics',
                          Icons.check_circle,
                          Colors.green,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _buildStatCard(
                          'Rank',
                          userRank.isNotEmpty ? userRank : '-',
                          Icons.leaderboard,
                          Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  _buildSectionTitle('Achievements'),
                  SizedBox(height: 15),
                  _buildAchievementCard(
                    'First Steps',
                    'Complete your first topic',
                    completedTopics >= 1,
                    Icons.flag,
                  ),
                  _buildAchievementCard(
                    'Quiz Master',
                    'Score 100% in any quiz',
                    totalPoints >= 50,
                    Icons.quiz,
                  ),
                  _buildAchievementCard(
                    'Code Warrior',
                    'Complete 5 practice exercises',
                    completedTopics >= 5,
                    Icons.code,
                  ),
                  _buildAchievementCard(
                    'Streak Champion',
                    'Maintain 7 day streak',
                    streak >= 7,
                    Icons.local_fire_department,
                  ),
                  _buildAchievementCard(
                    'Point Collector',
                    'Earn 100 points',
                    totalPoints >= 100,
                    Icons.star,
                  ),
                  _buildAchievementCard(
                    'Learning Machine',
                    'Complete 10 topics',
                    completedTopics >= 10,
                    Icons.school,
                  ),
                  _buildAchievementCard(
                    'Expert Level',
                    'Reach 1000 points',
                    totalPoints >= 1000,
                    Icons.emoji_events,
                  ),
                  _buildAchievementCard(
                    'Dedication Master',
                    'Maintain 30 day streak',
                    streak >= 30,
                    Icons.calendar_today,
                  ),
                  SizedBox(height: 30),
                  _buildSectionTitle('Progress'),
                  SizedBox(height: 15),
                  _buildProgressCard('Python', (languageProgress['Python'] ?? 0).toDouble() / 100, Colors.blue),
                  _buildProgressCard('Java', (languageProgress['Java'] ?? 0).toDouble() / 100, Colors.orange),
                  _buildProgressCard('C', (languageProgress['C'] ?? 0).toDouble() / 100, Colors.purple),
                  _buildProgressCard('HTML', (languageProgress['HTML'] ?? 0).toDouble() / 100, Colors.red),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 17, 14, 14),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      await AuthDatabase.logout();
                      Navigator.of(context).pushAndRemoveUntil(
                        SmoothPageRoute(page: LoginScreen()),
                        (route) => false,
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 35),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildAchievementCard(String title, String description, bool unlocked, IconData icon) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: unlocked ? Colors.amber.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: unlocked ? Colors.amber : Colors.grey,
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: unlocked ? Colors.black87 : Colors.grey,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: unlocked
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.lock, color: Colors.grey),
      ),
    );
  }

  Widget _buildProgressCard(String language, double progress, Color color) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  language,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }
}
