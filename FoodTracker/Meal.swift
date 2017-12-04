//
//  Meal.swift
//  FoodTracker
//
//  Created by amitabh singh on 12/1/17.
//  Copyright © 2017 iStar. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
   //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    struct propertyTypes {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //MARK: Initializors
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialization should fail if no name or if the rating is negative
        guard !name.isEmpty else {
            return nil
        }
        guard (rating>=0) && (rating<6) else {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: propertyTypes.name)
        aCoder.encode(photo, forKey: propertyTypes.photo)
        aCoder.encode(rating, forKey: propertyTypes.rating)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: propertyTypes.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: propertyTypes.rating)
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: propertyTypes.name) as? String
            else {
                os_log("Unable to decode the name for a meal object.", log: OSLog.default, type: .debug)
                return nil
        }
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
    }
}
