
import WebKit

class WebDataCleaner {
    
    static func clearCookies(completion: @escaping () -> Void) {
        let websiteDataStore = WKWebsiteDataStore.default()
        let dataTypes = Set([WKWebsiteDataTypeCookies])
        
        websiteDataStore.fetchDataRecords(ofTypes: dataTypes) { records in
            websiteDataStore.removeData(ofTypes: dataTypes, for: records, completionHandler: completion)
        }
    }

    static func clearAllData(completion: @escaping () -> Void) {
        let websiteDataStore = WKWebsiteDataStore.default()
        let dataTypes = WKWebsiteDataStore.allWebsiteDataTypes()
        
        websiteDataStore.fetchDataRecords(ofTypes: dataTypes) { records in
            websiteDataStore.removeData(ofTypes: dataTypes, for: records, completionHandler: completion)
        }
    }
}
