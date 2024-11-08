class CustomerClass{
  final int id;
  final String nameOfCustomer;
  final double billAmount;
  final String billStatus;
  CustomerClass({
    required this.id,
    required this.nameOfCustomer,
    required this.billAmount,
    required this.billStatus
  });
  Map<String,dynamic> customerData(){
    return{
      "id":id,
      "nameOfCustomer":nameOfCustomer,
      "billAmount":billAmount,
      "billStatus":billStatus
    };
  }
}