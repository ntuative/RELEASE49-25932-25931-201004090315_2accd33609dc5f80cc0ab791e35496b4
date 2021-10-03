package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SpacesCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_180:String = "landscape";
      
      private static const const_181:String = "floor";
      
      private static const const_182:String = "wallpaper";
       
      
      private var var_1213:String = "default";
      
      private var var_1156:Array;
      
      private var var_251:BitmapData = null;
      
      private var var_215:int = 0;
      
      private var var_662:int = 0;
      
      private var var_1211:String = "1.1";
      
      private var var_1158:int = -1;
      
      private var var_1155:int = -1;
      
      private var var_791:Array;
      
      private var var_661:int = 0;
      
      private var var_252:BitmapData = null;
      
      private var var_291:int = 0;
      
      private var var_660:int = 0;
      
      private var var_290:int = 0;
      
      private var var_249:int = 0;
      
      private var var_790:Array;
      
      private var _floorType:String = "default";
      
      private var _activeFloorPatterns:Array;
      
      private var var_1159:Array;
      
      private var var_250:int = 0;
      
      private var var_154:XML;
      
      private var var_1157:Array;
      
      private var var_292:int = 0;
      
      public function SpacesCatalogWidget(param1:IWindowContainer)
      {
         var_1157 = [];
         var_790 = [];
         var_1156 = [];
         _activeFloorPatterns = [];
         var_1159 = [];
         var_791 = [];
         super(param1);
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 != null && param2 != null && true)
         {
            _loc3_ = new Point(param1.width / 2 + 4 + 19,param1.height / 2 - param2.height / 2 - 24 + 10);
            _loc4_ = new BitmapData(param1.width,param1.height,param1.transparent);
            _loc4_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
            _loc4_.copyPixels(param2,param2.rect,_loc3_,null,null,true);
            _loc5_ = window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               if(_loc5_.bitmap == null)
               {
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
               }
               _loc5_.bitmap.fillRect(_loc5_.bitmap.rect,16777215);
               _loc6_ = (_loc5_.width - _loc4_.width) / 2;
               _loc7_ = (_loc5_.height - _loc4_.height) / 2;
               _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point(_loc6_,_loc7_),null,null,true);
               _loc5_.invalidate();
            }
            _loc4_.dispose();
         }
      }
      
      private function changeColor(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case const_182:
               var_215 += param2;
               if(var_215 < 0)
               {
                  if(var_660 > 0)
                  {
                     var_215 = var_660 - 1;
                  }
                  else
                  {
                     var_215 = 0;
                  }
               }
               if(var_215 >= var_660)
               {
                  var_215 = 0;
               }
               break;
            case const_181:
               var_249 += param2;
               if(var_249 < 0)
               {
                  if(var_661 > 0)
                  {
                     var_249 = var_661 - 1;
                  }
                  else
                  {
                     var_249 = 0;
                  }
               }
               if(var_249 >= var_661)
               {
                  var_249 = 0;
               }
               break;
            case const_180:
               var_250 += param2;
               if(var_250 < 0)
               {
                  if(var_662 > 0)
                  {
                     var_250 = var_662 - 1;
                  }
                  else
                  {
                     var_250 = 0;
                  }
               }
               if(var_250 >= var_662)
               {
                  var_250 = 0;
               }
         }
      }
      
      override public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.init();
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(_loc1_ != null)
         {
            var_154 = _loc1_.content as XML;
            for each(_loc2_ in page.offers)
            {
               _loc4_ = _loc2_.productContainer.firstProduct;
               _loc5_ = _loc2_.localizationId;
               _loc6_ = _loc5_.split(" ")[0];
               _loc7_ = _loc5_.split(" ")[1];
               _loc8_ = false;
               switch(_loc4_.furnitureData.name)
               {
                  case "floor":
                     for each(_loc9_ in var_154.floors.pattern)
                     {
                        _activeFloorPatterns.push(String(_loc9_.@id));
                        var_1156.push(_loc2_);
                     }
                     break;
                  case "wallpaper":
                     for each(_loc10_ in var_154.walls.pattern)
                     {
                        if(_loc10_.@id == _loc7_)
                        {
                           var_790.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        var_1157.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find wallpaper pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  case "landscape":
                     for each(_loc11_ in var_154.landscapes.pattern)
                     {
                        if(_loc11_.@id == _loc7_)
                        {
                           var_791.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        var_1159.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find landscape pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + _loc4_.furnitureData.name);
                     break;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _window.numChildren)
            {
               _loc12_ = _window.getChildAt(_loc3_);
               if(_loc12_ is IButtonWindow)
               {
                  _loc12_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClick);
               }
               _loc3_++;
            }
            changePattern(const_182,0);
            changePattern(const_180,0);
            changePattern(const_181,0);
            updateConfiguration();
            retrieveSpacesPreview();
            return;
         }
      }
      
      override public function dispose() : void
      {
         if(var_251 != null)
         {
            var_251.dispose();
            var_251 = null;
         }
         if(var_252 != null)
         {
            var_252.dispose();
            var_252 = null;
         }
         super.dispose();
      }
      
      public function method_1(param1:int, param2:BitmapData) : void
      {
         switch(param1)
         {
            case var_1155:
               var_1155 = 0;
               if(var_251 != null)
               {
                  var_251.dispose();
               }
               var_251 = param2;
               break;
            case var_1158:
               var_1158 = 0;
               if(var_252 != null)
               {
                  var_252.dispose();
               }
               var_252 = param2;
         }
         if(var_251 != null && var_252 != null)
         {
            setRoomImage(var_251,var_252);
         }
      }
      
      private function updateConfiguration() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc2_:String = "null";
         for each(_loc1_ in var_154.walls.pattern)
         {
            if(_loc1_.@id == _loc2_)
            {
               if(var_215 >= 0)
               {
                  _loc9_ = _loc1_.children()[var_215];
                  if(_loc9_ != null)
                  {
                     var_1213 = _loc9_.@id;
                  }
               }
            }
         }
         _loc3_ = var_1157[var_291];
         _loc4_ = (page.viewer.catalog as HabboCatalog).localization;
         if(_loc3_ != null)
         {
            _loc10_ = _window.findChildByName("ctlg_wall_price") as ITextWindow;
            if(_loc10_ != null)
            {
               _loc10_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc3_.priceInCredits));
            }
         }
         var _loc5_:String = "null";
         for each(_loc1_ in var_154.floors.pattern)
         {
            if(_loc1_.@id == _loc5_)
            {
               _loc11_ = _loc1_.children()[var_249];
               if(_loc11_ != null)
               {
                  _floorType = _loc11_.@id;
               }
            }
         }
         _loc6_ = var_1156[var_290];
         if(_loc6_ != null)
         {
            _loc12_ = _window.findChildByName("ctlg_floor_price") as ITextWindow;
            if(_loc12_ != null)
            {
               _loc12_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc6_.priceInCredits));
            }
         }
         var _loc7_:String = "null";
         for each(_loc1_ in var_154.landscapes.pattern)
         {
            if(_loc1_.@id == _loc7_)
            {
               _loc13_ = _loc1_.children()[var_250];
               if(_loc13_ != null)
               {
                  var_1211 = _loc13_.@id;
               }
            }
         }
         _loc8_ = var_1159[var_292];
         if(_loc8_ != null)
         {
            _loc14_ = _window.findChildByName("ctlg_landscape_price") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc8_.priceInCredits));
            }
         }
      }
      
      private function changePattern(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1)
         {
            case const_182:
               var_291 += param2;
               if(var_291 < 0)
               {
                  var_291 = -1;
               }
               if(var_291 == var_790.length)
               {
                  var_291 = 0;
               }
               var_215 = 0;
               var_660 = 0;
               _loc5_ = "null";
               for each(_loc8_ in var_154.walls.pattern)
               {
                  if(_loc8_.@id == _loc5_)
                  {
                     var_660 = _loc8_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_wall_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_wall_color_next") as IButtonWindow;
               if(var_660 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_181:
               var_290 += param2;
               if(var_290 < 0)
               {
                  var_290 = -1;
               }
               if(var_290 >= _activeFloorPatterns.length)
               {
                  var_290 = 0;
               }
               var_249 = 0;
               var_661 = 0;
               _loc6_ = "null";
               for each(_loc9_ in var_154.floors.pattern)
               {
                  if(_loc9_.@id == _loc6_)
                  {
                     var_661 = _loc9_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_floor_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_floor_color_next") as IButtonWindow;
               if(var_661 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_180:
               var_292 += param2;
               if(var_292 < 0)
               {
                  var_292 = -1;
               }
               if(var_292 >= var_791.length)
               {
                  var_292 = 0;
               }
               var_250 = 0;
               var_662 = 0;
               _loc7_ = "null";
               for each(_loc10_ in var_154.landscapes.pattern)
               {
                  if(_loc10_.@id == _loc7_)
                  {
                     var_662 = _loc10_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_landscape_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_landscape_color_next") as IButtonWindow;
               if(var_662 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         switch(_loc2_.name)
         {
            case "ctlg_wall_pattern_prev":
               changePattern(const_182,-1);
               break;
            case "ctlg_wall_pattern_next":
               changePattern(const_182,1);
               break;
            case "ctlg_wall_color_prev":
               changeColor(const_182,-1);
               break;
            case "ctlg_wall_color_next":
               changeColor(const_182,1);
               break;
            case "ctlg_buy_wall":
               _loc3_ = var_1157[var_291];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,var_1213);
               }
               break;
            case "ctlg_floor_pattern_prev":
               changePattern(const_181,-1);
               break;
            case "ctlg_floor_pattern_next":
               changePattern(const_181,1);
               break;
            case "ctlg_floor_color_prev":
               changeColor(const_181,-1);
               break;
            case "ctlg_floor_color_next":
               changeColor(const_181,1);
               break;
            case "ctlg_buy_floor":
               _loc3_ = var_1156[var_290];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,_floorType);
               }
               break;
            case "ctlg_landscape_pattern_next":
               changePattern(const_180,-1);
               break;
            case "ctlg_landscape_pattern_prev":
               changePattern(const_180,1);
               break;
            case "ctlg_landscape_color_prev":
               changeColor(const_180,-1);
               break;
            case "ctlg_landscape_color_next":
               changeColor(const_180,1);
               break;
            case "ctlg_buy_landscape":
               _loc3_ = var_1159[var_292];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,var_1211);
               }
               break;
            default:
               Logger.log("Spaces, unknown button: " + _loc2_.name);
         }
         updateConfiguration();
         retrieveSpacesPreview();
      }
      
      private function retrieveSpacesPreview() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:ImageResult = page.viewer.roomEngine.getRoomImage(_floorType,var_1213,var_1211,64,this,"window_romantic_wide");
         var _loc3_:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage("window_romantic_wide","",new Vector3d(180,0,0),64,this,"window_romantic_wide");
         if(_loc2_ != null && _loc3_ != null)
         {
            var_1155 = _loc2_.id;
            var_1158 = _loc3_.id;
            _loc4_ = _loc2_.data as BitmapData;
            _loc5_ = _loc3_.data as BitmapData;
            if(var_251 != null)
            {
               var_251.dispose();
            }
            if(var_252 != null)
            {
               var_252.dispose();
            }
            var_251 = _loc4_;
            var_252 = _loc5_;
            setRoomImage(_loc4_,_loc5_);
         }
      }
   }
}
