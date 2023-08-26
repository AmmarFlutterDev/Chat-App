import 'package:flutter/material.dart';

class AuthenciationScreem extends StatefulWidget {
  const AuthenciationScreem({super.key});

  @override
  State<AuthenciationScreem> createState() {
    return _AuthenciationScreemState();
  }
}

class _AuthenciationScreemState extends State<AuthenciationScreem> {
  final _form = GlobalKey<FormState>();
  void _submit() {
    final isValid = _form.currentState!.validate();
    if (isValid) {
      _form.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200,
                // child: const Image(image: AssetImage('a.png')),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                        key: _form,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email Address',
                              ),
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains('@ ')) {
                                  return 'plz entere the correct email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              onSaved: (value) {},
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password ',
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Paswword must be greater the 5 charcters long';
                                }
                                return null;
                              },
                              onSaved: (value) {},
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: _submit,
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
