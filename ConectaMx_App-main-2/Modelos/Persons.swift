// Person.swift
import Foundation

struct Person: Identifiable {
    var id: String
    var name: String
    var phone: String
    var email: String
    var interestedTags: [String]
    var followedOrgs: [String]
}

