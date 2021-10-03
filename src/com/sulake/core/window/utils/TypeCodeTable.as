package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_690;
         param1["bitmap"] = const_632;
         param1["border"] = const_597;
         param1["border_notify"] = const_1221;
         param1["button"] = const_410;
         param1["button_thick"] = const_563;
         param1["button_icon"] = const_1146;
         param1["button_group_left"] = const_521;
         param1["button_group_center"] = const_504;
         param1["button_group_right"] = const_697;
         param1["canvas"] = const_644;
         param1["checkbox"] = const_545;
         param1["closebutton"] = const_877;
         param1["container"] = const_324;
         param1["container_button"] = const_702;
         param1["display_object_wrapper"] = const_663;
         param1["dropmenu"] = const_426;
         param1["dropmenu_item"] = const_439;
         param1["frame"] = const_310;
         param1["frame_notify"] = const_1207;
         param1["header"] = const_675;
         param1["icon"] = const_921;
         param1["itemgrid"] = const_1019;
         param1["itemgrid_horizontal"] = const_434;
         param1["itemgrid_vertical"] = const_575;
         param1["itemlist"] = const_848;
         param1["itemlist_horizontal"] = const_303;
         param1["itemlist_vertical"] = const_323;
         param1["maximizebox"] = const_1183;
         param1["menu"] = const_1371;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_822;
         param1["minimizebox"] = const_1192;
         param1["notify"] = const_1349;
         param1["HabboHelpCom_help_cfh_pick_topic_xml"] = const_574;
         param1["password"] = const_696;
         param1["radiobutton"] = const_503;
         param1["region"] = const_442;
         param1["restorebox"] = const_1336;
         param1["scaler"] = const_691;
         param1["scaler_horizontal"] = const_1347;
         param1["scaler_vertical"] = const_1176;
         param1["scrollbar_horizontal"] = const_462;
         param1["scrollbar_vertical"] = const_567;
         param1["scrollbar_slider_button_up"] = const_988;
         param1["scrollbar_slider_button_down"] = const_908;
         param1["scrollbar_slider_button_left"] = const_818;
         param1["scrollbar_slider_button_right"] = const_965;
         param1["scrollbar_slider_bar_horizontal"] = const_878;
         param1["scrollbar_slider_bar_vertical"] = const_971;
         param1["scrollbar_slider_track_horizontal"] = const_978;
         param1["scrollbar_slider_track_vertical"] = const_869;
         param1["scrollable_itemlist"] = const_1387;
         param1["scrollable_itemlist_vertical"] = const_408;
         param1["scrollable_itemlist_horizontal"] = const_925;
         param1["selector"] = const_550;
         param1["selector_list"] = const_625;
         param1["submenu"] = const_822;
         param1["tab_button"] = const_693;
         param1["tab_container_button"] = const_995;
         param1["tab_context"] = const_476;
         param1["tab_content"] = const_961;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_685;
         param1["input"] = const_578;
         param1["toolbar"] = const_1263;
         param1["tooltip"] = const_299;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
