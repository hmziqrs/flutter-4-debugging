import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    print(windowFrame.size.width, windowFrame.size.height)
    print(windowFrame.origin.x, windowFrame.origin.y)
    
    let dic = ["width": windowFrame.size.width, "height": windowFrame.size.height, "x": windowFrame.origin.x, "y": windowFrame.origin.y]
    
    let encoder = JSONEncoder()
    
    if let jsonData = try? encoder.encode(dic) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print(jsonString)
            
            let fileName = "dimensions"
            let fileManager = FileManager.default
            if let directory = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil ,create: false) {
                print(directory)
                let fileURL = directory.appendingPathComponent(fileName).appendingPathExtension("json")
                print("fileURL", fileURL)
                do {
                    try jsonString.write(to: fileURL, atomically: false, encoding: .utf8)
                } catch  {
                    print("AMAZINGLY FAILED")
                }
            }
            

        }
    }
    
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
