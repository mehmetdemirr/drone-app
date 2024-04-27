enum ImageItem {
  image,
  splash,
  customerLogin,
  demoProduct,
  companyIcon,
  defaultImage,
  appIcon,
}

String defaultValue = "assets/images";

extension ImageItems on ImageItem {
  String str() {
    return switch (this) {
      ImageItem.image => "$defaultValue/image.png",
      ImageItem.splash => "$defaultValue/splash_image.png",
      ImageItem.customerLogin => "$defaultValue/customer_login.png",
      ImageItem.demoProduct => "$defaultValue/demo-product.jpeg",
      ImageItem.companyIcon => "$defaultValue/company-icon.png",
      ImageItem.defaultImage => "$defaultValue/default-image.png",
      ImageItem.appIcon => "$defaultValue/app_icon.png",
    };
  }
}
