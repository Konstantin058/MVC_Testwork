//
//  ApiError.swift
//  MVC_Testwork
//
//  Created by Константин Евсюков on 20.03.2024.
//

import UIKit

enum ApiError: String, Error {
    case urlError = "Ошибка вызова URL-адресса"
    case serverError = "Сервер не отвечает"
    case invalidResponse = "Ошибка запроса сети"
    case decodingError = "При декодировании произошла ошибка"
}
