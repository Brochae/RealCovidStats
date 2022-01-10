/*
User
    pk
    UserFirstName varchar
    UserLastName varchar
    UserDOB date
    UserSSN (last 4 digits) int
    HadCovid19 bit yes or no
    First/SecondWave bit
    DeltaWave bit
    OmicronWave bit
    DegreeOfSymptom varchar (mild, moderate, harsh, extreme, died(no double))
    LossOfTasteAndSmell bit
    ListOfSymptoms varchar (healthy)
    VaccinationStatus bit
    VaccineCompany varchar
    DateOfVaccine date
    BoosterStatus int (0,1,2,3,4)
    BosterCompany varchar




-For whatever feilds you can pull straight from the table - please do.
-For the DOB - Put January 1st of the last two digits of the year born for Winter Medalists
                   May 1st of the last two digits of the year born for the Spring Medalists
                   July 1st of the last two digits of the year born for the Summer Medalists
                   October 1st of the last two digits of the year bor for the Fall Medalists
-For the last 4 digits of the SSN - do the year born minus the number of characters that the Medalist has in their First and Last Names combined
    (You may either include the spaces or not, just remember the rule: ALL or NONE but not SOME)
-For simplicity's sake, all the gold medalists will be healthy, all silver medalists will have hypertension, all bronze medalista will have diabetes.
    However, please do not limit it to these categories for the real data - this is just for the sample.
-For when each medalist got covid:
    -Medalists whose first name starts with a-k got the 1/2 wave
    -Medalists whose first name starts with l-z got delta
    -Medalists whose last name start with g-q got omicron
-For the exact date that the medalist contracted the disease:
    -April 14, 2020 for the 1/2 wave
    -August 20, 2021 for the Delta wave
    -November 26, 2021 for the Omicron wave
-For the Degree of Symptoms:
    -Medalists whose first name contains 1-4 characters - Mild
    -Medalists whose first name contains 5-6 characters - Moderate
    -Medalists whose first name contains 7-8 characters - Harsh
    -Medalists whose first name contains 9-10 charachters - Extreme
    -Medalists whose first name contains 11 or more charachters - Died
    (For simplicity, everyone got it to the same degree each time. Just make sure nobody dies twice.)
-Medalists who were born in an even year did not loose taste or smell, but medalists born in an odd year did.
    (Again, this is the same every time for the sample data)
-For the most common symptom:
    Winter Medalists - chills
    Spring Medalists - random aches
    Summer Medalists - High fever
    Fall Medalists - runny nose
    (Again, this is an incomplete list of symptoms.)
-Vaccination Status and date
    -All Americans, Brits, Russians, and Chinese got vaccinated on their birthday in 2021, the rest did not get vaccinated.
-Vaccine company 
    -Americans and Brits took Pfizer, Chinese took Moderna, and Russians used J&J
-Booster Status (of those vaxxed)
    -Gold Medalists had 2 boosters
    -Silver Medalists had 1 booster
    -Bronze Medalists had 0
-Booster Company:
    For simplicity all will be Moderna










*/