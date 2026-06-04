import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'signup_screen.dart';
import '../main.dart';
import '../auth_database.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool isLoading = false;
  List<String> emailSuggestions = [];
  bool showSuggestions = false;

  @override
  void initState() {
    super.initState();
    loadSavedCredentials();
    loadEmailSuggestions();
  }

  Future<void> loadEmailSuggestions() async {
    final suggestions = await AuthDatabase.getLoginSuggestions();
    setState(() {
      emailSuggestions = suggestions;
    });
  }

  Future<void> loadSavedCredentials() async {
    // No auto-fill - only suggestions
  }

  Future<void> loginWithEmail() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter email and password'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => isLoading = true);
    
    // Try to login with database
    final user = await AuthDatabase.loginUser(
      email: emailController.text.trim(),
      password: passwordController.text,
    );
    
    if (user != null) {
      // Login successful
      if (rememberMe) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('savedEmail', emailController.text);
        await prefs.setString('savedPassword', passwordController.text);
        await prefs.setBool('rememberMe', true);
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✅ Welcome back, ${user['name']}!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      await Future.delayed(Duration(seconds: 1));
      
      Navigator.pushReplacement(
        context,
        SmoothPageRoute(page: HomeScreen(userName: user['name'])),
      );
    } else {
      // Login failed
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Invalid credentials! Please check your email and password.'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    setState(() => isLoading = true);
    
    // Show saved Google accounts
    final prefs = await SharedPreferences.getInstance();
    List<String> savedAccounts = prefs.getStringList('googleAccounts') ?? [];
    
    if (savedAccounts.isEmpty) {
      // First time - show default accounts
      savedAccounts = [
        'user@gmail.com|User',
        'demo@gmail.com|Demo',
        'test@gmail.com|Test User'
      ];
    }
    
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
            ...savedAccounts.map((account) {
              final parts = account.split('|');
              final email = parts[0];
              final name = parts.length > 1 ? parts[1] : email.split('@')[0];
              
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.primaries[savedAccounts.indexOf(account) % Colors.primaries.length],
                  child: Text(
                    name[0].toUpperCase(),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(email, style: TextStyle(fontSize: 12)),
                onTap: () async {
                  await prefs.setBool('isLoggedIn', true);
                  await prefs.setString('userName', name);
                  await prefs.setString('userEmail', email);
                  await prefs.setString('loginMethod', 'google');
                  
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    SmoothPageRoute(page: HomeScreen(userName: name)),
                  );
                },
              );
            }).toList(),
            Divider(),
            TextButton.icon(
              icon: Icon(Icons.add, color: Color(0xFF4285F4)),
              label: Text('Use another account', style: TextStyle(color: Color(0xFF4285F4))),
              onPressed: () {
                Navigator.pop(context);
                _showAddGoogleAccount();
              },
            ),
          ],
        ),
      ),
    );
    
    setState(() => isLoading = false);
  }
  
  void _showAddGoogleAccount() {
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
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: newEmailController,
              decoration: InputDecoration(
                labelText: 'Email',
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
                final prefs = await SharedPreferences.getInstance();
                List<String> accounts = prefs.getStringList('googleAccounts') ?? [];
                accounts.add('${newEmailController.text}|${newNameController.text}');
                await prefs.setStringList('googleAccounts', accounts);
                
                await prefs.setBool('isLoggedIn', true);
                await prefs.setString('userName', newNameController.text);
                await prefs.setString('userEmail', newEmailController.text);
                await prefs.setString('loginMethod', 'google');
                
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  SmoothPageRoute(page: HomeScreen(userName: newNameController.text)),
                );
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('✅ Account saved successfully!'),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
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
            colors: [Color(0xFFFF8C42), Color(0xFFFFB380)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.code, size: 80, color: Colors.amber),
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
                            "Continue with Google",
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
                          onPressed: isLoading ? null : loginWithGoogle,
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
                          controller: emailController,
                          onChanged: (value) {
                            setState(() {
                              showSuggestions = value.isNotEmpty && emailSuggestions.any((email) => email.toLowerCase().contains(value.toLowerCase()));
                            });
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        if (showSuggestions && emailSuggestions.isNotEmpty)
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: emailSuggestions
                                  .where((email) => email.toLowerCase().contains(emailController.text.toLowerCase()))
                                  .take(3)
                                  .map((email) => ListTile(
                                        dense: true,
                                        leading: Icon(Icons.history, size: 16, color: Colors.grey),
                                        title: Text(email, style: TextStyle(fontSize: 14)),
                                        onTap: () {
                                          emailController.text = email;
                                          setState(() {
                                            showSuggestions = false;
                                          });
                                        },
                                      ))
                                  .toList(),
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),
                            Text("Remember me"),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4CAF50),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: isLoading ? null : loginWithEmail,
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Login",
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
                            Text("Don't have an account? "),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  SmoothPageRoute(page: SignUpScreen()),
                                );
                              },
                              child: Text(
                                "Sign Up",
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