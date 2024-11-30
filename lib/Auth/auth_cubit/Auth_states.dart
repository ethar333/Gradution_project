

abstract class AuthStates{


}

class AuthIntialState extends AuthStates{}

class RegisterLoadingState  extends AuthStates{

  
}


class RegisterSuccessState  extends AuthStates{

  
} 

class RegisterErrorStata  extends AuthStates{
 String message;

 RegisterErrorStata({required this.message});             
  
} 

