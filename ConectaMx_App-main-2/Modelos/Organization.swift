// Organization.swift
import Foundation

struct Organization: Identifiable {
    var id: String
    var name: String
    var location: Location
    var contact: Contact
    var serviceHours: String
    var socialMedia: SocialMedia
    var missionStatement: String
    var tags: [String]
    var followers: [String]
}

struct Location {
    var address: String
    var city: String
    var state: String
    var country: String
    var zip: String
}

struct Contact {
    var email: String
    var phone: String
}

struct SocialMedia {
    var facebook: String
    var twitter: String
    var instagram: String
    var linkedIn: String
}
