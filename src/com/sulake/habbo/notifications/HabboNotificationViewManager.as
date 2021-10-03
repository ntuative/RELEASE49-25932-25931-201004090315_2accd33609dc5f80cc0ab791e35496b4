package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class HabboNotificationViewManager implements IUpdateReceiver
   {
      
      private static const const_493:int = 4;
       
      
      private var _disposed:Boolean = false;
      
      private var var_429:Map;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_232:Array;
      
      private var var_2128:Map;
      
      private var var_195:IHabboToolbar;
      
      private var _windowManager:IHabboWindowManager;
      
      public function HabboNotificationViewManager(param1:IAssetLibrary, param2:IHabboWindowManager, param3:Map, param4:Map, param5:IHabboToolbar)
      {
         super();
         _assetLibrary = param1;
         _windowManager = param2;
         var_2128 = param3;
         var_429 = param4;
         var_195 = param5;
         var_232 = new Array();
      }
      
      private function getNextAvailableVerticalPosition() : int
      {
         var _loc3_:* = null;
         if(false)
         {
            return const_493;
         }
         var _loc1_:int = const_493;
         var _loc2_:int = 0;
         while(_loc2_ < var_232.length)
         {
            _loc3_ = var_232[_loc2_] as HabboNotificationItemView;
            if(_loc1_ + HabboNotificationItemView.const_517 < _loc3_.verticalPosition)
            {
               return _loc1_;
            }
            _loc1_ = _loc3_.verticalPosition + HabboNotificationItemView.const_517 + const_493;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < var_232.length)
         {
            (var_232[_loc2_] as HabboNotificationItemView).update(param1);
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_232.length)
         {
            _loc3_ = var_232[_loc2_] as HabboNotificationItemView;
            if(_loc3_.ready)
            {
               _loc3_.dispose();
               var_232.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_232)
         {
            _loc2_.replaceIcon(param1);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            (var_232.pop() as HabboNotificationItemView).dispose();
            _loc2_++;
         }
         _disposed = true;
      }
      
      public function showItem(param1:HabboNotificationItem) : void
      {
         if(!isSpaceAvailable())
         {
            return;
         }
         var _loc2_:HabboNotificationItemView = new HabboNotificationItemView(_assetLibrary.getAssetByName("layout_notification_xml"),_windowManager,var_2128,var_429,var_195);
         _loc2_.showItem(param1);
         _loc2_.reposition(getNextAvailableVerticalPosition());
         var_232.push(_loc2_);
         var_232.sortOn("verticalPosition",Array.NUMERIC);
      }
      
      public function isSpaceAvailable() : Boolean
      {
         return getNextAvailableVerticalPosition() + HabboNotificationItemView.const_517 < 540;
      }
   }
}
