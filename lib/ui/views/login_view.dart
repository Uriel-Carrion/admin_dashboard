import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(
            context,
            listen: false,
          );

          return Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            // color: Colors.red,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no válido';
                          }
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Contraseña',
                          label: 'Contraseña',
                          icon: Icons.lock_outline,
                        ),
                      ),

                      SizedBox(height: 20),
                      CustomOutline(
                        onPressed: () {
                          final isValid = loginFormProvider.validateForm();
                          if (isValid) {
                            authProvider.login(
                              loginFormProvider.email,
                              loginFormProvider.password,
                            );
                          }
                        },
                        text: 'Ingresar',
                      ),

                      SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Flurorouter.registerRoute,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
