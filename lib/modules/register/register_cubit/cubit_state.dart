part of 'cubit_cubit.dart';

abstract class RegisterStates {}

class InitialState extends RegisterStates {}

class RegisterLoading extends RegisterStates {}
class RegisterSuccess extends RegisterStates {}
class RegisterError extends RegisterStates {}
