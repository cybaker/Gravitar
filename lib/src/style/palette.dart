// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// A palette of colors to be used in the game.
///
/// The reason we're not going with something like Material Design's
/// `Theme` is simply that this is simpler to work with and yet gives
/// us everything we need for a game.
///
/// Games generally have more radical color palettes than apps. For example,
/// every level of a game can have radically different colors.
/// At the same time, games rarely support dark mode.
///
/// Colors taken from this fun palette:
/// https://lospec.com/palette-list/crayola84
///
/// Colors here are implemented as getters so that hot reloading works.
/// In practice, we could just as easily implement the colors
/// as `static const`. But this way the palette is more malleable:
/// we could allow players to customize colors, for example,
/// or even get the colors from the network.
class Palette {
  Color get pen => Color(0xff1d75fb);

  Color get darkPen => const Color(0xFF0050bc);

  Color get redPen => const Color(0xFFd10841);

  Color get greenPen => const Color(0xFF00FF00);

  Color get inkFullOpacity => const Color(0xff352b42);

  Color get ink => const Color(0xee352b42);

  Color get backgroundMain => const Color(0xff222222);

  Color get backgroundLevelSelection => const Color(0xff444444);

  Color get backgroundPlaySession => const Color(0xff111111);

  Color get background4 => const Color(0xffffd7ff);

  Color get backgroundSettings => const Color(0xffbfc8e3);

  Color get trueWhite => const Color(0xffffffff);

  TextStyle get mainTitle => TextStyle( fontFamily: 'AstroSpace', fontSize: 78, color: pen,);
  TextStyle get mainTitleMobile => TextStyle( fontFamily: 'AstroSpace', fontSize: 40, color: pen,);

  TextStyle get missionAccomplished => TextStyle( fontFamily: 'AstroSpace', fontSize: 54, color: greenPen,);
  TextStyle get missionAccomplishedMobile => TextStyle( fontFamily: 'AstroSpace', fontSize: 36, color: greenPen,);

  TextStyle get title => TextStyle(fontFamily: 'AstroSpace', fontSize: 30, color: pen,);

  TextStyle get subtitle => TextStyle(fontFamily: 'AstroSpace', fontSize: 24, color: pen,);
  TextStyle get subtitleDisabled => TextStyle(fontFamily: 'AstroSpace', fontSize: 24, color: inkFullOpacity,);

  TextStyle get subtitleSmall => TextStyle(fontFamily: 'AstroSpace', fontSize: 20, color: pen,);
}
