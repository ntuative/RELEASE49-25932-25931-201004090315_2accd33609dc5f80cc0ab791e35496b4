package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
   public class AvatarEffect
   {
       
      
      private var var_1634:int;
      
      private var var_1214:int;
      
      private var _type:int;
      
      private var var_1635:int;
      
      public function AvatarEffect()
      {
         super();
      }
      
      public function get inactiveEffectsInInventory() : int
      {
         return var_1635;
      }
      
      public function set secondsLeftIfActive(param1:int) : void
      {
         var_1634 = param1;
      }
      
      public function get duration() : int
      {
         return var_1214;
      }
      
      public function set inactiveEffectsInInventory(param1:int) : void
      {
         var_1635 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1214 = param1;
      }
      
      public function get secondsLeftIfActive() : int
      {
         return var_1634;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
   }
}
