//
//  ImageCacheController.swift
//  iDrinx2
//
//  Created by Jeremiah Hawks on 7/22/22.
//

import Foundation
import UIKit

class ImageCacheController {
    
    init() {
        createFolderIfNeeded()
    }
    
    func storeImage(urlString: String, imageData: Data) {
        let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("Cocktail_Images").path.appending("/").appending(getImageName(urlString: urlString))
//        let path = NSTemporaryDirectory().appending(UUID().uuidString)
        let url = URL(fileURLWithPath: path)
        
        do {
            try imageData.write(to: url)
            print("image was successfully saved")
            var dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String : String]
            if dict == nil {
                dict = [String: String]()
            }
            dict![urlString] = url.path
            UserDefaults.standard.set(dict, forKey: "ImageCache")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func createFolderIfNeeded() {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("Cocktail_Images")
            .path else { return }
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("success creating folder")
                print(path)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    }
    
//    func loadImage(urlString: String) -> Data? {
//        if let dict = UserDefaults.standard.object(forKey: "ImageCache") as? [String: String],
//           let path = dict[urlString] {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path))
//                return data
//            } catch let error {
//                print(error.localizedDescription)
//                return nil
//            }
//        } else {
//            return nil
//        }
//    }
    
    private func getImageName(urlString: String) -> String {
        if let url = URL(string: urlString) {
            let components = url.pathComponents
            return components[components.count - 1]
        } else {
            return ""
        }
    }
    
    func loadImage(urlString:String) -> Data? {
        let name = getImageName(urlString: urlString)
        
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent("Cocktail_Images")
            .path.appending("/" + name) else { return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
