package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1660:int;
      
      private var var_2056:int;
      
      private var var_2055:int;
      
      private var var_2059:int;
      
      private var _nutrition:int;
      
      private var var_1182:int;
      
      private var var_2060:int;
      
      private var var_2058:int;
      
      private var _energy:int;
      
      private var var_2057:int;
      
      private var var_2061:int;
      
      private var _ownerName:String;
      
      private var var_2054:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1660;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_2056 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1660 = param1;
      }
      
      public function get petId() : int
      {
         return var_1182;
      }
      
      public function get experienceMax() : int
      {
         return var_2058;
      }
      
      public function get nutritionMax() : int
      {
         return var_2059;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_2060 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_2054;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1182 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_2061;
      }
      
      public function get respect() : int
      {
         return var_2056;
      }
      
      public function get levelMax() : int
      {
         return var_2060;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_2058 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_2055 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_2059 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_2054 = param1;
      }
      
      public function get experience() : int
      {
         return var_2055;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_2061 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_2057 = param1;
      }
      
      public function get age() : int
      {
         return var_2057;
      }
   }
}
