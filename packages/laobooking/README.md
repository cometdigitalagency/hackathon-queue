<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# Lao Booking - Registering to reserve a passport application date

This package is meant to define widgets for developpers to use in thier own application, it has two main widgets which help users to find an available date for appointement and to book an appointment

## Include the package to project
add to pubspec.yaml
```dependencies:
  laobooking:
    git:
      url:https://github.com/cometdigitalagency/hackathon-queue.git
      path:packages/laobooking
```

## Calling packages
### FindQueueWidget
The purpose of this widget is to help users find availability and to know when they can reserve an appointment

---

###### import to dart file
```
import 'package:laobooking/widgets/FindQueueWidget.dart';
```
###### call the widget
```
body: const FindQueueWidget()
```
### ScheduleConsular
The purpose of this widget is to help users reserve an appointment with the consular

---

###### import to dart file
```
import 'package:laobooking/widgets/ScheduleConsular.dart';
```
###### call the widget
```
body: const ScheduleConsular()
```
