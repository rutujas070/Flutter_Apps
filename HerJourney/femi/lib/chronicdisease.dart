import 'package:femi/planningpreg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChronicDisease extends StatelessWidget{
  const ChronicDisease({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PlanningPregnancy()));
          },
          child: const Icon(Icons.arrow_back,size: 30,),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              width: 380,
              child: Text("Chronic diseases and pregnancy planning: Things to know",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: 350,
              height: 250,
              child:Image.asset("assets/home/gynac.jpg",fit:BoxFit.fill,)
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width: 380,
              child: Text("Planning a pregnancy while managing a chronic disease requires thoughtful preparation and collaboration with healthcare professionals. Conditions such as diabetes, hypertension, asthma, or autoimmune disorders can impact pregnancy outcomes, making it essential to achieve optimal disease control before conception. Consulting a healthcare provider early allows for adjustments to medications that are safe during pregnancy and for developing a personalized care plan. Lifestyle changes, such as maintaining a balanced diet, exercising appropriately, and managing stress, play a critical role in minimizing risks. Open communication with specialists ensures that both maternal and fetal health are prioritized, empowering individuals to navigate pregnancy with confidence and care.",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}