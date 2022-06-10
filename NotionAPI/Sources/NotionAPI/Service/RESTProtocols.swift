//
//  RESTProtocols.swift
//  Notion API Tests
//
//  Created by Ricardo Venieris on 08/05/22.
//

import Foundation

protocol DataFetcher {
    func fetched(result:Result<Data, Error>, response: HTTPURLResponse?)
}

protocol DataPoster {
    func posted(result:Result<Data, Error>, response: HTTPURLResponse?)
}

protocol DataDeleter {
    func deleted(result:Result<Data, Error>, response: HTTPURLResponse?)
}

protocol RESTManager:DataFetcher, DataPoster, DataDeleter { }
