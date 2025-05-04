//
//  Untitled.swift
//  SwiftOpenNGC
//
//  Created by Yuma decaux on 3/5/2025.
//

import Foundation

extension SwiftOpenNGC {

    func filterByAll(
        _ items: [OpenNGCEntry],
        by predicates: ((OpenNGCEntry) -> Bool)...
    ) -> [OpenNGCEntry] {
        return items.filter { item in
            predicates.allSatisfy { $0(item) }
        }
    }

    func filterByAny(
        _ items: [OpenNGCEntry],
        by predicates: ((OpenNGCEntry) -> Bool)...
    ) -> [OpenNGCEntry] {
        return items.filter { item in
            predicates.contains{ $0(item) }
        }
    }

}
