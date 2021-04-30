//
//  UserResponse.swift
//  AppChallenge
//
//  Created by Tric Rullan on 4/30/21.
//

import Foundation

struct UserResponse {
  let id: Int
  let name: String
  let username: String
  let email: String
  let phone: String
  let website: String
}

extension UserResponse: Decodable {
  enum UserCodingKeys: String, CodingKey {
    case id
    case name
    case username
    case email
    case phone
    case website
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserCodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    
    name = try container.decode(String.self, forKey: .name)
    username = try container.decode(String.self, forKey: .username)
    email = try container.decode(String.self, forKey: .email)
    phone = try container.decode(String.self, forKey: .phone)
    website = try container.decode(String.self, forKey: .website)
  }
}

struct UserAddress {
  let street: String
  let suite: String
  let city: String
  let zipcode: String
}

extension UserAddress: Decodable {
  enum UserAddressCodingKeys: String, CodingKey {
    case street
    case suite
    case city
    case zipcode
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserAddressCodingKeys.self)
    street = try container.decode(String.self, forKey: .street)
    suite = try container.decode(String.self, forKey: .suite)
    city = try container.decode(String.self, forKey: .city)
    zipcode = try container.decode(String.self, forKey: .zipcode)
  }
}

struct UserAddressGeo {
  let latitude: String
  let longitude: String
}

extension UserAddressGeo: Decodable {
  enum UserAddressGeoCodingKeys: String, CodingKey {
    case latitude
    case longitude
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserAddressGeoCodingKeys.self)
    latitude = try container.decode(String.self, forKey: .latitude)
    longitude = try container.decode(String.self, forKey: .longitude)
  }
}

struct UserCompany {
  let name: String
  let catchPhrase: String
  let bs: String
}

extension UserCompany: Decodable {
  enum UserCompanyCodingKeys: String, CodingKey {
    case name
    case catchPhrase
    case bs
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: UserCompanyCodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
    bs = try container.decode(String.self, forKey: .bs)
  }
}
