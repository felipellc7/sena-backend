namespace :sena do
  namespace :empty do
    task database: :environment do
      puts "*** BORRANDO BASE DE DATOS ***"
      puts "******************************"
      puts "Registros Actuales"
      current_total_records()
      puts "******************************"
      User.delete_all
      Patient.delete_all
      Specialty.delete_all
      Doctor.delete_all
      ConsultingRoom.delete_all
      Schedule.delete_all
      Appointment.delete_all
    end
  end
  namespace :check do
    task total_records: :environment do
      puts "******************************"
      puts "Registros Actuales"
      current_total_records()
      puts "******************************"
    end
    task records: :environment do
      puts "Usuarios: #{User.all.inspect}"
      puts "****************************"
      puts "Pacientes: #{Patient.all.inspect}"
      puts "****************************"
      puts "Especialidades: #{Specialty.all.inspect}"
      puts "****************************"
      puts "Medicos: #{Doctor.all.inspect}"
      puts "****************************"
      puts "Consultorios: #{ConsultingRoom.all.inspect}"
      puts "****************************"
      puts "Agendas: #{Schedule.all.inspect}"
      puts "****************************"
      puts "Citas: #{Appointment.all.inspect}"
    end
  end
end

def current_total_records
  users = User.count
  patients = Patient.count
  specialties = Specialty.count
  doctors = Doctor.count
  consulting_rooms = ConsultingRoom.count
  schedules = Schedule.count
  appointments = Appointment.count
  puts "Usuarios: #{users}"
  puts "Pacientes: #{patients}"
  puts "Especialidades: #{specialties}"
  puts "Medicos: #{doctors}"
  puts "Consultorios: #{consulting_rooms}"
  puts "Agendas: #{schedules}"
  puts "Citas: #{appointments}"
end