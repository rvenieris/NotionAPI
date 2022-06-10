//
//  Notion.ObjectType.swift
//  Notion API Tests
//
//  Created by Ricardo Venieris on 14/05/22.
//

import Foundation

extension Notion {
    class Types {
        enum Object:String, Codable {
            case list, page, user
        }
        
        enum Decoration:String, Codable {
            case external, icon
        }
        
        enum Parent:String, Codable {
            case database_id, page_id, workspace
        }
        
        enum Color:String, Codable {
            case gray, brown, orange, yellow, green, blue, purple, pink, red
        }
    }
}
