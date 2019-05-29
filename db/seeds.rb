Record.delete_all
Doctor.delete_all
Patient.delete_all


###### 15 DOCTORS ######
doctor_smith = Doctor.create(name: "Dr. Eric Smith", specialty: "Internal Medicine", hospital: "New York Presbyterian Hospital")
doctor_lee = Doctor.create(name: "Dr. Percy Lee", specialty: "Cardiologist", hospital: "New York Presbyterian Hospital")
doctor_johnson = Doctor.create(name: "Dr. Amelia Johnson", specialty: "Endocrinologist", hospital: "New York Presbyterian Hospital")

doctor_carlson = Doctor.create(name: "Dr. Standley Carlson", specialty: "Internal Medicine", hospital: "Mount Sinai Hospital")
doctor_gibbs = Doctor.create(name: "Dr. Lucas Gibbs", specialty: "Cardiologist", hospital: "Mount Sinai Hospital")
doctor_davis = Doctor.create(name: "Dr. Ray Davis", specialty: "Endocrinologist", hospital: "Mount Sinai Hospital")

doctor_rodriguez = Doctor.create(name: "Dr. John Rodriguez", specialty: "Internal Medicine", hospital: "NYU Langone Medical Center")
doctor_moore = Doctor.create(name: "Dr. Alfred Moore", specialty: "Cardiologist", hospital: "NYU Langone Medical Center")
doctor_laurey = Doctor.create(name: "Dr. Josefina Laurey", specialty: "Endocrinologist", hospital: "NYU Langone Medical Center")

doctor_cole = Doctor.create(name: "Dr. Horace Cole", specialty: "Internal Medicine", hospital: "Morristown Medical Center")
doctor_andrews = Doctor.create(name: "Dr. Lula Andrews", specialty: "Cardiologist", hospital: "Morristown Medical Center")
doctor_garcia = Doctor.create(name: "Dr. Darrell Garcia", specialty: "Endocrinologist", hospital: "Morristown Medical Center")

doctor_may = Doctor.create(name: "Dr. Jean May", specialty: "Internal Medicine", hospital: "St. Francis Hospital")
doctor_ramos = Doctor.create(name: "Dr. Jimmie Ramos", specialty: "Cardiologist", hospital: "St. Francis Hospital")
doctor_nguyen = Doctor.create(name: "Dr. Alicia Nguyen", specialty: "Endocrinologist", hospital: "St. Francis Hospital")


###### 3 PATIENTS ######
bob = Patient.create(name: "Bob Belcher", age: 34, previous_conditions: "fish allergy and heart murmur")
linda = Patient.create(name: "Linda Belcher", age: 30, previous_conditions: "sleep apnea")
teddy = Patient.create(name: "Teddy Francisco", age: 38, previous_conditions: "asthma")

##### 2 RECORDS #####
record_bob = Record.create(illness: "flu", description: "runny nose and sore body for 7 days", cured?: false)
record_tom = Record.create(illness: "strep throat", description: "hoarse throat", cured?: false)
record_tom = Record.create(illness: "fever", description: "itchy throat", cured?: false)
record_tom = Record.create(illness: "rush", description: "red skin", cured?: false)
record_tom = Record.create(illness: "chicken poxs", description: "red spots", cured?: false)
record_tom = Record.create(illness: "Pnuimonia", description: "feeling cold", cured?: false)
