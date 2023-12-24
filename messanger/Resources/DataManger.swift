
import Firebase


final class  DatabaseManger{
    static let shared = DatabaseManger()
    
    let databace = Database.database(url: "https://massenger-3fd2a-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
}

extension DatabaseManger {
    
    public func isAccountExsit(with email:String ,completion:@escaping ((Bool)->Void)){
        var safeEmail=decodeEmail(with: email)
        databace.child(safeEmail).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
        
    }
    
    public func insertNewAccount(with user:NewAccountInfo,completion:@escaping((Bool)->Void)){
        
        databace.child(user.codedEmail).setValue([
            "first_name":user.firstName,
            "last_name":user.lastName
        ],withCompletionBlock: {error,_ in
            
            guard error == nil else{
                completion(false)
                return
            }
            completion(true)
        })
    }
    
    private func  decodeEmail(with email:String)->String{
        var safeEmail=email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}

struct NewAccountInfo{
    let firstName:String
    let lastName:String
    let email:String
    
    var codedEmail:String {
        var safeEmail=email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    var profileimgFileName:String {
        
        return "\(codedEmail)_profile_picture.png"
    }
}
