    //
    //  NotionServices.swift
    //  Notion API Tests
    //
    //  Created by Ricardo Venieris on 07/05/22.
    //

import Foundation


class NotionService {
    
    enum ReqError:Error {
        case invalidURLRequest
    }
    
    enum DocType:String {
        case databases = "databases"
        case pages = "pages"
        case blocks = "blocks"
    }
    
    enum RequestType {
        case query
        case retrieve
        case create
        case update
        case archive
        case delete
    }
    
    let requestMethod:[RequestType:String] = [
        .query:"POST",
        .retrieve:"GET",
        .create:"POST",
        .update:"PATCH",
        .archive:"PATCH",
        .delete:"DELETE"
        
    ]
    
    
    private let apiUrlPrefix = "https://api.notion.com/v1"
    private var headers:[String:String] = [:]
    
    private let pageSizeParameter:[String : Any] = ["page_size": 100]
    private let archivedParameter:[String : Any] = ["archived": true]
    
    let sessionConfiguration = URLSessionConfiguration.default
    
    
    private var page = 1
    
    
    
        // MARK: Constructor (Public init)
    init(apiKey: String) {
        headers["Accept"        ] = "application/json"
        headers["Notion-Version"] = "2022-02-22"
        headers["Content-Type"  ] = "application/json"
        headers["Authorization" ] = "Bearer \(apiKey)"
    }
    
    
    private func checkRequestLimit() {
            // 3 requests per second
            // https://developers.notion.com/reference/request-limits
    }
    
        //MARK: Fetch Session
    func query(_ docType:DocType, tableKey:String, to requester:DataFetcher) {
        
        guard let url = requestURL(from: docType, tableKey: tableKey, isQuery: true) else {
            requester.fetched(result: .failure(ReqError.invalidURLRequest), response: nil)
            return
        }
        request(from: url, type: .query, to: requester)
        

    }
    
    func request(from url:URL, type:RequestType, to requester:DataFetcher) {
        checkRequestLimit()

        let session = URLSession(configuration: sessionConfiguration)
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = requestMethod[type] ?? "Unmapped Request Method"
        request.allHTTPHeaderFields = headers
        request.httpBody = pageSizeParameter.asData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            
            if let error = error {
                requester.fetched(result: .failure(error), response: httpResponse)
            } else {
                requester.fetched(result: .success(data ?? Data()), response: httpResponse)
            }
            
        }
        task.resume()
    }
    
    func requestURL(from docType:DocType, tableKey:String, isQuery:Bool)->URL? {
        let query = isQuery ? "/query" : ""
        return URL(string: "https://api.notion.com/v1/\(docType.rawValue)/\(tableKey)\(query)")
    }
}



    //    private func fetch(with url:URL, from table:String, to requester:DataFetcher) {
    //        let task = session.dataTask(with: url) { (data, response, error) in
    //            print (data ?? "*** No data ***")
    //            print (response ?? "*** No response ***")
    //            print (error ?? "*** No error ***")


    //            if let error = error {
    //                requester.fetchedAirtable(with: error, data: data)
    //            } else if let data = data {
    //                if let _ = data.asDictionary["error"] {
    //                    requester.fetchedAirtable(with: AirtableErrorTypes.dataReturnedWithError, data: data)
    //                } else {
    //                    let queryPart = url.absoluteString.split(separator: "?", maxSplits: 2, omittingEmptySubsequences: true)
    //                    let query = queryPart.count == 2 ? queryPart[1] : ""
    //                    if let result = AirtableResult(data: data, table:table, query: String(query), service: self, requester: requester) {
    //                        requester.fetchedAirtable(with: result)
    //                    } else {
    //                        requester.fetchedAirtable(with: data)
    //                    }
    //                }
    //            }
    //        }
    //            // Run task
    //        task.resume()
    //    }

    //MARK: Post, Update & Delete Session
    //    private func post(data:[AnyHashable : Any], in table:String, for requestType: RequestType, to requester:AirtablePoster) {
    //        let url = makeQueryURL(for: table)
    //
    //        runPost(for: requestType, with: url, writing: data, to: requester)
    //    }
    //
    //    private func runPost(for requestType: RequestType, with url:URL, writing data:[AnyHashable : Any], to requester:AirtablePoster) {
    //        checkRequestLimit()
    //
    //        let data = data.removingThumbnailsFromAttachment()
    //        let session = getSession(for: requestType)
    //        let request = getRequest(with: url, and: data, for: requestType)
    //
    //        let task = session.dataTask(with: request) { (data, response, error) in
    //            if let error = error {
    //                requester.postedAirtable(with: error, data:data)
    //            } else if let data = data {
    //                if let _ = data.asDictionary["error"] {
    //                    requester.postedAirtable(with: AirtableErrorTypes.dataReturnedWithError, data: data)
    //                } else {
    //                    requester.postedAirtable(with: data)
    //                }
    //
    //            }
    //        }
    //            // Run task
    //        task.resume()
    //    }
    //
    //    private func runDelete(with url:URL, to requester:AirtableDeleter) {
    //        checkRequestLimit()
    //
    //        let session = getSession(for: .delete)
    //        let request = getRequest(with: url, for: .delete)
    //
    //        let task = session.dataTask(with: request) { (data, response, error) in
    //            if let error = error {
    //                requester.deletedAirtable(with: error, data:data)
    //            } else if let data = data {
    //                requester.deletedAirtable(with: data)
    //            }
    //        }
    //            // Run task
    //        task.resume()
    //    }

    //MARK: RunTask session

    //    private func getSession(for type: RequestType)->URLSession {
    //        guard let session = autorizedSession[type] else {
    //            fatalError("\(type) request has no designed session.")
    //        }
    //        return session
    //    }
    //
    //    private func getRequest(with url:URL, and data:[AnyHashable : Any]? = nil, for requestType: RequestType)->URLRequest {
    //        var request = URLRequest(url: url)
    //
    //        switch requestType {
    //            case .write:
    //                request.httpMethod = "POST"
    //            case .update:
    //                request.httpMethod = "PATCH"
    //            case .delete:
    //                request.httpMethod = "DELETE"
    //            default:
    //                fatalError("No request type for \(requestType)")
    //        }
    //
    //        request.setValue("Bearer " + apiKey, forHTTPHeaderField: "Authorization")
    //
    //        if let data = data {
    //            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //            request.setValue("true", forHTTPHeaderField: "typecast")
    //            guard let httpBody = try? JSONSerialization.data(withJSONObject: ["fields":data], options: []) else {
    //                fatalError("cannot Serialize dictionary.")
    //            }
    //            request.httpBody = httpBody
    //        }
    //
    //        return request
    //    }

    //}


    // ********** Public Functions - Interface Session **********
    //extension NotionService {
    //
    //        //MARK: Fetch Session
    //
    //    /**
    //     Fetches a certain object using it's id on the desired table.
    //
    //     - Parameters:
    //     - id: The id of the object being fetched.
    //     - table: The table where the object will be fetched.
    //     - requester: The class that is requesting the fetch.
    //
    //     - Attention: The requester must conform to the AirtableFetcher Protocol.
    //     The result will be sent to the requester by callback function.
    //     */
    //    public func fetch(objectIdentifiedBy id: String, inTable table: String, to requester:AirtableFetcher){
    //        let url = makeQueryURL(for: table, with: "/", and: id)
    //        runFetch(with: url, from:table, to: requester)
    //    }
    //
    //    /**
    //     Fetches the objects on a table using an AirtableQuery.
    //
    //     - Parameters:
    //     - query: The query that will be used to fetch.
    //     - table: The table that will be fetched.
    //     - requester: The class that is requesting the fetch.
    //
    //     - Attention: The requester must conform to the AirtableFetcher Protocol.
    //     The result will be sent to the requester by callback function.
    //     */
    //    public func fetch(quering query: AirtableQuery, inTable table: String, to requester:AirtableFetcher){
    //        fetch(quering: query.description, inTable: table, to: requester)
    //    }
    //
    //    /**
    //     Fetches the objects on a table using a String query.
    //
    //     - Parameters:
    //     - query: The string query that will be used to fetch.
    //     - table: The table that will be fetched.
    //     - requester: The class that is requesting the fetch.
    //
    //     - Attention: The requester must conform to the AirtableFetcher Protocol.
    //     The result will be sent to the requester by callback function.
    //     */
    //    public func fetch(quering query: String, inTable table: String, to requester:AirtableFetcher){
    //        let url = makeQueryURL(for: table, with: "?", and: query)
    //        runFetch(with: url, from:table, to: requester)
    //    }
    //
    //    /**
    //     Fetches all objects on a table.
    //
    //     - Parameters:
    //     - table: The table that will be fetched.
    //     - requester: The class that is requesting the fetch.
    //
    //     - Attention: The requester must conform to the AirtableFetcher Protocol.
    //     The result will be sent to the requester by callback function.
    //     */
    //    public func fetchAll(inTable table: String, to requester:AirtableFetcher){
    //        fetch(quering: "", inTable: table, to: requester)
    //    }
    //
    //
    //        //MARK: Post Session
    //
    //    /**
    //     Posts a data, as a dictionary, on a table.
    //
    //     - Parameters:
    //     - data: The data that will be posted.
    //     - table: The table where the data will be posted.
    //     - requester: The class that is requesting the post.
    //
    //     - Attention: The requester must conform to the AirtablePoster Protocol.
    //     */
    //    public func post(data:[AnyHashable : Any], inTable table:String, to requester:AirtablePoster) {
    //        post(data: data, in: table, for: .write, to: requester)
    //    }
    //
    //    /**
    //     Posts a data on a table.
    //
    //     - Parameters:
    //     - record: The data that will be posted.
    //     - table: The table where the data will be posted.
    //     - requester: The class that is requesting the post.
    //
    //     - Attention: The requester must conform to the AirtablePoster Protocol and the data to be posted must conform to the AirtableRecord Protocol.
    //     */
    //    public func post<T:AirtableRecord>(record:T, inTable table:String? = nil, to requester:AirtablePoster) {
    //        post(data: record.fields.asDictionary,
    //             inTable: tableNameFromDefaults(using: table, and: record),
    //             to: requester)
    //    }
    //
    //    /**
    //     Posts a data array on a table.
    //
    //     - Parameters:
    //     - records: The AirtableRecord array that will be posted.
    //     - table: The table where the data array will be posted.
    //     - requester: The class that is requesting the post.
    //
    //     - Attention: The requester must conform to the AirtablePoster Protocol and the data on the array must conform to the AirtableRecord Protocol.
    //     The result will be sent to the requester by callback function.
    //     */
    //    public func post<T:AirtableRecord>(records:[T], inTable table:String? = nil, to requester:AirtablePoster) {
    //
    //        guard let record = records.first else {
    //            debugPrint("Warning post call with empty data")
    //            return
    //        }
    //
    //        let table = tableNameFromDefaults(using: table, and: record)
    //        for record in records {
    //            post(record: record, inTable: table, to: requester)
    //        }
    //
    //    }
    //
    //
    //        //MARK: Update Session
    //
    //    /**
    //     Updates a data, as a dictionary, on a table.
    //
    //     - Parameters:
    //     - id: The id of the data that is going to be updated.
    //     - data: The dictionary of the content of the new data.
    //     - table: The table where the data is.
    //     - requester: The class that is requesting the update.
    //
    //     - Attention: The requester must conform to the AirtablePoster Protocol.
    //     The result will be sent to the requester by callback function.
    //     */
    //    public func update(objectIdentifiedBy id: String, withData data:[AnyHashable : Any], in table:String, to requester:AirtablePoster) {
    //        let url = makeQueryURL(for: table, with: "/", and: id)
    //        runPost(for: .update, with: url, writing: data, to: requester)
    //    }
    //
    //    /**
    //     Updates a data on a table.
    //
    //     - Parameters:
    //     - record: The AirtableRecord that is going to be updated.
    //     - table: The table where the AirtableRecord is.
    //     - requester: The class that is requesting the update.
    //
    //     - Attention: The requester must conform to the AirtablePoster Protocol.
    //     The operation result will be sent to the requester by callback function.
    //     */
    //    public func update<T:AirtableRecord>(record:T, in table:String? = nil, to requester:AirtablePoster) {
    //        update(objectIdentifiedBy: record.id, withData: record.fields.asDictionary, in: tableNameFromDefaults(using: table, and: record), to: requester)
    //    }
    //
    //
    //        // MARK: Delete Session
    //
    //    /**
    //     Deletes a data from a table.
    //
    //     - Parameters:
    //     - id: The id of the data that is going to be deleted.
    //     - table: The table where the data is.
    //     - requester: The class that is requesting the delete.
    //
    //     - Attention: The requester must conform to the AirtableDeleter Protocol.
    //     */
    //    public func delete(objectIdentifiedBy id: String, inTable table: String, to requester:AirtableDeleter){
    //        let url = makeQueryURL(for: table, with: "/", and: id)
    //        runDelete(with: url, to: requester)
    //    }
    //
    //    /**
    //     Deletes a data from a table.
    //
    //     - Parameters:
    //     - record: The AirtableRecord that is going to be deleted.
    //     - table: The table where the data is.
    //     - requester: The class that is requesting the delete.
    //
    //     - Attention: The requester must conform to the AirtableDeleter Protocol.
    //     */
    //    public func delete<T:AirtableRecord>(record:T, in table:String? = nil, to requester:AirtableDeleter) {
    //
    //        delete(objectIdentifiedBy: record.id,
    //               inTable: tableNameFromDefaults(using: table, and: record),
    //               to: requester)
    //    }
    // }
