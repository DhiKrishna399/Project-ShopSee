# ShopSee

**ShopSee** is a concept for a **live streaming shopping** platform: creators share video content and review products in real time so shoppers can see items in context before they buy. This repository contains **WeShoppin**, an iOS prototype built with SwiftUI that sketches the core flows—discovery, a live-style playback experience with chat and product context, and creator-style profiles.

## Why this project?

Online shopping often lacks the tactile, honest signal you get from seeing someone use a product on camera. The goal here is to combine **live or on-demand video**, **community chat**, and **product highlights** in one place so buyers can make more confident decisions.

## What’s in the app today

| Area | Description |
|------|-------------|
| **Auth** | Email/password sign-in and account creation via **Firebase Authentication**. |
| **Home** | Category rows (e.g. Live Now, Technology, Makeup) with horizontal scrolling thumbnails; sample assets stand in for real catalog data. |
| **Live experience** | Full-screen **AVKit** player streaming sample HLS video, with a **live-style overlay**: viewer count, stream title, chat-style comments (sample text), and a product card beside the stream. |
| **Profile** | Profile-style layout with follower/following/post counts and a toggle between a **photo grid** and a **comment-focused** view (sample content). |
| **Navigation** | Tab-style bar to move between Home, Live, and Profile; search and cart controls are present in the UI as placeholders. |

Much of the content is **mock data** (images, comments, stream metadata). The codebase includes notes and stubs for future work—such as loading tiles from a backend, wiring real chat, and expanding the upload flow.

## Tech stack

- **Swift 5** & **SwiftUI**
- **iOS 14+** (deployment targets are set in the Xcode project)
- **Firebase** (`Firebase/Core`, `Firebase/Auth`) via **CocoaPods**
- **AVKit** for video playback

## Project layout

```
Project-ShopSee/
└── WeShoppin/                 # Xcode project & workspace
    ├── WeShoppin.xcworkspace  # Open this (not the .xcodeproj alone if using CocoaPods)
    ├── WeShoppin/             # App source
    │   ├── Views/             # Screens (login, home, live stream, profile, …)
    │   ├── DataModels/        # Routers, auth view model, …
    │   └── CustomUIComponents/
    └── Podfile
```

## Getting started

1. **Requirements:** macOS with **Xcode** and **CocoaPods** (`sudo gem install cocoapods` if needed).

2. **Install dependencies:**
   ```bash
   cd WeShoppin
   pod install
   ```

3. **Open the workspace:** `WeShoppin.xcworkspace` (CocoaPods integrates through the workspace).

4. **Firebase:** The app expects a Firebase iOS configuration. Add your own **`GoogleService-Info.plist`** from the [Firebase console](https://console.firebase.google.com/) under the WeShoppin target if you are not using the bundled file, and enable **Email/Password** authentication for your project.

5. **Run:** Select an iPhone simulator or device and build/run (⌘R).

## Roadmap (natural next steps)

- Back feeds and profiles with **Firestore or another API**; replace static image lists with real streams and products.
- **Real-time chat** and **going live** (e.g. WebRTC or a streaming provider) instead of sample comments and a fixed demo URL.
- Complete **search**, **cart**, and **content upload** flows beyond the current placeholders.
- Harden **auth** (async sign-in state, proper session handling in SwiftUI).

## Credits

Built as a learning and portfolio project (initial work from 2021 onward). Firebase and other third-party libraries are subject to their respective licenses under `WeShoppin/Pods/`.
