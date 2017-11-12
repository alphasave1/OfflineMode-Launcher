from debug_utils import LOG_CURRENT_EXCEPTION
import game
import GUI
import Keys
import BigWorld
from helpers import dependency
from gui.shared import personality as gui_personality
from skeletons.connection_mgr import IConnectionManager
from helpers import OfflineMode
from gui.Scaleform.framework import g_entitiesFactories, ViewSettings
from gui.Scaleform.framework import ViewTypes, ScopeTemplates
from gui.Scaleform.framework.entities.abstract.AbstractWindowView import AbstractWindowView
from gui.app_loader import g_appLoader
from gui.Scaleform.framework.managers.loaders import ViewLoadParams
from gui.modsListApi import g_modsListApi
OfflineMode.MOVE_SPEED_MAX = 2000.0
OfflineMode.MOVE_SPEED_POW = 200.0
OfflineMode.MOVE_SPEED_ADJUST = 100.0

def init():
    global enableHandleKeyEvent
    manager = dependency.instance(IConnectionManager)
    manager.onConnected += onConnected
    manager.onDisconnected += onDisconnected
    enableHandleKeyEvent = True
    g_modsListApi.addModification(id='OfflineMode', name='OfflineMode Launcher', description='View All Maps on OfflineMode.', enabled=True, callback=lambda : g_appLoader.getDefLobbyApp().loadView(ViewLoadParams(_alias, None)), login=True, lobby=False, icon='gui/flash/offline_icon.jpg')


class TestWindow(AbstractWindowView):

    def __init__(self):
        super(TestWindow, self).__init__()

    def _populate(self):
        super(TestWindow, self)._populate()

    def onOfflineStart(self):
        mapName = self.flashObject.as_getName()
        print mapName
        start(mapName)

    def onWindowClose(self):
        self.destroy()


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
    VERSION = '1.0'
    DESCRIPTION = 'Load Mod From ModsListApi ,OfflineMode will Start.\n Elif You Push END Key,OfflineMode will End.'
    SUPPORT_URL = 'http://twitter.com/chirimenspiral , http://www.twitter.com/alphasave1'


def start(mapName):
    print 'mod_OfflineMode: start'
    if not OfflineMode.enabled():
        for x in GUI.roots():
            GUI.delRoot(x)

    OfflineMode.launch(mapName)
    BigWorld.setWatcher('Visibility/GUI', True)


def shutdown():
    print 'mod_OfflineMode: shutdown'
    if OfflineMode.enabled():
        OfflineMode.onShutdown()
        BigWorld.quit()


def onConnected():
    global enableHandleKeyEvent
    enableHandleKeyEvent = False


def onDisconnected():
    global enableHandleKeyEvent
    enableHandleKeyEvent = True


def handleKeyEvent(event):
    ret = wg_handleKeyEvent(event)
    try:
        if enableHandleKeyEvent and event.isKeyDown() and not event.isRepeatedEvent():
            if event.key == Keys.KEY_END:
                shutdown()
            elif event.key == Keys.KEY_PGUP:
                adjustSpeed(+MOVE_SPEED_ADJUST)
            elif event.key == Keys.KEY_PGDN:
                adjustSpeed(-MOVE_SPEED_ADJUST)
    except:
        LOG_CURRENT_EXCEPTION()

    return ret


wg_handleKeyEvent = game.handleKeyEvent
game.handleKeyEvent = handleKeyEvent
enableHandleKeyEvent = False
