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
class UploadApi :ObservableObject{
    func CreateNewPost(newPost:NewPostDto, upload:@escaping(PostDto?) ->()){
        let urlPath = "/Post/CreatePost";

            conn.postRequest(path: urlPath, body: newPost){
                data, response, error in
                if let data = data{
                    if let post = try? JSONDecoder().decode(PostDto.self, from: data)
                    {
                        upload(post)
                    }
                    else{
                        print ("Error decoding json")
                    }
                    
                    
                }
                else{
                    print (error)
                }
            }
            
    }
    
    func UploadMedia(imageData : DataField, guid: String){
        let urlPath = "/Post/UploadPostMedia/\(guid)";
        conn.putRequest(path: urlPath, field:imageData){
            data, response, error in
            if let data = data {
                do {
                    print(data);
                }}
            else{
                print(error)
            }
        }
    }
    
    func GetPost(guid:String, PostExcape:@escaping(PostDto?) ->()){
        let urlPath = "/Post/GetPost/\(guid)";
        conn.getRequest(path: urlPath){
            data, response, error in
                print(response)
        }
    }
    
    func DeletePost(guid:String){
        let urlPath = "/Post/DeletePost/\(guid)";
        conn.deleteRequest(path: urlPath){
            data, response, error in
            
        }
    }
    
    func GetNextPost(){
        
    }
}
