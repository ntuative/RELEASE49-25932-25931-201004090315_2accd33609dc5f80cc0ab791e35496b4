package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1650:Date;
      
      private var var_1135:Boolean = false;
      
      private var _type:int;
      
      private var var_377:BitmapData;
      
      private var var_278:Boolean = false;
      
      private var var_1214:int;
      
      private var var_553:int = 1;
      
      private var var_968:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_377;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_553;
         if(var_553 < 0)
         {
            var_553 = 0;
         }
         var_968 = var_1214;
         var_278 = false;
         var_1135 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_968 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_278;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_377 = param1;
      }
      
      public function get duration() : int
      {
         return var_1214;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1135;
      }
      
      public function get effectsInInventory() : int
      {
         return var_553;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_377;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_278)
         {
            var_1650 = new Date();
         }
         var_278 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_553 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_278)
         {
            _loc1_ = var_968 - (new Date().valueOf() - var_1650.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_968;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1135 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1214 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
