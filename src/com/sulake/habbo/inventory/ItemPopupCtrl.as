package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1098:int = 100;
      
      private static const const_1099:int = 200;
      
      private static const const_1100:int = 180;
      
      public static const const_796:int = 1;
      
      public static const const_400:int = 2;
      
      private static const const_1097:int = 250;
      
      private static const const_772:int = 5;
       
      
      private var var_618:BitmapData;
      
      private var var_310:Timer;
      
      private var var_8:IWindowContainer;
      
      private var var_734:BitmapData;
      
      private var var_309:Timer;
      
      private var var_70:IWindowContainer;
      
      private var var_1545:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_309 = new Timer(const_1097,1);
         var_310 = new Timer(const_1098,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_70 = param1;
         var_70.visible = false;
         _assets = param2;
         var_309.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_310.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_734 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_618 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_70.visible = false;
         var_310.reset();
         var_309.reset();
         if(var_8 != null)
         {
            var_8.removeChild(var_70);
         }
      }
      
      public function hideDelayed() : void
      {
         var_310.reset();
         var_309.reset();
         var_310.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_309 != null)
         {
            var_309.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_309.stop();
            var_309 = null;
         }
         if(var_310 != null)
         {
            var_310.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_310.stop();
            var_310 = null;
         }
         _assets = null;
         var_70 = null;
         var_8 = null;
         var_618 = null;
         var_734 = null;
      }
      
      public function showDelayed() : void
      {
         var_310.reset();
         var_309.reset();
         var_309.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_70 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_8 != null)
         {
            var_8.removeChild(var_70);
         }
         var_8 = param1;
         var_1545 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_70.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_70.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1100,param3.width),Math.min(const_1099,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_70.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_70 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_70.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_796:
               _loc2_.bitmap = var_734.clone();
               _loc2_.width = var_734.width;
               _loc2_.height = var_734.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_400:
               _loc2_.bitmap = var_618.clone();
               _loc2_.width = var_618.width;
               _loc2_.height = var_618.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_310.reset();
         var_309.reset();
         if(var_8 == null)
         {
            return;
         }
         var_70.visible = true;
         var_8.addChild(var_70);
         refreshArrow(var_1545);
         switch(var_1545)
         {
            case const_796:
               var_70.x = 0 - const_772;
               break;
            case const_400:
               var_70.x = var_8.width + const_772;
         }
         var_70.y = (0 - 0) / 2;
      }
   }
}
