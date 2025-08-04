import 'package:flutter/material.dart';
import 'package:barbarshop/view/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _shopController = TextEditingController();

  bool _isLogin = true;
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _shopController.dispose();
    super.dispose();
  }

  Future<void> _handleAuth() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: screenHeight - MediaQuery.of(context).padding.top),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Logo Section with Glass Effect
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    height: screenHeight * 0.25,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background Circle
                        Container(
                          width: screenWidth * 0.5,
                          height: screenWidth * 0.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [const Color(0xFF8B4513).withOpacity(0.15), const Color(0xFFD2691E).withOpacity(0.1)],
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Inner Circle with Glass Effect
                        Container(
                          width: screenWidth * 0.4,
                          height: screenWidth * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 25, offset: const Offset(0, 12)),
                              BoxShadow(color: Colors.white.withOpacity(0.1), blurRadius: 15, offset: const Offset(-8, -8)),
                            ],
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.white, Color(0xFFFAFAFA)],
                              ),
                            ),
                            child: ClipOval(
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Image.asset('assets/image/logo.png', fit: BoxFit.contain,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.content_cut, size: 45, color: Color(0xFF8B4513)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Content Section
                SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 30, offset: const Offset(0, 15)),
                        BoxShadow(color: Colors.white.withOpacity(0.1), blurRadius: 15, offset: const Offset(-15, -15)),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.white.withOpacity(0.95), Colors.white.withOpacity(0.85)],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Header Section
                                Column(
                                  children: [
                                    // Tag Text
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [const Color(0xFF8B4513).withOpacity(0.15), const Color(0xFFD2691E).withOpacity(0.1)]),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Text(
                                        _isLogin ? '🔑 Account Access' : '👤 New Member',
                                        style: const TextStyle(fontSize: 11, color: Color(0xFF8B4513), fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Title
                                    Text(
                                      _isLogin ? 'Welcome Back!' : 'Join Us Today!',
                                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF8B4513)),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      _isLogin ? 'Sign in to your barbershop account' : 'Create your professional account',
                                      style: TextStyle(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                // Toggle Pills
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F9FA),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: _buildTogglePill('SIGN IN', _isLogin, () => setState(() => _isLogin = true))),
                                      Expanded(child: _buildTogglePill('SIGN UP', !_isLogin, () => setState(() => _isLogin = false))),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Form Fields
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: _isLogin ? _buildLoginFields() : _buildSignupFields(),
                                ),

                                const SizedBox(height: 20),

                                // Submit Button
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [Color(0xFF8B4513), Color(0xFFD2691E)]),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [BoxShadow(color: const Color(0xFF8B4513).withOpacity(0.4), blurRadius: 15, offset: const Offset(0, 6))],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: _isLoading ? null : _handleAuth,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                    ),
                                    child: _isLoading
                                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.white)))
                                        : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(_isLogin ? Icons.login_rounded : Icons.person_add_rounded, color: Colors.white, size: 18),
                                        const SizedBox(width: 8),
                                        Text(_isLogin ? 'SIGN IN' : 'CREATE ACCOUNT', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 0.8)),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 12),

                                // Toggle Text
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(_isLogin ? "Don't have an account? " : "Already have an account? ", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                    GestureDetector(
                                      onTap: () => setState(() => _isLogin = !_isLogin),
                                      child: Text(_isLogin ? 'Sign Up' : 'Sign In', style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.w600, fontSize: 13)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTogglePill(String text, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF8B4513) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive ? [BoxShadow(color: const Color(0xFF8B4513).withOpacity(0.3), blurRadius: 6, offset: const Offset(0, 2))] : null,
        ),
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(color: isActive ? Colors.white : Colors.grey[600], fontWeight: FontWeight.w700, fontSize: 13, letterSpacing: 0.5)),
      ),
    );
  }

  Widget _buildLoginFields() {
    return Column(
      key: const ValueKey('login'),
      children: [
        _buildTextField(_emailController, 'Email Address', Icons.email_outlined),
        const SizedBox(height: 16),
        _buildTextField(_passwordController, 'Password', Icons.lock_outline, isPassword: true),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF8B4513), fontSize: 12, fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupFields() {
    return Column(
      key: const ValueKey('signup'),
      children: [
        _buildTextField(_nameController, 'Full Name', Icons.person_outline),
        const SizedBox(height: 12),
        _buildTextField(_emailController, 'Email Address', Icons.email_outlined),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildTextField(_phoneController, 'Phone', Icons.phone_outlined)),
            const SizedBox(width: 12),
            Expanded(child: _buildTextField(_shopController, 'Shop Name', Icons.store_outlined)),
          ],
        ),
        const SizedBox(height: 12),
        _buildTextField(_passwordController, 'Password', Icons.lock_outline, isPassword: true),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && !_isPasswordVisible,
        validator: (value) => (value?.isEmpty ?? true) ? 'Required' : null,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF2D3748)),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [const Color(0xFF8B4513).withOpacity(0.12), const Color(0xFFD2691E).withOpacity(0.08)]),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: const Color(0xFF8B4513), size: 16),
          ),
          suffixIcon: isPassword ? IconButton(
            icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF8B4513), size: 18),
            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
          ) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[200]!, width: 1)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF8B4513), width: 1.5)),
          labelStyle: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.w500),
          floatingLabelStyle: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.w700),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}