# PCIC Application

Welcome to the readme for the PCIC (Placeholder for Your Project Name) application! This document provides a comprehensive overview of the project, including necessary dependencies, tutorials, and optimization techniques.

## Overview

PCIC is a Flutter project aimed at [provide a brief description of the application's purpose or functionality].

## Dependencies

### Downloader

Integrate the flutter_downloader package for efficient downloading capabilities.

- [Documentation](https://pub.dev/packages/flutter_downloader)
- [Permission Video](https://www.youtube.com/watch?v=tRdU5gnbrmc)

### Firebase

Utilize Firebase services for backend functionality and user authentication.

- [Tutorial](https://www.youtube.com/watch?v=_3W-JuIVFlg&t=96s)

### Icons

Enhance the visual appeal of the application using custom icons generated with flutter_launcher_icons.

- [Documentation](https://pub.dev/packages/flutter_launcher_icons)

## Getting Started

To set up the project locally, follow these steps:

```bash
flutter clean
flutter pub get 
flutter pub outdated
flutter run
```

Ensure you have the latest Flutter SDK installed:

```bash
flutter upgrade
flutter pub upgrade
```

## Building for Release

Before releasing the application, optimize it using R8 & Proguard:

- [Documentation](https://medium.com/@ChanakaDev/simplifying-android-proguard-rules-in-flutter-apps-2bfa6a1d5e68)
- [Documentation](https://articles.wesionary.team/use-of-proguard-in-the-flutter-app-289cd7b31a18)
- [Tutorial](https://youtu.be/bgpyuuzMlo0?si=HRbD13wDYwIt1zVe)

## Additional Functionality

### Removing Hashtag in URL

Implement a solution to remove hashtags from URLs.

- [Tutorial](https://www.youtube.com/watch?v=kVspc_vfnYY)

### Java Environment Setup

Configure your development environment for Java, which might be necessary for certain functionalities.

- [Tutorial](https://www.youtube.com/watch?v=SQykK40fFds)

### Configuration before map

Punta lang sa settings.gradle at wag dun sa build.gradle kasi visible ung pinapabago sa error na iupgrade ung kotlin version

- [Jetbrain Kotlin Version](https://plugins.gradle.org/plugin/org.jetbrains.kotlin.android)

### Map

- [Tutorial](https://www.youtube.com/watch?v=M7cOmiSly3Q)

### Upgrade Everything

- Command

    ```cmd
    flutter upgrade
    ```

## Optimization Techniques

Enhance the performance of your Flutter application with these optimization hacks:

- Use StatelessWidget instead of StatefulWidget when possible.
- Keep your widget tree shallow.
- Use const constructors.
- Choose the right widget for the job.
- Use keys judiciously.
- Implement appropriate state management techniques.
- Avoid excessive use of setState.
- Optimize images.
- Utilize the performance overlay.
- Profile your app for further enhancements.

## Conclusion

By following this guide and leveraging the provided resources, you can effectively develop, optimize, and release your PCIC application, ensuring a seamless user experience. If you encounter any issues or have further questions, refer to the respective documentation or seek assistance from the Flutter community.

Happy coding! 🚀


## TODO

add refresh