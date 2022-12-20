import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:journal_florist/features/login/login_service.dart';
import 'package:journal_florist/widgets/bottom_bar.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginService loginService = LoginService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool passwordHidden = true;

  _onFormSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await loginService
          .postLogin(
            _usernameController.text,
            _passwordController.text,
          )
          .then(
            (_) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => BottomBar(),
              ),
            ),
          );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            padding: EdgeInsets.all(size.width - size.width * .85),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                const Text(
                  "Welcome back.",
                  style: TextStyle(
                      color: Color(0xFF161925),
                      fontWeight: FontWeight.w600,
                      fontSize: 32),
                ),
                SizedBox(
                  height: size.height * .08,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: const TextStyle(color: Color(0xFF95989A)),
                        ),
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          return value!.isEmpty ? "Required field" : null;
                        },
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Color(0xFF95989A)),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordHidden = !passwordHidden;
                              });
                            },
                            child: Icon(
                              passwordHidden
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xff747881),
                              size: 23,
                            ),
                          ),
                        ),
                        controller: _passwordController,
                        obscureText: passwordHidden,
                        enableSuggestions: false,
                        toolbarOptions: const ToolbarOptions(
                          copy: false,
                          paste: false,
                          cut: false,
                          selectAll: false,
                          //by default all are disabled 'false'
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .050,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Signin',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(20),
                    SizedBox(
                      width: 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: _onFormSubmit,
                          icon: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
