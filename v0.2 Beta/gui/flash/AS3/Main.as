package
{
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import net.wg.gui.components.controls.DropdownMenu;
   import net.wg.gui.components.controls.SoundButton;
   import net.wg.infrastructure.base.AbstractWindowView;
   import scaleform.clik.data.DataProvider;
   import scaleform.clik.events.ListEvent;
   
   public class Main extends AbstractWindowView
   {
       
      
      private var soundButtonLoad:SoundButton;
      
      private var soundButtonCancel:SoundButton;
      
      private var soundButtonCheck:SoundButton;
      
      private var textFieldTest:TextField;
      
      private var ddMenu:DropdownMenu;
      
      private var imgMap:TextField;
      
      public var mapName:String;
      
      public var py_log:Function;
      
      public var onOfflineStart:Function;
      
      public function Main()
      {
         super();
      }
      
      override protected function onPopulate() : void
      {
         super.onPopulate();
         width = 720;
         height = 360;
         window.title = "OfflineMode Launcher";
         var data:Array = new Array();
         data.push({
            "label":"#arenas:00_tank_tutorial/name",
            "data":"spaces/00_tank_tutorial"
         });
         data.push({
            "label":"#arenas:01_karelia/name",
            "data":"spaces/01_karelia"
         });
         data.push({
            "label":"#arenas:02_malinovka/name",
            "data":"spaces/02_malinovka"
         });
         data.push({
            "label":"#arenas:04_himmelsdorf/name",
            "data":"spaces/04_himmelsdorf"
         });
         data.push({
            "label":"#arenas:05_prohorovka/name",
            "data":"spaces/05_prohorovka"
         });
         data.push({
            "label":"#arenas:06_ensk/name",
            "data":"spaces/06_ensk"
         });
         data.push({
            "label":"#arenas:07_lakeville/name",
            "data":"spaces/07_lakeville"
         });
         data.push({
            "label":"#arenas:08_ruinberg/name",
            "data":"spaces/08_ruinberg"
         });
         data.push({
            "label":"#arenas:10_hills/name",
            "data":"spaces/10_hills"
         });
         data.push({
            "label":"#arenas:11_murovanka/name",
            "data":"spaces/11_murovanka"
         });
         data.push({
            "label":"#arenas:13_erlenberg/name",
            "data":"spaces/13_erlenberg"
         });
         data.push({
            "label":"#arenas:14_siegfried_line/name",
            "data":"spaces/14_siegfried_line"
         });
         data.push({
            "label":"#arenas:17_munchen/name",
            "data":"spaces/17_munchen"
         });
         data.push({
            "label":"#arenas:18_cliff/name",
            "data":"spaces/18_cliff"
         });
         data.push({
            "label":"#arenas:19_monastery/name",
            "data":"spaces/19_monastery"
         });
         data.push({
            "label":"#arenas:22_slough/name",
            "data":"spaces/22_slough"
         });
         data.push({
            "label":"#arenas:23_westfeld/name",
            "data":"spaces/23_westfeld"
         });
         data.push({
            "label":"#arenas:28_desert/name",
            "data":"spaces/28_desert"
         });
         data.push({
            "label":"#arenas:29_el_hallouf/name",
            "data":"spaces/29_el_hallouf"
         });
         data.push({
            "label":"#arenas:31_airfield/name",
            "data":"spaces/31_airfield"
         });
         data.push({
            "label":"#arenas:33_fjord/name",
            "data":"spaces/33_fjord"
         });
         data.push({
            "label":"#arenas:34_redshire/name",
            "data":"spaces/34_redshire"
         });
         data.push({
            "label":"#arenas:35_steppes/name",
            "data":"spaces/25_steppes"
         });
         data.push({
            "label":"#arenas:36_fishing_bay/name",
            "data":"spaces/36_fishing_bay"
         });
         data.push({
            "label":"#arenas:37_caucasus/name",
            "data":"spaces/37_caucasus"
         });
         data.push({
            "label":"#arenas:38_mannerheim_line/name",
            "data":"spaces/38_mannerheim_line"
         });
         data.push({
            "label":"#arenas:44_north_america/name",
            "data":"spaces/44_north_america"
         });
         data.push({
            "label":"#arenas:45_north_america/name",
            "data":"spaces/45_north_america"
         });
         data.push({
            "label":"#arenas:47_canada_a/name",
            "data":"spaces/47_canada_a"
         });
         data.push({
            "label":"#arenas:63_tundra/name",
            "data":"spaces/63_tundra"
         });
         data.push({
            "label":"#arenas:73_asia_korea/name",
            "data":"spaces/73_asia_korea"
         });
         data.push({
            "label":"#arenas:83_kharkiv/name",
            "data":"spaces/83_kharkiv"
         });
         data.push({
            "label":"#arenas:84_winter/name",
            "data":"spaces/84_winter"
         });
         data.push({
            "label":"#arenas:86_himmelsdorf_winter/name",
            "data":"spaces/86_himmelsdorf_winter"
         });
         data.push({
            "label":"#arenas:92_stalingrad/name",
            "data":"spaces/92_stalingrad"
         });
         data.push({
            "label":"#arenas:95_lost_city/name",
            "data":"spaces/95_lost_city"
         });
         data.push({
            "label":"#arenas:96_prohorovka_defense/name",
            "data":"spaces/96_prohorovka_defense"
         });
         data.push({
            "label":"#arenas:100_thepit/name",
            "data":"spaces/100_thepit"
         });
         data.push({
            "label":"#arenas:101_dday/name",
            "data":"spaces/101_dday"
         });
         data.push({
            "label":"#arenas:103_ruinberg_winter/name",
            "data":"spaces/103_ruinberg_winter"
         });
         data.push({
            "label":"#arenas:112_eiffel_tower_ctf/name",
            "data":"spaces/112_eiffel_tower_ctf"
         });
         data.push({
            "label":"#arenas:114_czech/name",
            "data":"spaces/114_czech"
         });
         data.push({
            "label":"#arenas:120_kharkiv_halloween/name",
            "data":"spaces/120_kharkiv_halloween"
         });
         data.push({
            "label":"#arenas:212_epic_random_valley/name",
            "data":"spaces/212_epic_random_valley"
         });
         data.push({
            "label":"h03_shopfest_2015",
            "data":"spaces/h03_shopfest_2015"
         });
         data.push({
            "label":"hangar_bootcamp",
            "data":"spaces/hangar_bootcamp"
         });
         data.push({
            "label":"hangar_halloween_v2",
            "data":"spaces/hangar_halloween_v2"
         });
         data.push({
            "label":"hangar_kharkiv_halloween",
            "data":"spaces/hangar_kharkiv_halloween"
         });
         data.push({
            "label":"hangar_premium_v2",
            "data":"spaces/hangar_premium_v2"
         });
         data.push({
            "label":"hangar_v2",
            "data":"spaces/hangar_v2"
         });
         var dataProv:DataProvider = new DataProvider(data);
         this.textFieldTest = new TextField();
         this.textFieldTest.width = 580;
         this.textFieldTest.height = 36;
         this.textFieldTest.x = 20;
         this.textFieldTest.y = 15;
         this.textFieldTest.multiline = true;
         this.textFieldTest.selectable = false;
         this.textFieldTest.defaultTextFormat = new TextFormat("$FieldFont",20,15353111);
         this.textFieldTest.text = "If You Select Map Name and Push \'Load\' Button, it will load Map.";
         addChild(this.textFieldTest);
         this.ddMenu = addChild(App.utils.classFactory.getComponent("DropdownMenuUI",DropdownMenu,{
            "x":20,
            "y":40,
            "width":200,
            "itemRenderer":"DropDownListItemRendererSound",
            "dropdown":"DropdownMenu_ScrollingList",
            "menuRowCount":dataProv.length,
            "dataProvider":dataProv
         })) as DropdownMenu;
         this.ddMenu.addEventListener(ListEvent.INDEX_CHANGE,this.onPresetsddMenuChange);
         this.soundButtonLoad = addChild(App.utils.classFactory.getComponent("ButtonRed",SoundButton,{
            "width":100,
            "height":25,
            "x":100,
            "y":320,
            "label":"Load"
         })) as SoundButton;
         this.soundButtonLoad.addEventListener(MouseEvent.CLICK,this._LoadClick);
         this.soundButtonCancel = addChild(App.utils.classFactory.getComponent("ButtonNormal",SoundButton,{
            "width":100,
            "height":25,
            "x":250,
            "y":320,
            "label":"Cancel"
         })) as SoundButton;
         this.soundButtonCancel.addEventListener(MouseEvent.CLICK,this._CancelClick);
      }
      
      public function _LoadClick() : void
      {
         var _loc3_:* = this.ddMenu.dataProvider[this.ddMenu.selectedIndex];
         this.mapName = _loc3_.data;
         this.onOfflineStart();
      }
      
      public function _CancelClick() : void
      {
         this.onWindowClose();
      }
      
      public function onPresetsddMenuChange() : void
      {
         this.imgMap = new TextField();
         this.imgMap.width = 300;
         this.imgMap.height = 300;
         this.imgMap.x = 360;
         this.imgMap.y = 40;
         var _loc4_:* = this.ddMenu.dataProvider[this.ddMenu.selectedIndex];
         this.mapName = _loc4_.data;
         this.mapName = this.mapName.replace("spaces/","");
         this.imgMap.htmlText = this.imgMap.htmlText + ("<img src=\'img://gui/maps/icons/map/" + this.mapName + ".png\' width=\'300\' height=\'300\'>");
         this.addChild(this.imgMap);
      }
      
      public function as_setText() : void
      {
         this.py_log(this.mapName);
      }
      
      public function as_getName() : String
      {
         return this.mapName;
      }
   }
}
