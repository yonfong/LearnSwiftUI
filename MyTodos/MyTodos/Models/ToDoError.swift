//
//  ToDoError.swift
//  MyTodos
//
//  Created by sky on 2024/3/30.
//

import Foundation

enum ToDoError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodingError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("could not save todos, please reinstall the app", comment: "")
        case .readError:
            return NSLocalizedString("could not load todos, please reinstall the app", comment: "")
        case .decodingError:
            return NSLocalizedString("There was a problem loading your todos, please create a new todo to start over", comment: "")
        case .encodingError:
            return NSLocalizedString("could not load todos, please reinstall the app", comment: "")
        }
    }
}

struct ErrorType: Identifiable {
    let id = UUID()
    let error: ToDoError
}
