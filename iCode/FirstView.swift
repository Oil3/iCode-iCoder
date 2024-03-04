    import SwiftUI

    struct FirstView: View {

        var osVersion: String {
            ProcessInfo.processInfo.operatingSystemVersionString
        }
        
        var body: some View {
            VStack {
                Text("""
                Launch iCoder from title bar, log-in. 
                Shift+Return makes new line and Cmd+Return sends prompt.
                Cmd+H hides app and floating windows, Cmd+Shift+H hides all other apps.
                Toggle transparency from iCoder's title bar slider.
                Pin the window on top of other windows from iCoder's title bar button
""")
                    .font(.headline)
                    .padding()

                Text("OS Version: \(osVersion)")
     
            }
        }
    }

    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            FirstView()
        }
    }
