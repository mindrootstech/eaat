class AppAssets {
  static _SvgIcons get svgIcons => _SvgIcons();
  static _PngIcons get pngIcons => _PngIcons();
  static _Images get images => _Images();
  static _SVGImage get svgImage => _SVGImage();
}

const String _iconPath = 'assets/icons';
const String _imagePath = 'assets/images';

class _SvgIcons {
  final String logo = '$_iconPath/logo.svg';
  final String heart = '$_iconPath/heart.svg';
  // Add more as needed
}

class _PngIcons {
  final String user = 'assets/icons/user.png';
  final String cart = 'assets/icons/cart.png';
  // Add more as needed
}

class _Images {
  final String background = '$_imagePath/splash_bg.png';
}

class _SVGImage {
  final String getStarted = '$_imagePath/get_started.svg';
  final String onboardingOne = '$_imagePath/onboarding_1.svg';
  final String onboardingTwo = '$_imagePath/onboarding_2.svg';
  final String onboardingThree = '$_imagePath/onboarding_3.svg';
}
