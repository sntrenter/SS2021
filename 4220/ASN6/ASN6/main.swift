// Sam Trenter
//  main.swift
//  ASN6
//
//  Created by CompSci 4220 Student on 7/22/21.
//

import Foundation


//func prettyprint(json: String) -> String {
//    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
//       let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
//        print(String(decoding: jsonData, as: UTF8.self))
//    } else {
//        print("json data malformed")
//    }
//}

let BananaJSON: [String: Any] = [
    "name": "Banana",
    "points": 200,
    "description": "A banana grown in Ecuador."
]
let OrangeJSON: [String:Any] = [
    "name": "Orange",
    "points": 100
]

struct Fruit: Decodable {
    let name: String?
    let points: Int?
    let description: String?
}


let decoder = JSONDecoder()

let BananaData: Data = try JSONSerialization.data(withJSONObject: BananaJSON, options: [])
let newBanana = try decoder.decode(Fruit.self, from: BananaData)

let OrangeData: Data = try JSONSerialization.data(withJSONObject: OrangeJSON, options: [])
let newOrange = try decoder.decode(Fruit.self, from: OrangeData)

print(newBanana)
print(newOrange)




let store1JSON: [String: Any] =
    [
        "name": "Home Town Market",
        "aisles": [
            [
                "name": "Produce",
                "shelves": [
                    [
                        "name": "Discount Produce",
                        "product": [
                            "name": "Banana",
                            "points": 200,
                            "description": "A banana that's perfectly ripe."
                        ]
                    ]
                ]
            ]
        ]
    ]

let store2JSON: [String: Any] =
    [
        "name": "Big City Market",
        "aisles": [
            [
                "name": "Sale Aisle",
                "shelves": [
                    [
                        "name": "Seasonal Sale",
                        "product": [
                            "name": "Chestnuts",
                            "points": 700,
                            "description": "Chestnuts that were roasted over an open fire."
                        ]
                    ],
                    [
                        "name": "Last Season's Clearance",
                        "product": [
                            "name": "Pumpkin Seeds",
                            "points": 400,
                            "description": "Seeds harvested from a pumpkin."
                        ]
                    ]
                ]
            ]
        ]
    ]



struct Product: Decodable {
    let name: String?
    let points: Int?
    let description: String?
}
struct Shelves: Decodable {
    let name: String?
    let product: Product?
}

struct Aisles: Decodable {
    let name: String?
    let shelves: [Shelves]?
}
struct Store: Decodable {
    let name: String?
    let aisles: [Aisles]?
}


let store1Data: Data = try JSONSerialization.data(withJSONObject: store1JSON, options: [])
//print(String(decoding: store1Data, as: UTF8.self))
let newStore1 = try decoder.decode(Store.self, from: store1Data)

let store2Data: Data = try JSONSerialization.data(withJSONObject: store2JSON, options: .prettyPrinted)
//print(String(decoding: store2Data, as: UTF8.self))
let newStore2 = try decoder.decode(Store.self, from: store2Data)

print(newStore1)
print(newStore2)
print("#########")
print(newStore1.aisles?.first?.shelves?.first?.product?.name ?? "ope")

//I had some issues with the second set of JSON objects but everything seems to load correctly now,
//wasn't sure if you wanted us to print anything specific.

