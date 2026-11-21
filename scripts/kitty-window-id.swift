// Prints the CGWindowID of kitty's frontmost on-screen window (for screencapture -l).
import CoreGraphics
import Foundation

let opts = CGWindowListOption(arrayLiteral: .optionOnScreenOnly, .excludeDesktopElements)
if let list = CGWindowListCopyWindowInfo(opts, kCGNullWindowID) as? [[String: Any]] {
    for w in list {
        if let owner = w[kCGWindowOwnerName as String] as? String, owner == "kitty",
           let layer = w[kCGWindowLayer as String] as? Int, layer == 0,
           let num = w[kCGWindowNumber as String] as? Int {
            print(num)
            exit(0)
        }
    }
}
exit(1)
