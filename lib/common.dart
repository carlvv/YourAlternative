int HIGHEST_ID = 0;
List<Entry> history = []; //TODO speichern
List<Entry> catalog = [];

class Entry {
  int _id = 0;
  String _name = "";
  String _description = "";
  double _price = 0.0;
  int _rating = 0;
  bool _advertisement = false;
  List<Entry> _adjecent = [];

  get id => this._id;
  get name => this._name;
  get description => this._description;
  get price => this._price;
  get rating => this._rating;
  get advertisement => this._advertisement;
  get adjecent => this._adjecent;

  Entry(
    String _name,
    String __description,
    double _price,
    int _rating,
    bool _advertisement,
    List<Entry> _adjecent,
  ) {
    this._id = ++HIGHEST_ID;
    this._name = _name;
    this._description = _description;
    this._price = _price;
    this._rating = _rating;
    this._advertisement = _advertisement;
    this._adjecent = _adjecent;
  }

  @override
  String toString() {
    return 'ID: $_id\n'
        'Name: $_name\n'
        'Beschreibung: $_description\n'
        'Preis: $_price\n'
        'Bewertung: $_rating\n'
        'Werbung: $_advertisement\n'
        'Adjacent: ${_adjecent.map((e) => e._id).toList()}\n';
  }
}

void prepareData() {
  final Entry kuehlschrankBosch = Entry(
    "Bosch Kühlschrank (KGN39VL30)",
    "Kühlschrank mit Gefrierfach, 180 Liter, Energieeffizienzklasse A+++",
    799.99,
    5,
    false,
    [],
  );
  catalog.add(kuehlschrankBosch);
  final Entry kuehlschrankSamsung = Entry(
    "Samsung Kühlschrank (RB37A52N1SA)",
    "Side-by-Side, 367 Liter, Twin Cooling Plus, Energieeffizienzklasse A++",
    1199.99,
    4,
    true,
    [],
  );
  catalog.add(kuehlschrankSamsung);
  final Entry kuehlschrankLG = Entry(
    "LG Kühlschrank (GB-B539SLQZ)",
    "Kühl-Gefrierkombination, 390 Liter, DoorCooling+, Energieeffizienzklasse A+++",
    999.99,
    5,
    false,
    [],
  );
  catalog.add(kuehlschrankLG);
  final Entry kuehlschrankLiebherr = Entry(
    "Liebherr Kühlschrank (CBNes 4855)",
    "Premium-Kühlschrank, 358 Liter, BioFresh, Energieeffizienzklasse A+++",
    1499.99,
    5,
    false,
    [],
  );
  catalog.add(kuehlschrankLiebherr);
  final Entry fernseherSamsung = Entry(
    "Samsung QLED TV (QN90C)",
    "55 Zoll Smart-TV, 4K, Quantum HDR, 120Hz",
    1299.00,
    5,
    true,
    [],
  );
  catalog.add(fernseherSamsung);
  final Entry fernseherSony = Entry(
    "Sony Bravia XR-55A80L",
    "55 Zoll OLED-TV, 4K, Cognitive Processor XR, 120Hz",
    1499.00,
    5,
    false,
    [],
  );
  catalog.add(fernseherSony);
  final Entry fernseherLG = Entry(
    "LG OLED55C27LA",
    "55 Zoll OLED-TV, 4K, α9 Gen5 AI Processor, 120Hz",
    1399.00,
    5,
    false,
    [],
  );
  catalog.add(fernseherLG);
  final Entry fernseherPhilips = Entry(
    "Philips The One 55PUS8508",
    "55 Zoll LED-TV, 4K, P5 AI Picture Processor, Ambilight",
    899.00,
    4,
    false,
    [],
  );
  catalog.add(fernseherPhilips);
  final Entry kopfhoererSony = Entry(
    "Sony WH-1000XM5",
    "Noise-Cancelling-Kopfhörer, 30h Akku, Bluetooth 5.2, LDAC",
    399.99,
    5,
    false,
    [],
  );
  catalog.add(kopfhoererSony);
  final Entry kopfhoererBose = Entry(
    "Bose QuietComfort 45",
    "Noise-Cancelling-Kopfhörer, 24h Akku, Bluetooth 5.1",
    329.99,
    4,
    false,
    [],
  );
  catalog.add(kopfhoererBose);
  final Entry kopfhoererSennheiser = Entry(
    "Sennheiser Momentum 4 Wireless",
    "Noise-Cancelling-Kopfhörer, 60h Akku, Bluetooth 5.2, aptX Adaptive",
    299.99,
    5,
    false,
    [],
  );
  catalog.add(kopfhoererSennheiser);
  final Entry kopfhoererApple = Entry(
    "Apple AirPods Max",
    "Over-Ear-Kopfhörer, Active Noise Cancellation, 20h Akku",
    549.00,
    4,
    true, // Werbung
    [],
  );
  catalog.add(kopfhoererApple);
  final Entry nachttischlampeIKEA = Entry(
    "IKEA RIGGAD",
    "Nachttischlampe, LED, dimmbar, warmweiß",
    29.99,
    3,
    false,
    [],
  );
  catalog.add(nachttischlampeIKEA);
  final Entry nachttischlampePhilips = Entry(
    "Philips Hue Go",
    "Tragbare LED-Lampe, dimmbar, 16 Mio. Farben, Smart Home",
    79.99,
    4,
    false,
    [],
  );
  catalog.add(nachttischlampePhilips);
  final Entry nachttischlampeXiaomi = Entry(
    "Xiaomi Mi LED Desk Lamp",
    "LED-Schreibtischlampe, dimmbar, Touch-Steuerung, USB-Anschluss",
    49.99,
    4,
    false,
    [],
  );
  catalog.add(nachttischlampeXiaomi);
  final Entry nachttischlampeDyson = Entry(
    "Dyson Lightcycle Morph",
    "Premium-LED-Lampe, dimmbar, 4 Lichtmodi, Smart Home",
    899.00,
    5,
    true, // Werbung
    [],
  );
  catalog.add(nachttischlampeDyson);
  final Entry deckenleuchteOSRAM = Entry(
    "OSRAM LED Deckenleuchte",
    "LED-Deckenleuchte, 4000 Lumen, dimmbar, 3000K",
    89.99,
    4,
    false,
    [],
  );
  catalog.add(deckenleuchteOSRAM);
  final Entry deckenleuchtePhilips = Entry(
    "Philips LED Deckenleuchte",
    "LED-Panel, 3600 Lumen, dimmbar, 4000K, Smart Home",
    129.99,
    4,
    false,
    [],
  );
  catalog.add(deckenleuchtePhilips);
  final Entry deckenleuchteIKEA = Entry(
    "IKEA SOLHETTA",
    "LED-Deckenleuchte, 2300 Lumen, 2700K, modern",
    49.99,
    3,
    false,
    [],
  );
  catalog.add(deckenleuchteIKEA);
  kuehlschrankBosch._adjecent = [kuehlschrankSamsung, kuehlschrankLG, kuehlschrankLiebherr];
  kuehlschrankSamsung._adjecent = [kuehlschrankBosch, kuehlschrankLG, kuehlschrankLiebherr];
  kuehlschrankLG._adjecent = [kuehlschrankBosch, kuehlschrankSamsung, kuehlschrankLiebherr];
  kuehlschrankLiebherr._adjecent = [kuehlschrankBosch, kuehlschrankSamsung, kuehlschrankLG];

  fernseherSamsung._adjecent = [fernseherSony, fernseherLG, fernseherPhilips];
  fernseherSony._adjecent = [fernseherSamsung, fernseherLG, fernseherPhilips];
  fernseherLG._adjecent = [fernseherSamsung, fernseherSony, fernseherPhilips];
  fernseherPhilips._adjecent = [fernseherSamsung, fernseherSony, fernseherLG];

  kopfhoererSony._adjecent = [kopfhoererBose, kopfhoererSennheiser, kopfhoererApple];
  kopfhoererBose._adjecent = [kopfhoererSony, kopfhoererSennheiser, kopfhoererApple];
  kopfhoererSennheiser._adjecent = [kopfhoererSony, kopfhoererBose, kopfhoererApple];
  kopfhoererApple._adjecent = [kopfhoererSony, kopfhoererBose, kopfhoererSennheiser];

  nachttischlampeIKEA._adjecent = [nachttischlampePhilips, nachttischlampeXiaomi, nachttischlampeDyson];
  nachttischlampePhilips._adjecent = [nachttischlampeIKEA, nachttischlampeXiaomi, nachttischlampeDyson];
  nachttischlampeXiaomi._adjecent = [nachttischlampeIKEA, nachttischlampePhilips, nachttischlampeDyson];
  nachttischlampeDyson._adjecent = [nachttischlampeIKEA, nachttischlampePhilips, nachttischlampeXiaomi];

  deckenleuchteOSRAM._adjecent = [deckenleuchtePhilips, deckenleuchteIKEA];
  deckenleuchtePhilips._adjecent = [deckenleuchteOSRAM, deckenleuchteIKEA];
  deckenleuchteIKEA._adjecent = [deckenleuchteOSRAM, deckenleuchtePhilips];
}
