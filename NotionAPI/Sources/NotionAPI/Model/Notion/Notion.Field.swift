//
//  Notion.Field.swift
//  Notion API Tests
//
//  Created by Ricardo Venieris on 10/05/22.
//

import Foundation

protocol  NotionObject: Codable {
    var object: Notion.Types.Object {get set}
    var id: String {get set}
}

extension Notion {
    
        // MARK: - Object
    public class Object: NotionObject {
        public var object: Notion.Types.Object
        public var id: String
        
        enum CodingKeys: String, CodingKey {
            case object = "object"
            case id = "id"
        }
        
        public init(object: Notion.Types.Object, id: String) {
            self.object = object
            self.id = id
        }
    }
    
        // MARK: - External
    public class External: Codable {
        public var urlString: String
        
        enum CodingKeys: String, CodingKey {
            case urlString = "url"
        }
        
        public init(urlString: String) {
            self.urlString = urlString
        }
    }

        // MARK: - Decoration
    public class Decoration: Codable {
        public var type: Notion.Types.Decoration
        private var external: External?
        private var emoji: String?
        public var value:String {
            switch type {
                case .external:
                    return external?.urlString ?? "fail_URL"
                case .icon:
                    return emoji ?? "fail_emoji"
            }
        }
        
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case external = "external"
            case emoji = "emoji"
            
        }
        
        public init(type: Notion.Types.Decoration, external: External) {
            self.type = type
            self.external = external
        }
    }
    
        // MARK: - Parent
    public class Parent: Codable {
        public var type: Notion.Types.Parent
        private var databaseID: String?
        private var pageID: String?
        private var workspace: String?
        public var id: String {
            get {
                return databaseID ?? pageID ?? workspace ?? "fail_ID"
            }
            set {
                switch type {
                    case .database_id:
                        databaseID = newValue
                        pageID = nil
                        workspace = nil
                    case .page_id:
                        databaseID = nil
                        pageID = newValue
                        workspace = nil
                    case .workspace:
                        databaseID = nil
                        pageID = nil
                        workspace = newValue
                }
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case databaseID = "database_id"
            case pageID = "page_id"
        }
        
        public init(type: Notion.Types.Parent, id: String) {
            self.type = type
            self.id = id
        }
    }
    
        // MARK: - URL
    public class URLe: Codable {
        public var id: String?
        public var url: URL
        public var expiryTime: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case url = "url"
            case expiryTime = "expiry_time"
        }
        
        public init(id: String? = nil, url: URL, expiryTime: String? = nil) {
            self.id = id
            self.url = url
            self.expiryTime = expiryTime
        }
    }
    
    class Field {
        
            // MARK: - Checkbox
        public class Checkbox: Codable, Identifiable {
            public var id: String
            public var value: Bool
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case value = "checkbox"
            }
            
            public init(id: String, value: Bool) {
                self.id = id
                self.value = value
            }
        }
        
            // MARK: - EMail
        public class EMail: Codable, Identifiable {
            public var id: String
            public var value: String?
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case value = "email"
            }
            
            public init(id: String, value: String?) {
                self.id = id
                self.value = value
            }
        }
        
            // MARK: - SelectClass
        public class Select: Codable, Identifiable {
            
                // MARK: - Select
            public class Option: Codable, Identifiable {
                public var id: String
                public var value: String
                public var color: String
                
                enum CodingKeys: String, CodingKey {
                    case id = "id"
                    case value = "name"
                    case color = "color"
                }
                
                public init(id: String, value: String, color: String) {
                    self.id = id
                    self.value = value
                    self.color = color
                }
            }
                        
            public var id: String
            public var select: Select.Option
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case select = "select"
            }
            
            public init(id: String, select: Select.Option) {
                self.id = id
                self.select = select
            }
        }
        
            // MARK: - MultiSelect
        public class MultiSelect: Codable, Identifiable {
            public var id: String
            public var values: [Select.Option]
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case values = "multi_select"
            }
            
            public init(id: String, values: [Select.Option]) {
                self.id = id
                self.values = values
            }
        }
    
            // MARK: - Number
        public class Number: Codable, Identifiable {
            public var id: String
            public var value: Int
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case value = "number"
            }
            
            public init(id: String, value: Int) {
                self.id = id
                self.value = value
            }
        }
    
            // MARK: - Phone
        public class Phone: Codable, Identifiable {
            public var id: String
            public var value: String?
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case value = "phone_number"
            }
            
            public init(id: String, value: String?) {
                self.id = id
                self.value = value
            }
        }
    
            // MARK: - Date
        public class Date: Codable, Identifiable {
                // MARK: - DateValues
            public class DateValues: Codable {
                public var start: String
                public var end: String?
                public var timeZone: String?
                
                enum CodingKeys: String, CodingKey {
                    case start = "start"
                    case end = "end"
                    case timeZone = "time_zone"
                }
                
                public init(start: String, end: String?, timeZone: String?) {
                    self.start = start
                    self.end = end
                    self.timeZone = timeZone
                }
            }
            
            public var id: String
            public var values: DateValues
            
            enum CodingKeys: String, CodingKey {
                case id = "id"
                case values = "date"
            }
            
            public init(id: String, values: DateValues) {
                self.id = id
                self.values = values
            }
        }
    
    
    
    
    
    
    
    
    
    }
}
