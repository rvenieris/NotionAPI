    // This file was generated from JSON Schema using quicktype, do not modify it directly.
    // To parse the JSON, add this file to your project and do:
    //
    //   let notionQueryResult = try? newJSONDecoder().decode(NotionQueryResult.self, from: jsonData)

import Foundation


class Notion {
        // MARK: - NotionQueryResult
    public class QueryResult: Codable {
        public var object: String
        public var results: [Notion.Result]
        public var nextCursor: String?
        public var hasMore: Bool
        public var type: String
        public var page: Page
        
        enum CodingKeys: String, CodingKey {
            case object = "object"
            case results = "results"
            case nextCursor = "next_cursor"
            case hasMore = "has_more"
            case type = "type"
            case page = "page"
        }
        
        public init(object: String, results: [Result], nextCursor: String?, hasMore: Bool, type: String, page: Page) {
            self.object = object
            self.results = results
            self.nextCursor = nextCursor
            self.hasMore = hasMore
            self.type = type
            self.page = page
        }
    }
    
        // MARK: - Page
    public class Page: Codable {
        
        public init() {
        }
    }
    
        // MARK: - Result
    public class Result: Codable {
        public var object: String
        public var id: String
        public var createdTime: String
        public var lastEditedTime: String
        public var createdBy: Notion.Object
        public var lastEditedBy: Notion.Object
        public var cover: Decoration
        public var icon: Decoration
        public var parent: Parent
        public var archived: Bool
        public var properties: Properties
        public var url: String
        
        enum CodingKeys: String, CodingKey {
            case object = "object"
            case id = "id"
            case createdTime = "created_time"
            case lastEditedTime = "last_edited_time"
            case createdBy = "created_by"
            case lastEditedBy = "last_edited_by"
            case cover = "cover"
            case icon = "icon"
            case parent = "parent"
            case archived = "archived"
            case properties = "properties"
            case url = "url"
        }
        
        public init(object: String, id: String, createdTime: String, lastEditedTime: String, createdBy: Notion.Object, lastEditedBy: Notion.Object, cover: Decoration, icon: Decoration, parent: Parent, archived: Bool, properties: Properties, url: String) {
            self.object = object
            self.id = id
            self.createdTime = createdTime
            self.lastEditedTime = lastEditedTime
            self.createdBy = createdBy
            self.lastEditedBy = lastEditedBy
            self.cover = cover
            self.icon = icon
            self.parent = parent
            self.archived = archived
            self.properties = properties
            self.url = url
        }
    }
    


    

    
        // MARK: - Properties
    public class Properties: Codable {
        public var select: Notion.Field.Select
        public var checkbox: Notion.Field.Checkbox
        public var number: Notion.Field.Number
        public var url: Notion.URLe
        public var phone: Notion.Field.Phone
        public var horaCriação: HoraCriação
        public var editadoPor: EditadoPor
        public var property: Property
        public var criadoPor: CriadoPor
        public var eMail: Notion.Field.EMail
        public var multiSelect: Notion.Field.MultiSelect
        public var rollupCOMPerson: RollupCOMPerson
        public var person: Person
        public var files: Files
        public var texto: Texto
        public var date: DateClass
        public var últimaEdição: ÚltimaEdição
        public var formula: Formula
        public var relação: Relação
        public var nome: Nome
        
        enum CodingKeys: String, CodingKey {
            case select = "Select"
            case checkbox = "Checkbox"
            case number = "Number"
            case url = "URL"
            case phone = "Phone"
            case horaCriação = "Hora Criação"
            case editadoPor = "Editado Por"
            case property = "Property"
            case criadoPor = "Criado Por"
            case eMail = "e-mail"
            case multiSelect = "Multi-Select"
            case rollupCOMPerson = "Rollup com Person"
            case person = "Person"
            case files = "Files"
            case texto = "Texto"
            case date = "Date"
            case últimaEdição = "Última Edição"
            case formula = "Formula"
            case relação = "Relação"
            case nome = "Nome"
        }
        
        public init(select: Notion.Field.Select, checkbox: Notion.Field.Checkbox, number: Notion.Field.Number, url: Notion.URLe, phone: Notion.Field.Phone, horaCriação: HoraCriação, editadoPor: EditadoPor, property: Property, criadoPor: CriadoPor, eMail: Notion.Field.EMail, multiSelect: Notion.Field.MultiSelect, rollupCOMPerson: RollupCOMPerson, person: Person, files: Files, texto: Texto, date: DateClass, últimaEdição: ÚltimaEdição, formula: Formula, relação: Relação, nome: Nome) {
            self.select = select
            self.checkbox = checkbox
            self.number = number
            self.url = url
            self.phone = phone
            self.horaCriação = horaCriação
            self.editadoPor = editadoPor
            self.property = property
            self.criadoPor = criadoPor
            self.eMail = eMail
            self.multiSelect = multiSelect
            self.rollupCOMPerson = rollupCOMPerson
            self.person = person
            self.files = files
            self.texto = texto
            self.date = date
            self.últimaEdição = últimaEdição
            self.formula = formula
            self.relação = relação
            self.nome = nome
        }
    }
    

    
        // MARK: - CriadoPor
    public class CriadoPor: Codable {
        public var id: String
        public var type: String
        public var createdBy: CriadoPorCreatedBy
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case createdBy = "created_by"
        }
        
        public init(id: String, type: String, createdBy: CriadoPorCreatedBy) {
            self.id = id
            self.type = type
            self.createdBy = createdBy
        }
    }
    
        // MARK: - CriadoPorCreatedBy
    public class CriadoPorCreatedBy: Codable {
        public var object: String
        public var id: String
        public var type: String

        public var name: String
        public var avatarURL: String
        public var person: CreatedByPerson
        
        enum CodingKeys: String, CodingKey {
            case object = "object"
            case id = "id"
            case name = "name"
            case avatarURL = "avatar_url"
            case type = "type"
            case person = "person"
        }
        
        public init(object: String, id: String, name: String, avatarURL: String, type: String, person: CreatedByPerson) {
            self.object = object
            self.id = id
            self.name = name
            self.avatarURL = avatarURL
            self.type = type
            self.person = person
        }
    }
    
        // MARK: - CreatedByPerson
    public class CreatedByPerson: Codable {
        public var email: String
        
        enum CodingKeys: String, CodingKey {
            case email = "email"
        }
        
        public init(email: String) {
            self.email = email
        }
    }
    

    

    

    
        // MARK: - EditadoPor
    public class EditadoPor: Codable {
        public var id: String
        public var type: String
        public var lastEditedBy: CriadoPorCreatedBy
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case lastEditedBy = "last_edited_by"
        }
        
        public init(id: String, type: String, lastEditedBy: CriadoPorCreatedBy) {
            self.id = id
            self.type = type
            self.lastEditedBy = lastEditedBy
        }
    }
    
        // MARK: - Files
    public class Files: Codable {
        public var id: String
        public var type: String
        public var files: [FileElement]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case files = "files"
        }
        
        public init(id: String, type: String, files: [FileElement]) {
            self.id = id
            self.type = type
            self.files = files
        }
    }
    
        // MARK: - FileElement
    public class FileElement: Codable {
        public var name: String
        public var type: String
        public var file: Notion.Field.EMail
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case type = "type"
            case file = "file"
        }
        
        public init(name: String, type: String, file: Notion.Field.EMail) {
            self.name = name
            self.type = type
            self.file = file
        }
    }
    

    
        // MARK: - Formula
    public class Formula: Codable {
        public var id: String
        public var type: String
        public var formula: FormulaClass
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case formula = "formula"
        }
        
        public init(id: String, type: String, formula: FormulaClass) {
            self.id = id
            self.type = type
            self.formula = formula
        }
    }
    
        // MARK: - FormulaClass
    public class FormulaClass: Codable {
        public var type: String
        public var string: String
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case string = "string"
        }
        
        public init(type: String, string: String) {
            self.type = type
            self.string = string
        }
    }
    
        // MARK: - HoraCriação
    public class HoraCriação: Codable {
        public var id: String
        public var type: String
        public var createdTime: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case createdTime = "created_time"
        }
        
        public init(id: String, type: String, createdTime: String) {
            self.id = id
            self.type = type
            self.createdTime = createdTime
        }
    }
    

    

    
        // MARK: - Nome
    public class Nome: Codable {
        public var id: String
        public var type: String
        public var title: [Title]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case title = "title"
        }
        
        public init(id: String, type: String, title: [Title]) {
            self.id = id
            self.type = type
            self.title = title
        }
    }
    
        // MARK: - Title
    public class Title: Codable {
        public var type: String
        public var text: Text
        public var annotations: Annotations
        public var plainText: String
        public var href: URL?
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case text = "text"
            case annotations = "annotations"
            case plainText = "plain_text"
            case href = "href"
        }
        
        public init(type: String, text: Text, annotations: Annotations, plainText: String, href: URL?) {
            self.type = type
            self.text = text
            self.annotations = annotations
            self.plainText = plainText
            self.href = href
        }
    }
    
        // MARK: - Annotations
    public class Annotations: Codable {
        public var bold: Bool
        public var italic: Bool
        public var strikethrough: Bool
        public var underline: Bool
        public var code: Bool
        public var color: Notion.Types.Color
        
        enum CodingKeys: String, CodingKey {
            case bold = "bold"
            case italic = "italic"
            case strikethrough = "strikethrough"
            case underline = "underline"
            case code = "code"
            case color = "color"
        }
        
        public init(bold: Bool, italic: Bool, strikethrough: Bool, underline: Bool, code: Bool, color: Notion.Types.Color) {
            self.bold = bold
            self.italic = italic
            self.strikethrough = strikethrough
            self.underline = underline
            self.code = code
            self.color = color
        }
    }
    
        // MARK: - Text
    public class Text: Codable {
        public var content: String
        public var link: URL?
        
        enum CodingKeys: String, CodingKey {
            case content = "content"
            case link = "link"
        }
        
        public init(content: String, link: URL?) {
            self.content = content
            self.link = link
        }
    }
    

    
        // MARK: - Person
    public class Person: Codable {
        public var id: String
        public var type: String
        public var people: [PersonElement]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case people = "people"
        }
        
        public init(id: String, type: String, people: [PersonElement]) {
            self.id = id
            self.type = type
            self.people = people
        }
    }
    
        // MARK: - PersonElement
    public class PersonElement: Codable {
        public var object: String
        public var id: String
        public var name: String
        public var avatarURL: String?
        public var type: String
        public var person: CreatedByPerson
        
        enum CodingKeys: String, CodingKey {
            case object = "object"
            case id = "id"
            case name = "name"
            case avatarURL = "avatar_url"
            case type = "type"
            case person = "person"
        }
        
        public init(object: String, id: String, name: String, avatarURL: String?, type: String, person: CreatedByPerson) {
            self.object = object
            self.id = id
            self.name = name
            self.avatarURL = avatarURL
            self.type = type
            self.person = person
        }
    }
    

    
        // MARK: - Property
    public class Property: Codable {
        public var id: String
        public var type: String
        public var richText: [JSONAny]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case richText = "rich_text"
        }
        
        public init(id: String, type: String, richText: [JSONAny]) {
            self.id = id
            self.type = type
            self.richText = richText
        }
    }
    
        // MARK: - Relação
    public class Relação: Codable {
        public var id: String
        public var type: String
        public var relation: [Relation]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case relation = "relation"
        }
        
        public init(id: String, type: String, relation: [Relation]) {
            self.id = id
            self.type = type
            self.relation = relation
        }
    }
    
        // MARK: - Relation
    public class Relation: Codable {
        public var id: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
        }
        
        public init(id: String) {
            self.id = id
        }
    }
    
        // MARK: - RollupCOMPerson
    public class RollupCOMPerson: Codable {
        public var id: String
        public var type: String
        public var rollup: Rollup
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case rollup = "rollup"
        }
        
        public init(id: String, type: String, rollup: Rollup) {
            self.id = id
            self.type = type
            self.rollup = rollup
        }
    }
    
        // MARK: - Rollup
    public class Rollup: Codable {
        public var type: String
        public var array: [Array]
        public var function: String
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case array = "array"
            case function = "function"
        }
        
        public init(type: String, array: [Array], function: String) {
            self.type = type
            self.array = array
            self.function = function
        }
    }
    
        // MARK: - Array
    public class Array: Codable {
        public var type: String
        public var people: [PersonElement]
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case people = "people"
        }
        
        public init(type: String, people: [PersonElement]) {
            self.type = type
            self.people = people
        }
    }
    

    
        // MARK: - Texto
    public class Texto: Codable {
        public var id: String
        public var type: String
        public var richText: [Title]
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case richText = "rich_text"
        }
        
        public init(id: String, type: String, richText: [Title]) {
            self.id = id
            self.type = type
            self.richText = richText
        }
    }
    

    
        // MARK: - ÚltimaEdição
    public class ÚltimaEdição: Codable {
        public var id: String
        public var type: String
        public var lastEditedTime: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case type = "type"
            case lastEditedTime = "last_edited_time"
        }
        
        public init(id: String, type: String, lastEditedTime: String) {
            self.id = id
            self.type = type
            self.lastEditedTime = lastEditedTime
        }
    }
    
        // MARK: - Encode/decode helpers
    
    public class JSONNull: Codable, Hashable {
        
        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }
        
        public var hashValue: Int {
            return 0
        }
        
        public func hash(into hasher: inout Hasher) {
                // No-op
        }
        
        public init() {}
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
    
    class JSONCodingKey: CodingKey {
        let key: String
        
        required init?(intValue: Int) {
            return nil
        }
        
        required init?(stringValue: String) {
            key = stringValue
        }
        
        var intValue: Int? {
            return nil
        }
        
        var stringValue: String {
            return key
        }
    }
    
    public class JSONAny: Codable {
        
        public let value: Any
        
        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
        }
        
        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
        }
        
        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if container.decodeNil() {
                return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
        }
        
        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if let value = try? container.decodeNil() {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }
        
        static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }
        
        static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                let value = try decode(from: &container)
                arr.append(value)
            }
            return arr
        }
        
        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                let value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
            }
            return dict
        }
        
        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                if let value = value as? Bool {
                    try container.encode(value)
                } else if let value = value as? Int64 {
                    try container.encode(value)
                } else if let value = value as? Double {
                    try container.encode(value)
                } else if let value = value as? String {
                    try container.encode(value)
                } else if value is JSONNull {
                    try container.encodeNil()
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer()
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }
        
        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                let key = JSONCodingKey(stringValue: key)!
                if let value = value as? Bool {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                    try container.encode(value, forKey: key)
                } else if let value = value as? String {
                    try container.encode(value, forKey: key)
                } else if value is JSONNull {
                    try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer(forKey: key)
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }
        
        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
        
        public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                let container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
            }
        }
    }
}
