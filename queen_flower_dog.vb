Imports System

Public Class TheArtOfHealing
	
	Dim patientName As String
	Dim dateOfAppointment As Date
	
	Sub New(ByVal pName As String, ByVal appDate As Date)
		patientName = pName
		dateOfAppointment = appDate
	End Sub
	
	Public Sub TakeAppointment()
		Console.WriteLine("Patient name: {0}, Appointment date: {1}", patientName, dateOfAppointment.ToShortDateString())
	End Sub
	
	Public Sub TakePatientHistory()
		Console.WriteLine("Patient has complained of follows symptoms:")
		Console.WriteLine("1) Fever")
		Console.WriteLine("2) Cold")
		Console.WriteLine("3) Cough")
		Console.WriteLine("4) Loss of Appetite")
		Console.WriteLine("5) Nausea")
	End Sub
	
	Public Sub Diagnose()
		Console.WriteLine("Diagnosis of Patient based on histor and symptoms")
		Console.WriteLine("1) Flu")
		Console.WriteLine("2) Common Cold")
		Console.WriteLine("3) Gastroenteritis")
	End Sub
	
	Public Sub PrescribeTreatment()
		Console.WriteLine("Initial Course of treatment prescribed")
		Console.WriteLine("1) Bed Rest and Fluids")
		Console.WriteLine("2) Over-The-Counter Medication")
	End Sub
	
	Public Sub MonitorProgress()
		Console.WriteLine("Regular monitoring of patient progress")
		Console.WriteLine("1) Take Temperature and measure pulse rate every 4 hours")
		Console.WriteLine("2) Monitor diet and adjust medication if required")
	End Sub
	
	Public Sub ReferSpecialist()
		Console.WriteLine("Refer patient to specialist if necessary and review treatment if required")
		Console.WriteLine("1) Refer to an Internist")
		Console.WriteLine("2) Refer to a Gastroenterologist")
	End Sub
	
	Public Sub FollowupVisits()
		Console.WriteLine("Schedule followup visits to track progress of patient")
		Console.WriteLine("1) Schedule weekly visits to monitor progress")
		Console.WriteLine("2) Increase to bi-weekly visits if the patient is improving")
	End Sub
	
	Public Sub EvaluateOutcome()
		Console.WriteLine("Evaluate the outcome at the end of the treatment")
		Console.WriteLine("1) Check the patient's vital signs")
		Console.WriteLine("2) Ask the patient how they feel")
	End Sub
	
	Public Sub DiscussLifestyleChanges()
		Console.WriteLine("Discuss lifestyle changes if necessary at the end of the treatment")
		Console.WriteLine("1) Increase physical activity level")
		Console.WriteLine("2) Improve nutrition")
		Console.WriteLine("3) Reduce stress levels")
	End Sub
	
End Class