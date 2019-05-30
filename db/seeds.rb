Record.delete_all
# Doctor.delete_all
# Patient.delete_all

# 
# ###### 15 DOCTORS ######
# doctor_smith_25 = Doctor.create(name: "Dr. Eric Smith", specialty: "Internal Medicine", hospital: "New York Presbyterian Hospital")
# doctor_lee_26 = Doctor.create(name: "Dr. Percy Lee", specialty: "Cardiologist", hospital: "New York Presbyterian Hospital")
# doctor_johnson_27 = Doctor.create(name: "Dr. Amelia Johnson", specialty: "Endocrinologist", hospital: "New York Presbyterian Hospital")

# doctor_carlson_28 = Doctor.create(name: "Dr. Standley Carlson", specialty: "Internal Medicine", hospital: "Mount Sinai Hospital")
# doctor_gibbs_29 = Doctor.create(name: "Dr. Lucas Gibbs", specialty: "Cardiologist", hospital: "Mount Sinai Hospital")
# doctor_davis_30 = Doctor.create(name: "Dr. Ray Davis", specialty: "Endocrinologist", hospital: "Mount Sinai Hospital")
# #
# doctor_rodriguez = Doctor.create(name: "Dr. John Rodriguez", specialty: "Internal Medicine", hospital: "NYU Langone Medical Center")
# doctor_moore = Doctor.create(name: "Dr. Alfred Moore", specialty: "Cardiologist", hospital: "NYU Langone Medical Center")
# doctor_laurey = Doctor.create(name: "Dr. Josefina Laurey", specialty: "Endocrinologist", hospital: "NYU Langone Medical Center")
#
# doctor_cole = Doctor.create(name: "Dr. Horace Cole", specialty: "Internal Medicine", hospital: "Morristown Medical Center")
# doctor_andrews = Doctor.create(name: "Dr. Lula Andrews", specialty: "Cardiologist", hospital: "Morristown Medical Center")
# doctor_garcia = Doctor.create(name: "Dr. Darrell Garcia", specialty: "Endocrinologist", hospital: "Morristown Medical Center")
#
# doctor_may = Doctor.create(name: "Dr. Jean May", specialty: "Internal Medicine", hospital: "St. Francis Hospital")
# doctor_ramos = Doctor.create(name: "Dr. Jimmie Ramos", specialty: "Cardiologist", hospital: "St. Francis Hospital")
# doctor_nguyen = Doctor.create(name: "Dr. Alicia Nguyen", specialty: "Endocrinologist", hospital: "St. Francis Hospital")
#
#
# ###### 3 PATIENTS ######
# bob_11 = Patient.create(name: "Bob Belcher", password: 555, age: 34, previous_conditions: "fish allergy and heart murmur")
# linda_12 = Patient.create(name: "Linda Belcher", password: 666, age: 30, previous_conditions: "sleep apnea")
# teddy_13 = Patient.create(name: "Teddy Francisco", password: 777, age: 38, previous_conditions: "asthma")
# tom_14 = Patient.create(name: "Tom Neir", password: 888, age: 34, previous_conditions: "fish allergy and heart murmur")
# beti_15 = Patient.create(name: "Beti Team", password: 999, age: 30, previous_conditions: "sleep apnea")
# eric_16 = Patient.create(name: "Eric Nader", password: 001, age: 38, previous_conditions: "asthma")
#
# ##### 2 RECORDS #####
record_bob = Record.create(illness: "flu", description: "runny nose and sore body for 7 days", cured: false, patient_id: 11, doctor_id: 25)
record_tom = Record.create(illness: "strep throat", description: "hoarse throat", cured: false, patient_id: 11, doctor_id: 26)
record_tom = Record.create(illness: "fever", description: "itchy throat", cured: false, patient_id: 11, doctor_id: 27)
record_tom = Record.create(illness: "rush", description: "red skin", cured: false, patient_id: 12, doctor_id: 28)
record_tom = Record.create(illness: "chicken poxs", description: "red spots", cured: false, patient_id: 12, doctor_id: 29)
record_tom = Record.create(illness: "Pnuimonia", description: "feeling cold", cured: false, patient_id: 12, doctor_id: 30)

 