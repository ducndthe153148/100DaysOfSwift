//
//  WeatherManager.swift
//  Clima
//
//  Created by MacOS on 14/02/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager ,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=78ed6b8b11e08ae58625e4a726e6d625&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
//        - Step 1: Create a URL
        if let url = URL(string: urlString) {
//            - Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            
            //        - Step 3: Give URLSession Task
            let task = session.dataTask(with: url) { data, response, error in
                // completionHandler (được gọi sau khi đã gọi xong request)
                if error != nil {
                    print("This is error: \(error)")
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //        - Step 4: Start the task
            task.resume()
        
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            print(weather.conditionName)
            return weather
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
