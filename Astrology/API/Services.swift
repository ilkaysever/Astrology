//
//  Services.swift
//  Astrology
//
//  Created by ilkay on 27.10.2020.
//

import Alamofire

class Services {
    
    private static var baseUrl = "https://json.astrologyapi.com/v1"
    
    static func getAstroDetail(model: AstrologyRequestModel, response: @escaping(AstrologyModel) -> Void, error: @escaping(ErrorModel) -> Void) {
        
        let headers = HTTPHeaders(generateHeader()!)
        var parameters: Parameters?
        
        parameters = [:]
        parameters!["day"] = model.day
        parameters!["month"] = model.month
        parameters!["year"] = model.year
        parameters!["hour"] = model.hour
        parameters!["min"] = model.min
        parameters!["lat"] = model.lat
        parameters!["lon"] = model.lon
        parameters!["tzone"] = 5.5
        
        let request = AF.request("\(baseUrl)/astro_details", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
        request.validate()
        request.responseData { (afresponse) in
            switch afresponse.result {
            case .success:
                let astrology = AstrologyModel.decode(afresponse.data!)
                response(astrology!)
            case .failure:
                break
            }
        }
    }
    
    private static func generateHeader() -> [String: String]? {
        let userId = "614655"
        let apiKey = "6e03b1b78386693bac79adbb55b6f59d"
        let loginString = "\(userId):\(apiKey)"

        guard let loginData = loginString.data(using: String.Encoding.utf8) else {
            return nil
        }
        let base64LoginString = loginData.base64EncodedString()
        var parameters: [String: String] = [:]
        parameters["authorization"] = "Basic \(base64LoginString)"
        
        return parameters
    }
    
}

extension Decodable {
    
    static func decode(_ data: Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        return try? decoder.decode(self, from: data)
    }
    
    static func decode(_ data: String) -> Self? {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        return try? decoder.decode(self, from: Data(data.utf8))
    }
    
}
