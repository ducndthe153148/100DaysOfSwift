//
//  WeatherManager.swift
//  Clima
//
//  Created by MacOS on 14/02/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=78ed6b8b11e08ae58625e4a726e6d625&units=metric"
    
    func fetchWeather (cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
//        - Step 1: Create a URL
        if let url = URL(string: urlString) {
//            - Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            
            //        - Step 3: Give URLSession Task
            let task = session.dataTask(with: url) { data, response, error in
                // completionHandler (được gọi sau khi đã gọi xong request)
                if error != nil {
                    print("This is error: \(error)")
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print("Da den day")
                    print(dataString)
                }
            }
            
            //        - Step 4: Start the task
            task.resume()
        
        }

    }

}
