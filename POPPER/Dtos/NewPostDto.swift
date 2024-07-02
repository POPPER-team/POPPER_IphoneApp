//
//  NewPostDto.swift
//  POPPER
//
//  Created by Lorena Kovačić on 06.06.2024..
//

import Foundation

struct NewPostDto : Codable{
public var Title:String;
public var Description:String;
public var Ingridients:[String];
public var Steps:[String];
}
