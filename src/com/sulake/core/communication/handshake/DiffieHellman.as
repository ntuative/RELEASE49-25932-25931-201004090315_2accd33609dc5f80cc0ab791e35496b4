package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1266:BigInteger;
      
      private var var_600:BigInteger;
      
      private var var_1524:BigInteger;
      
      private var var_1523:BigInteger;
      
      private var var_2067:BigInteger;
      
      private var var_1620:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1266 = param1;
         var_1524 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2067.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1523 = new BigInteger();
         var_1523.fromRadix(param1,param2);
         var_2067 = var_1523.modPow(var_600,var_1266);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1620.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1266.toString() + ",generator: " + var_1524.toString() + ",secret: " + param1);
         var_600 = new BigInteger();
         var_600.fromRadix(param1,param2);
         var_1620 = var_1524.modPow(var_600,var_1266);
         return true;
      }
   }
}
