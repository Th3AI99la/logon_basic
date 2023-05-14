
import SwiftUI

struct ContentView: View {
    
    //MARK: VARIAVEIS
    

    @State var nomeLogin = "ronaldo" // NOME
    @State var senhaLogin = "" // SENHA
    
    @State var lembrar = false // TOOGLE INTERRUPTOR
    
    @State var SheetModal = false // MODAL ("outra tela")
    
    @State var aparecerAlerta = false // ALERTA DE ERRO DE SENHA
    
    
    
    var body: some View {
        
      
      
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.white, .purple]), startPoint: .bottom, endPoint: .top)
            
                .ignoresSafeArea()
            
            VStack {
                
             
                    Text("Olá, Dev. Mobile" )
                
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .light))
                    
          
         
                    
                    TextField("Nome", text: $nomeLogin)
                    
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.purple.opacity(5))
                        .cornerRadius(10)
                        .textContentType(.name)
                    
        
                    
                    SecureField("Senha", text: $senhaLogin)
                    
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.purple.opacity(5))
                        .cornerRadius(10)
                    
                    // MARK: TOGGLE LEMBRA DE MIM
                    
                    Toggle("Lembrar de mim", isOn: $lembrar)
                    
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                    
                    
                
                // MARK: LOGICA DO BOTÃO SENHA INCORRETA
                    
                    Button ("Entrar"){
                    

                        if senhaLogin == "123"{
                            
                            SheetModal.toggle() // SE A SENHA ESTIVER CORRETA, ACESSA O A MODAL
                            
                        }else{
                            
                            aparecerAlerta.toggle()// SENÃO, O ALERT APARECE.
                            
                        }
           
                    }
                
                    .alert("Senha incorreta", isPresented: $aparecerAlerta){
                        
                        Button("OK"){}
             
                    }
                
        
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.purple)
                    .cornerRadius(30)
                    
                
                // MARK: MODAL (BEM-VINDO)
                
                    .sheet(isPresented: $SheetModal){ // MODAL

                            
                    HStack{
                                
                        VStack {
                                    
                            Text("BEM VINDO(A),  \(nomeLogin)")
                                    .font(.system(size: 50, weight: .semibold))
                                    .textCase(.uppercase)
                                    
                                Rectangle()
                                     .fill(.purple) // modificador de preenchimento para colocar cor
                                     .frame(width: 200, height: 10) // altura e largura
                                }
                                  

                                Text("👊🏻")
                                   
                                    .font(.system(size: 100))
               
                            }
                 
        
                        Button("Sair "){
                            SheetModal = false //BOTÃO VOLTAR
                             
                        }
                        .padding(80)
                        .foregroundColor(.purple)
                        .font(.system(size: 20, weight: .semibold))
                 
                       
                }
            
                           
                
                
                
            } // FINAL HSSTACK
               
        }// FINAL ZSSTACK
   
    }
     
}

// MARK: STRUCT PADRÃO


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



