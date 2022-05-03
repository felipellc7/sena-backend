# Create users
users = [{
  first_name: 'Alberto',
  last_name: 'Perez',
  dni: '1143222333',
  email: 'aperez@gmail.com',
  phone: '5553523',
  gender: 'male'
}, {
  first_name: 'Angie',
  last_name: 'Smith',
  dni: '1045333222',
  email: 'asmith@gmail.com',
  phone: '5551956',
  gender: 'female'
}]

User.create(users)

# Create patients
patients = [{
  first_name: 'Karla',
  last_name: 'Gomez',
  dni: '1045999888',
  email: 'kgomez@gmail.com',
  phone: '5552324',
  gender: 'female'
}, {
  first_name: 'Breiner',
  last_name: 'Otalvaro',
  dni: '1143777333',
  email: 'botalvaro@gmail.com',
  phone: '5551213',
  gender: 'male'
}]

Patient.create(patients)

# Create specialties
specialties = [{
  name: "Odontología General"
}, {
  name: "Optometría"
}]

Specialty.create(specialties)

# Create doctors
doctors = [{
  first_name: 'Mauricio',
  last_name: 'Buendia',
  dni: '1143099333',
  email: 'mbuendia@gmail.com',
  phone: '5550903',
  gender: 'male',
  specialties_id: Specialty.first.id
}, {
  first_name: "Julia",
  last_name: "Uribe",
  dni: "1045987990",
  email: "juribe@gmail.com",
  phone: "5554325",
  gender: "female",
  specialties_id: Specialty.last.id
}]

Doctor.create(doctors)

# Create consulting rooms
consulting_rooms = [{
  name: "Consultorio 1",
  loc_country: "COLOMBIA",
  loc_region: "ATLANTICO",
  loc_city: "BARRANQUILLA",
  loc_commune: "SUR",
  loc_nomeclature: "Calle 1 # 1-1",
  loc_description: "Consultorio de Odontología General",
  specialties_id: Specialty.first.id
}, {
  name: "Consultorio 2",
  loc_country: "COLOMBIA",
  loc_region: "ATLANTICO",
  loc_city: "BARRANQUILLA",
  loc_commune: "SUR",
  loc_nomeclature: "Calle 2 # 2-2",
  loc_description: "Consultorio de Optometría",
  specialties_id: Specialty.last.id
}]

ConsultingRoom.create(consulting_rooms)