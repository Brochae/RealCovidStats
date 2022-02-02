/*

-----------
create new database for this table
create new folder for database, and organize files properly
sketch the table with pseudo code before you code it
-----------

Hi! I'm extremely frustrated with all the "Fake news" the government and media are feeding us about the covid-19 vaccines!  
They can't seem to go more than 24 hours without changing their opinions/rules and regulations or contradicting themselves!
I've decided to create a privatly owned and regulated database, as a public service, in order to accurately analyze the data.
Please help me carry out my noble plan.
Thank you!

The following is the data that I want each verified user of my program to be required to enter:

First Name, Last Name, DOB, Last for digits of SSN, Covid-19 - the first or second wave (Y/N), Delta wave (Y/N), 
Omicron wave (Y/N), Degree of symptoms each time around, Loss of taste and/smell each time around,
Vaccination status (Y/N), If yes, which one and when, Boosters (0,1,2,3,4)

I would like the following reports to be ready at hand:

1) How many people got covid twice, and for whoever did get it twice, tell how many of them got it by the 1/2 and then Delta,
how many by the 1/2 and then Omicron, and how many by Delta and then Omicron.

2) What were the typical sypmtoms for each age group each wave of covid?

3) Compared to the overall population (that is entered in my system), were the people who were vaccinted more likely, less likely, or equally likely
to get covid for each of the 3 major varients that I collected data about?

4) The same idea as the report before, just this time I want to know about the symptoms of those vaccinated - were they any better or worse than the general population?

Question: I understand why you're collecting their date of birth - you want to know their age; but why do you need the last for digits of their SSN?
Answer: I told you, I don't want to feed anyone all the phony info they're getting from other places, I want the data here to be ligit. I don't want any hooligans
to try messing up the data by placing duplicate entries.

Question: You mentioned that you want report 2 to be grouped be age, what age groups do you have in mind?
Answer: I was thinking to go by the decade from 10-70 and go by the half a decade for ages outside that range

Question: Another thing I want to clarify about the age - when exactly do you want it calculated from?
Answer: When they first contracted covid.

Question: I know some people mix-and-match of vaccines and boosters - how do you want to count those?
Answer: Exactly how they were - I think I made it clear that I'm looking to get to the honest truth for once and for all ;)

Question: There was a lot of talk about underlying conditions that effect covid - do you plan on including them in your database?
Answer: Of course! How could I have forgotten?!?! Thanks for reminding me. Please ensure to also include in the reports the relationship
between each underlying condtion and the degree of syptoms, compared to how common the same symptom was with the general public.

Question: A few times you said you want something compared to 'the general public' - what exactly do you mean by that, literally everyone? 
or everyone without underlying conditions?
Answer: Good question! But a hard one to answer :( it's the age-old issue of averages misrepresenting the population due to the extremes that throw 
all the numbers off. I think the best idea in this case would be to create a 'pre-existing condition' called 'healthy' and have 'the general public' mean
literally everyone. This way I think we'll be able to get an informative view of the data.

Are you clear now? Please let me know if you have any more questions.

Now, in order to populate the sample data, I thought a good idea would be to base it an existing table in your database.
I heard you have a table called Medalists.

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

GOOD LUCK!!! Thank you for your help in this noteworthy cause!
*/

