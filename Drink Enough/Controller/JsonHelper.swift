//
//  JsonHelper.swift
//  Drink Enough
//
//  Created by Annekatrin Dunkel on 3/26/20.
//  Copyright © 2020 Annekatrin Dunkel. All rights reserved.
//

import UIKit

/*class JsonHelper
{
    let fileManager = FileManager()
    
    func getDocumentsURL() -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        } else {
            fatalError("Could not retrieve documents directory")
        }
    }

    //zum speichern eines amounts
    public func jsonWrite(jsonDict : Dictionary<String, Int>) -> Bool
    {
        let url = getDocumentsURL().appendingPathComponent("Drink.json")
        print(url)

        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(encodedXingData)
            // 3. Check if xing.json already exists...
            if fileManager.fileExists(atPath: url.path) {
                // ... and if it does, remove it
                try fileManager.removeItem(at: url)
            }
            // 4. Now create xing.json with the data encoded from our array of XingData
            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch {
            print(error)
        }
        
        JObject jobject = new JObject(
        new JProperty("weight", jsonDict["weight"]),
        new JProperty("amount", jsonDict["amount"]));

        try
        {
            using (StreamWriter file = File.CreateText(filepath))
            using (JsonTextWriter writer = new JsonTextWriter(file))
            {
                jobject.WriteTo(writer);
            }
            return true;
        }
        catch (Error)
        {
            print(Error);
            return false;
        }
    }

    public func jsonGetAllData() -> Dictionary<String, Int>
    {
        var dataDict = Dictionary<String, Int>()
        
        // 1. Create a url for documents-directory/Drink.json
        let url = getDocumentsURL().appendingPathComponent("Drink.json")
        
        do
        { if (file.exists(filepath))
            {
                var content = File.ReadAllText(filepath);
                dataDict = JsonConvert.DeserializeObject<Dictionary<string, int>>(content);
            }
            else
            {
                dataDict.Add("weight", 0);
                dataDict.Add("amount", 0);
            }
            return dataDict;
        }
        catch (Error)
        {
            print(Error);
        return nil
        }
    }

    public void deleteAllamounts()
    {
        //Datei löschen, wenn vorhanden
        if (File.Exists(filepath))
        {
            File.Delete(filepath);
        }
    }
}  */
