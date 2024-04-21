enum ImageItem {
  image,
  splash,
  customerLogin,
  demoProduct,
  companyIcon,
}

String defaultValue = "assets/images";

extension ImageItems on ImageItem {
  String str() {
    return switch (this) {
      ImageItem.image => "$defaultValue/image.png",
      ImageItem.splash => "$defaultValue/splash_image.jpeg",
      ImageItem.customerLogin => "$defaultValue/customer_login.png",
      ImageItem.demoProduct => "$defaultValue/demo-product.jpeg",
      ImageItem.companyIcon => "$defaultValue/company-icon.png",
    };
  }
}
