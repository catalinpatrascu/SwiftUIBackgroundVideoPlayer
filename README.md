# SwiftUIBackgroundVideoPlayer
Full screen video background in `SwiftUI`

**Usage:** 

Just add the `BgdFullScreenVideoView` into the body of any `View` and the magic will happen.
Also be sure you have a `.mp4` video file inside your project, as in this example.

```
import SwiftUI

struct MainView: View {
    var body: some View {
        BgdFullScreenVideoView(videoName: "dashboard_video")
    }
}
```

It also handles all the weird states of going to background, coming back to foreground, pushing a new view inside the Navigation or popping that normally either pauses the video or makes it move very fast forward, similar as it was happening in `UIKit` as well.
