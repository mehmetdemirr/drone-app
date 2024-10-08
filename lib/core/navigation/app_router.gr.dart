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
    CompanyCashEditRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CompanyCashEditRouteArgs>(
          orElse: () => CompanyCashEditRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyCashEditScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CompanyCashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyCashScreen(),
      );
    },
    CompanyCustomerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyCustomerScreen(),
      );
    },
    CompanyFeedBackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyFeedBackScreen(),
      );
    },
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
    CompanyNewAreaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyNewAreaScreen(),
      );
    },
    CompanyNewOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyNewOrderScreen(),
      );
    },
    CompanyNewProductRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyNewProductScreen(),
      );
    },
    CompanyOrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CompanyOrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyOrderDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CompanyOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyOrderScreen(),
      );
    },
    CompanyProductDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CompanyProductDetailRouteArgs>(
          orElse: () =>
              CompanyProductDetailRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyProductDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CompanyProductEditRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CompanyProductEditRouteArgs>(
          orElse: () =>
              CompanyProductEditRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CompanyProductEditScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CompanyProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyProductsScreen(),
      );
    },
    CompanyRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyRegisterScreen(),
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
    CompanyStatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyStatisticScreen(),
      );
    },
    CompanyStatusFalseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyStatusFalseScreen(),
      );
    },
    CustomerAreaLoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerAreaLoginScreen(),
      );
    },
    CustomerCashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerCashScreen(),
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
      final args = routeData.argsAs<CustomerOrderConfirmRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomerOrderConfirmScreen(
          key: args.key,
          locationData: args.locationData,
        ),
      );
    },
    CustomerProductDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CustomerProductDetailRouteArgs>(
          orElse: () =>
              CustomerProductDetailRouteArgs(id: pathParams.getInt('id')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomerProductDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    CustomerRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerRegisterScreen(),
      );
    },
    CustomerSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerSettingScreen(),
      );
    },
    CustomerStatisticRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerStatisticScreen(),
      );
    },
    CustomerWaitingRoomRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerWaitingRoomScreen(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderSuccessScreen(),
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
/// [CompanyCashEditScreen]
class CompanyCashEditRoute extends PageRouteInfo<CompanyCashEditRouteArgs> {
  CompanyCashEditRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CompanyCashEditRoute.name,
          args: CompanyCashEditRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CompanyCashEditRoute';

  static const PageInfo<CompanyCashEditRouteArgs> page =
      PageInfo<CompanyCashEditRouteArgs>(name);
}

class CompanyCashEditRouteArgs {
  const CompanyCashEditRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CompanyCashEditRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CompanyCashScreen]
class CompanyCashRoute extends PageRouteInfo<void> {
  const CompanyCashRoute({List<PageRouteInfo>? children})
      : super(
          CompanyCashRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyCashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyCustomerScreen]
class CompanyCustomerRoute extends PageRouteInfo<void> {
  const CompanyCustomerRoute({List<PageRouteInfo>? children})
      : super(
          CompanyCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyCustomerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyFeedBackScreen]
class CompanyFeedBackRoute extends PageRouteInfo<void> {
  const CompanyFeedBackRoute({List<PageRouteInfo>? children})
      : super(
          CompanyFeedBackRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyFeedBackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [CompanyNewAreaScreen]
class CompanyNewAreaRoute extends PageRouteInfo<void> {
  const CompanyNewAreaRoute({List<PageRouteInfo>? children})
      : super(
          CompanyNewAreaRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyNewAreaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyNewOrderScreen]
class CompanyNewOrderRoute extends PageRouteInfo<void> {
  const CompanyNewOrderRoute({List<PageRouteInfo>? children})
      : super(
          CompanyNewOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyNewOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyNewProductScreen]
class CompanyNewProductRoute extends PageRouteInfo<void> {
  const CompanyNewProductRoute({List<PageRouteInfo>? children})
      : super(
          CompanyNewProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyNewProductRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyOrderDetailScreen]
class CompanyOrderDetailRoute
    extends PageRouteInfo<CompanyOrderDetailRouteArgs> {
  CompanyOrderDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CompanyOrderDetailRoute.name,
          args: CompanyOrderDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'CompanyOrderDetailRoute';

  static const PageInfo<CompanyOrderDetailRouteArgs> page =
      PageInfo<CompanyOrderDetailRouteArgs>(name);
}

class CompanyOrderDetailRouteArgs {
  const CompanyOrderDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CompanyOrderDetailRouteArgs{key: $key, id: $id}';
  }
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
/// [CompanyProductDetailScreen]
class CompanyProductDetailRoute
    extends PageRouteInfo<CompanyProductDetailRouteArgs> {
  CompanyProductDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CompanyProductDetailRoute.name,
          args: CompanyProductDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CompanyProductDetailRoute';

  static const PageInfo<CompanyProductDetailRouteArgs> page =
      PageInfo<CompanyProductDetailRouteArgs>(name);
}

class CompanyProductDetailRouteArgs {
  const CompanyProductDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CompanyProductDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CompanyProductEditScreen]
class CompanyProductEditRoute
    extends PageRouteInfo<CompanyProductEditRouteArgs> {
  CompanyProductEditRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CompanyProductEditRoute.name,
          args: CompanyProductEditRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CompanyProductEditRoute';

  static const PageInfo<CompanyProductEditRouteArgs> page =
      PageInfo<CompanyProductEditRouteArgs>(name);
}

class CompanyProductEditRouteArgs {
  const CompanyProductEditRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CompanyProductEditRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CompanyProductsScreen]
class CompanyProductsRoute extends PageRouteInfo<void> {
  const CompanyProductsRoute({List<PageRouteInfo>? children})
      : super(
          CompanyProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyRegisterScreen]
class CompanyRegisterRoute extends PageRouteInfo<void> {
  const CompanyRegisterRoute({List<PageRouteInfo>? children})
      : super(
          CompanyRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyRegisterRoute';

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
/// [CompanyStatisticScreen]
class CompanyStatisticRoute extends PageRouteInfo<void> {
  const CompanyStatisticRoute({List<PageRouteInfo>? children})
      : super(
          CompanyStatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyStatisticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyStatusFalseScreen]
class CompanyStatusFalseRoute extends PageRouteInfo<void> {
  const CompanyStatusFalseRoute({List<PageRouteInfo>? children})
      : super(
          CompanyStatusFalseRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyStatusFalseRoute';

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
/// [CustomerCashScreen]
class CustomerCashRoute extends PageRouteInfo<void> {
  const CustomerCashRoute({List<PageRouteInfo>? children})
      : super(
          CustomerCashRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerCashRoute';

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
class CustomerOrderConfirmRoute
    extends PageRouteInfo<CustomerOrderConfirmRouteArgs> {
  CustomerOrderConfirmRoute({
    Key? key,
    required LocationData locationData,
    List<PageRouteInfo>? children,
  }) : super(
          CustomerOrderConfirmRoute.name,
          args: CustomerOrderConfirmRouteArgs(
            key: key,
            locationData: locationData,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomerOrderConfirmRoute';

  static const PageInfo<CustomerOrderConfirmRouteArgs> page =
      PageInfo<CustomerOrderConfirmRouteArgs>(name);
}

class CustomerOrderConfirmRouteArgs {
  const CustomerOrderConfirmRouteArgs({
    this.key,
    required this.locationData,
  });

  final Key? key;

  final LocationData locationData;

  @override
  String toString() {
    return 'CustomerOrderConfirmRouteArgs{key: $key, locationData: $locationData}';
  }
}

/// generated route for
/// [CustomerProductDetailScreen]
class CustomerProductDetailRoute
    extends PageRouteInfo<CustomerProductDetailRouteArgs> {
  CustomerProductDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CustomerProductDetailRoute.name,
          args: CustomerProductDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CustomerProductDetailRoute';

  static const PageInfo<CustomerProductDetailRouteArgs> page =
      PageInfo<CustomerProductDetailRouteArgs>(name);
}

class CustomerProductDetailRouteArgs {
  const CustomerProductDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CustomerProductDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [CustomerRegisterScreen]
class CustomerRegisterRoute extends PageRouteInfo<void> {
  const CustomerRegisterRoute({List<PageRouteInfo>? children})
      : super(
          CustomerRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerRegisterRoute';

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
/// [CustomerStatisticScreen]
class CustomerStatisticRoute extends PageRouteInfo<void> {
  const CustomerStatisticRoute({List<PageRouteInfo>? children})
      : super(
          CustomerStatisticRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerStatisticRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerWaitingRoomScreen]
class CustomerWaitingRoomRoute extends PageRouteInfo<void> {
  const CustomerWaitingRoomRoute({List<PageRouteInfo>? children})
      : super(
          CustomerWaitingRoomRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerWaitingRoomRoute';

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
