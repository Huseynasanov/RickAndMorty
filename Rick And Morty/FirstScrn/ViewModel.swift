//
//  ViewModel.swift
//  Rick And Morty
//
//  Created by Huseyn Hasanov on 27.10.22.
//

import Foundation
class ViewModel{
    var success: ((Bool, Data?) -> Void)?
    var error : ((Bool) -> Void)?
    var pageNum = 1
    func getList(name: String,status: String,species: String,type: String,gender: String){
        pageNum = 1
        let namee = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let speciess = species.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let genderr = gender.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let statuss = status.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let typee = type.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let url = "https://rickandmortyapi.com/api/character/?page=\(pageNum)&name=\(namee)&status=\(statuss)&species=\(speciess)&type=\(typee)&gender=\(genderr)"
        print("knkjndc\(url)")
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, res, err in
            if err != nil{
                print(err ?? 0)
                return
            }
            if let safeDate = data{
                let decoder = JSONDecoder()
                do{
                    let data = try decoder.decode(Data.self, from: safeDate)
                    
                    self.success?(false, data)
                }catch{
                    return
                }
            }
        })
        session.resume()
    }
    func getListPaignation(name: String,status: String,species: String,type: String,gender: String){
        pageNum += 1
        let namee = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let speciess = species.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let genderr = gender.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let statuss = status.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let typee = type.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let url = "https://rickandmortyapi.com/api/character/?page=\(pageNum)&name=\(namee)&status=\(statuss)&species=\(speciess)&type=\(typee)&gender=\(genderr)"
        print("knkjndc\(url)")
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, res, err in
            if err != nil{
                print(err ?? 0)
                return
            }
            if let safeDate = data{
                let decoder = JSONDecoder()
                do{
                    let data = try decoder.decode(Data.self, from: safeDate)
                    
                    self.success?(true ,data)
                }catch{
                    return
                }
            }
        })
        session.resume()
    }
}
