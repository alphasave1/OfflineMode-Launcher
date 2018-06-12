import GUI
import Keys
import BigWorld
import WWISE
import ResMgr
from helpers import OfflineMode
from gui.Scaleform.framework import g_entitiesFactories, ViewSettings
from gui.Scaleform.framework import ViewTypes, ScopeTemplates
from gui.Scaleform.framework.entities.abstract.AbstractWindowView import AbstractWindowView
from gui.app_loader import g_appLoader
from gui.Scaleform.framework.managers.loaders import SFViewLoadParams
from gui.modsListApi import g_modsListApi

def init():
    g_modsListApi.addModification(id='OfflineMode', name='OfflineMode Launcher', description='View All Maps on OfflineMode.', enabled=True, callback=lambda : g_appLoader.getDefLobbyApp().loadView(SFViewLoadParams(_alias, None)), login=True, lobby=False, icon='gui/flash/offline_icon.jpg')


class TestWindow(AbstractWindowView):

    def __init__(self):
        super(TestWindow, self).__init__()

    def _populate(self):
        super(TestWindow, self)._populate()
        self.as_setdata()

    def onOfflineStart(self):
        mapName = self.flashObject.as_getName()
        print mapName
        start(mapName)

    def onWindowClose(self):
        self.destroy()

    def as_setdata(self):
        spDir = ResMgr.openSection('spaces')
        mapsData = spDir.keys()
        mapsData.sort()
        return self.flashObject.as_senddata(mapsData)


_alias = 'Main'
_url = 'OfflineModeLaunch.swf'
_type = ViewTypes.WINDOW
_event = None
_scope = ScopeTemplates.VIEW_SCOPE
_settings = ViewSettings(_alias, TestWindow, _url, _type, _event, _scope)
g_entitiesFactories.addSettings(_settings)

class MOD:
    AUTHOR = 'Chirimen , alphasave1'
    NAME = 'OfflineMode'
    VERSION = '1.0.1.1'
    DESCRIPTION = 'Load Mod From ModsListApi ,OfflineMode will Start.\n Elif You Push END Key,OfflineMode will End.'
    SUPPORT_URL = 'http://www.twitter.com/alphasave1'


def start(mapName):
    print 'mod_OfflineMode: start'
    if not OfflineMode.enabled():
        for x in GUI.roots():
            GUI.delRoot(x)

    WWISE.WW_eventGlobal('loginscreen_mute')
    OfflineMode.launch(mapName)
    BigWorld.setWatcher('Visibility/GUI', True)
