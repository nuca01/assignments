//
//  LogInPageViewModel.swift
//  assignment20
//
//  Created by nuca on 28.04.24.
//

import Foundation

enum KeyChainError: Error {
    case sameItemFound
    case unknown
    case nosuchDataFound
    case KCErrorWithCode(Int)
}

class LogInPageViewModel {
    //    MARK: - Properties
    weak var view: LogInPageViewController?
    var onFetchImage: ((URL) -> Void)?
    var didCheckAccount: (() -> (String?, String?))?
    var onButtonTapped: (() -> Void)?
    var account = "This Device"
    //    MARK: - LifeCycles
    func didLoad(view: LogInPageViewController){
        loadImageFromDocumentsDirectory()
        self.view = view
        saveImageToDocumentsDirectory()
        checkIfAlreadyLoggedIn()
    }
    
    //    MARK: - Methods
    private func loadImageFromDocumentsDirectory(){
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let imageURL = documentsURL.appendingPathComponent("pickedImage.jpg")
        onFetchImage?(imageURL)
    }
    
    func saveImageToDocumentsDirectory() {
        view?.onDataLoaded = { data in
            let fileManager = FileManager.default
            let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let imageURL = documentsURL.appendingPathComponent("pickedImage.jpg")
            do {
                try data.write(to: imageURL)
            } catch {
                print("Error saving image:", error)
            }
        }
    }
    
    func checkIfAccountExists() {
        let userName = didCheckAccount?().0
        let password = didCheckAccount?().1
        guard let userName, let password
        else {
            return
        } 
        let retrievedPassword = String(data: get(service: "log in", account: userName) ?? Data(), encoding: .utf8)
        if retrievedPassword == password {
            UserDefaults.standard.set(false, forKey: "First Time Logged In")
            navigateToCountries()
        } else{
            do{
                try save(service: "log in", account: userName, password: password.data(using: .utf8) ?? Data())
                saveLoggedIn(user: userName, password: password)
                UserDefaults.standard.set(true, forKey: "First Time Logged In")
                navigateToCountries()
            } catch{
                print(error)
            }
        }
    }
    
    private func save(
        service: String,
        account: String,
        password: Data
    ) throws {
        let query: [String: AnyObject] = [
            kSecClass as String         : kSecClassGenericPassword,
            kSecAttrService as String   : service as AnyObject,
            kSecAttrAccount as String   : account as AnyObject,
            kSecValueData as String     : password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
    }
    
    
    private func get(
        service: String,
        account: String
    ) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        _ = SecItemCopyMatching(query as CFDictionary, &result)
        return result as? Data
    }
    
    private func saveLoggedIn(user: String, password: String) {
        UserDefaults.standard.set(true, forKey: "Logged In")
        do {
            try save(service: "Log In User", account: account, password: user.data(using: .utf8) ?? Data())
        } catch {
            print(error)
        }
    }
    
    private func checkIfAlreadyLoggedIn() {
        view?.onCheckedIfLoggedIn = { [weak self] in
            let user = self?.get(service: "Log In User", account: self?.account ?? "") ?? Data()
            let password = self?.get(service: "log in", account: String(data: user, encoding: .utf8) ?? "") ?? Data()
            let alreadyLoggedIn = UserDefaults.standard.bool(forKey: "Logged In")
            if alreadyLoggedIn {
                self?.navigateToCountries()
            }
            return ((String(data: user, encoding: .utf8) ?? ""), (String(data: password, encoding: .utf8) ?? ""))
        }
    }
//        MARK: - Navigation
    func navigateToCountries() {
        self.onButtonTapped?()
    }
    
}
