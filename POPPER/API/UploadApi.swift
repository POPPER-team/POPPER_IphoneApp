//
//  UploadApi.swift
//  POPPER
//
//  Created by Lorena Kovačić on 06.06.2024..

/*
 [Route("api/[controller]")]
 public class PostController : ControllerBase
 {
     private readonly IPostService _postService;
     public PostController(IPostService postService)
     {
         _postService = postService;
     }
     [HttpPost("[action]")]
     public async Task<IActionResult> CreatePost([FromForm] NewPostDto dto)


     [HttpGet("[action]")]
     public IActionResult GetRecommendedPosts()

     [HttpGet("[action]/{guid}")]
     public async Task<IActionResult> GetPost([FromRoute] string guid)

     [HttpDelete("[action]{guid}")]
     public IActionResult DeletePost([FromRoute] string guid)

 */
//


import Foundation
class UploadApi{
    
    func UploadPost(){
        let urlPath = "";
        var data :Data? = nil;
        conn.putRequest(path: urlPath, body: data!){
            data, response, error in
            if let data = data{
                
            }
            else{
                print (error)
            }
            
        }
    }
    
    func GetPost(guid:String){
        let urlPath = "";
        conn.getRequest(path: urlPath){
            data, response, error in
            
        }
    }
    
    func DeletePost(guid:String){
        let urlPath = "";
        conn.deleteRequest(path: urlPath){
            data, response, error in
            
        }
    }
    
    func GetNextPost(){
        
    }
}
