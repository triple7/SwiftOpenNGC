import Foundation
import CodableCSV

public enum OpenNGCError:Error {
    case NoSuchObject
    case noConnection
    case RequestError
    case OK
}

public struct OpenNGCSyslog:CustomStringConvertible {
    let log:OpenNGCError
    let message:String
    let timecode:String
    
    init( log: OpenNGCError, message: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy--MM-dd hh:mm:ss"
        self.timecode = dateFormatter.string(from: date)

        self.log = log
                  self.message = message
        print("OpenNGC: \(log) \(message)")
    }
    
    public var description:String {
        return "\(log): \(message)"
    }
}

public class SwiftOpenNGC:NSObject {
    internal let baseTapUrl = "http://dc.g-vo.org/tap"
    internal var sysLog:[OpenNGCSyslog] = []
    
    public override init() {
        
    }
    
    public func getOpenNGC() -> [OpenNGCEntry] {
        let url = Foundation.URL(fileURLWithPath: Bundle.main.path(forResource: "OpenNGC", ofType: "json")!)
        let data = try? Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        let openNGC = try? decoder.decode([OpenNGCEntry].self, from: data!)
        return openNGC!
    }
    
    internal func writeToOpenNGCJson(entries: [OpenNGCEntry], fileName: String = "OpenNGC.json") {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let openNGCDirectoryUrl = documentsURL.appendingPathComponent("openNGC", isDirectory: true)
        if !fileManager.fileExists(atPath: openNGCDirectoryUrl.path) {
            try! fileManager.createDirectory(at: openNGCDirectoryUrl,
                                             withIntermediateDirectories: true,
                                             attributes: nil)
        }
        let fileURL = openNGCDirectoryUrl.appendingPathComponent(fileName)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(entries)
        try! data.write(to: fileURL, options: .atomic)
    }

    internal func parseCatalog(from text: String) -> [OpenNGCEntry] {
        print(text)
        let decoder = CSVDecoder {
          $0.headerStrategy = .firstLine
          $0.delimiters.field = ";"
        }
        let entries: [OpenNGCEntry] = try! decoder.decode([OpenNGCEntry].self, from: text)
        return entries
    }

}
