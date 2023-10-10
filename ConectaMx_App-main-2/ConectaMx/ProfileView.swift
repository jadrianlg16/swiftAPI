//
//  ProfileView.swift
//  ConectaMx
//
//  Created by Guillermo Garcia Acosta on 21/09/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var activePage: ActivePage = .profile
    @State private var showImagePicker = false
    @State private var profileImage: UIImage? = UIImage(named: "messi_mock")
    var tags: [String]
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                ZStack{
                    VStack{
                        List{
                            ForEach(tags, id:\.self){tag in
                                Text(tag)}
                        }
                        
                    }
                }
                // Imagen de perfil
                ZStack {
                    Image(uiImage: profileImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    // Botón para editar imagen
                    Button(action: {
                        showImagePicker.toggle()
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(hex: "FFD465"))
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .offset(x: 55, y: 55)
                }
                .padding(.bottom, 30)
                
                // Botones de opciones
                VStack {
                    profileButton(icon: "person.fill", text: "Datos personales")
                    profileButton(icon: "questionmark.circle.fill", text: "Ayuda & Soporte")
                    profileButton(icon: "gear", text: "Ajustes")
                    profileButton(icon: "power", text: "Cerrar Sesión")
                }
                .frame(width: 260)
                
                Spacer()
                
                // Botón web
                Button(action: {
                    // Acción para botón web
                }) {
                    HStack {
                        Image(systemName: "globe")
                            .foregroundColor(.white)
                        Text("Web")
                            .foregroundColor(.white)
                    }
                    .frame(width: 230)
                    .padding()
                    .background(Color(hex: "3D3D4E"))
                    .cornerRadius(10)
                }
                .padding(.bottom, 130)
            }
            .padding()
            
            VStack(spacing: 0) {
                
                // Llamar a barra inferior
                Spacer()
                BottomBarView(activePage: $activePage)
            }
            .zIndex(1)
        }
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$profileImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = profileImage else { return }
        //Terminar más tarde
    }
    
    // Botón de perfil personalizado
    func profileButton(icon: String, text: String) -> some View {
        Button(action: {
            // Acción para botones
            if text == "Datos personales" {
                let editProfileView = EditProfileView(profileImage: $profileImage)
                let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: editProfileView))
                navigationController.navigationBar.prefersLargeTitles = true
                UIApplication.shared.windows.first?.rootViewController?.present(navigationController, animated: true, completion: nil)
            }
        }) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                Text(text)
                    .foregroundColor(.white)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color(hex: "3D3D4E"))
            .cornerRadius(10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(tags:["Examoople"])
    }
}
