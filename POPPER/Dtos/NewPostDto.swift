//
//  NewPostDto.swift
//  POPPER
//
//  Created by Lorena Kovačić on 06.06.2024..
//

import Foundation

class NewPostDto : Codable{

//    public IFormFile Media { get; set; }

var Title:String;
var Description:String;
var Ingridients:Array<String>;
var Steps:Array<String>;
}
