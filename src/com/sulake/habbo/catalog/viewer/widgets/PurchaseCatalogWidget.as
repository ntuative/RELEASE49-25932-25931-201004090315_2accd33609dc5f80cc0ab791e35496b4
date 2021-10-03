package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2203:XML;
      
      private var var_1579:ITextWindow;
      
      private var var_1577:ITextWindow;
      
      private var var_2202:XML;
      
      private var var_922:IWindowContainer;
      
      private var var_2339:ITextWindow;
      
      private var var_2200:String = "";
      
      private var var_2392:IButtonWindow;
      
      private var var_2199:XML;
      
      private var var_1578:ITextWindow;
      
      private var var_2201:XML;
      
      private var var_921:IButtonWindow;
      
      private var var_76:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_284:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2202) as IWindowContainer;
               break;
            case Offer.const_360:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2201) as IWindowContainer;
               break;
            case Offer.const_421:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2203) as IWindowContainer;
               break;
            case Offer.const_510:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_2199) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_922 != null)
            {
               _window.removeChild(var_922);
               var_922.dispose();
            }
            var_922 = _loc2_;
            _window.addChild(_loc2_);
            var_922.x = 0;
            var_922.y = 0;
         }
         var_1578 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1577 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1579 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2339 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_921 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_921 != null)
         {
            var_921.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_921.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_76 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_76,page,var_2200);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_2202 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_2201 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_2203 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_2199 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_799,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_2200 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_76 = param1.offer;
         attachStub(var_76.priceType);
         if(var_1578 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_76.priceInCredits));
            var_1578.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1577 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_76.priceInPixels));
            var_1577.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1579 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_76.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_76.priceInPixels));
            var_1579.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_921 != null)
         {
            var_921.enable();
         }
      }
   }
}
