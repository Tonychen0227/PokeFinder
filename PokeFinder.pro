lessThan(QT_MAJOR_VERSION, 5):error("You need at least Qt 5.12 to build PokeFinder")
equals(QT_MAJOR_VERSION, 5):lessThan(QT_MINOR_VERSION, 12):error("You need at least Qt 5.12 to build PokeFinder")

QT += concurrent network widgets
CONFIG += c++1z lrelease embed_translations
gcc:QMAKE_CXXFLAGS += -msse4.1
QMAKE_LRELEASE_FLAGS = -nounfinished -removeidentical

TARGET = PokeFinder
TEMPLATE = app
VERSION = 2.5.4
#GIT_VERSION = $$system(git rev-parse HEAD)
#GIT_BRANCH = $$system(git rev-parse --abbrev-ref HEAD)
QMAKE_TARGET_DESCRIPTION = PokeFinder
QMAKE_TARGET_COPYRIGHT = Admiral_Fish

RC_ICONS += Images/pokefinder.ico
ICON += Images/pokefinder.icns

DEFINES += VERSION=\\\"$$VERSION\\\"
#DEFINES += GIT_VERSION=\\\"$$GIT_VERSION\\\"
#DEFINES += GIT_BRANCH=\\\"$$GIT_BRANCH\\\"
DEFINES += QT_DEPRECATED_WARNINGS

TRANSLATIONS += \
    i18n/PokeFinder_en.ts \
    i18n/PokeFinder_fr.ts \
    i18n/PokeFinder_es.ts \
    i18n/PokeFinder_de.ts \
    i18n/PokeFinder_it.ts \
    i18n/PokeFinder_ja.ts \
    i18n/PokeFinder_ko.ts \
    i18n/PokeFinder_zh.ts

RESOURCES += \
    QDarkStyleSheet/qdarkstyle/style.qrc \
    resources.qrc

FORMS += \
    Forms/Controls/EggSettings.ui \
    Forms/Controls/Filter.ui \
    Forms/Controls/IVFilter.ui \
    Forms/Gen3/Eggs3.ui \
    Forms/Gen3/GameCube.ui \
    Forms/Gen3/IDs3.ui \
    Forms/Gen3/Profile/ProfileEditor3.ui \
    Forms/Gen3/Profile/ProfileManager3.ui \
    Forms/Gen3/Stationary3.ui \
    Forms/Gen3/Tools/GameCubeRTC.ui \
    Forms/Gen3/Tools/GameCubeSeedFinder.ui \
    Forms/Gen3/Tools/JirachiPattern.ui \
    Forms/Gen3/Tools/PIDIV.ui \
    Forms/Gen3/Tools/PokeSpot.ui \
    Forms/Gen3/Tools/SeedTime3.ui \
    Forms/Gen3/Tools/SpindaPainter.ui \
    Forms/Gen3/Wild3.ui \
    Forms/Gen4/Eggs4.ui \
    Forms/Gen4/IDs4.ui \
    Forms/Gen4/Profile/ProfileEditor4.ui \
    Forms/Gen4/Profile/ProfileManager4.ui \
    Forms/Gen4/Stationary4.ui \
    Forms/Gen4/Tools/ChainedSID.ui \
    Forms/Gen4/Tools/RoamerMap.ui \
    Forms/Gen4/Tools/SearchCalls.ui \
    Forms/Gen4/Tools/SearchCoinFlips.ui \
    Forms/Gen4/Tools/SeedtoTime4.ui \
    Forms/Gen4/Wild4.ui \
    Forms/Gen5/DreamRadar.ui \
    Forms/Gen5/Eggs5.ui \
    Forms/Gen5/Event5.ui \
    Forms/Gen5/IDs5.ui \
    Forms/Gen5/Profile/ProfileCalibrator5.ui \
    Forms/Gen5/Profile/ProfileEditor5.ui \
    Forms/Gen5/Profile/ProfileManager5.ui \
    Forms/Gen5/Stationary5.ui \
    Forms/MainWindow.ui \
    Forms/Util/EncounterLookup.ui \
    Forms/Util/IVCalculator.ui \
    Forms/Util/IVtoPID.ui \
    Forms/Util/Researcher.ui \
    Forms/Util/Settings.ui

HEADERS += \
    Core/Enum/Buttons.hpp \
    Core/Enum/DSType.hpp \
    Core/Enum/Encounter.hpp \
    Core/Enum/Game.hpp \
    Core/Enum/Language.hpp \
    Core/Enum/Lead.hpp \
    Core/Enum/Method.hpp \
    Core/Enum/ShadowType.hpp \
    Core/Gen3/EncounterArea3.hpp \
    Core/Gen3/Encounters3.hpp \
    Core/Gen3/States/EggState3.hpp \
    Core/Gen3/States/GameCubeState.hpp \
    Core/Gen3/States/GameCubeRTCState.hpp \
    Core/Gen3/States/IDState3.hpp \
    Core/Gen3/States/PIDIVState.hpp \
    Core/Gen3/States/SeedTimeState3.hpp \
    Core/Gen3/Generators/EggGenerator3.hpp \
    Core/Gen3/Generators/GameCubeGenerator.hpp \
    Core/Gen3/Generators/IDGenerator3.hpp \
    Core/Gen3/Generators/PokeSpotGenerator.hpp \
    Core/Gen3/Generators/StationaryGenerator3.hpp \
    Core/Gen3/Generators/WildGenerator3.hpp \
    Core/Gen3/LockInfo.hpp \
    Core/Gen3/Profile3.hpp \
    Core/Gen3/ProfileLoader3.hpp \
    Core/Gen3/Searchers/ChannelSeedSearcher.hpp \
    Core/Gen3/Searchers/ColoSeedSearcher.hpp \
    Core/Gen3/Searchers/GalesSeedSearcher.hpp \
    Core/Gen3/Searchers/GameCubeSearcher.hpp \
    Core/Gen3/Searchers/RTCSearcher.hpp \
    Core/Gen3/Searchers/SeedSearcher.hpp \
    Core/Gen3/Searchers/StationarySearcher3.hpp \
    Core/Gen3/Searchers/WildSearcher3.hpp \
    Core/Gen3/ShadowLock.hpp \
    Core/Gen3/Tools/JirachiPatternCalculator.hpp \
    Core/Gen3/Tools/PIDIVCalculator.hpp \
    Core/Gen3/Tools/SeedTimeCalculator3.hpp \
    Core/Gen4/EncounterArea4.hpp \
    Core/Gen4/Encounters4.hpp \
    Core/Gen4/States/EggState4.hpp \
    Core/Gen4/States/IDState4.hpp \
    Core/Gen4/Generators/EggGenerator4.hpp \
    Core/Gen4/Generators/IDGenerator4.hpp \
    Core/Gen4/Generators/StationaryGenerator4.hpp \
    Core/Gen4/Generators/WildGenerator4.hpp \
    Core/Gen4/HGSSRoamer.hpp \
    Core/Gen4/Profile4.hpp \
    Core/Gen4/ProfileLoader4.hpp \
    Core/Gen4/Searchers/EggSearcher4.hpp \
    Core/Gen4/Searchers/IDSearcher4.hpp \
    Core/Gen4/Searchers/StationarySearcher4.hpp \
    Core/Gen4/Searchers/WildSearcher4.hpp \
    Core/Gen4/Tools/ChainedSIDCalc.hpp \
    Core/Gen5/EncounterArea5.hpp \
    Core/Gen5/Encounters5.hpp \
    Core/Gen5/Filters/HiddenGrottoFilter.hpp \
    Core/Gen5/States/State5.hpp \
    Core/Gen5/States/HiddenGrottoState.hpp \
    Core/Gen5/States/IDState5.hpp \
    Core/Gen5/States/SearcherState5.hpp \
    Core/Gen5/States/StationaryState5.hpp \
    Core/Gen5/Generators/DreamRadarGenerator.hpp \
    Core/Gen5/Generators/EggGenerator5.hpp \
    Core/Gen5/Generators/EventGenerator5.hpp \
    Core/Gen5/Generators/HiddenGrottoGenerator.hpp \
    Core/Gen5/Generators/IDGenerator5.hpp \
    Core/Gen5/Generators/StationaryGenerator5.hpp \
    Core/Gen5/Keypresses.hpp \
    Core/Gen5/Nazos.hpp \
    Core/Gen5/PGF.hpp \
    Core/Gen5/Profile5.hpp \
    Core/Gen5/ProfileLoader5.hpp \
    Core/Gen5/Searchers/DreamRadarSearcher.hpp \
    Core/Gen5/Searchers/EggSearcher5.hpp \
    Core/Gen5/Searchers/EventSearcher5.hpp \
    Core/Gen5/Searchers/IDSearcher5.hpp \
    Core/Gen5/Searchers/ProfileSearcher5.hpp \
    Core/Gen5/Searchers/StationarySearcher5.hpp \
    Core/Parents/Daycare.hpp \
    Core/Parents/EncounterArea.hpp \
    Core/Parents/Filters/StateFilter.hpp \
    Core/Parents/Filters/IDFilter.hpp \
    Core/Parents/States/EggState.hpp \
    Core/Parents/States/State.hpp \
    Core/Parents/States/IDState.hpp \
    Core/Parents/States/ResearcherState.hpp \
    Core/Parents/States/StationaryState.hpp \
    Core/Parents/States/WildState.hpp \
    Core/Parents/Generators/EggGenerator.hpp \
    Core/Parents/Generators/Generator.hpp \
    Core/Parents/Generators/IDGenerator.hpp \
    Core/Parents/Generators/StationaryGenerator.hpp \
    Core/Parents/Generators/WildGenerator.hpp \
    Core/Parents/PersonalInfo.hpp \
    Core/Parents/Profile.hpp \
    Core/Parents/Searchers/Searcher.hpp \
    Core/Parents/Searchers/StationarySearcher.hpp \
    Core/Parents/Searchers/WildSearcher.hpp \
    Core/Parents/Slot.hpp \
    Core/RNG/LCRNG.hpp \
    Core/RNG/LCRNG64.hpp \
    Core/RNG/MT.hpp \
    Core/RNG/RNGCache.hpp \
    Core/RNG/RNGEuclidean.hpp \
    Core/RNG/RNGList.hpp \
    Core/RNG/SFMT.hpp \
    Core/RNG/SHA1.hpp \
    Core/RNG/TinyMT.hpp \
    Core/Util/DateTime.hpp \
    Core/Util/EncounterSlot.hpp \
    Core/Util/Global.hpp \
    Core/Util/IVChecker.hpp \
    Core/Util/Nature.hpp \
    Core/Util/Translator.hpp \
    Core/Util/Utilities.hpp \
    Forms/Controls/CheckList.hpp \
    Forms/Controls/ComboBox.hpp \
    Forms/Controls/EggSettings.hpp \
    Forms/Controls/Filter.hpp \
    Forms/Controls/GraphicsPixmapItem.hpp \
    Forms/Controls/IVFilter.hpp \
    Forms/Controls/Label.hpp \
    Forms/Controls/TableView.hpp \
    Forms/Controls/TextBox.hpp \
    Forms/Gen3/Eggs3.hpp \
    Forms/Gen3/GameCube.hpp \
    Forms/Gen3/IDs3.hpp \
    Forms/Gen3/Profile/ProfileEditor3.hpp \
    Forms/Gen3/Profile/ProfileManager3.hpp \
    Forms/Gen3/Stationary3.hpp \
    Forms/Gen3/Tools/GameCubeRTC.hpp \
    Forms/Gen3/Tools/GameCubeSeedFinder.hpp \
    Forms/Gen3/Tools/JirachiPattern.hpp \
    Forms/Gen3/Tools/PIDIV.hpp \
    Forms/Gen3/Tools/PokeSpot.hpp \
    Forms/Gen3/Tools/SeedTime3.hpp \
    Forms/Gen3/Tools/SpindaPainter.hpp \
    Forms/Gen3/Wild3.hpp \
    Forms/Gen4/Eggs4.hpp \
    Forms/Gen4/IDs4.hpp \
    Forms/Gen4/Profile/ProfileEditor4.hpp \
    Forms/Gen4/Profile/ProfileManager4.hpp \
    Forms/Gen4/Stationary4.hpp \
    Forms/Gen4/Tools/ChainedSID.hpp \
    Forms/Gen4/Tools/RoamerMap.hpp \
    Forms/Gen4/Tools/SearchCalls.hpp \
    Forms/Gen4/Tools/SearchCoinFlips.hpp \
    Forms/Gen4/Tools/SeedtoTime4.hpp \
    Forms/Gen4/Wild4.hpp \
    Forms/Gen5/DreamRadar.hpp \
    Forms/Gen5/Eggs5.hpp \
    Forms/Gen5/Event5.hpp \
    Forms/Gen5/IDs5.hpp \
    Forms/Gen5/Profile/ProfileCalibrator5.hpp \
    Forms/Gen5/Profile/ProfileEditor5.hpp \
    Forms/Gen5/Profile/ProfileManager5.hpp \
    Forms/Gen5/Stationary5.hpp \
    Forms/MainWindow.hpp \
    Forms/Util/EncounterLookup.hpp \
    Forms/Util/IVCalculator.hpp \
    Forms/Util/IVtoPID.hpp \
    Forms/Util/Researcher.hpp \
    Forms/Util/Settings.hpp \
    Models/Gen3/EggModel3.hpp \
    Models/Gen3/GameCubeModel.hpp \
    Models/Gen3/GameCubeRTCModel.hpp \
    Models/Gen3/IDModel3.hpp \
    Models/Gen3/PIDIVModel.hpp \
    Models/Gen3/PokeSpotModel.hpp \
    Models/Gen3/ProfileModel3.hpp \
    Models/Gen3/SeedTimeModel3.hpp \
    Models/Gen3/StationaryModel3.hpp \
    Models/Gen3/WildModel3.hpp \
    Models/Gen4/EggModel4.hpp \
    Models/Gen4/IDModel4.hpp \
    Models/Gen4/ProfileModel4.hpp \
    Models/Gen4/SeedtoTimeModel4.hpp \
    Models/Gen4/StationaryModel4.hpp \
    Models/Gen4/WildModel4.hpp \
    Models/Gen5/DreamRadarModel.hpp \
    Models/Gen5/EggModel5.hpp \
    Models/Gen5/EventModel5.hpp \
    Models/Gen5/IDModel5.hpp \
    Models/Gen5/ProfileModel5.hpp \
    Models/TableModel.hpp \
    Models/Util/ResearcherModel.hpp

SOURCES += \
    Core/Gen3/EncounterArea3.cpp \
    Core/Gen3/Encounters3.cpp \
    Core/Gen3/States/EggState3.cpp \
    Core/Gen3/States/GameCubeState.cpp \
    Core/Gen3/States/GameCubeRTCState.cpp \
    Core/Gen3/States/IDState3.cpp \
    Core/Gen3/States/PIDIVState.cpp \
    Core/Gen3/States/SeedTimeState3.cpp \
    Core/Gen3/Generators/EggGenerator3.cpp \
    Core/Gen3/Generators/GameCubeGenerator.cpp \
    Core/Gen3/Generators/IDGenerator3.cpp \
    Core/Gen3/Generators/PokeSpotGenerator.cpp \
    Core/Gen3/Generators/StationaryGenerator3.cpp \
    Core/Gen3/Generators/WildGenerator3.cpp \
    Core/Gen3/LockInfo.cpp \
    Core/Gen3/Profile3.cpp \
    Core/Gen3/ProfileLoader3.cpp \
    Core/Gen3/Searchers/ChannelSeedSearcher.cpp \
    Core/Gen3/Searchers/ColoSeedSearcher.cpp \
    Core/Gen3/Searchers/GalesSeedSearcher.cpp \
    Core/Gen3/Searchers/GameCubeSearcher.cpp \
    Core/Gen3/Searchers/RTCSearcher.cpp \
    Core/Gen3/Searchers/SeedSearcher.cpp \
    Core/Gen3/Searchers/StationarySearcher3.cpp \
    Core/Gen3/Searchers/WildSearcher3.cpp \
    Core/Gen3/ShadowLock.cpp \
    Core/Gen3/Tools/JirachiPatternCalculator.cpp \
    Core/Gen3/Tools/PIDIVCalculator.cpp \
    Core/Gen3/Tools/SeedTimeCalculator3.cpp \
    Core/Gen4/EncounterArea4.cpp \
    Core/Gen4/Encounters4.cpp \
    Core/Gen4/States/EggState4.cpp \
    Core/Gen4/States/IDState4.cpp \
    Core/Gen4/Generators/EggGenerator4.cpp \
    Core/Gen4/Generators/IDGenerator4.cpp \
    Core/Gen4/Generators/StationaryGenerator4.cpp \
    Core/Gen4/Generators/WildGenerator4.cpp \
    Core/Gen4/HGSSRoamer.cpp \
    Core/Gen4/Profile4.cpp \
    Core/Gen4/ProfileLoader4.cpp \
    Core/Gen4/Searchers/EggSearcher4.cpp \
    Core/Gen4/Searchers/IDSearcher4.cpp \
    Core/Gen4/Searchers/StationarySearcher4.cpp \
    Core/Gen4/Searchers/WildSearcher4.cpp \
    Core/Gen4/Tools/ChainedSIDCalc.cpp \
    Core/Gen5/EncounterArea5.cpp \
    Core/Gen5/Encounters5.cpp \
    Core/Gen5/Filters/HiddenGrottoFilter.cpp \
    Core/Gen5/States/IDState5.cpp \
    Core/Gen5/Generators/DreamRadarGenerator.cpp \
    Core/Gen5/Generators/EggGenerator5.cpp \
    Core/Gen5/Generators/EventGenerator5.cpp \
    Core/Gen5/Generators/HiddenGrottoGenerator.cpp \
    Core/Gen5/Generators/IDGenerator5.cpp \
    Core/Gen5/Generators/StationaryGenerator5.cpp \
    Core/Gen5/Keypresses.cpp \
    Core/Gen5/Nazos.cpp \
    Core/Gen5/PGF.cpp \
    Core/Gen5/Profile5.cpp \
    Core/Gen5/ProfileLoader5.cpp \
    Core/Gen5/Searchers/DreamRadarSearcher.cpp \
    Core/Gen5/Searchers/EggSearcher5.cpp \
    Core/Gen5/Searchers/EventSearcher5.cpp \
    Core/Gen5/Searchers/IDSearcher5.cpp \
    Core/Gen5/Searchers/ProfileSearcher5.cpp \
    Core/Gen5/Searchers/StationarySearcher5.cpp \
    Core/Parents/Daycare.cpp \
    Core/Parents/EncounterArea.cpp \
    Core/Parents/Filters/StateFilter.cpp \
    Core/Parents/Filters/IDFilter.cpp \
    Core/Parents/States/EggState.cpp \
    Core/Parents/States/State.cpp \
    Core/Parents/States/IDState.cpp \
    Core/Parents/States/ResearcherState.cpp \
    Core/Parents/States/StationaryState.cpp \
    Core/Parents/States/WildState.cpp \
    Core/Parents/Generators/EggGenerator.cpp \
    Core/Parents/Generators/Generator.cpp \
    Core/Parents/Generators/IDGenerator.cpp \
    Core/Parents/Generators/StationaryGenerator.cpp \
    Core/Parents/Generators/WildGenerator.cpp \
    Core/Parents/PersonalInfo.cpp \
    Core/Parents/Profile.cpp \
    Core/Parents/Searchers/Searcher.cpp \
    Core/Parents/Searchers/StationarySearcher.cpp \
    Core/Parents/Searchers/WildSearcher.cpp \
    Core/Parents/Slot.cpp \
    Core/RNG/MT.cpp \
    Core/RNG/RNGCache.cpp \
    Core/RNG/RNGEuclidean.cpp \
    Core/RNG/SFMT.cpp \
    Core/RNG/SHA1.cpp \
    Core/RNG/TinyMT.cpp \
    Core/Util/DateTime.cpp \
    Core/Util/EncounterSlot.cpp \
    Core/Util/IVChecker.cpp \
    Core/Util/Nature.cpp \
    Core/Util/Translator.cpp \
    Core/Util/Utilities.cpp \
    Forms/Controls/CheckList.cpp \
    Forms/Controls/ComboBox.cpp \
    Forms/Controls/EggSettings.cpp \
    Forms/Controls/Filter.cpp \
    Forms/Controls/GraphicsPixmapItem.cpp \
    Forms/Controls/IVFilter.cpp \
    Forms/Controls/Label.cpp \
    Forms/Controls/TableView.cpp \
    Forms/Controls/TextBox.cpp \
    Forms/Gen3/Eggs3.cpp \
    Forms/Gen3/GameCube.cpp \
    Forms/Gen3/IDs3.cpp \
    Forms/Gen3/Profile/ProfileEditor3.cpp \
    Forms/Gen3/Profile/ProfileManager3.cpp \
    Forms/Gen3/Stationary3.cpp \
    Forms/Gen3/Tools/GameCubeRTC.cpp \
    Forms/Gen3/Tools/GameCubeSeedFinder.cpp \
    Forms/Gen3/Tools/JirachiPattern.cpp \
    Forms/Gen3/Tools/PIDIV.cpp \
    Forms/Gen3/Tools/PokeSpot.cpp \
    Forms/Gen3/Tools/SeedTime3.cpp \
    Forms/Gen3/Tools/SpindaPainter.cpp \
    Forms/Gen3/Wild3.cpp \
    Forms/Gen4/Eggs4.cpp \
    Forms/Gen4/IDs4.cpp \
    Forms/Gen4/Profile/ProfileEditor4.cpp \
    Forms/Gen4/Profile/ProfileManager4.cpp \
    Forms/Gen4/Stationary4.cpp \
    Forms/Gen4/Tools/ChainedSID.cpp \
    Forms/Gen4/Tools/RoamerMap.cpp \
    Forms/Gen4/Tools/SearchCalls.cpp \
    Forms/Gen4/Tools/SearchCoinFlips.cpp \
    Forms/Gen4/Tools/SeedtoTime4.cpp \
    Forms/Gen4/Wild4.cpp \
    Forms/Gen5/DreamRadar.cpp \
    Forms/Gen5/Eggs5.cpp \
    Forms/Gen5/Event5.cpp \
    Forms/Gen5/IDs5.cpp \
    Forms/Gen5/Profile/ProfileCalibrator5.cpp \
    Forms/Gen5/Profile/ProfileEditor5.cpp \
    Forms/Gen5/Profile/ProfileManager5.cpp \
    Forms/Gen5/Stationary5.cpp \
    Forms/MainWindow.cpp \
    Forms/Util/EncounterLookup.cpp \
    Forms/Util/IVCalculator.cpp \
    Forms/Util/IVtoPID.cpp \
    Forms/Util/Researcher.cpp \
    Forms/Util/Settings.cpp \
    Models/Gen3/EggModel3.cpp \
    Models/Gen3/GameCubeModel.cpp \
    Models/Gen3/GameCubeRTCModel.cpp \
    Models/Gen3/IDModel3.cpp \
    Models/Gen3/PIDIVModel.cpp \
    Models/Gen3/PokeSpotModel.cpp \
    Models/Gen3/ProfileModel3.cpp \
    Models/Gen3/SeedTimeModel3.cpp \
    Models/Gen3/StationaryModel3.cpp \
    Models/Gen3/WildModel3.cpp \
    Models/Gen4/EggModel4.cpp \
    Models/Gen4/IDModel4.cpp \
    Models/Gen4/ProfileModel4.cpp \
    Models/Gen4/SeedtoTimeModel4.cpp \
    Models/Gen4/StationaryModel4.cpp \
    Models/Gen4/WildModel4.cpp \
    Models/Gen5/DreamRadarModel.cpp \
    Models/Gen5/EggModel5.cpp \
    Models/Gen5/EventModel5.cpp \
    Models/Gen5/IDModel5.cpp \
    Models/Gen5/ProfileModel5.cpp \
    Models/Util/ResearcherModel.cpp \
    main.cpp
