class Currency {
  final int id;
  final String flag;
  final String name;
  final String code;

  Currency(this.id, this.flag, this.name, this.code);

  static List<Currency> currencyList() {
    return <Currency>[
      Currency(1, "USD", "United States Dollar", "USD"),
      Currency(2, "AED", "United Emirates Durham", "AED"),
      Currency(3, "IQD", "Iraqi Dinar", "IQD"),
     // Currency(4, "JOD", "Jordanian Dinar", "JOD"),
    ];
  }
}