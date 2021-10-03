package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_498:String = "Rectangle";
      
      public static const const_56:String = "Boolean";
      
      public static const const_730:String = "Number";
      
      public static const const_62:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_657:String = "Point";
      
      public static const const_833:String = "Array";
      
      public static const const_815:String = "uint";
      
      public static const const_453:String = "hex";
      
      public static const const_991:String = "Map";
       
      
      private var var_564:String;
      
      private var var_164:Object;
      
      private var var_2296:Boolean;
      
      private var _type:String;
      
      private var var_1714:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_564 = param1;
         var_164 = param2;
         _type = param3;
         var_1714 = param4;
         var_2296 = param3 == const_991 || param3 == const_833 || param3 == const_657 || param3 == const_498;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_453:
               return "0x" + uint(var_164).toString(16);
            case const_56:
               return Boolean(var_164) == true ? "AvatarImagePartContainer" : "false";
            case const_657:
               return "Point(" + Point(var_164).x + ", " + Point(var_164).y + ")";
            case const_498:
               return "Rectangle(" + Rectangle(var_164).x + ", " + Rectangle(var_164).y + ", " + Rectangle(var_164).width + ", " + Rectangle(var_164).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_991:
               _loc3_ = var_164 as Map;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_833:
               _loc4_ = var_164 as Array;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_657:
               _loc5_ = var_164 as Point;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_498:
               _loc6_ = var_164 as Rectangle;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_62 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_453:
               _loc1_ = "<var key=\"" + var_564 + "\" value=\"" + "0x" + uint(var_164).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_564 + "\" value=\"" + var_164 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_164;
      }
      
      public function get valid() : Boolean
      {
         return var_1714;
      }
      
      public function get key() : String
      {
         return var_564;
      }
   }
}
