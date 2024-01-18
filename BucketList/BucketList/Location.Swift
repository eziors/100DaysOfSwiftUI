//
//  Location.Swift
//  BucketList
//
//  Created by Marcos Barbosa on 18/01/24.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
