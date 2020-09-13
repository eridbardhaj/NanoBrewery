//
//  Image+Network.swift
//  NanoBrewery
//
//  Created by Erid Bardhaj on 9/10/20.
//

import SwiftUI
import Combine

extension Image {
    
    static func fetchImage(from resourceURLString: String) -> AnyPublisher<UIImage?, Never> {
        Future<UIImage?, Never> { observer in
            let image = try? URL(string: resourceURLString)
                .map { try Data(contentsOf: $0) }
                .flatMap { UIImage(data: $0) }
            
            observer(.success(image))
        }
        .eraseToAnyPublisher()
    }
}
