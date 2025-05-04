//
//  Untitled.swift
//  SwiftOpenNGC
//
//  Created by Yuma decaux on 4/5/2025.
//

import Foundation

extension SwiftOpenNGC {
    
    /** request returned data check
     */
    private func requestIsValid(error: Error?, response: URLResponse?, url: URL? = nil) -> Bool {
        var gotError = false
        if error != nil {
            self.sysLog.append(OpenNGCSyslog(log: .RequestError, message: error!.localizedDescription))
            gotError = true
        }
        if (response as? HTTPURLResponse) == nil {
            self.sysLog.append(OpenNGCSyslog(log: .RequestError, message: "response timed out"))
            gotError = true
        }
        if let response = response {
            let urlResponse = (response as! HTTPURLResponse)
            if urlResponse.statusCode != 200 {
                let error = NSError(domain: "com.error", code: urlResponse.statusCode)
                self.sysLog.append(OpenNGCSyslog(log: .RequestError, message: error.localizedDescription))
                gotError = true
            }
        } else {
            self.sysLog.append(OpenNGCSyslog(log: .RequestError, message: "response timed out"))
            gotError = true
        }
        if !gotError {
            let message = url != nil ? url!.absoluteString : "data"
            self.sysLog.append(OpenNGCSyslog(log: .OK, message: "\(message) downloaded"))
        }
        return !gotError
    }


    public func queryOpenNGC(selectQuery: String) async throws -> [OpenNGCEntry] {
        let urlString = "\(baseTapUrl)/sync?REQUEST=doQuery&LANG=ADQL&QUERY=\(selectQuery)&FORMAT=csv".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)!
        print(url.absoluteString)
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        let (data, response) = try await session.data(from: url)
        guard requestIsValid(error: nil, response: response, url: url) else {
            throw OpenNGCError.RequestError
        }
        
        sysLog.append(OpenNGCSyslog(log: .OK, message: "Query successfull: \(selectQuery)"))
        
        let result = String(data: data, encoding: .utf8)!
        let entries = parseCatalog(from: result)
        
        // Add to the documents
        writeToOpenNGCJson(entries: entries)
        return entries
    }

    
}
