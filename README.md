# FairDriveInternAssignment
FairDrive Taxi App Prototype

A prototype taxi app developed as part of an internship assignment at FairDrive. The app is built using Swift and integrates various technologies to provide essential taxi service features, such as user location tracking, and map-based navigation.

Overview

The FairDrive Taxi App prototype enables users to:

    •	Search for locations points.
    •	Authenticate with Firebase for secure login.
The app is built with MapKit for maps, Firebase for authentication and database services, and CoreLocation for location updates.
Features

    •	User Location Tracking: Displays the user's location on the map using MapKit.
    •	Map-Based Navigation: Offers interactive maps with real-time location updates.
    •	Firebase Integration: Utilizes Firebase for authentication, database management, and real-time data synchronization.
    •	Custom Annotations: Shows custom markers for pick-up and drop-off locations.
    •	Search Functionality: Provides a search bar to find locations easily.
Instructions for Running the App

To run the app, follow these steps:

1. Clone the Repository
Clone the project from GitHub to your local machine:
bash
Copy code
git clone https://github.com/islam7r/FairDriveInternAssignment
2. Open the Project in Xcode
•	Open the .xcodeproj or .xcworkspace file in Xcode.
3. Install Dependencies Using Swift Package Manager
•	The required dependencies should already be included via SPM. To ensure the dependencies are resolved, follow these steps:
1.	Open the Xcode project.
2.	Go to File > Swift Packages > Update to Latest Package Versions to make sure all packages are up-to-date.
3.	If you need to add additional packages, go to File > Swift Packages > Add Package Dependency, then specify the URL of the package.
4. Configure Firebase
Follow the steps below to set up Firebase for the project.
Firebase Configuration
1.	Create a Firebase Project
o	Go to the Firebase Console.
o	Create a new project or use an existing one.
2.	Add an iOS App to the Firebase Project
o	Register your iOS app in the Firebase console with your app's bundle ID.
o	Download the GoogleService-Info.plist file provided by Firebase.
3.	Add GoogleService-Info.plist to Your Project
o	Drag the GoogleService-Info.plist file into your Xcode project (make sure "Copy items if needed" is selected).
o	Ensure that the file is included in the main target.
4.	Initialize Firebase in Your App
o	In your AppDelegate.swift, import Firebase and configure it: FirebaseApp.configure() (write this code inside this function in AppDelegate.swift “func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool”

Additional Libraries Used

    •	MapKit: Used for displaying maps, showing user location, and route guidance.
    •	FirebaseAuth: For user authentication (sign-up, login).
    •	FirebaseDatabase: For real-time database management.
    •	CoreLocation: To track the user's location and update it on the map.

Instructions for Running the App on a Physical Device
To run the app on a physical device, make sure you have:
1.	A valid Apple Developer Account.
2.	A configured signing certificate and provisioning profile in Xcode.
3.	Location services enabled on the device.
Screenshots

![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 52 13](https://github.com/user-attachments/assets/8dc1b75c-efcd-4b34-ab2d-b31a4e6f88f4)
![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 52 10](https://github.com/user-attachments/assets/03e7f4f3-a90d-4329-9a28-72a55bb4cf9b)
![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 52 07](https://github.com/user-attachments/assets/70ef60dc-9574-446b-9695-e634de359ee0)
![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 52 01](https://github.com/user-attachments/assets/e8e94756-3ceb-4730-8a40-2e1a9cdfc1be)
![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 51 43](https://github.com/user-attachments/assets/7207e97a-3dc2-40dd-8c68-80b36afd28aa)
![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 51 27](https://github.com/user-attachments/assets/7db92d1d-32eb-4389-994b-bd3e1a4cdfbc)
![Simulator Screenshot - iPhone 16 - 2024-10-21 at 04 51 20](https://github.com/user-attachments/assets/92f96507-d59d-49d4-8603-726c27cf1755)






