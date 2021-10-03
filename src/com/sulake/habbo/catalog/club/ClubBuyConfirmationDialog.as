package com.sulake.habbo.catalog.club
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.product.IProductData;
   
   public class ClubBuyConfirmationDialog
   {
       
      
      private var _view:IFrameWindow;
      
      private var var_393:ICatalogPage;
      
      private var var_46:ClubBuyController;
      
      private var var_76:ClubBuyOfferData;
      
      public function ClubBuyConfirmationDialog(param1:ClubBuyController, param2:ClubBuyOfferData, param3:ICatalogPage)
      {
         super();
         var_76 = param2;
         var_46 = param1;
         var_393 = param3;
         showConfirmation();
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(!param1 || !param2 || !var_46 || !var_76)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "select_button":
               var_46.confirmSelection(var_76,var_393);
               break;
            case "header_button_close":
            case "cancel_button":
               var_46.closeConfirmation();
         }
      }
      
      private function getProductName() : String
      {
         var _loc1_:* = null;
         if(var_76 && false && var_76.productContainer.firstProduct)
         {
            _loc1_ = var_76.productContainer.firstProduct.productData;
            if(_loc1_)
            {
               return _loc1_.name;
            }
         }
         return "";
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(!var_46 || true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = var_46.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_ || !_loc2_.content)
         {
            return null;
         }
         var _loc3_:XML = _loc2_.content as XML;
         if(!_loc3_)
         {
            return null;
         }
         return var_46.windowManager.buildFromXML(_loc3_);
      }
      
      public function showConfirmation() : void
      {
         var _loc3_:* = null;
         if(!var_76 || !var_46)
         {
            return;
         }
         _view = createWindow("club_buy_confirmation") as IFrameWindow;
         if(!_view)
         {
            return;
         }
         _view.procedure = windowEventHandler;
         _view.center();
         var _loc1_:ITextWindow = _view.findChildByName("item_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = getProductName();
         }
         if(false)
         {
            (_view.findChildByName("icon") as IIconWindow).style = 18;
         }
         else
         {
            (_view.findChildByName("icon") as IIconWindow).style = 17;
         }
         var _loc2_:ICoreLocalizationManager = var_46.localization;
         var _loc4_:* = "";
         var _loc5_:int = var_46.getClubType();
         var _loc6_:* = "catalog.club.buy.confirm.desc.";
         switch(_loc5_)
         {
            case HabboClubLevelEnum.const_49:
               _loc6_ += "none.";
               break;
            case HabboClubLevelEnum.const_58:
               _loc6_ += "hc.";
               break;
            case HabboClubLevelEnum.const_50:
               _loc6_ += "vip.";
         }
         _loc6_ += !true ? "vip" : "hc";
         _loc6_ += !true ? ".period" : "";
         _loc3_ = _loc2_.getLocalization(_loc6_);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.value;
            _loc4_ += "\n\n";
         }
         var _loc7_:IPurse = var_46.getPurse();
         var _loc8_:int = _loc7_.clubDays;
         var _loc9_:int = _loc7_.clubPeriods;
         var _loc10_:int = _loc9_ * 31 + _loc8_;
         var _loc11_:String = !true ? "vip" : "hc";
         var _loc12_:String = _loc2_.getLocalization("catalog.club." + _loc11_).value;
         var _loc13_:int = var_76.periods == 0 ? 1 : int(var_76.periods);
         _loc2_.registerParameter("catalog.club.buy.confirm.price","price",String(var_76.price));
         _loc2_.registerParameter("catalog.club.buy.confirm.product","days",String(_loc13_ * 31));
         _loc2_.registerParameter("catalog.club.buy.confirm.product","club",_loc12_);
         _loc2_.registerParameter("catalog.club.buy.confirm.amount","day",String(var_76.day));
         _loc2_.registerParameter("catalog.club.buy.confirm.amount","month",String(var_76.month));
         _loc2_.registerParameter("catalog.club.buy.confirm.amount","year",String(var_76.year));
         _loc2_.registerParameter("catalog.club.buy.confirm.before","days",String(_loc10_));
         _loc2_.registerParameter("catalog.club.buy.confirm.after","days",String(var_76.daysLeftAfterPurchase));
         if(false)
         {
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.price").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.before").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.after").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.amount").value + "\n";
            _view.height = 240;
            _view.findChildByName("description").height = 150;
         }
         else
         {
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.price").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.product").value + "\n";
            _loc4_ += _loc2_.getLocalization("catalog.club.buy.confirm.amount").value + "\n";
         }
         _view.findChildByName("description").caption = _loc4_;
      }
      
      public function dispose() : void
      {
         var_46 = null;
         var_76 = null;
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
      }
   }
}
