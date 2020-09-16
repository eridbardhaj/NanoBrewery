//
//  URLSessionable.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/16/20.
//

import Foundation

protocol URLSessionable {
    func dataTaskPublisher(for request: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionable {}
