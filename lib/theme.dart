// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'app.dart';

typedef ThemedWidgetBuilder = Widget Function(
  BuildContext context,
  ThemeData theme,
  ThemeData darkTheme,
  ThemeMode themeMode,
);

class AppTheme extends StatefulWidget {
  const AppTheme({
    Key? key,
    required this.themedWidgetBuilder,
  }) : super(key: key);

  final ThemedWidgetBuilder themedWidgetBuilder;

  @override
  AppThemeState createState() => AppThemeState();

  static AppThemeState of(BuildContext context) {
    return context.findAncestorStateOfType<AppThemeState>()!;
  }
}

class AppThemeState extends State<AppTheme> {
  late ThemeMode _themeMode;
  late bool _isBlack;
  late ThemeData _darkThemeData;
  late ThemeData _lightThemeData;

  late String _theme;

  @override
  void initState() {
    super.initState();

    _loadState();
    _updateThemes();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateThemes();
  }

  @override
  void didUpdateWidget(AppTheme oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateThemes();
  }

  void _loadState() {
    _theme = loadTheme();
    _isBlack = dataBox.get('theme_is_black') ?? false;
  }

  void updateTheme() {
    setState(() {
      _loadState();
      _updateThemes();
    });
  }

  _updateThemes() {
    logger.verbose('updateThemes');
    _themeMode = _theme == 'light'
        ? ThemeMode.light
        : _theme == 'dark'
            ? ThemeMode.dark
            : ThemeMode.system;

    final customThemes = dataBox.get('custom_themes') ?? {};

    final customDarkTheme = dataBox.get('custom_theme_dark');

    if (customDarkTheme == null) {
      _darkThemeData = _buildThemeData(_isBlack ? 'black' : 'dark');
    } else {
      _darkThemeData = _buildThemeDataWithJson(customThemes[customDarkTheme]);
    }

    final customLightTheme = dataBox.get('custom_theme_light');
    if (customLightTheme == null) {
      _lightThemeData = _buildThemeData('light');
    } else {
      _lightThemeData = _buildThemeDataWithJson(customThemes[customLightTheme]);
    }
  }

  String loadTheme() {
    return dataBox.get('theme') ?? 'system';
  }

  final errorColor = Colors.red.value;

  ThemeData _buildThemeDataWithJson(Map config) {
    final accentColor = Color(
      int.tryParse(config['color_accent'] ?? '') ?? errorColor,
    );
    final backgroundColor = Color(
      int.tryParse(config['color_background'] ?? '') ?? errorColor,
    );
    final cardColor = Color(
      int.tryParse(config['color_card'] ?? '') ?? errorColor,
    );
    String? backgroundImageUrl = config['background_image_url'];
    if (backgroundImageUrl?.isEmpty ?? false) {
      backgroundImageUrl = null;
    }

    return _buildCustomThemeData(
      accentColor: accentColor,
      backgroundColor: backgroundColor,
      cardColor: cardColor,
      brightness: backgroundColor.computeLuminance() < 0.5
          ? Brightness.dark
          : Brightness.light,
      backgroundImageUrl: backgroundImageUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.themedWidgetBuilder(
      context,
      _lightThemeData,
      _darkThemeData,
      _themeMode,
    );
  }

  final defaultAccentColor = Color(0xff1ed660);

  ThemeData _buildThemeData(String theme) {
    /* = RainbowColorTween([
      Colors.orange,
      Colors.red,
      Colors.blue,
    ]).transform(_controller.value);
 */

    //    Colors.lime;
    //Color(0xffEC1873);
    //Colors.cyan;

    if (theme == 'light') {
      return _buildCustomThemeData(
        accentColor: defaultAccentColor,
        backgroundColor: Color(0xfffafafa),
        cardColor: Color(0xffffffff),
        brightness: Brightness.light,
      );
    } else if (theme == 'dark') {
      return _buildCustomThemeData(
        accentColor: defaultAccentColor,
        backgroundColor: Color(0xff151819),
        cardColor: Color(0xff424242),
        brightness: Brightness.dark,
      );
    } else {
      return _buildCustomThemeData(
        accentColor: defaultAccentColor,
        backgroundColor: Colors.black,
        cardColor: Color(0xff424242),
        brightness: Brightness.dark,
      );
    }
  }

  ThemeData _buildCustomThemeData({
    required Color accentColor,
    required Color backgroundColor,
    required Color cardColor,
    required Brightness brightness,
    String? backgroundImageUrl,
  }) {
    var secondaryColor = accentColor;

    if (brightness == Brightness.light && accentColor == defaultAccentColor) {
      secondaryColor = Color(0xff00bd36);
    }

    final dividerColor =
        brightness == Brightness.dark ? Color(0x28ffffff) : Color(0x1c000000);

    final scheme = ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: brightness,
      primary: accentColor,
      onPrimary: Colors.black,
      secondary: secondaryColor,
      //surface: cardColor,
      surfaceTint: accentColor,

      /*      onBackground: Colors.red,
        onPrimary: Colors.red,
        onSecondary: Colors.red,
        onSurface: Colors.red, */
      /*     background: Colors.red,
        surface: Colors.red, */
    );

    const borderRadius = BorderRadius.all(Radius.circular(4));
    var themeData = ThemeData(
      useMaterial3: true,
      extensions: [
        ThemeImages(backgroundImageUrl: backgroundImageUrl),
      ],
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: accentColor,
      ),
      dividerColor: dividerColor,
      dividerTheme: DividerThemeData(color: dividerColor),
      brightness: brightness,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(accentColor),
      ),
      colorScheme: scheme,
      fontFamily: (dataBox.get('custom_font') ?? '').isEmpty
          ? null
          : dataBox.get('custom_font'),
      hintColor:
          brightness == Brightness.dark ? Colors.grey[500] : Colors.grey[500],

      primaryColor: accentColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            accentColor,
          ),
          foregroundColor: MaterialStateProperty.all(
            accentColor.computeLuminance() < 0.48 ? Colors.white : Colors.black,
          ),
        ),
      ),

      // visualDensity: VisualDensity.adaptivePlatformDensity,
      visualDensity: (Platform.isAndroid || Platform.isIOS)
          ? VisualDensity(horizontal: -2, vertical: 0)
          : VisualDensity(horizontal: -2, vertical: -2),
      // toggleableActiveColor: accentColor,
      highlightColor: accentColor,

      // hintColor: _accentColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: accentColor,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: accentColor,
        /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(
            color: Colors.red,
          ),
        ), */
      ),
      // TODO High-contrast mode dividerColor: Colors.white,

      /* textTheme: TextTheme(
        button: TextStyle(color: accentColor),
        subtitle1: TextStyle(
          // fontSize: 100,
          fontWeight: FontWeight.w500,
        ),
      ), */
      /* .apply(
        bodyColor: Color(0xff0d0d0d),
        displayColor: Color(0xff0d0d0d),
      ), */

      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return TextStyle();
            }
            if (states.contains(MaterialState.focused)) {
              return TextStyle(color: accentColor);
            }

            return TextStyle();
          },
        ),
        border: MaterialStateOutlineInputBorder.resolveWith(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return const OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide.none,
            );
          }
          if (states.contains(MaterialState.error)) {
            if (states.contains(MaterialState.focused)) {
              return OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: scheme.error, width: 2.0),
              );
            }
            return OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: scheme.error),
            );
          }
          if (states.contains(MaterialState.focused)) {
            return OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: scheme.primary, width: 2.0),
            );
          }
          if (states.contains(MaterialState.hovered)) {
            return OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: scheme.primary),
            );
          }
          return OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(color: scheme.outline),
          );
        }),
        focusColor: accentColor,
        fillColor: accentColor,
        enabledBorder: brightness == Brightness.light
            ? null
            : OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
      ),
      chipTheme: ChipThemeData(
        selectedColor: accentColor,
        secondaryLabelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        foregroundColor: Colors.black,
      ),
    );

    themeData = themeData.copyWith(
      appBarTheme: brightness == Brightness.dark
          ? AppBarTheme(
              color: Colors.black,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              foregroundColor: Colors.white,
            )
          : null,
      // backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      dialogBackgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      cardColor: cardColor,
    );

    return themeData;
  }
}

@immutable
class ThemeImages extends ThemeExtension<ThemeImages> {
  const ThemeImages({
    required this.backgroundImageUrl,
  });

  final String? backgroundImageUrl;

  @override
  ThemeImages copyWith({String? backgroundImageUrl, Color? danger}) {
    return ThemeImages(
      backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
    );
  }

  @override
  ThemeImages lerp(ThemeExtension<ThemeImages>? other, double t) {
    return this;
  }

  // Optional
  @override
  String toString() => 'ThemeImages(backgroundImageUrl: $backgroundImageUrl)';
}
