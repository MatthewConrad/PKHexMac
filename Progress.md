# Rewrite Progress

# PKHeX.Core

## Editing

- [ ] CommonEdits
- [ ] HiddenPower
- [ ] IBattleTemplate
- [ ] IPKMView
- [ ] IPlugin
- [ ] ISaveFileProvider
- [ ] ISpriteBuilder
- [ ] LocationEdits
- [ ] NatureAmp
- [ ] Pokerus
- [ ] PowerPotential
- [ ] WurmpleUtil

### Applicators

- [ ] BallApplicator
- [ ] CatchRateApplicator
- [ ] GenderApplicator
- [ ] HiddenPowerApplicator
- [ ] MarkingApplicator
- [ ] MemoryApplicator
- [ ] MoveApplicator
- [ ] MoveSetApplicator
- [ ] MoveShopRecordApplicator
- [ ] RibbonApplicator
- [ ] TechnicalRecordApplicator

### Bulk

- [ ] BatchEditing
- [ ] BatchEditor
- [ ] BatchFilters
- [ ] BatchInfo
- [ ] BatchMods
- [ ] ModifyResult
- [ ] StringInstruction
- [ ] StringInstructionSet

#### Complex Set

- [ ] ComplexFilter
- [ ] ComplexSet
- [ ] IComplexFilter
- [ ] IComplexFilterMeta
- [ ] IComplexSet
- [ ] MetaFilter

#### Suggestion

- [ ] BatchModifications
- [ ] ComplexSuggestion
- [ ] ISuggestModification
- [ ] TypeSuggestion


### Database

- [ ] TrainerDatabase

### PKM

- [ ] EntitySuggestionUtil
- [ ] EntitySummary
- [ ] EntityTemplates
- [ ] ILegalMoveDisplaySource
- [ ] ILegalMoveComboSource
- [ ] LegalMoveInfo
- [ ] LegalMoveSource

#### QR

- [ ] QRMessageUtil
- [ ] QRPK7
- [ ] QRPKM

### Program

- [ ] AutoLoadSetting
- [ ] IStartupSettings
- [ ] StartupArguments

### Saves

#### BoxManip

- [ ] BoxManipBase
- [ ] BoxManipClear
- [ ] BoxManipClearComplex
- [ ] BoxManipClearDuplicate
- [ ] BoxManipDefaults
- [ ] BoxManipModify
- [ ] BoxManipModifyComplex
- [ ] BoxManipSort
- [ ] BoxManipSortComplex
- [ ] BoxManipType
- [ ] BoxManipUtil
- [ ] BoxManipulator
- [ ] IBoxManip

#### Editors

- [ ] FakePKMEditor
- [ ] FakeSaveFile
- [ ] SaveDataEditor

##### EventOld

- [ ] EventLabelCollection
- [ ] EventLabelCollectionSystem
- [ ] EventLabelParsing
- [ ] EventWorkspace
- [ ] NamedEventType
- [ ] NamedEventValue
- [ ] NamedEventWork

##### EventUnlock

- [ ] EventUnlocker
- [ ] EventUnlocker8b

##### EventWork

- [ ] EventFlag
- [ ] EventVar
- [ ] EventVarGroup
- [ ] EventWork
- [ ] EventWorkUtil
- [ ] EventWorkVal
- [ ] SplitEventEditor

###### Diff

- [ ] EventWorkDiff
- [ ] EventWorkDiff7b
- [ ] EventWorkDiff8b
- [ ] EventWorkDiffCompatibility
- [ ] IEventWorkDiff

#### Management

- [ ] INamedFolderPath
- [ ] SavePreview

#### Slots

- [ ] BoxEdit
- [ ] Extensions
- [ ] ISlotViewer
- [ ] SlotChangelog
- [ ] SlotEditor
- [ ] SlotPublisher
- [ ] SlotTouchResult
- [ ] SlotTouchType
- [ ] SlotViewInfo
- [ ] StorageSlotType

##### Exporting

- [ ] BoxExport
- [ ] BoxExportSettings

##### Info

- [ ] ISlotInfo
- [ ] SlotCache
- [ ] SlotInfoBox
- [ ] SlotInfoFile
- [ ] SlotInfoLoader
- [ ] SlotInfoMisc
- [ ] SlotInfoParty
- [ ] SlotOrigin
- [ ] WriteBlockedMessage

### Showdown

- [ ] ShowdownParsing
- [ ] ShowdownSet

## Game

- [x] ComboItem
- [x] GameUtil *(combined with Enums/GameVersion)*
- [x] IBasicStrings

### Enums

- [X] Ability
- [x] Ball
- [x] GCVersion *(combined with GameVersion; GCRegion moved to new file Region)* 
- [x] GameVersion
- [x] Gender
- [x] LanguageGC *(combined with LanguageID)*
- [x] LanguageID
- [x] Move
- [x] MoveType
- [x] Nature
- [x] Region3DSIndex *(moved to new file Version)*
- [x] Species 

### GameStrings

- [ ] FilteredGameDataSource
- [ ] GameDataSource
- [ ] GameInfo
- [/] GameLanguage (in progress, need to come up with better file solution)
- [/] GameStrings (started, need to make more progress on GameLanguage)
- [ ] GeoLocation
- [ ] MemoryStrings
- [ ] MetDataSource
- [x] ProgramLanguage

#### LocationSet

- [x] ILocationSet
- [x] LocationSet0
- [x] LocationSet4
- [x] LocationSet6

### Locations

- [x] Locations
- [x] Locations4
- [x] Locations5
- [x] Locations6
- [x] Locations7
- [x] Locations7b
- [x] Locations8
- [x] Locations8a
- [x] Locations8b
- [x] Locations9
- [x] LocationsHOME

## Items

- [x] HeldItemLumpImage
- [x] IItemStorage
- [x] ItemStorage1
- [x] ItemStorage2
- [x] ItemStorage3Colo *(all gen 3 storage condensed to single file)*
- [x] ItemStorage3E
- [x] ItemStorage3FRLG
- [x] ItemStorage3RS
- [x] ItemStorage3XD
- [x] ItemStorage4 *(all gen 4 storage condensed to single file)*
- [x] ItemStorage4DP
- [x] ItemStorage4HGSS
- [x] ItemStorage4Pt
- [x] ItemStorage5
- [x] ItemStorage5B2W2
- [x] ItemStorage5BW *( all gen 5 storage condensed to single file)*
- [x] ItemStorage6AO
- [x] ItemStorage6XY *(all gen 6 storage condensed to single file)*
- [x] ItemStorage7GG
- [x] ItemStorage7SM
- [x] ItemStorage7USUM *( SM & USUM condensed to single file)*
- [x] ItemStorage8BDSP
- [x] ItemStorage8LA
- [x] ItemStorage8SWSH
- [x] ItemStorage9SV

## Legality

- [ ] BinLinkerAccessor
- [ ] Breeding
- [ ] BulkGenerator
- [/] Core
- [ ] LegalityAnalysis
- [ ] LegalityAnalyzer
- [ ] MoveListSuggest
- [ ] MoveSourceType

### Bulk

- [ ] BulkAnalysis
- [ ] CombinedReference
- [ ] DuplicateEncryptionChecker
- [ ] DuplicateGiftChecker
- [ ] DuplicatePIDChecker
- [ ] DuplicateTrainerChecker
- [ ] HandlerChecker
- [ ] IBulkAnalyzer
- [ ] StandardCloneChecker

### Encounters

#### Data

- [ ] EncounterEvent
- [ ] EncounterUtil

##### Gen1

- [ ] Encounters1
- [ ] Encounters1GBEra
- [ ] Encounters1VC
 
##### Gen2

- [ ] Encounters2
- [ ] Encounters2GBEra

##### Gen3

- [ ] Encounters3Colo
- [ ] Encounters3ColoShadow
- [ ] Encounters3ColoTeams  
- [ ] Encounters3FRLG  
- [ ] Encounters3RSE  
- [ ] Encounters3XD  
- [ ] Encounters3XDShadow  
- [ ] Encounters3XDTeams  
- [ ] EncountersWC3  

##### Gen4

- [ ] Encounters4DPPt
- [ ] Encounters4DHGSS

##### Gen5

- [ ] Encounters5B2W2
- [ ] Encounters5BW
- [ ] Encounters5DR

##### Gen6

- [ ] Encounters6AO
- [ ] Encounters6XY

##### Gen7

- [ ] Encounters7GG
- [ ] Encounters7SM
- [ ] Encounters7USUM

##### Gen8

- [ ] Encounters8
- [ ] Encounters8Nest
- [ ] Encounters8a
- [ ] Encounters8b

##### Gen9

- [ ] Encounters9

##### Live

- [ ] EncounterServerDate
- [ ] EncounterServerDateCheck
- [ ] EncountersGO
- [ ] IEncounterServerDate

#### Generator

- [ ] EncounterCriteria
- [ ] EncounterFinder
- [ ] EncounterGenerator
- [ ] PeekEnumerator

##### ByGeneration

- [ ] EncounterGenerator1
- [ ] EncounterGenerator2
- [ ] EncounterGenerator3
- [ ] EncounterGenerator3GC
- [ ] EncounterGenerator4
- [ ] EncounterGenerator5
- [ ] EncounterGenerator6
- [ ] EncounterGenerator7
- [ ] EncounterGenerator7GG
- [ ] EncounterGenerator7GO
- [ ] EncounterGenerator8
- [ ] EncounterGenerator8GO
- [ ] EncounterGenerator8a
- [ ] EncounterGenerator8b
- [ ] EncounterGenerator9
- [ ] EncounterStateUtil

###### Lump

- [ ] EncounterGenerator12
- [ ] EncounterGenerator7X
- [ ] EncounterGenerator8X
- [ ] EncounterGeneratorDummy
- [ ] EncounterGeneratorGO
- [ ] IEncounterGenerator

##### Moveset

- [ ] EncounterMovesetGenerator
- [ ] EncounterTypeGroup

##### Possible

- [ ] EncounterPossible1
- [ ] EncounterPossible2
- [ ] EncounterPossible3
- [ ] EncounterPossible3GC
- [ ] EncounterPossible4
- [ ] EncounterPossible5
- [ ] EncounterPossible6
- [ ] EncounterPossible7
- [ ] EncounterPossible7GG
- [ ] EncounterPossible7GO
- [ ] EncounterPossible8
- [ ] EncounterPossible8GO
- [ ] EncounterPossible8a
- [ ] EncounterPossible8b
- [ ] EncounterPossible9

##### Search

- [ ] EncounterEnumerator1
- [ ] EncounterEnumerator2
- [ ] EncounterEnumerator3
- [ ] EncounterEnumerator3GC
- [ ] EncounterEnumerator4
- [ ] EncounterEnumerator5
- [ ] EncounterEnumerator6
- [ ] EncounterEnumerator7
- [ ] EncounterEnumerator7GG
- [ ] EncounterEnumerator7GO
- [ ] EncounterEnumerator8
- [ ] EncounterEnumerator8GO
- [ ] EncounterEnumerator8a
- [ ] EncounterEnumerator8b
- [ ] EncounterEnumerator9
- [ ] MatchedEncounter

###### Dirtied

- [ ] EncounterEnumerator8bSWSH
- [ ] EncounterEnumerator9SWSH

#### Information

- [ ] EncounterDate
- [ ] EncounterLearn
- [ ] EncounterSuggestion
- [ ] EncounterSuggestionData
- [ ] EncounterSummary
- [ ] EncounterText

#### Templates

##### Enums

- [ ] AbilityPermission
- [ ] EncounterMatchRating
- [ ] HiddenAbilityPermission
- [ ] Shiny
- [ ] SlotType

##### Gen1

- [ ] EncounterArea1
- [ ] EncounterGBLanguage
- [ ] EncounterGift1
- [ ] EncounterSlot1
- [ ] EncounterStatic1
- [ ] EncounterTrade1
- [ ] IFixedGBLanguage

##### Gen2

- [ ] EncounterArea2
- [ ] EncounterGift2
- [ ] EncounterSlot2
- [ ] EncounterStatic2
- [ ] EncounterTime
- [ ] EncounterTrade2

##### Gen3

- [ ] EncounterArea3
- [ ] EncounterSlot3
- [ ] EncounterSlot3Swarm
- [ ] EncounterStatic3
- [ ] EncounterTrade3

###### Colo

- [ ] EncounterGift3Colo
- [ ] EncounterShadow3Colo
- [ ] EncounterStatic3Colo
- [ ] IShadow3

###### XD

- [ ] EncounterArea3XD
- [ ] EncounterShadow3XD
- [ ] EncounterSlot3XD
- [ ] EncounterStatic3XD
- [ ] EncounterTrade3XD

##### Gen4

- [ ] EncounterArea4
- [ ] EncounterSlot4
- [ ] EncounterStatic4
- [ ] EncounterStatic4Pokewalker
- [ ] EncounterTrade4PID
- [ ] EncounterTrade4RanchGift
- [ ] GroundTileAllowed
- [ ] IGroundTypeTile
- [ ] PokewalkerCourse4

##### Gen5

- [ ] DreamWorldEntry
- [ ] EncounterArea5
- [ ] EncounterSlot5
- [ ] EncounterStatic5
- [ ] EncounterStatic5Entree
- [ ] EncounterStatic5N
- [ ] EncounterStatic5Radar
- [ ] EncounterTrade5B2W2
- [ ] EncounterTrade5BW

##### Gen6

- [ ] EncounterArea6AO
- [ ] EncounterArea6XY
- [ ] EncounterSlot6AO
- [ ] EncounterSlot6XY
- [ ] EncounterStatic6
- [ ] EncounterTrade6

##### Gen7

- [ ] EncounterArea7
- [ ] EncounterSlot7
- [ ] EncounterStatic7
- [ ] EncounterTrade7
- [ ] EncounterTransfer7

##### Gen7b

- [ ] EncounterArea7b
- [ ] EncounterSlot7b
- [ ] EncounterStatic7b
- [ ] EncounterTrade7b

##### Gen8

- [ ] AreaSlotType8
- [ ] AreaWeather8
- [ ] Crossover8
- [ ] EncounterArea8
- [ ] EncounterSlot8
- [ ] EncounterStatic8
- [ ] EncounterStatic8N
- [ ] EncounterStatic8NC
- [ ] EncounterStatic8ND
- [ ] EncounterStatic8Nest
- [ ] EncounterStatic8U
- [ ] EncounterTrade8
- [ ] IOverworldCorrelation8
- [ ] ISeedCorrelation64
- [ ] OverworldCorrelation8Requirement

##### Gen8a

- [ ] EncounterArea8a
- [ ] EncounterSlot8a
- [ ] EncounterStatic8a
- [ ] EncounterStatic8aCorrelation
- [ ] IMasteryInitialMoveShop8

##### Gen8b

- [ ] EncounterArea8b
- [ ] EncounterSlot8b
- [ ] EncounterStatic8b
- [ ] EncounterTrade8b
- [ ] IStaticCorrelation8b
- [ ] StaticCorrelation8bRequirement

##### Gen9

- [ ] AreaWeather9
- [ ] EncounterArea9
- [ ] EncounterDist9
- [ ] EncounterFixed9
- [ ] EncounterMight9
- [ ] EncounterOutbreak9
- [ ] EncounterSlot9
- [ ] EncounterStatic9
- [ ] EncounterTera9
- [ ] EncounterTrade9
- [ ] IGemType
- [ ] ITeraRaid9
- [ ] SizeType9

##### GO

- [ ] EncounterArea7g
- [ ] EncounterArea8g
- [ ] EncounterSlot7GO
- [ ] EncounterSlot8GO
- [ ] IPogoDateRange
- [ ] IPogoSlot
- [ ] IPogoType

##### Interfaces

- [ ] IEncounterable
- [ ] IEncounterArea
- [ ] IEncounterConvertible
- [ ] IEncounterInfo
- [ ] IEncounterMatch
- [ ] IEncounterTemplate
- [ ] ILocation

###### Properties

- [ ] IEncounterFormRandom
- [ ] IFixedAbilityNumber
- [ ] IFixedBall
- [ ] IFixedGender
- [ ] IFixedIVSet
- [ ] IFixedNature
- [ ] IFixedNickname
- [ ] IFixedTrainer
- [ ] IFlawlessIVCount
- [ ] IFlawlessIVCountConditional
- [ ] IHatchCycle
- [ ] ILevelRange
- [ ] IMoveset
- [ ] IRandomCorrelation
- [ ] IRelearn
- [ ] IRestrictVersion
- [ ] IShinyPotential
- [ ] IVersion

###### RNG

- [ ] IMagnetStatic
- [ ] INumberedSlot
- [ ] ISlotRNGType

##### Shared

- [ ] EncounterEgg
- [ ] EncounterInvalid
- [ ] IndividualValidSet
- [ ] Moveset

#### Verifiers

- [ ] EggHatchLocation3
- [ ] EggHatchLocation4
- [ ] EggHatchLocation5
- [ ] EggHatchLocation6
- [ ] EggHatchLocation7
- [ ] EggHatchLocation8
- [ ] EggHatchLocation8b
- [ ] EggHatchLocation9
- [ ] EncounterVerifier
- [ ] EvolutionVerifier
- [ ] MysteryGiftRestriction
- [ ] MysteryGiftVerifier

### Evolutions

- [ ] EncounterOrigin
- [ ] EvolutionChain
- [ ] EvolutionHistory
- [ ] EvolutionRuleTweak
- [ ] EvolutionSet
- [ ] EvolutionTree
- [ ] IEvolutionNetwork

#### EvolutionGroup

- [ ] EvolutionGroup1
- [ ] EvolutionGroup2
- [ ] EvolutionGroup3
- [ ] EvolutionGroup4
- [ ] EvolutionGroup5
- [ ] EvolutionGroup6
- [ ] EvolutionGroup7
- [ ] EvolutionGroup7b
- [ ] EvolutionGroupHOME
- [ ] EvolutionGroupUtil
- [ ] EvolutionOrigin
- [ ] EvolutionUtil
- [ ] IEvolutionGroup

#### Forward

- [ ] EvolutionForwardPersonal
- [ ] EvolutionForwardSpecies
- [ ] IEvolutionForward

#### Methods

- [ ] EvoCriteria
- [ ] EvolutionCheckResult
- [ ] EvolutionMethod
- [ ] EvolutionType

#### Reversal

- [ ] EvolutionLink
- [ ] EvolutionNode
- [ ] EvolutionReversal
- [ ] EvolutionReversalLookup
- [ ] EvolutionReversalPersonal
- [ ] EvolutionReversalSpecies
- [ ] IEvolutionReverse

### Formatting

- [ ] BaseLegalityFormatter
- [ ] ILegalityFormatter
- [ ] LegalityCheckStrings
- [ ] LegalityFormatting

### Learnset

- [ ] EggMoves
- [ ] Learnset
- [ ] LearnsetReader

### LearnSource

- [ ] LearnEnvironment
- [ ] LearnMethod
- [ ] MoveLearnInfo
- [ ] MoveResult

#### Group

- [ ] ILearnGroup
- [ ] LearnGroup1
- [ ] LearnGroup2
- [ ] LearnGroup3
- [ ] LearnGroup4
- [ ] LearnGroup5
- [ ] LearnGroup6
- [ ] LearnGroup7
- [ ] LearnGroup7b
- [ ] LearnGroup8
- [ ] LearnGroup8a
- [ ] LearnGroup8b
- [ ] LearnGroup9
- [ ] LearnGroupHOME
- [ ] LearnGroupUtil

#### Sources

- [ ] IHomeSource
- [ ] LearnSource1RB
- [ ] LearnSource1YW
- [ ] LearnSource2C
- [ ] LearnSource2GS
- [ ] LearnSource3E
- [ ] LearnSource3FR
- [ ] LearnSource3LG
- [ ] LearnSource3RS
- [ ] LearnSource4DP
- [ ] LearnSource4HGSS
- [ ] LearnSource4Pt
- [ ] LearnSource5B2W2
- [ ] LearnSource5BW
- [ ] LearnSource6AO
- [ ] LearnSource6XY
- [ ] LearnSource7GG
- [ ] LearnSource7SM
- [ ] LearnSource7USUM
- [ ] LearnSource8BDSP
- [ ] LearnSource8PLA
- [ ] LearnSource8SWSH
- [ ] LearnSource9SV

##### Shared

- [ ] IEggSource
- [ ] ILearnSource
- [ ] IReminderSource
- [x] LearnOption
- [ ] LearnSource1
- [ ] LearnSource2
- [ ] LearnSource3
- [ ] LearnSource4
- [ ] LearnSource5
- [ ] LearnSource7
- [ ] MoveTutor

#### Verify

- [ ] LearnPossible
- [ ] LearnVerifier
- [ ] LearnVerifierEgg
- [ ] LearnVerifierHistory
- [ ] LearnVerifierRelearn

### Moves

- [ ] GameData

#### Breeding

- [ ] BreedInfo
- [ ] EggSource
- [ ] MoveBreed
- [ ] MoveBreed2
- [ ] MoveBreed3
- [ ] MoveBreed4
- [ ] MoveBreed5
- [ ] MoveBreed6

### Restrictions

- [ ] EvolutionRestrictions
- [ ] GBRestrictions
- [ ] HomeTrackerUtil
- [ ] ItemRestrictions
- [ ] Locale3DS
- [ ] Vivillon3DS
- [ ] WordFilter

#### Memories

- [ ] Memories
- [ ] MemoryArgType
- [ ] MemoryContext
- [ ] MemoryContext6
- [ ] MemoryContext6Data
- [ ] MemoryContext8
- [ ] MemoryContext8Data
- [ ] MemoryPermissions
- [ ] MemoryRules
- [ ] MemoryVariableSet

### RNG

- [ ] MethodFinder
- [ ] PIDGenerator
- [ ] PIDIV
- [ ] PIDType

#### Algorithms

- [ ] ARNG
- [ ] LCRNG
- [ ] LCRNGReversal
- [ ] LCRNGReversalSkip
- [ ] XDRNG
- [ ] Xoroshiro128Plus
- [ ] Xoroshiro128Plus8b
- [ ] Xoroshiro128PlusReversal
- [ ] XorShift128

#### CXD

- [ ] LockFinder
- [ ] NPCLock
- [ ] SeedFrame
- [ ] TeamLock
- [ ] TeamLockResult

#### Frame

- [ ] Frame
- [ ] FrameCache
- [ ] FrameFinder
- [ ] FrameGenerator
- [ ] FrameType
- [ ] LeadRequired
- [ ] LockInfo
- [ ] Pokeblock
- [ ] SeedInfo
- [ ] SlotNumber
- [ ] SlotRange

#### Methods

##### Gen8

- [ ] GenerateParam8
- [ ] Overworld8RNG
- [ ] RaidRNG

##### Gen8a

- [ ] Overworld8aRNG
- [ ] OverworldParam8a

##### Gen8b

- [ ] Roaming8bRNG
- [ ] Wild8bRNG

##### Gen9

- [ ] Encounter9RNG
- [ ] GenerateParam9
- [ ] Tera9RNG

#### Util

- [ ] ShinyUtil
- [ ] ToxtricityUtil

### Structures

- [ ] CheckIdentifier
- [ ] CheckResult
- [ ] LegalInfo
- [ ] Severity

### Tables

- [x] FormChangeUtil
- [ ] FormInfo
- [ ] FormItem
- [ ] MysteryMew
- [x] SpeciesCategory

### Verifiers

- [ ] AwakenedValueVerifier
- [ ] ConsoleRegionVerifier
- [ ] ContestStatVerifier
- [ ] CXDVerifier
- [ ] EffortValueVerifier
- [ ] FormArgumentVerifier
- [ ] FormVerifier
- [ ] GenderVerifier
- [ ] GroundTileVerifier
- [ ] HistoryVerifier
- [ ] HyperTrainingVerifier
- [ ] IndividualValueVerifier
- [ ] ItemVerifier
- [ ] LanguageVerifier
- [ ] LegendsArceusVerifier
- [ ] LevelVerifier
- [ ] MarkingVerifier
- [ ] MarkVerifier
- [ ] MedalVerifier
- [ ] MemoryVerifier
- [ ] MiscVerifier
- [ ] NicknameVerifier
- [ ] ParseSettings
- [ ] PIDVerifier
- [ ] TrainerIDVerifier
- [ ] TrainerNameVerifier
- [ ] TransferVerifier
- [ ] Verifier

#### Ability

- [ ] AbilityBreedLegality
- [ ] AbilityChangeRules
- [ ] AbilityVerifier

#### Ball

- [ ] BallContext6
- [ ] BallContext7
- [ ] BallContextHOME
- [ ] BallContextUtil
- [ ] BallInheritanceResult
- [ ] BallUseLegality
- [ ] BallVerifier
- [ ] IBallContext

#### Egg

- [ ] EggStateLegality

#### Misc

- [ ] ContestStatGranting
- [ ] ContestStatGrantingSheen
- [ ] ContestStatInfo

#### Ribbons

- [ ] MarkRules
- [ ] RibbonResult
- [ ] RibbonResultList
- [ ] RibbonRules
- [ ] RibbonStrings
- [ ] RibbonVerifier
- [ ] RibbonVerifierArguments
- [ ] RibbonVerifierCommon3
- [ ] RibbonVerifierCommon4
- [ ] RibbonVerifierCommon6
- [ ] RibbonVerifierCommon7
- [ ] RibbonVerifierCommon8
- [ ] RibbonVerifierCommon9
- [ ] RibbonVerifierEvent3
- [ ] RibbonVerifierEvent4
- [ ] RibbonVerifierEvent9
- [ ] RibbonVerifierOnly3
- [ ] RibbonVerifierUnique3
- [ ] RibbonVerifierUnique4

## Moves

- [ ] MoveInfo
- [ ] MoveInfo1
- [ ] MoveInfo2
- [ ] MoveInfo3
- [ ] MoveInfo4
- [ ] MoveInfo5
- [ ] MoveInfo6
- [ ] MoveInfo7
- [ ] MoveInfo7b
- [ ] MoveInfo8
- [ ] MoveInfo8a
- [ ] MoveInfo8b
- [ ] MoveInfo9

## Mystery Gifts

- [ ] DataMysteryGift
- [ ] MysteryGift
- [ ] MysteryUtil
- [ ] PCD
- [ ] PGF
- [ ] PGT
- [ ] PL6
- [ ] ShinyType6
- [ ] ShinyType8
- [ ] WA7
- [ ] WB7
- [ ] WB8
- [ ] WC3
- [ ] WC6
- [ ] WC6Full
- [ ] WC7
- [ ] WC7Full
- [ ] WC8
- [ ] WC9
- [ ] WR7

## PersonalInfo

- [ ] PersonalInfo
- [ ] PersonalTable

### Info

- [ ] PersonalInfo1
- [ ] PersonalInfo2
- [ ] PersonalInfo3
- [ ] PersonalInfo4
- [ ] PersonalInfo5B2W2
- [ ] PersonalInfo5BW
- [ ] PersonalInfo6AO
- [ ] PersonalInfo6XY
- [ ] PersonalInfo7
- [ ] PersonalInfo7GG
- [ ] PersonalInfo8BDSP
- [ ] PersonalInfo8LA
- [ ] PersonalInfo8SWSH
- [ ] PersonalInfo9SV

### Interfaces

- [ ] IBaseState
- [ ] IEffortValueYield
- [ ] IGenderDetail
- [ ] IPersonalAbility
- [ ] IPersonalEgg
- [ ] IPersonalEncounter
- [ ] IPersonalFormInfo
- [ ] IPersonalMisc
- [ ] IPersonalTable
- [ ] IPersonalType

### Table

- [ ] PersonalTable1
- [ ] PersonalTable2
- [ ] PersonalTable3
- [ ] PersonalTable4
- [ ] PersonalTable5B2W2
- [ ] PersonalTable5BW
- [ ] PersonalTable6AO
- [ ] PersonalTable6XY
- [ ] PersonalTable7
- [ ] PersonalTable7GG
- [ ] PersonalTable8BDSP
- [ ] PersonalTable8LA
- [ ] PersonalTable8SWSH
- [ ] PersonalTable9SV

## PKM

- [ ] BK4
- [ ] CK3
- [ ] PA8
- [ ] PB7
- [ ] PB8
- [ ] PK1
- [ ] PK2
- [ ] PK3
- [ ] PK4
- [ ] PK5
- [ ] PK6
- [ ] PK7
- [ ] PK8
- [ ] PK9
- [ ] PKM
- [ ] RK4
- [ ] SK2
- [ ] XK3

### Enums

- [x] AlcremieDecoration
- [x] GroundTileType
- [ ] OriginMark
- [x] PokeSize
- [x] PokeSizeDetailed

### HOME

- [ ] GameDataCore
- [ ] GameDataPA8
- [ ] GameDataPB7
- [ ] GameDataPB8
- [ ] GameDataPK8
- [ ] GameDataPK9
- [ ] HomeCrypto
- [ ] HomeGameDataFormat
- [ ] HomeOptional1
- [ ] IGameDataSide
- [ ] IGameDataSplitAbility
- [ ] IHomeStorage
- [ ] IPokerusStatus
- [ ] PKH

### Interfaces

- [ ] IAffection
- [ ] IAlpha
- [ ] IAppliedMarkings
- [ ] IAwakened
- [ ] IBattleVersion
- [ ] ICaughtData2
- [ ] IContestStats
- [ ] IDynamaxLevel
- [ ] IFatefulEncounter
- [ ] IFavorite
- [ ] IFormArgument
- [ ] IGanbaru
- [ ] IGeoTrack
- [ ] IGigantamax
- [ ] IGroundTile
- [ ] IHandlerLanguage
- [ ] IHomeTrack
- [ ] IHyperTrain
- [ ] IMemoryHT
- [ ] IMemoryOT
- [ ] IMoveShop8
- [ ] INature
- [ ] INoble
- [ ] IObedienceLevel
- [ ] IRegionOrigin
- [ ] ISanityChecksum
- [ ] IScaledSize
- [ ] IShadowCapture
- [ ] ISociability
- [ ] ITechRecord
- [ ] ITeraType
- [x] ITrainerID
- [x] ITrainerID32
- [ ] ITrainerMemories

#### Metadata

- [ ] IGameValueLimit
- [ ] IGeneration
- [ ] ILangNick
- [ ] IShiny
- [x] ISpeciesForm

#### Templates

- [ ] IAlphaReadOnly
- [ ] IContestStatsReadOnly
- [ ] IDynamaxLevelReadOnly
- [ ] IFatefulEncounterReadOnly
- [ ] IFixedOTFriendship
- [ ] IGigantamaxReadOnly
- [ ] ILangNicknamedTemplate
- [ ] IMemoryOTReadOnly
- [ ] INatureReadOnly
- [ ] IObedienceLevelReadOnly
- [ ] IScaledSizeReadOnly

### Searching

- [ ] CloneDetectionMethod
- [ ] SearchComparison
- [ ] SearchSettings
- [ ] SearchUtil

### Shared

- [ ] G3PKM
- [ ] G4PKM
- [ ] G6PKM
- [ ] G8PKM
- [ ] GBPKM
- [ ] GBPKML
- [ ] PokeList1
- [ ] PokeList2
- [ ] PokeListGB
- [ ] PokeListType

### Strings

- [ ] StringConverter
- [ ] StringConverter2KOR
- [ ] StringConverter3
- [ ] StringConverter3GC
- [ ] StringConverter4
- [ ] StringConverter4GC
- [ ] StringConverter4Util
- [ ] StringConverter5
- [ ] StringConverter6
- [ ] StringConverter7
- [ ] StringConverter7ZH
- [ ] StringConverter8
- [ ] StringConverter12
- [ ] StringConverter12Transporter
- [ ] StringConverter345
- [ ] StringConverterOption

#### Trash

- [ ] TrashBytes
- [ ] TrashBytes8
- [ ] TrashBytesGB
- [ ] TrashMatch

### Util

- [ ] Conversion
- [ ] EffortValues
- [ ] EntityBlank
- [ ] EntityCharacteristic
- [x] EntityContext
- [ ] EntityDetection
- [ ] EntityFileExtension
- [ ] EntityFileNamer
- [ ] EntityFormat
- [ ] EntityGender
- [ ] EntityPID
- [ ] EntitySorting
- [ ] Experience
- [x] GameConsole
- [ ] Language
- [ ] PKX
- [ ] PokeCrypto
- [ ] RecentTrainerCache
- [ ] SpeciesName

#### Conversion

- [ ] EntityCompatibilitySetting
- [ ] EntityConverter
- [ ] EntityConverterResult
- [ ] EntityConverterResultExtensions
- [ ] EntityRejuvenationSetting
- [ ] FormConverter
- [ ] IEntityRejuvenator
- [ ] ItemConverter
- [ ] SpeciesConverter
- [ ] TransporterLogic

## Resources

## Ribbons

- [ ] IRibbonIndex
- [ ] IRibbonSetAffixed
- [ ] IRibbonSetCommon3
- [ ] IRibbonSetCommon4
- [ ] IRibbonSetCommon6
- [ ] IRibbonSetCommon7
- [ ] IRibbonSetCommon8
- [ ] IRibbonSetCommon9
- [ ] IRibbonSetEvent3
- [ ] IRibbonSetEvent4
- [ ] IRibbonSetMark8
- [ ] IRibbonSetMark9
- [ ] IRibbonSetMemory6
- [ ] RibbonIndex
- [ ] RibbonInfo

### Past

- [ ] IRibbonSetOnly3
- [ ] IRibbonSetUnique4
- [ ] RibbonIndex3
- [ ] RibbonIndex4

## Saves

- [ ] SAV_BEEF
- [ ] SAV_STADIUM
- [ ] SAV1
- [ ] SAV1Stadium
- [ ] SAV1StadiumJ
- [ ] SAV2
- [ ] SAV2Stadium
- [ ] SAV3
- [ ] SAV3Colosseum
- [ ] SAV3E
- [ ] SAV3FRLG
- [ ] SAV3GCMemoryCard
- [ ] SAV3RS
- [ ] SAV3RSBox
- [ ] SAV3XD
- [ ] SAV4
- [ ] SAV4BR
- [ ] SAV4DP
- [ ] SAV4HGSS
- [ ] SAV4Pt
- [ ] SAV4Sinnoh
- [ ] SAV5
- [ ] SAV5B2W2
- [ ] SAV5BW
- [ ] SAV6
- [ ] SAV6AO
- [ ] SAV6AODemo
- [ ] SAV6XY
- [ ] SAV7
- [ ] SAV7b
- [ ] SAV7SM
- [ ] SAV7USUM
- [ ] SAV8BS
- [ ] SAV8LA
- [ ] SAV8SWSH
- [ ] SAV9SV
- [ ] SaveFile
- [ ] SaveFileMetadata
- [ ] SaveFileState

### Abstractions

- [ ] ITrainerInfo
- [ ] SimpleTrainerInfo

### Access

- [ ] ISaveBlock5B2W2
- [ ] ISaveBlock5BW
- [ ] ISaveBlock6AO
- [ ] ISaveBlock6Core
- [ ] ISaveBlock6Main
- [ ] ISaveBlock6XY
- [ ] ISaveBlock7b
- [ ] ISaveBlock7Main
- [ ] ISaveBlock7SM
- [ ] ISaveBlock7USUM
- [ ] ISaveBlock8LA
- [ ] ISaveBlock8Main
- [ ] ISaveBlock8SWSH
- [ ] ISaveBlock9Main
- [ ] ISaveBlockAccessor
- [ ] ISCBlockArray
- [ ] SaveBlockAccessor5B2W2
- [ ] SaveBlockAccessor5BW
- [ ] SaveBlockAccessor6AO
- [ ] SaveBlockAccessor6AODemo
- [ ] SaveBlockAccessor6XY
- [ ] SaveBlockAccessor7b
- [ ] SaveBlockAccessor7SM
- [ ] SaveBlockAccessor7USUM
- [ ] SaveBlockAccessor8LA
- [ ] SaveBlockAccessor8SWSH
- [ ] SaveBlockAccessor9SV
- [ ] SaveBlockMetadata
- [ ] SCBlockAccessor

### Blocks

- [ ] BlockInfo
- [ ] BlockInfo3DS
- [ ] BlockInfo4
- [ ] BlockInfoNDS
- [ ] BlockInfoRSBOX
- [ ] RecordBlock

### Encryption

- [ ] GeniusCrypto

#### MemeCrypto

- [ ] MemeCrypto
- [ ] MemeKey
- [ ] MemeKeyIndex

#### SwishCrypto

- [ ] FnvHash
- [ ] SCBlock
- [ ] SCBlockCompare
- [ ] SCBlockMetadata
- [ ] SCBlockUtil
- [ ] SCTypeCode
- [ ] SCXorShift32
- [ ] SwishCrypto

### Storage

- [ ] Bank3
- [ ] Bank4
- [ ] Bank7
- [ ] BulkStorage
- [ ] PKMImportSetting
- [ ] SAV4Ranch
- [ ] SlotPointerUtil
- [ ] StorageSlotSource

### Substructures

- [ ] IEventFlagArray
- [ ] IMultiplayerSprite
- [ ] ITrainerStatRecord
- [ ] MysteryGiftAlbum
- [ ] Records

#### BattleVideos

- [ ] BattleMode
- [ ] BattleStyle6
- [ ] BattleVideo
- [ ] BV3
- [ ] BV6
- [ ] BV7
- [ ] BVRequestUtil
- [ ] MoveTarget
- [ ] RotateDirection
- [ ] TurnActionCode
- [ ] TurnStartCode
- [ ] TurnStartInstruction

#### Gen3

- [ ] Decoration3
- [ ] DecorationInventory3
- [ ] EReaderBerrySettings
- [ ] Gen3MysteryData
- [ ] HallFame3
- [ ] IGen3Hoenn
- [ ] IGen3Joyful
- [ ] IGen3Wonder
- [ ] PokeBlock3
- [ ] PokeBlock3Case
- [ ] PokeBlock3Color
- [ ] Record3
- [ ] RecordMixing3Gift
- [ ] Roamer3
- [ ] RTC3
- [ ] SAV3BlockDetection
- [ ] SecretBase3
- [ ] SecretBase3PKM
- [ ] SecretBase3Team
- [ ] StrategyMemo
- [ ] Swarm3
- [ ] TrainerHillMode3E
- [ ] TrendyWord3E

##### CXD

- [ ] ShadowInfoEntryColo
- [ ] ShadowInfoEntryXD
- [ ] ShadowInfoTableXD

##### Events

- [ ] MysteryEvent3
- [ ] MysteryEvent3RS
- [ ] WonderCard3
- [ ] WonderCard3Extra
- [ ] WonderNews3

#### Gen4

- [ ] Accessory4
- [ ] Backdrop4
- [ ] BattleFrontierFacility4
- [ ] BattleFrontierPrintStatus4
- [ ] Chatter4
- [ ] Dendou4
- [ ] Geonet4
- [ ] Hall4
- [ ] HoneyTreeUtil
- [ ] HoneyTreeValue
- [ ] Poffin4
- [ ] PoffinCase4
- [ ] PoffinFlavor4
- [ ] PokegearNumber
- [ ] PoketchApp
- [ ] PoketchColor
- [ ] Roamer4
- [ ] SAV4BlockDetection
- [ ] Seal4
- [ ] ToughWord4
- [ ] VillaFurniture4
- [ ] Wallpaper4Pt

##### Ranch

- [ ] RanchLevel
- [ ] RanchMii
- [ ] RanchOwnershipType
- [ ] RanchToy
- [ ] RanchToyType
- [ ] RanchTrainerMii

#### Gen5

- [ ] BattleSubway5
- [ ] BoxLayout5
- [ ] CGearBackground
- [ ] Chatter5
- [ ] Color15Bit
- [ ] Daycare5
- [ ] Encount5
- [ ] Entralink5
- [ ] FestaBlock5
- [ ] Medal5
- [ ] MedalList5
- [ ] Misc5
- [ ] Musical5
- [ ] MyItem5B2W2
- [ ] MyItem5BW
- [ ] MysteryBlock5
- [ ] PassPower5
- [ ] PlayerData5
- [ ] PWTBlock5
- [ ] PWTRecordID
- [ ] Roamer5
- [ ] UnityTower5

##### Entree

- [ ] EntreeForest
- [ ] EntreeForestArea
- [ ] EntreeSlot

#### Gen6

- [ ] BattleBox6
- [ ] BoxLayout6
- [ ] ConfigSave6
- [ ] Encount6
- [ ] Fashion6XY
- [ ] GameTime6
- [ ] HallFame6Entity
- [ ] IGymTeamInfo
- [ ] ItemInfo6
- [ ] LinkBlock6
- [ ] MaisonBlock
- [ ] Misc6AO
- [ ] Misc6XY
- [ ] MyItem6AO
- [ ] MyItem6XY
- [ ] MyStatus6
- [ ] MyStatus6XY
- [ ] MysteryBlock6
- [ ] PlayTime6
- [ ] PSS6
- [ ] Puff6
- [ ] RecordBlock6
- [ ] SangoInfoBlock
- [ ] SecretBase6Block
- [ ] Situation6
- [ ] SubEventLog6
- [ ] SuperTrainBlock
- [ ] TrainerFashion6
- [ ] TrainerSprite6

##### OPower

- [ ] OPower6
- [ ] OPower6Type
- [ ] OPower6Value
- [ ] OPowerFlagSet
- [ ] OPowerFlagState

##### SecretBase

- [ ] SecretBase6
- [ ] SecretBase6GoodPlacement
- [ ] SecretBase6GoodStock
- [ ] SecretBase6PKM
- [ ] SecretBase6Rank

#### Gen7

- [ ] BattleAgency7
- [ ] BattleTree7
- [ ] BoxLayout7
- [ ] ConfigSave7
- [ ] Daycare7
- [ ] EventVarType
- [ ] FashionBlock7
- [ ] FestaFacility
- [ ] FieldMenu7
- [ ] FieldMoveModelSave7
- [ ] GameTime7
- [ ] HallOfFame7
- [ ] JoinFesta7
- [ ] Misc7
- [ ] MyItem7SM
- [ ] MyItem7USUM
- [ ] MyStatus7
- [ ] MysteryBlock7
- [ ] PlayerBattleStyle7
- [ ] PlayerSkinColor7
- [ ] PokeFinder7
- [ ] QR7
- [ ] ResortSave7
- [ ] SAV7BlockIndex
- [ ] SaveBlock
- [ ] Situation7
- [ ] Stamp7
- [ ] WormholeInfoReader

##### LGPE

- [ ] BelugaBlockIndex
- [ ] CaptureRecords
- [ ] ConfigSave7b
- [ ] Coordinates7b
- [ ] EventWork7b
- [ ] Fashion7b
- [ ] GoParkStorage
- [ ] GP1
- [ ] IEventWork
- [ ] Misc7b
- [ ] MyItem7b
- [ ] MyStatus7b
- [ ] PlayTime7b
- [ ] PokeListHeader
- [ ] PouchSize7b
- [ ] WB7Records
- [ ] WR7GiftType

#### Gen8

##### BS

- [ ] BattleTowerWork8b
- [ ] BattleTrainerStatus8b
- [ ] BerryTreeGrowSave8b
- [ ] BoxLayout8b
- [ ] ConfigSave8b
- [ ] Contest8b
- [ ] ContestPhotoLanguage8b
- [ ] Daycare8b
- [ ] EncounterSave8b
- [ ] FieldGimmickSave8b
- [ ] FieldObjectSave8b
- [ ] FlagWork8b
- [ ] Gem8Version
- [ ] MenuSelect8b
- [ ] MyItem8b
- [ ] MyStatus8b
- [ ] MysteryBlock8b
- [ ] Party8b
- [ ] PlayerData8b
- [ ] PlayTime8b
- [ ] PoffinSaveData8b
- [ ] Poketch8b
- [ ] RandomGroup8b
- [ ] Record8b
- [ ] RecordAddData8b
- [ ] SaveItemShortcut8b
- [ ] SealDeco8b
- [ ] SealList8b
- [ ] SealSticker8b
- [ ] SystemData8b
- [ ] UgCountRecord8b
- [ ] UgItemType
- [ ] UgItemUtil
- [ ] UgSaveData8b
- [ ] UndergroundItem8b
- [ ] UndergroundItemList8b
- [ ] UnionSaveData8b
- [ ] Zukan8b
- [ ] ZukanSpinda8b

##### LA

- [ ] BlankBlocks8a
- [ ] BoxLayout8a
- [ ] Coordinates8a
- [ ] Epoch1970Value
- [ ] LastSaved8a
- [ ] MyItem8a
- [ ] MyStatus8a
- [ ] Party8a
- [ ] PlayerFashion8a
- [ ] PlayTime8a

###### Pokedex

- [ ] PokedexConstants8a
- [ ] PokedexResearchTask8a
- [ ] PokedexResearchTaskType8a
- [ ] PokedexSave8a
- [ ] PokedexSaveData
- [ ] PokedexSaveGlobalData
- [ ] PokedexSaveLocalData
- [ ] PokedexSaveResearchEntry
- [ ] PokedexSaveStatisticsEntry
- [ ] PokedexTimeOfDay8a
- [ ] PokedexType8a
- [ ] PokedexUpdateInfo8a

###### Spawners

- [ ] AreaSpawnerSet8a
- [ ] MassiveOutbreakArea8a
- [ ] MassiveOutbreakSet8a
- [ ] MassiveOutbreakSpawner8a
- [ ] MassiveOutbreakSpawnerStatus
- [ ] MassOutbreakSet8a
- [ ] MassOutbreakSpawner8a
- [ ] Spawner8a
- [ ] SpawnerEntry8a
- [ ] SpawnerMeta8a
- [ ] SpawnerUtil8a

##### SWSH

- [ ] BlankBlocks8
- [ ] Box8
- [ ] BoxLayout8
- [ ] Coordinates8
- [ ] Daycare8
- [ ] FashionUnlock8
- [ ] FieldMoveModelSave8
- [ ] Fused8
- [ ] HallOfFameTime8
- [ ] Misc8
- [ ] MyItem8
- [ ] MyStatus8
- [ ] Party8
- [ ] PlayTime8
- [ ] PouchSize8
- [ ] RaidSpawnList8
- [ ] Record8
- [ ] TeamIndexes8
- [ ] TitleScreen8
- [ ] TrainerCard8

##### ValueBlocks

- [ ] MenuOrderOption
- [ ] OptInOption
- [ ] OptOutOption
- [ ] TextSpeedOption

#### Gen9

- [ ] BlankBlocks9
- [ ] BlueberryClubRoom9
- [ ] BlueberryQuestRecord9
- [ ] BoxLayout9
- [ ] ConfigCamera9
- [ ] ConfigSave9
- [ ] DXT1
- [ ] Epoch1900Value
- [ ] FixedSpawnList9
- [ ] MyItem9
- [ ] MyStatus9
- [ ] Party9
- [ ] PlayerAppearance9
- [ ] PlayerFashion9
- [ ] PlayerFashionUnlock9
- [ ] PlayTime9
- [ ] PouchSize9
- [ ] RaidSevenStar9
- [ ] RaidSpawnList9
- [ ] TeamIndexes9
- [ ] ThrowStyle9

#### Gen12

- [ ] G1OverworldSpawner
- [ ] SAV1Offsets
- [ ] SAV2Offsets

#### Inventory

- [ ] IItemFavorite
- [ ] IItemFreeSpace
- [ ] IItemFreeSpaceIndex
- [ ] IItemNewFlag
- [ ] InventoryType
- [ ] MyItem

##### Item

- [ ] InventoryItem
- [ ] InventoryItem7
- [ ] InventoryItem7b
- [ ] InventoryItem8
- [ ] InventoryItem8a
- [ ] InventoryItem8b
- [ ] InventoryItem9

##### Pouch

- [ ] InventoryPouch
- [ ] InventoryPouch3
- [ ] InventoryPouch3GC
- [ ] InventoryPouch4
- [ ] InventoryPouch7
- [ ] InventoryPouch7b
- [ ] InventoryPouch8
- [ ] InventoryPouch8a
- [ ] InventoryPouch8b
- [ ] InventoryPouch9
- [ ] InventoryPouchGB

#### Mail

- [ ] Mail2
- [ ] Mail3
- [ ] Mail4
- [ ] Mail5
- [ ] MailDetail

#### Misc

- [ ] IBoxDetailName
- [ ] IBoxDetailWallpaper
- [ ] IChatter
- [ ] IGameSync
- [ ] IPokeGroup
- [ ] IRecordStatStorage
- [ ] ISaveFileRevision
- [ ] ISecureValueStorage
- [ ] ITeamIndexSet
- [ ] SlotGroup

#### PokeDex

- [ ] Zukan
- [ ] Zukan4
- [ ] Zukan5
- [ ] Zukan6
- [ ] Zukan7
- [ ] Zukan7b
- [ ] Zukan8

##### Gen9

- [ ] DexBlockMode9
- [ ] PokeDexEntry9Kitakami
- [ ] PokeDexEntry9Paldea
- [ ] Zukan9
- [ ] Zukan9Kitakami
- [ ] Zukan9Paldea

#### Rentals

- [ ] IRentalTeam
- [ ] RentalTeam8
- [ ] RentalTeam9
- [ ] RentalTeamSet9

### Util

- [ ] BinaryExportSetting
- [ ] BoxUtil
- [ ] Checksums
- [ ] DexFormUtil
- [ ] IGCSaveFile
- [ ] ILangDeviantSave
- [ ] SaveExtensions
- [ ] SaveFinder
- [ ] SaveUtil
- [ ] StadiumUtil

#### Recognition

- [ ] ISaveHandler
- [ ] SaveHandlerARDS
- [ ] SaveHandlerBizHawk
- [ ] SaveHandlerDeSmuME
- [ ] SaveHandlerGCI
- [ ] SaveHandlerSplitResult

## Util

- [ ] ArrayUtil
- [ ] BinaryCodedDecimal
- [ ] ComboItemUtil
- [ ] DateUtil
- [ ] FileUtil
- [ ] FlagUtil
- [ ] MessageStrings
- [ ] NetUtil
- [ ] PathUtil
- [ ] RandUtil
- [ ] ReflectUtil
- [ ] ResourceUtil
- [ ] StringUtil
- [ ] UpdateUtil
- [ ] Util
- [ ] ValueTypeTypeConverter

### Localization

- [ ] LocatizationUtil
- [ ] LocatizationDescriptionAttribute
- [ ] LocalizeUtil

# PKHeX.Drawing.Misc

# PKHex.Drawing.PokeSprite

# PKHex.Drawing

# PKHeX.WinForms

# Tests/PKHeX.Core.Tests


