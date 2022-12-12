import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 330, top: 10),
                child: Container(
                  height: 40,
                  width: 47,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff4b0082)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Text(
                      "Eng",
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 99, 2, 116)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                children: [
                  Text(
                    "to",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 99, 2, 116)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Khalti",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 99, 2, 116)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                "Sign in to your Khalti Account",
                style: TextStyle(
                    color: Colors.black45, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email_controller,
                validator: EmailValidator(errorText: "Invalid Email"),
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Mobile Number / Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.purple)),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: password_controller,
                obscureText: hidePassword,
                validator: MultiValidator([
                  RequiredValidator(errorText: "Password is required"),
                  MinLengthValidator(5,
                      errorText: "Password must have at least 5 characters"),
                  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                      errorText: "password must have special characters")
                ]),
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: InkWell(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: Icon(hidePassword == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250),
              child: Text(
                "FORGOT PASSWORD",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                onPressed: () {},
                minWidth: double.infinity,
                color: Color.fromARGB(255, 99, 2, 116),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(child: Text("New User?")),
            SizedBox(
              height: 7,
            ),
            Center(
              child: Text(
                "CREATE AN ACCOUNT",
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
