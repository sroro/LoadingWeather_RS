//
//  MockFakeDataResponse.swift
//  LoadingWeather_RSTests
//
//  Created by Rodolphe Schnetzer on 07/09/2022.
//

import Foundation

class TestFakeResponseData {
    
    // 1-simulate 2 types of responses
    static let responseOK = HTTPURLResponse(url: URL(string:"https://google.com")!, statusCode: 200, httpVersion: nil, headerFields: [:])
    static let responseKO = HTTPURLResponse(url: URL(string:"https://google.com")!, statusCode: 500, httpVersion: nil, headerFields: [:])
    
    class DataError: Error { }
    static let error = DataError()
    
    static var weatherCorrectData: Data {
        let bundle = Bundle(for: TestFakeResponseData.self)
        let url = bundle.url(forResource: "Weather", withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    // 3-Json damaged
    static let incorrectData = "erreur".data(using: .utf8)
    
}
