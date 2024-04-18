// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CompanyHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyHomeScreen(),
      );
    },
    CompanyLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyLoginScreen(),
      );
    },
    CompanyOrderDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyOrderDetailScreen(),
      );
    },
    CompanyOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyOrderScreen(),
      );
    },
    CompanySettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanySettingScreen(),
      );
    },
    CompanyShowQrRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyShowQrScreen(),
      );
    },
    CustomerAreaLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerAreaLoginScreen(),
      );
    },
    CustomerHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerHomeScreen(),
      );
    },
    CustomerLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerLoginScreen(),
      );
    },
    CustomerOrderConfirmRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerOrderConfirmScreen(),
      );
    },
    CustomerSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerSettingScreen(),
      );
    },
    GetImageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GetImageScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderSuccessScreen(),
      );
    },
    PostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PostScreen(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailRouteArgs>(
          orElse: () => ProductDetailRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    QRViewExampleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QRViewExampleScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [CompanyHomeScreen]
class CompanyHomeRoute extends PageRouteInfo<void> {
  const CompanyHomeRoute({List<PageRouteInfo>? children})
      : super(
          CompanyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyLoginScreen]
class CompanyLoginRoute extends PageRouteInfo<void> {
  const CompanyLoginRoute({List<PageRouteInfo>? children})
      : super(
          CompanyLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyOrderDetailScreen]
class CompanyOrderDetailRoute extends PageRouteInfo<void> {
  const CompanyOrderDetailRoute({List<PageRouteInfo>? children})
      : super(
          CompanyOrderDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyOrderDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyOrderScreen]
class CompanyOrderRoute extends PageRouteInfo<void> {
  const CompanyOrderRoute({List<PageRouteInfo>? children})
      : super(
          CompanyOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanySettingScreen]
class CompanySettingRoute extends PageRouteInfo<void> {
  const CompanySettingRoute({List<PageRouteInfo>? children})
      : super(
          CompanySettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanySettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyShowQrScreen]
class CompanyShowQrRoute extends PageRouteInfo<void> {
  const CompanyShowQrRoute({List<PageRouteInfo>? children})
      : super(
          CompanyShowQrRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyShowQrRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerAreaLoginScreen]
class CustomerAreaLoginRoute extends PageRouteInfo<void> {
  const CustomerAreaLoginRoute({List<PageRouteInfo>? children})
      : super(
          CustomerAreaLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerAreaLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerHomeScreen]
class CustomerHomeRoute extends PageRouteInfo<void> {
  const CustomerHomeRoute({List<PageRouteInfo>? children})
      : super(
          CustomerHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerLoginScreen]
class CustomerLoginRoute extends PageRouteInfo<void> {
  const CustomerLoginRoute({List<PageRouteInfo>? children})
      : super(
          CustomerLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerLoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerOrderConfirmScreen]
class CustomerOrderConfirmRoute extends PageRouteInfo<void> {
  const CustomerOrderConfirmRoute({List<PageRouteInfo>? children})
      : super(
          CustomerOrderConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerOrderConfirmRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerSettingScreen]
class CustomerSettingRoute extends PageRouteInfo<void> {
  const CustomerSettingRoute({List<PageRouteInfo>? children})
      : super(
          CustomerSettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GetImageScreen]
class GetImageRoute extends PageRouteInfo<void> {
  const GetImageRoute({List<PageRouteInfo>? children})
      : super(
          GetImageRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetImageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderSuccessScreen]
class OrderSuccessRoute extends PageRouteInfo<void> {
  const OrderSuccessRoute({List<PageRouteInfo>? children})
      : super(
          OrderSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PostScreen]
class PostRoute extends PageRouteInfo<void> {
  const PostRoute({List<PageRouteInfo>? children})
      : super(
          PostRoute.name,
          initialChildren: children,
        );

  static const String name = 'PostRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailScreen]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [QRViewExampleScreen]
class QRViewExampleRoute extends PageRouteInfo<void> {
  const QRViewExampleRoute({List<PageRouteInfo>? children})
      : super(
          QRViewExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'QRViewExampleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
