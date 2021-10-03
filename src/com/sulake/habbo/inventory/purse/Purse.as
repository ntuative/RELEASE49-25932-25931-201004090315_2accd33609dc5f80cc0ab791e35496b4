package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1747:Boolean = false;
      
      private var var_1749:int = 0;
      
      private var var_1438:int = 0;
      
      private var var_1750:int = 0;
      
      private var var_1748:Boolean = false;
      
      private var var_1564:int = 0;
      
      private var var_1439:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1564 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1749;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1747;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1747 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1748;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1749 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1438 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1564;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1748 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1750 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1438;
      }
      
      public function get pixelBalance() : int
      {
         return var_1750;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1439 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1439;
      }
   }
}
