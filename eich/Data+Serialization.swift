//
//  Data+Serialization.swift
//  eich
//
//  Created by mdelmaestro on 14/01/22.
//

// MARK: Encoding

extension Dictionary {
    
    func serialize() throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: [])
    }
}

extension Array {
    
    func serialize() throws -> Data {
        return try JSONSerialization.data(withJSONObject: self, options: [])
    }
}

extension Encodable {
    
    func encode() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}


// MARK: Decoding

extension Data {
    
    func deserialize() throws -> Any {
        return try JSONSerialization.jsonObject(with: self, options: [])
    }
    
    func decode<T>(_ type: T.Type) throws -> T where T : Decodable {
        return try JSONDecoder().decode(type, from: self)
    }
}
