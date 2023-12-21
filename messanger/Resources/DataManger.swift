
import Firebase


final class  DatabaseManger{
    static let shared = DatabaseManger()
    
    let databace = Database.database().reference()
}

extension DatabaseManger {
    
    public func isAccountExsit(with email:String ,completion:@escaping ((Bool)->Void)){
        databace.child(email).observeSingleEvent(of: .value, with: {snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        })
        
    }
    
    public func insertNewAccount(with user:NewAccountInfo){
        databace.child(user.email).setValue([
            "first_name":user.firstName,
            "last_name":user.lastName
        ])
    }
}

struct NewAccountInfo{
    let firstName:String
    let lastName:String
    let email:String
//    let accountImgURL:URL
}
