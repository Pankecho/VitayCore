//
//  Error.swift
//  VitayCore
//
//  Created by Juan Pablo on 9/2/19.
//  Copyright © 2019 Vitay. All rights reserved.
//

import Foundation

public enum CustomError: Error {
    case ParsingError
    case DataNotFound
    case NotArrayFound
    case ServerInternalError
    case ServerError(mensaje: String)
    case UserNotFound
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .ParsingError:
            return NSLocalizedString("Error al parsear la estructura", comment: "")
        case .DataNotFound:
            return NSLocalizedString("Data no se encuentra en la respuesta", comment: "")
        case .NotArrayFound:
            return NSLocalizedString("No se encontró un arreglo de respuesta", comment: "")
        case .ServerError(mensaje: let message):
            return NSLocalizedString(message, comment: "")
        case .ServerInternalError:
            return NSLocalizedString("Hubo un problema al conectar con el servidor, intente mas tarde", comment: "")
        case .UserNotFound:
            return NSLocalizedString("No se encontró el usuario", comment: "")
        }
    }
}
