package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_393:int = 2;
      
      public static const const_330:int = 1;
      
      public static const const_221:int = 0;
      
      public static const const_770:int = 3;
      
      private static const const_763:int = 150;
      
      private static const const_762:int = 250;
      
      public static const const_76:int = 39;
       
      
      private var var_1476:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1474:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_1893:int = 0;
      
      private var var_34:IWindowContainer;
      
      private var var_93:IRegionWindow;
      
      private var var_1896:int = 30;
      
      private var var_30:int = -1;
      
      private var var_1891:BitmapData;
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1894:BitmapData;
      
      private var var_68:IBitmapWrapperWindow;
      
      private var var_1895:BitmapData;
      
      private var var_1892:BitmapData;
      
      private var var_1475:BitmapData;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param4;
         var_34 = param3;
         var_1892 = (_assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_1474 = (_assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_1895 = (_assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_1475 = (_assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_1476 = (_assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_1891 = (_assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_1894 = (_assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_68 = _windowManager.createWindow("chat_history_bg","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_39,HabboWindowParam.const_71,new Rectangle(0,0,param3.width,param3.height - const_76),null,0,0) as IBitmapWrapperWindow;
         var_34.addChild(var_68);
         _window = _windowManager.createWindow("chat_pulldown","",HabboWindowType.const_59,HabboWindowStyle.const_39,HabboWindowParam.const_41,new Rectangle(0,0 - const_76,param3.width,const_76),null,0) as IWindowContainer;
         var_34.addChild(_window);
         var_93 = _windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_442,HabboWindowStyle.const_40,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_76),null,0) as IRegionWindow;
         if(var_93 != null)
         {
            var_93.background = true;
            var_93.mouseTreshold = 0;
            var_93.addEventListener(WindowMouseEvent.const_52,onPulldownMouseDown);
            var_34.addChild(var_93);
            var_93.toolTipCaption = "${chat.history.drag.tooltip}";
            var_93.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc5_.content as XML);
         _window.addEventListener(WindowMouseEvent.const_52,onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.mouseTreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_91,onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_52,onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_30,onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.mouseTreshold = 0;
         this.state = const_221;
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1891.clone();
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1476.clone();
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state)
         {
            case const_393:
               var_68.blend += param1 / const_762;
               _window.blend += param1 / const_762;
               if(false)
               {
                  state = const_330;
               }
               break;
            case const_770:
               var_68.blend = 0 - param1 / const_763;
               _window.blend = 0 - param1 / const_763;
               if(true)
               {
                  state = const_221;
               }
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      public function get state() : int
      {
         return var_30;
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1476.clone();
         }
      }
      
      public function dispose() : void
      {
         if(var_93 != null)
         {
            var_93.dispose();
            var_93 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_68 != null)
         {
            var_68.dispose();
            var_68 = null;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownMouseDown(param1);
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == var_30)
         {
            return;
         }
         switch(param1)
         {
            case const_330:
               if(var_30 == const_221)
               {
                  this.state = const_393;
               }
               else
               {
                  if(_window == null || var_68 == null)
                  {
                     return;
                  }
                  _window.visible = true;
                  var_68.visible = true;
                  var_93.visible = true;
                  var_30 = param1;
               }
               break;
            case const_221:
               if(_window == null || var_68 == null)
               {
                  return;
               }
               _window.visible = false;
               var_68.visible = false;
               var_93.visible = false;
               var_30 = param1;
               break;
            case const_393:
               if(_window == null || var_68 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_68.blend = 0;
               _window.visible = true;
               var_68.visible = true;
               var_30 = param1;
               break;
            case const_770:
               if(_window == null || var_68 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_68.blend = 1;
               var_30 = param1;
               break;
         }
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = 0 - const_76;
            _window.width = var_34.width;
         }
         if(var_93 != null)
         {
            var_93.x = 0;
            var_93.y = 0 - const_76;
            var_93.width = 0 - var_1896;
         }
         if(var_68 != null)
         {
            var_68.rectangle = var_34.rectangle;
            var_68.height = 0 - const_76;
         }
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1475.clone();
         }
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_window == null)
         {
            return;
         }
         if(var_1893 == _window.width)
         {
            return;
         }
         var_1893 = _window.width;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = var_1895.clone();
            _loc2_.bitmap = var_1475.clone();
            var_1896 = 0 - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               tileBitmapHorz(var_1892.clone(),_loc7_);
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               tileBitmapHorz(var_1474.clone(),_loc8_);
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               tileBitmapHorz(var_1474.clone(),_loc9_);
               _loc4_.bitmap = _loc9_;
            }
         }
         if(var_68 == null)
         {
            return;
         }
         var_68.bitmap = var_1894.clone();
      }
   }
}
