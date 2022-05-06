# Create users
users = [{
  first_name: 'Alberto',
  last_name: 'Perez',
  dni: '1143222333',
  email: 'aperez@gmail.com',
  password: '1143222333',
  phone: '5553523',
  gender: 'male'
}, {
  first_name: 'Angie',
  last_name: 'Smith',
  dni: '1045333222',
  email: 'asmith@gmail.com',
  password: '1045333222',
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
  password: "1045999888",
  phone: '5552324',
  gender: 'female'
}, {
  first_name: 'Breiner',
  last_name: 'Otalvaro',
  dni: '1143777333',
  email: 'botalvaro@gmail.com',
  password: "1143777333",
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
  password: '1143099333',
  phone: '5550903',
  gender: 'male',
  specialty_id: Specialty.first.id
}, {
  first_name: "Julia",
  last_name: "Uribe",
  dni: "1045987990",
  email: "juribe@gmail.com",
  password: "1045987990",
  phone: "5554325",
  gender: "female",
  specialty_id: Specialty.last.id
}]

Doctor.create(doctors)

# Create consulting rooms
consulting_rooms = [{
  name: "Consultorio 1",
  loc_country: "COLOMBIA",
  loc_region: "ATLANTICO",
  loc_city: "BARRANQUILLA",
  loc_commune: "SUR",
  loc_address: "Calle 1 # 1-1",
  loc_description: "Consultorio de Odontología General",
  specialty_id: Specialty.first.id
}, {
  name: "Consultorio 2",
  loc_country: "COLOMBIA",
  loc_region: "ATLANTICO",
  loc_city: "BARRANQUILLA",
  loc_commune: "SUR",
  loc_address: "Calle 2 # 2-2",
  loc_description: "Consultorio de Optometría",
  specialty_id: Specialty.last.id
}]

ConsultingRoom.create(consulting_rooms)

# Create schedules
schedules = [{
  consulting_room_id: ConsultingRoom.first.id,
  date: Date.current().to_s,
  time: "08:00:00",
}, {
  consulting_room_id: ConsultingRoom.last.id,
  date: Date.current().to_s,
  time: "14:00:00",
}]

Schedule.create(schedules)

# Create appointments
appointments = [{
  patient_id: Patient.first.id,
  doctor_id: Doctor.first.id,
  schedule_id: Schedule.first.id,
  status: "reserved",
  observations: "NINGUNA",
}, {
  patient_id: Patient.last.id,
  doctor_id: Doctor.last.id,
  schedule_id: Schedule.last.id,
  status: "in_progress",
  observations: "NINGUNA",
}]

Appointment.create(appointments)

# Create histories
histories = [{
  appointment_id: Appointment.last.id,
  doctor_id: Doctor.last.id,
  patient_id: Patient.last.id,
  diagnosis: "Resequedad en los ojos",
  treatment: "Control mensual por 3 meses con gotas oftalmicas",
}]

History.create(histories)