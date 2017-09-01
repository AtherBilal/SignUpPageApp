import Foundation

struct user {
    var username = ""
    var password = ""
    var email = ""
    var phoneNumber = ""
}

class userData {
    var users = [user]()
    var publicUserInfo = [String]()

    var inputTracker = [String]()
    func addNewUser(username:String, password:String, email:String, phoneNumber:String) {
        let newUser = user(username: username, password: password, email: email, phoneNumber: phoneNumber)
        publicUserInfo.append("username: \(newUser.username) email: \(newUser.email) Number: \(newUser.phoneNumber)")
        users.append(newUser)
        inputTracker = []
    }
    func isValidUserName (username: String) -> String {
        if (username.isEmpty){
            return "A username is required"
        } else if (username.characters.count) < 3  {
            return "The username must be atleast 3 characters"
        }
        else {
            inputTracker.append("username")
            return ""
        }
    }
    func isValidPassword (password: String) -> String {
        if password.characters.count < 7 {
            return "Password must have at least 7 characters"
        } else {
            inputTracker.append("password")
            return ""
        }
    }
    func isValidEmail (email: String) -> String {
        if email.characters.count < 3 {
            return "Each field must have atleast 3 characters"
        } else {
            inputTracker.append("email")
            return ""
        }
    }
    func isValidPhoneNumber (phoneNumber: String) -> String {
        if phoneNumber.characters.count < 10 {
            return "Phone number must be at least 10 numbers"
        } else {
            inputTracker.append("phoneNumber")
            return ""
        }
    }
    
    func allInputsValid() -> Bool {
        if inputTracker.contains("username"), inputTracker.contains("password"), inputTracker.contains("email"),inputTracker.contains("phoneNumber") {
            return true
        } else {
            return false
        }
    }
    
}

