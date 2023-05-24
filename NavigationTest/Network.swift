//
//  Network.swift
//  NavigationTest
//
//  Created by Paraíso, Gustavo Alexandre on 04/05/2023.
//

import Foundation

struct Item: Codable{
  var id: Int
  var gender: String
  var name: String
  var image: URL
  var price: Double
}

struct AvailableColor: Codable {
    let label: String
    let stock: Int
    let image: String
}

struct AvailableSize: Codable {
    let label, stock: Int
}

struct ItemSingular: Codable {
    let id: Int
    let name, brand: String
    let price: Double
    let gender, category: String
    let availableColors: [AvailableColor]
    let availableSizes: [AvailableSize]
    let description: String
}

class Network{
    

  var host: String
  var path: String
  var apiKey: String?
  var hasKey: Bool


  init(host: String, path: String, hasKey: Bool, apiKey: String?){
    self.host = host
    self.path = path
    self.apiKey = apiKey
    self.hasKey = hasKey
  }

func searchNetwork(search: String, completion: @escaping ([Item]?) -> Void){
  let url = self.urlBuilder(search: search)
  let request = self.requestBuilder(url: url)
  self.getItems(request: request, completion: completion)
}
    
    func getNetworkItem(completion: @escaping (ItemSingular?) -> Void){
        let url = self.urlBuilder(search: "")
        let request = self.requestBuilder(url: url)
        self.getItemSingular(request: request, completion: completion)
    }
    
    func getItemSingular(request: URLRequest, completion: @escaping (ItemSingular?) -> Void){
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("erro")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                guard let itemsJson = json as? [String: Any] else {
                    print("Error: Could not decode items JSON")
                    return
                }
                let itemsData = try JSONSerialization.data(withJSONObject: itemsJson, options: [])
                
                let items = try JSONDecoder().decode(ItemSingular.self, from: itemsData)
                
                completion(items)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
        
    }

func urlBuilder(search: String = "") -> URL {
  var components = URLComponents()

  //https://cf5dxst1y4.execute-api.eu-west-1.amazonaws.com/develop/product?searchTerm=Ada

  components.scheme = "https"
  components.host = self.host
  components.path = self.path

  components.queryItems = [URLQueryItem(name: "searchTerm", value: search)]

  return components.url!
}

func requestBuilder(url: URL) -> URLRequest{
  var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)

  if self.hasKey{
  request.setValue(self.apiKey, forHTTPHeaderField: "x-api-key")
  }

  return request
}


func getItems(request: URLRequest, completion: @escaping ([Item]?) -> Void){

URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data else {
        print("erro")
        return
    }
    do {
        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        guard let itemsJson = json["items"] as? [[String: Any]] else {
            print("Error: Could not decode items JSON")
            return
        }
        let itemsData = try JSONSerialization.data(withJSONObject: itemsJson, options: [])
      
        let items = try JSONDecoder().decode([Item].self, from: itemsData)
    
        completion(items)
    } catch {
        print("Error: \(error.localizedDescription)")
    }
}.resume()

}
    
}
