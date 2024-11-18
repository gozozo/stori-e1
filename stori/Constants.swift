//
//  Constants.swift
//  stori
//
//  Created by Luis Enrique Vazquez Escobar on 18/11/24.
//

import Foundation

/// This struct manages static constants and loads environment variables from a .env file.
import Foundation

/// This struct manages static constants and loads environment variables from a .env file.
struct Constants {
    
    // Static properties for environment variables
    static var apiBaseUrl: String?
    static var imagesBaseUrl: String?
    static var apiKey: String?
    
    // Path to the .env file
    private static let envFilePath = Bundle.main.path(forResource: ".env", ofType: "") ?? ""
    
    // Static function to load environment variables
    static func loadEnvironmentVariables() {
        guard !envFilePath.isEmpty else {
            print("ERROR: Could not find the .env file")
            return
        }
        
        do {
            let fileContents = try String(contentsOfFile: envFilePath)
            
            // Split the content by lines
            let lines = fileContents.split(separator: "\n")
            
            for line in lines {
                let components = line.split(separator: "=")
                if components.count == 2 {
                    let key = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
                    let value = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    switch key {
                    case "API_BASE_URL":
                        apiBaseUrl = value
                    case "TMDB_IMAGE_BASE_URL":
                        imagesBaseUrl = value
                    case "API_KEY":
                        apiKey = value
                    default:
                        break
                    }
                }
            }
        } catch {
            print("ERROR: Error reading the .env file: \(error)")
        }
    }
    
    // Static initializer to load environment variables when the app starts
    static func initialize() {
        loadEnvironmentVariables()
    }
}
