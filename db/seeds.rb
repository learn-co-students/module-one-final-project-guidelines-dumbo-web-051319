###### 15 DOCTORS #####
Record.delete_all
Doctor.delete_all
Patient.delete_all

doctor_smith = Doctor.new(name: "Dr. Eric Smith", specialty: "Internal Medicine", hospital: "New York Presbyterian Hospital")
doctor_lee = Doctor.new(name: "Dr. Percy Lee", specialty: "Cardiologist", hospital: "New York Presbyterian Hospital")
doctor_johnson = Doctor.new(name: "Dr. Amelia Johnson", specialty: "Endocrinologist", hospital: "New York Presbyterian Hospital")

doctor_carlson = Doctor.new(name: "Dr. Standley Carlson", specialty: "Internal Medicine", hospital: "Mount Sinai Hospital")
doctor_gibbs = Doctor.new(name: "Dr. Lucas Gibbs", specialty: "Cardiologist", hospital: "Mount Sinai Hospital")
doctor_davis = Doctor.new(name: "Dr. Ray Davis", specialty: "Endocrinologist", hospital: "Mount Sinai Hospital")

doctor_rodriguez = Doctor.new(name: "Dr. John Rodriguez", specialty: "Internal Medicine", hospital: "NYU Langone Medical Center")
doctor_moore = Doctor.new(name: "Dr. Alfred Moore", specialty: "Cardiologist", hospital: "NYU Langone Medical Center")
doctor_laurey = Doctor.new(name: "Dr. Josefina Laurey", specialty: "Endocrinologist", hospital: "NYU Langone Medical Center")

doctor_cole = Doctor.new(name: "Dr. Horace Cole", specialty: "Internal Medicine", hospital: "Morristown Medical Center")
doctor_andrews = Doctor.new(name: "Dr. Lula Andrews", specialty: "Cardiologist", hospital: "Morristown Medical Center")
doctor_garcia = Doctor.new(name: "Dr. Darrell Garcia", specialty: "Endocrinologist", hospital: "Morristown Medical Center")

doctor_may = Doctor.new(name: "Dr. Jean May", specialty: "Internal Medicine", hospital: "St. Francis Hospital")
doctor_ramos = Doctor.new(name: "Dr. Jimmie Ramos", specialty: "Cardiologist", hospital: "St. Francis Hospital")
doctor_nguyen = Doctor.new(name: "Dr. Alicia Nguyen", specialty: "Endocrinologist", hospital: "St. Francis Hospital")


###### 3 PATIENTS ######
bob = Patient.new(name: "Bob Belcher", age: 34, previous_conditions: "fish allergy and heart murmur")
linda = Patient.new(name: "Linda Belcher", age: 30, previous_conditions: "sleep apnea")
teddy = Patient.new(name: "Teddy Francisco", age: 38, previous_conditions: "asthma")

##### 2 RECORDS #####
# record_bob = Record.new(name: "flu", description: "runny nose and sore body for 7 days", year_month: "May 2019", patient_id: 1, doctor_id: 1, cured?: false)
# record_bob = Record.new(name: "strep throat", description: "hoarse throat", year_month: "June 2017", patient_id: 1, doctor: 4, cured?: false)
