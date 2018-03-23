package
{
	App.instance.loaderMgr.loadLibraries(Vector.<String>([
		"guiControlsLobbyBattle.swf"
	]));
	App.utils.classFactory.getComponent("DropdownMenuUI", DropdownMenu);
	import mx.utils.StringUtil;
	import net.wg.gui.components.controls.DropdownMenu;
    import net.wg.infrastructure.base.AbstractWindowView;
    import net.wg.gui.components.controls.SoundButton;
    import flash.text.*;
	import scaleform.clik.data.DataProvider;
	import scaleform.clik.events.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import scaleform.clik.events.ListEvent;

    public class Main extends AbstractWindowView
    {
        private var soundButtonLoad		: SoundButton;
        private var soundButtonCancel	: SoundButton;
		private var soundButtonCheck	: SoundButton;
        private var textFieldTest		: TextField;
		private var ddMenu				: DropdownMenu;
		private var imgMap				:TextField;
		public var mapName : String;
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
			var data : Array = new Array();
			data.push( { label:"#arenas:01_karelia/name" , data:"spaces/01_karelia" } );
			data.push( { label:"#arenas:02_malinovka/name" , data:"spaces/02_malinovka"} );
			data.push( { label:"#arenas:04_himmelsdorf/name" ,data:"spaces/04_himmelsdorf"} );
			data.push( { label:"#arenas:05_prohorovka/name" ,data:"spaces/05_prohorovka"} );
			data.push( { label:"#arenas:06_ensk/name" ,data:"spaces/06_ensk"} );
			data.push( { label:"#arenas:07_lakeville/name" ,data:"spaces/07_lakeville"} );
			data.push( { label:"#arenas:08_ruinberg/name" ,data:"spaces/08_ruinberg"} );
			data.push( { label:"#arenas:10_hills/name" ,data:"spaces/10_hills"} );
			data.push( { label:"#arenas:11_murovanka/name" ,data:"spaces/11_murovanka"} );
			data.push( { label:"#arenas:13_erlenberg/name" ,data:"spaces/13_erlenberg"} );
			data.push( { label:"#arenas:14_siegfried_line/name" ,data:"spaces/14_siegfried_line"} );
			data.push( { label:"#arenas:18_cliff/name" ,data:"spaces/18_cliff"} );
			data.push( { label:"#arenas:19_monastery/name" ,data:"spaces/19_monastery"} );
			data.push( { label:"#arenas:23_westfeld/name" ,data:"spaces/23_westfeld"} );
			data.push( { label:"#arenas:28_desert/name" ,data:"spaces/28_desert"} );
			data.push( { label:"#arenas:29_el_hallouf/name" ,data:"spaces/29_el_hallouf"} );
			data.push( { label:"#arenas:31_airfield/name" ,data:"spaces/31_airfield"} );
			data.push( { label:"#arenas:33_fjord/name" ,data:"spaces/33_fjord"} );
			data.push( { label:"#arenas:34_redshire/name" ,data:"spaces/34_redshire"} );
			data.push( { label:"#arenas:35_steppes/name" ,data:"spaces/25_steppes"} );
			data.push( { label:"#arenas:36_fishing_bay/name" ,data:"spaces/36_fishing_bay"} );
			data.push( { label:"#arenas:37_caucasus/name" ,data:"spaces/37_caucasus"} );
			data.push( { label:"#arenas:38_mannerheim_line/name" ,data:"spaces/38_mannerheim_line"} );
			data.push( { label:"#arenas:44_north_america/name" ,data:"spaces/44_north_america"} );
			data.push( { label:"#arenas:47_canada_a/name" ,data:"spaces/47_canada_a"} );
			data.push( { label:"#arenas:63_tundra/name" ,data:"spaces/63_tundra"} );
			data.push( { label:"#arenas:101_dday/name" ,data:"spaces/101_dday"} );
			data.push( { label:"#arenas:112_eiffel_tower_ctf/name" ,data:"spaces/112_eiffel_tower_ctf"} );
			data.push( { label:"#arenas:115_sweden/name" ,data:"spaces/115_sweden"} );
			data.push( { label:"#arenas:212_epic_random_valley/name" , data:"spaces/212_epic_random_valley" } );
			data.push( { label:"hangar_v3", data:"spaces/hangar_v3" } );
			var dataProv : DataProvider = new DataProvider(data);
			textFieldTest = new TextField();
            textFieldTest.width = 580;
            textFieldTest.height = 36;
            textFieldTest.x = 20;
            textFieldTest.y = 15;
            textFieldTest.multiline = true;
            textFieldTest.selectable = false;
            textFieldTest.defaultTextFormat = new TextFormat("$FieldFont", 20, 0xEA4517);
			textFieldTest.text = "If You Select Map Name and Push 'Load' Button, it will load Map.";
			addChild(textFieldTest);
			ddMenu = addChild(App.utils.classFactory.getComponent("DropdownMenuUI", DropdownMenu, {
				x: 20,
				y: 40,
				width: 200,
				itemRenderer: "DropDownListItemRendererSound",
				dropdown: "DropdownMenu_ScrollingList",
				menuRowCount: dataProv.length,
				//rowCount:rows,
				//scrollBar:scrBar,
				dataProvider: dataProv
				//selectedIndex:0
			})) as DropdownMenu;
			this.ddMenu.addEventListener(ListEvent.INDEX_CHANGE, this.onPresetsddMenuChange);
            soundButtonLoad = addChild(App.utils.classFactory.getComponent("ButtonRed", SoundButton, {
                width: 100,
                height: 25,
                x: 100,
                y: 320,
                label: "Load"
            })) as SoundButton;
			this.soundButtonLoad.addEventListener(MouseEvent.CLICK,this._LoadClick);
            soundButtonCancel = addChild(App.utils.classFactory.getComponent("ButtonNormal", SoundButton, {
                width: 100,
                height: 25,
                x: 250,
                y: 320,
                label: "Cancel"
            })) as SoundButton;
			this.soundButtonCancel.addEventListener(MouseEvent.CLICK, this._CancelClick);
        }
		public function _LoadClick():void
		{
			var _loc3_:* = this.ddMenu.dataProvider[this.ddMenu.selectedIndex];
			this.mapName = _loc3_.data;
			this.onOfflineStart();
		}
		public function _CancelClick():void 
		{
			this.onWindowClose();
		}
		public function onPresetsddMenuChange():void
		{
			this.imgMap = new TextField();
			this.imgMap.width = 300;
			this.imgMap.height = 300;
			this.imgMap.x = 360;
			this.imgMap.y = 40;
			var _loc4_:* = this.ddMenu.dataProvider[this.ddMenu.selectedIndex];
			this.mapName = _loc4_.data;
			this.mapName = mapName.replace("spaces/", "");
			this.imgMap.htmlText += "<img src='img://gui/maps/icons/map/" + mapName + ".png' width='300' height='300'>";
			this.addChild(this.imgMap);
		}
		public function as_setText():void
		{
			py_log(this.mapName);
		}
		public function as_getName():String 
		{
			return this.mapName;
		}
    }
}
