package com.sulake.habbo.avatar.promo
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.ISideContentModel;
   
   public class ClubPromoModel implements ISideContentModel
   {
       
      
      private var _view:ClubPromoView;
      
      public const const_1664:String = "try_club";
      
      private var var_46:HabboAvatarEditor;
      
      public const const_1665:String = "buy_club";
      
      public function ClubPromoModel(param1:HabboAvatarEditor)
      {
         super();
         var_46 = param1;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         init();
         if(_view)
         {
            return _view.getWindowContainer();
         }
         return null;
      }
      
      public function dispose() : void
      {
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
      }
      
      public function reset() : void
      {
      }
      
      private function init() : void
      {
         if(!_view)
         {
            _view = new ClubPromoView(this);
         }
      }
      
      public function tryClubClothes() : void
      {
         _view.showBuyView();
         if(controller)
         {
            controller.useClubClothing();
         }
      }
      
      public function get controller() : HabboAvatarEditor
      {
         return var_46;
      }
   }
}
