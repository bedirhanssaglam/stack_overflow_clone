import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../../uikit/button/special_button.dart';
import '../../../uikit/decoration/special_container_decoration.dart';

import '../../components/textformfield/default_text_form_field.dart';
import '../../viewmodels/register_view_model.dart';

class RegisterView extends StatelessWidget with BaseSingleton {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordV2Controller = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: _appBar(context),
        body: _body(context),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: FadeInDown(
        child: Text(AppLocalizations.of(context)!.registerAppbarTitle),
      ),
    );
  }

  FadeInUp _body(BuildContext context) {
    return FadeInUp(
      child: ListView(
        padding: context.padding2x,
        children: [
          _titleSection(context),
          context.emptySizedHeightBox5x,
          _registerSection(context)
        ],
      ),
    );
  }

  Container _titleSection(BuildContext context) {
    return Container(
      padding: context.padding4x,
      decoration: SpecialContainerDecoration(context: context),
      child: Text(
        AppLocalizations.of(context)!.registerTitle,
        style: context.textTheme.headline5,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _registerSection(BuildContext context) {
    return Container(
      padding: context.padding3x,
      decoration: SpecialContainerDecoration(context: context),
      child: Column(
        children: [
          _nameField(context),
          context.emptySizedHeightBox3x,
          _lastnameField(context),
          context.emptySizedHeightBox3x,
          _emailField(context),
          context.emptySizedHeightBox3x,
          _passwordField(context),
          context.emptySizedHeightBox3x,
          _againPasswordField(context),
          context.emptySizedHeightBox3x,
          _signUpButton(context)
        ],
      ),
    );
  }

  DefaultTextFormField _nameField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.nameLabel,
      prefixIcon: const Icon(Icons.person),
      controller: _nameController,
      validator: (name) => validators.nameCheck(name),
    );
  }

  DefaultTextFormField _lastnameField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.lastnameLabel,
      prefixIcon: const Icon(Icons.person),
      controller: _lastnameController,
      validator: (lastname) => validators.lastnameCheck(lastname),
    );
  }

  DefaultTextFormField _emailField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.emailLabel,
      prefixIcon: const Icon(Icons.mail),
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      validator: (email) => validators.emailCheck(email),
    );
  }

  DefaultTextFormField _passwordField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.passwordLabel,
      prefixIcon: const Icon(Icons.lock),
      controller: _passwordController,
      obscureText: true,
      validator: (password) => validators.twoPasswordCheck(
        password,
        _passwordV2Controller.text,
      ),
    );
  }

  DefaultTextFormField _againPasswordField(BuildContext context) {
    return DefaultTextFormField(
      context: context,
      labelText: AppLocalizations.of(context)!.passwordLabelV2,
      prefixIcon: const Icon(Icons.lock),
      controller: _passwordV2Controller,
      obscureText: true,
      validator: (passwordV2) => validators.twoPasswordCheck(
        passwordV2,
        _passwordController.text,
      ),
    );
  }

  SizedBox _signUpButton(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: SpecialButton(
        borderRadius: context.borderRadius2x,
        buttonLabel: AppLocalizations.of(context)!.signUp,
        onTap: () async {
          _formKey.currentState!.save();
          if (_formKey.currentState!.validate()) {
            final pv = Provider.of<RegisterViewModel>(context, listen: false);
            await pv.register(
              name: _nameController.text,
              lastname: _lastnameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              context: context,
            );
          }
        },
      ),
    );
  }
}