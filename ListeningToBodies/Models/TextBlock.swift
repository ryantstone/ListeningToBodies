import Foundation

struct TextBlock: Codable, Block {
    let textSection: String
}

struct LinkBlock: Codable, Block {
    let links: [String]
}

protocol Block {}
