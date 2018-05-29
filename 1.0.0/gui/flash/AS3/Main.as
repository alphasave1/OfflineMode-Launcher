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
	import scaleform.clik.data.ListData;
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
		public function as_senddata(param1:Array):void 
		{
			var data : Array = new Array();
			var maps:*;
			for each (maps in param1) {
			data.push( { label:"#arenas:" + maps + "/name" , data:"spaces/" + maps + "" } );
			}
			var dataProv : DataProvider = new DataProvider(data);
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
			ddMenu.scrollBar = "ScrollBar";
			this.ddMenu.addEventListener(ListEvent.INDEX_CHANGE, this.onPresetsddMenuChange);
		}
    }
}