drop table if exists CovidStats

Create table dbo.CovidStats(
    CovidStatsId int not null identity primary key,
    FirstName varchar(20) not null constraint ck_CovidStats_FirstName_not_blank check(FirstName <> ''),
    LastName varchar(20) not null constraint ck_CovidStats_LastName_cannot__be_blank check(LastName <> ''),
    DOB date not null constraint ck_CovidStats_DOB_cannot_be_blank check(DOB <> ''),
    SSN int not null constraint ck_CovidStats_SSN_cannot_be_blank check(SSN <> ''),
    HalfWave  varchar(1) not null constraint ck_CovidStats_HalfWave_cannot_be_blank check(HalfWave <> ''),
    DeltaWave varchar(1) not null constraint ck_CovidStats_DeltaWave_cannot_be_blank check(DeltaWave <> ''),
    OmicronWave varchar(1) constraint ck_CovidStats_OmriconWave_cannot_be_blank check(OmicronWave <> ''), 
    DegreeOfSymptoms varchar(10) constraint ck_CovidStats_DegreeOfSymptoms_cannot_be_blank check(DegreeOfSymptoms <> ''),
    LostTasteOrSmell varchar(1) constraint ck_CovidStats_LostTasteOrSmell_cannot_be_blank check(LostTasteOrSmell <> ''),
    CommonSymptoms varchar (10),
    DateContractedVirus date,
    PreExistingCondition varchar(10) constraint ck_CovidStats_PreExistingCondition_cannot_be_blank check(PreExistingCondition <> ''),
    VaccinationStatus varchar(1), 
    VaccineDate date,
    VaccineCompany varchar(10),
    BoosterStatus int,
    BoosterCompany varchar(10)
)
go 

