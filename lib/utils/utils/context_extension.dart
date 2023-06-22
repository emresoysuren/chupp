import 'package:chupp/utils/styles.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:chupp/utils/utils/inherited.dart';
import 'package:flutter/material.dart';

extension Utils on BuildContext {
  UtilsInherited get utils => UtilsInherited.of(this);

  AppTheme get theme => utils.theme;

  Styles get styles => utils.styles;
}
