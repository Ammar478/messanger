import Foundation
import FirebaseStorage


final class StorageManger {
    
    static let shared = StorageManger()
    
    private let storage = Storage.storage().reference()
    
    public typealias UploadProfileImageComplation = (Result<String,Error>)->Void
    
    public func uploadProfileImage(with data:Data ,fileName:String,completion: @escaping UploadProfileImageComplation){
        storage.child("image/\(fileName)").putData(data, metadata: nil, completion: {metaData,error in
            
            guard error == nil else{
                print("File to upload the profile image correctly")
                completion(.failure(StorageError.failedToUpload))
                return
            }
            
            self.storage.child("image/\(fileName)").downloadURL(completion: {url,error in
                
                guard let url=url , error == nil else{
                    print("Failed to download the url of profile image")
                    completion(.failure(StorageError.failedToDownloadURL))
                    return
                }
                
                let urlString = url.absoluteString
                completion(.success(urlString))
            })
        })
    }
    
    public enum StorageError:Error{
        case failedToUpload
        case failedToDownloadURL
    }
}
