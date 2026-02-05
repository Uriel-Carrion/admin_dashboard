import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart' show CustomInputs;
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.red,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_sharp,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Contraseña',
                    label: 'Contraseña',
                    icon: Icons.lock_outline,
                  ),
                ),

                SizedBox(height: 20),
                CustomOutline(onPressed: () {}, text: 'Crear cuenta'),

                SizedBox(height: 20),
                LinkText(
                  text: 'Ir al login',
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
