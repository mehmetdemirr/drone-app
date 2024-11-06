// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CompanyCashEditRouteArgs>(
          orElse: () => CompanyCashEditRouteArgs(id: pathParams.getInt('id')));
      return CompanyCashEditScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyCashScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyCustomerScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyFeedBackScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyHomeScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyLoginScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyNewAreaScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyNewOrderScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyNewProductScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompanyOrderDetailRouteArgs>();
      return CompanyOrderDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyOrderScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CompanyProductDetailRouteArgs>(
          orElse: () =>
              CompanyProductDetailRouteArgs(id: pathParams.getInt('id')));
      return CompanyProductDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CompanyProductEditRouteArgs>(
          orElse: () =>
              CompanyProductEditRouteArgs(id: pathParams.getInt('id')));
      return CompanyProductEditScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyProductsScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyRegisterScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanySettingScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyShowQrScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyStatisticScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyStatusFalseScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerAreaLoginScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerCashScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerHomeScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerLoginScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomerOrderConfirmRouteArgs>();
      return CustomerOrderConfirmScreen(
        key: args.key,
        locationData: args.locationData,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CustomerProductDetailRouteArgs>(
          orElse: () =>
              CustomerProductDetailRouteArgs(id: pathParams.getInt('id')));
      return CustomerProductDetailScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerRegisterScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerSettingScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerStatisticScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomerWaitingRoomScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrderSuccessScreen();
    },
  );
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

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
