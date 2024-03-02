    import SwiftUI

    struct SwiftUIView: View {

        var osVersion: String {
            ProcessInfo.processInfo.operatingSystemVersionString
        }
        
        var body: some View {
            VStack {
                Text("Welcome to iCode, iCoder!")
                    .font(.headline)
                    .padding()

                Text("OS Version: \(osVersion)")
     
            }
        }
    }

    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            SwiftUIView()
        }
    }
