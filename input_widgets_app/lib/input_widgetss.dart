import 'package:flutter/material.dart';

// 1. Create SurveyForm with StatefulWidget
class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});

  @override
  State<SurveyForm> createState() => SurveyFormState();
}

class SurveyFormState extends State<SurveyForm> {
  // 2. Add bool variables for checkboxes
  bool sports = false;
  bool music = false;
  bool tech = false;

  // 4. Add String? gender variable
  String? gender;

  // SwitchListTile
  bool notifications = false;

    final List<String> countries = ['Pakistan', 'India', 'Iran', 'Iraq'];
  String selectedCountry = 'Pakistan';

  // Slider
  double age = 18;

  String summary = '';

  void showSummary() {
    setState(() {  
      summary =     
      //   these ''' colons are used to add multiples lines text; 
          '''
Sports: $sports
Music: $music
Technology: $tech
Gender: ${gender ?? 'Not selected'}
Notifications: $notifications
Country: $selectedCountry
Age: ${age.toInt()}
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Form'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // 3. Implement Checkbox widgets with onChanged
             Text('Hobbies'),
            CheckboxListTile(
              title:  Text('Sports'),
              value: sports,
              onChanged: (value) => setState(() => sports = value!),
            ),
            CheckboxListTile(
              title:  Text('Music'),
              value: music,
              onChanged: (value) => setState(() => music = value!),
            ),
            CheckboxListTile(
              title:  Text('Technology'),
              value: tech,
              onChanged: (value) => setState(() => tech = value!),
            ),
             const Divider(),
             Text('Gender', style: TextStyle(fontSize: 18)),
        RadioListTile<String>(
  title: Text('Male'),
  value: 'Male',
  groupValue: gender,
  onChanged: (value) => setState(() => gender = value),
),
RadioListTile<String>(
  title: Text('Female'),
  value: 'Female',
  groupValue: gender,
  onChanged: (value) => setState(() => gender = value),
),
RadioListTile<String>(
  title: Text('Other'),
  value: 'Other',
  groupValue: gender,
  onChanged: (value) => setState(() => gender = value),
),
     const Divider(),
            SwitchListTile(title: Text('Notification'),  value: notifications , onChanged: (value)=>setState(()=>notifications=value)),
          const Divider(),
          
          Text('Country', style: TextStyle(fontSize: 18)),

            DropdownButton<String>(
              value: selectedCountry,
              isExpanded: true,
              items: countries
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (v) => setState(() => selectedCountry = v!),
            ),

            const Divider(),
            Text('Age', style: TextStyle(fontSize: 18)),

            Slider(
              value: age,
              min: 10,
              max: 60,
              divisions: 50,
              label: age.toInt().toString(),
              onChanged: (value) => setState(() => age = value),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: showSummary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Show Summary'),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}
