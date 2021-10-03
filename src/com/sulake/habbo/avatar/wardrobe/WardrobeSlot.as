package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class WardrobeSlot implements IOutfit
   {
       
      
      private var var_319:String;
      
      private var _view:IWindowContainer;
      
      private var var_289:IBitmapWrapperWindow;
      
      private var var_1415:int;
      
      private var var_560:String;
      
      private var var_1144:Boolean;
      
      private var var_46:HabboAvatarEditor;
      
      public function WardrobeSlot(param1:HabboAvatarEditor, param2:int, param3:Boolean, param4:String = null, param5:String = null)
      {
         super();
         var_46 = param1;
         var_1415 = param2;
         createView();
         update(param4,param5,param3);
      }
      
      private function createView() : void
      {
         var _loc1_:XmlAsset = var_46.assets.getAssetByName("wardrobe_slot") as XmlAsset;
         if(!_loc1_)
         {
            return;
         }
         _view = var_46.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         _view.procedure = eventHandler;
         _view.visible = false;
         var_289 = _view.findChildByName("image") as IBitmapWrapperWindow;
      }
      
      public function update(param1:String, param2:String, param3:Boolean) : void
      {
         switch(param2)
         {
            case FigureData.const_80:
            case "m":
            case "M":
               param2 = "null";
               break;
            case FigureData.const_84:
            case "f":
            case "F":
               param2 = "null";
         }
         var_319 = param1;
         var_560 = param2;
         var_1144 = param3;
         updateView();
      }
      
      public function updateView() : void
      {
         var _loc1_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Boolean = true;
         if(var_319 && var_1144)
         {
            _loc5_ = var_46.avatarRenderManager.createAvatarImage(figure,AvatarScaleType.SMALL,var_560);
            if(_loc5_)
            {
               _loc5_.setDirection(AvatarSetType.const_38,parseInt(FigureData.const_589));
               _loc1_ = _loc5_.getCroppedImage(AvatarSetType.const_38);
               _loc5_.dispose();
            }
         }
         else
         {
            _loc6_ = var_46.assets.getAssetByName("wardrobe_empty_slot") as BitmapDataAsset;
            if(_loc6_)
            {
               _loc1_ = _loc6_.content as BitmapData;
               _loc2_ = false;
            }
         }
         if(!_loc1_)
         {
            return;
         }
         if(var_289)
         {
            if(false)
            {
               var_289.bitmap.dispose();
            }
            var_289.bitmap = new BitmapData(var_289.width,var_289.height,true,0);
            _loc7_ = (0 - _loc1_.width) / 2;
            _loc8_ = (0 - _loc1_.height) / 2;
            var_289.bitmap.draw(_loc1_,new Matrix(1,0,0,1,_loc7_,_loc8_));
         }
         if(_loc2_)
         {
            _loc1_.dispose();
         }
         var _loc3_:IContainerButtonWindow = _view.findChildByName("set_button") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = var_1144;
         }
         var _loc4_:IContainerButtonWindow = _view.findChildByName("get_button") as IContainerButtonWindow;
         if(_loc4_)
         {
            _loc4_.visible = var_1144 && var_319 != null;
         }
      }
      
      public function get gender() : String
      {
         return var_560;
      }
      
      public function get id() : int
      {
         return var_1415;
      }
      
      public function dispose() : void
      {
         var_46 = null;
         var_319 = null;
         var_560 = null;
         var_289 = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
      }
      
      public function get figure() : String
      {
         return var_319;
      }
      
      public function get view() : IWindowContainer
      {
         return _view;
      }
      
      private function eventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "set_button":
               var_319 = var_46.figureData.getFigureString();
               var_560 = var_46.gender;
               var_46.handler.saveWardrobeOutfit(var_1415,this);
               updateView();
               break;
            case "get_button":
               if(var_319)
               {
                  var_46.loadAvatarInEditor(var_319,var_560,var_46.clubMemberLevel);
               }
         }
      }
   }
}
