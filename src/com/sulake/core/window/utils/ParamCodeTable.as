package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["HabboHelpCom_help_cfh_pick_topic_xml"] = const_118;
         param1["bound_to_parent_rect"] = const_89;
         param1["child_window"] = const_900;
         param1["embedded_controller"] = const_334;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_48;
         param1["internal_event_handling"] = const_684;
         param1["mouse_dragging_target"] = const_228;
         param1["mouse_dragging_trigger"] = const_335;
         param1["mouse_scaling_target"] = const_247;
         param1["mouse_scaling_trigger"] = const_419;
         param1["horizontal_mouse_scaling_trigger"] = const_191;
         param1["vertical_mouse_scaling_trigger"] = const_227;
         param1["observe_parent_input_events"] = const_876;
         param1["optimize_region_to_layout_size"] = const_479;
         param1["parent_window"] = const_960;
         param1["relative_horizontal_scale_center"] = const_154;
         param1["relative_horizontal_scale_fixed"] = const_123;
         param1["relative_horizontal_scale_move"] = const_332;
         param1["relative_horizontal_scale_strech"] = const_237;
         param1["relative_scale_center"] = const_987;
         param1["relative_scale_fixed"] = const_570;
         param1["relative_scale_move"] = const_952;
         param1["relative_scale_strech"] = const_934;
         param1["relative_vertical_scale_center"] = const_165;
         param1["relative_vertical_scale_fixed"] = const_116;
         param1["relative_vertical_scale_move"] = const_326;
         param1["relative_vertical_scale_strech"] = const_246;
         param1["on_resize_align_left"] = const_520;
         param1["on_resize_align_right"] = const_448;
         param1["on_resize_align_center"] = const_435;
         param1["on_resize_align_top"] = const_530;
         param1["on_resize_align_bottom"] = const_392;
         param1["on_resize_align_middle"] = const_436;
         param1["on_accommodate_align_left"] = const_953;
         param1["on_accommodate_align_right"] = const_466;
         param1["on_accommodate_align_center"] = const_736;
         param1["on_accommodate_align_top"] = const_930;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_692;
         param1["route_input_events_to_parent"] = const_467;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_874;
         param1["scalable_with_mouse"] = const_1004;
         param1["reflect_horizontal_resize_to_parent"] = const_455;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_263;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
