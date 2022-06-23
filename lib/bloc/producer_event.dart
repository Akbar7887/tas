import 'package:tas/models/Customer.dart';

abstract class ProducerEvent{}

class ProducerLoadEvent extends ProducerEvent{}

class ProducerClearEvent extends ProducerEvent{}
