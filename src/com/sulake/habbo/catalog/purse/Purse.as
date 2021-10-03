package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1438:int = 0;
      
      private var var_1774:int = 0;
      
      private var var_1748:Boolean = false;
      
      private var var_1773:int = 0;
      
      private var var_1439:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubPeriods() : int
      {
         return var_1439;
      }
      
      public function get clubDays() : int
      {
         return var_1438;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1774 = param1;
      }
      
      public function get pixels() : int
      {
         return var_1774;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1438 > 0 || var_1439 > 0;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1438 = param1;
      }
      
      public function get credits() : int
      {
         return var_1773;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1748;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1748 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1773 = param1;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1439 = param1;
      }
   }
}
