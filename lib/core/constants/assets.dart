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
  final String likeThisApp = '$_iconPath/like_this_app.svg';
  final String chefCap = '$_iconPath/chef_cap.svg';
  final String person = '$_iconPath/person.svg';
  final String apple = '$_iconPath/apple.svg';
  // Add more as needed
}

class _PngIcons {
  final String user = 'assets/icons/user.png';
  final String cart = 'assets/icons/cart.png';
  // Add more as needed
}

class _Images {
  final String background = '$_imagePath/splash_bg.png';
  final String scanYourFridge = '$_imagePath/fridge.png';
  final String notification = '$_imagePath/notification.png';
}

class _SVGImage {
  final String getStarted = '$_imagePath/get_started.svg';
  final String onboardingOne = '$_imagePath/onboarding_1.svg';
  final String onboardingTwo = '$_imagePath/onboarding_2.svg';
  final String onboardingThree = '$_imagePath/onboarding_3.svg';
}
