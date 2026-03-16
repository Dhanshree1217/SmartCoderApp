import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../user_data_manager.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import '../main.dart';
import '../auth_database.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  Future<void> signUpWithEmail() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 1));

    // Register user in database
    bool success = await AuthDatabase.registerUser(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      method: 'email',
    );
    
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ Account created! Please login with your credentials.'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        SmoothPageRoute(page: LoginScreen()),
      );
    } else {
      // Registration failed (email already exists or invalid email)
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Email already exists or invalid email format! Please try with different email.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> signUpWithGoogle() async {
    setState(() => isLoading = true);
    
    // Show Google account selection for signup
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF4285F4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  "G",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text('Choose an account'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildGoogleAccount(
              'John Doe',
              'john.doe@gmail.com',
              Colors.blue,
            ),
            Divider(),
            _buildGoogleAccount(
              'Sarah Smith',
              'sarah.smith@gmail.com',
              Colors.green,
            ),
            Divider(),
            _buildGoogleAccount(
              'Mike Johnson',
              'mike.j@gmail.com',
              Colors.orange,
            ),
            SizedBox(height: 10),
            TextButton.icon(
              icon: Icon(Icons.add, color: Color(0xFF4285F4)),
              label: Text('Use another account', style: TextStyle(color: Color(0xFF4285F4))),
              onPressed: () {
                Navigator.pop(context);
                _showAddNewGoogleAccount();
              },
            ),
          ],
        ),
      ),
    );

    setState(() => isLoading = false);
  }
  
  void _showAddNewGoogleAccount() {
    final newEmailController = TextEditingController();
    final newNameController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Google Account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newNameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: newEmailController,
              decoration: InputDecoration(
                labelText: 'Gmail Address',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (newEmailController.text.isNotEmpty && newNameController.text.isNotEmpty) {
                // Register new Google user in database
                bool success = await AuthDatabase.registerUser(
                  name: newNameController.text.trim(),
                  email: newEmailController.text.trim(),
                  password: 'google_auth_${DateTime.now().millisecondsSinceEpoch}',
                  method: 'google',
                );
                
                if (success) {
                  await UserDataManager.saveUserProfile(
                    name: newNameController.text,
                    email: newEmailController.text,
                  );
                  
                  Navigator.pop(context);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('✅ Google account created successfully!'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  
                  await Future.delayed(Duration(seconds: 1));
                  
                  Navigator.pushReplacement(
                    context,
                    SmoothPageRoute(page: HomeScreen(userName: newNameController.text)),
                  );
                } else {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('❌ Email already exists or invalid email format!'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              }
            },
            child: Text('Create Account'),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleAccount(String name, String email, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          name[0],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(email, style: TextStyle(fontSize: 12)),
      onTap: () async {
        // Register Google user in database
        bool success = await AuthDatabase.registerUser(
          name: name,
          email: email,
          password: 'google_auth_${DateTime.now().millisecondsSinceEpoch}', // Auto-generated password for Google users
          method: 'google',
        );
        
        if (success) {
          await UserDataManager.saveUserProfile(
            name: name,
            email: email,
          );

          Navigator.pop(context);
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✅ Google account created successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          
          await Future.delayed(Duration(seconds: 1));
          
          Navigator.pushReplacement(
            context,
            SmoothPageRoute(page: HomeScreen(userName: name)),
          );
        } else {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('❌ This Google account already exists! Please try login instead.'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF8B4513), Color(0xFFD2691E)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.rocket_launch, size: 80, color: Colors.white),
                  SizedBox(height: 20),
                  Text(
                    "Join Smart Coder",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Start your coding journey today!",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          icon: Text(
                            "G",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          label: Text(
                            "Sign up with Google",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4285F4),
                            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: isLoading ? null : signUpWithGoogle,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4CAF50),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: isLoading ? null : signUpWithEmail,
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? "),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  SmoothPageRoute(page: LoginScreen()),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2196F3),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}