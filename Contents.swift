import UIKit

struct Persona {
    var nombre: String
    var apelidoPaterno: String
    var apellidoMaterno: String
    var fechaNacimiento: Date
    var documento: String
    var sexo: String
    var correo: String
    var cantidadHermanos: Int
    var usuario: String?
    var edad: Int
    init ( nombre: String, apelidoPaterno: String, fechaNacimiento: Date, documento: String, sexo: String, correo: String, cantidadHermanos: Int, apellidoMaterno :String){
        
        let fechaActual = Date()
        let anio = Calendar.current.dateComponents([.year], from: fechaNacimiento, to: fechaActual)
        self.nombre = nombre
        self.apelidoPaterno = apelidoPaterno
        self.fechaNacimiento = fechaNacimiento
        self.documento = documento
        self.sexo = sexo
        self.correo = correo
        self.cantidadHermanos = cantidadHermanos
        self.edad = anio.year ?? 0
        self.apellidoMaterno = apellidoMaterno
        
        
    }
    init ( nombre: String, apelidoPaterno: String, fechaNacimiento: Date, documento: String, sexo: String, correo: String, cantidadHermanos: Int, usuario: String,apellidoMaterno :String){
        let fechaActual = Date()
        let anio = Calendar.current.dateComponents([.year], from: fechaNacimiento, to: fechaActual)
        self.nombre = nombre
        self.apelidoPaterno = apelidoPaterno
        self.fechaNacimiento = fechaNacimiento
        self.documento = documento
        self.sexo = sexo
        self.correo = correo
        self.cantidadHermanos = cantidadHermanos
        self.usuario = usuario
        self.edad = anio.year ?? 0
        self.apellidoMaterno = apellidoMaterno
    }
    func mayorEdad(personas: [Persona]) -> [Persona?]{
        var edadMenor: Int = 99
        var edadMayor: Int = 0
        var personaMayor :Persona?
        var personaMenor :Persona?
        for persona in personas{
            if(persona.edad>edadMayor){
                edadMayor = persona.edad
                personaMayor = persona
            }else if(persona.edad<edadMenor){
                edadMenor = persona.edad
                personaMenor = persona
            }
        }
        let listaPersonas = [personaMayor,personaMenor]
        return listaPersonas
    }
    func listaPorSexo(personas: [Persona]) -> (personasHombres :[Persona], personasMujeres :[Persona]){
        var personasHombres :[Persona] = []
        var personasMujeres :[Persona] = []
        for persona in personas{
            if(persona.sexo.elementsEqual("H")){
                personasHombres.append(persona)
            } else if(persona.sexo.elementsEqual("M")){
                personasMujeres.append(persona)
            }
        }
        return (personasHombres, personasMujeres)
    }
    
    func mayorDeDosHermanos(personas: [Persona]) -> [Persona]? {
        var listaPersonasConHermanos :[Persona]?
        for persona in personas{
            if (persona.cantidadHermanos > 2){
                listaPersonasConHermanos?.append(persona)
            }
        }
        return listaPersonasConHermanos
    }
    func imprimirNombreCompleto(persona :Persona){
        var nombre = persona.nombre.lowercased()
        var apellidoPaterno = persona.apelidoPaterno.lowercased()
        let apellidoMaterno = persona.apellidoMaterno[String.Index.init(encodedOffset: 0)]
    }
}

