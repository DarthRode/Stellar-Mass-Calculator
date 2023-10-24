import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false, // Supprimer la bannière "debug"
      ),
    ),
  );
}

class UserData with ChangeNotifier {
  double weightOnEarth = 0.0;
  final Map<String, double> gravities = {
    "Mercure": 0.38,
    "Vénus": 0.91,
    "Terre": 1.0,
    "Mars": 0.38,
    "Jupiter": 2.34,
    "Saturne": 1.06,
    "Uranus": 0.92,
    "Neptune": 1.19,
    "Pluton": 0.06,
  };

  final Map<String, double> weightsOnPlanets = {
    "Mercure": 0.0,
    "Vénus": 0.0,
    "Terre": 0.0,
    "Mars": 0.0,
    "Jupiter": 0.0,
    "Saturne": 0.0,
    "Uranus": 0.0,
    "Neptune": 0.0,
    "Pluton": 0.0,
  };

  void updateWeight(double newWeight) {
    weightOnEarth = newWeight;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stellar Mass Calculator (SMC)"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/space.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bienvenue dans l'application de calcul de masse stellaire !",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Cette application vous permet de saisir votre poids sur Terre, puis elle calcule votre poids sur différentes planètes du système solaire.",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  final userData = Provider.of<UserData>(context, listen: false);
                  userData.updateWeight(double.tryParse(text) ?? 0.0);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Entrez votre poids en kg",
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage()));
                },
                child: Text("Calculer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    for (String planet in userData.weightsOnPlanets.keys) {
      userData.weightsOnPlanets[planet] = userData.weightOnEarth * userData.gravities[planet]!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Résultats"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Votre poids sur différentes planètes :",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              for (String planet in userData.weightsOnPlanets.keys)
                Card(
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: ListTile(
                    title: Text(planet),
                    subtitle: Text("Poids : ${userData.weightsOnPlanets[planet]!.toStringAsFixed(2)} kg"),
                    leading: Image.asset('assets/${planet.toLowerCase()}.png'), // Assurez-vous d'ajouter 'assets/' ici
                  ),
                ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GravitationalMassPage()));
                },
                child: Text("Calculer la Masse Gravitationnelle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GravitationalMassPage extends StatefulWidget {
  @override
  _GravitationalMassPageState createState() => _GravitationalMassPageState();
}

class _GravitationalMassPageState extends State<GravitationalMassPage> {
  double mass1 = 0.0;
  double mass2 = 0.0;
  double distance = 0.0;
  double gravitationalForce = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcul de Masse Gravitationnelle"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Calcul de la Masse Gravitationnelle :",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    mass1 = double.tryParse(text) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Masse de la planète 1 (en kg)",
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    mass2 = double.tryParse(text) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Masse de la planète 2 (en kg)",
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    distance = double.tryParse(text) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Distance entre les planètes (en mètres)",
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    gravitationalForce = (6.67430e-11 * mass1 * mass2) / (distance * distance);
                  });
                },
                child: Text("Calculer la Force Gravitationnelle"),
              ),
              SizedBox(height: 20.0),
              if (gravitationalForce > 0)
                Text(
                  "Force Gravitationnelle : ${gravitationalForce.toStringAsFixed(2)} N",
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
