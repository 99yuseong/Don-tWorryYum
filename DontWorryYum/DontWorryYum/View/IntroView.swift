//
//  IntroView.swift
//  DontWorryYum
//
//  Created by 남유성 on 8/11/24.
//

import SwiftUI
import AuthenticationServices

struct IntroView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image("Title2")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 96)
                    .padding(.top, 165)
                    .padding(.leading, 20)
                
                Spacer()
                
                Image("splashIllust")
                    .resizable()
                    .scaledToFit()
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                AppleSigninButton()
                    .padding(.bottom, 16)
            }
        }
    }
}

struct AppleSigninButton : View{
    var body: some View{
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Apple Login Successful")
                    switch authResults.credential{
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            let UserIdentifier = appleIDCredential.user
                            let fullName = appleIDCredential.fullName
                            let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                            let email = appleIDCredential.email
                            let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                            let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                    default:
                        break
                    }
                    NavigationManager.shared.push(to: .nickname)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )
        .frame(width : UIScreen.main.bounds.width * 0.9, height:50)
        .cornerRadius(5)
    }
}

#Preview {
    IntroView()
}
