package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_719:int = 6;
      
      public static const const_209:int = 5;
      
      public static const const_672:int = 2;
      
      public static const const_333:int = 9;
      
      public static const const_288:int = 4;
      
      public static const const_258:int = 2;
      
      public static const const_643:int = 4;
      
      public static const const_193:int = 8;
      
      public static const const_549:int = 7;
      
      public static const const_262:int = 3;
      
      public static const const_282:int = 1;
      
      public static const const_198:int = 5;
      
      public static const const_463:int = 12;
      
      public static const const_290:int = 1;
      
      public static const const_513:int = 11;
      
      public static const const_505:int = 3;
      
      public static const const_1559:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_448:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_448 = new Array();
         var_448.push(new Tab(_navigator,const_282,const_463,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_427));
         var_448.push(new Tab(_navigator,const_258,const_290,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_427));
         var_448.push(new Tab(_navigator,const_288,const_513,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_885));
         var_448.push(new Tab(_navigator,const_262,const_209,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_427));
         var_448.push(new Tab(_navigator,const_198,const_193,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_554));
         setSelectedTab(const_282);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_448)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_448)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_448)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_288;
      }
      
      public function get tabs() : Array
      {
         return var_448;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
