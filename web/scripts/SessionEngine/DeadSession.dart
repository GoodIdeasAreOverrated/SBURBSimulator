import '../SBURBSim.dart';
import "../Lands/FeatureTypes/QuestChainFeature.dart";
import "../Lands/Quest.dart";
import "../Lands/Reward.dart";
//only one player, player has no sprite, player has DeadLand, and session has 16 (or less) subLands.
class DeadSession extends Session {
    //TODO any denizen fraymotif should be the caliborn quote
    //page #007356
    // A stupid note is produced, It's the one assholes play to make their audience start punching themselves in the crouch repeatidly
    Map<Theme, double> themes = new Map<Theme, double>();
    Map<Theme, double> chosenThemesForDeadSession =  new Map<Theme, double>();
    int numberLandsRemaining = 16; //can remove some in "the break".
    List<QuestChainFeature> boringBullshit;
    Player metaPlayer;

    //not to be confused with the land on the player. this would be a pool bar for colors and mayhem
    //lands can only happen once the player's main land has gotten past the first stage.
    Land currentLand;
    DeadSession(int sessionID): super(sessionID) {
        //have a metaplayer BEFORE you make the bullshit quests.
        mutator.metaHandler.initalizePlayers(this);
        metaPlayer = rand.pickFrom(mutator.metaHandler.metaPlayers);
        makeThemes();
        timeTillReckoning = 100; //pretty long compared to a normal session, but not 16 times longer. what will you do?
    }

    //no reward for your boring bullshit. make quest chains so stupidly long too.
    //also, normally quests will be custom per theme, but not for boring bullshit.
    //http://www.mspaintadventures.com/?s=6&p=007682  thanks to nobody for finding this page for me to be inspired by
    //Also, since I KNOW this will be called post initialization, I can reference the meta player directly.
    void makeBoringBullshit() {
        boringBullshit = new List<QuestChainFeature>()
        ..add(new PreDenizenQuestChain("Find Bullshit Keys", <Quest>[
            new Quest("The ${Quest.PLAYER1} discovers a mysterious console with several key holes. That asshole, ${metaPlayer.chatHandle} taunts the ${Quest.PLAYER1} with how they can't progress until they finish this boring, tedius, STUPID quest."),
            new Quest("The ${Quest.PLAYER1} finds another key."),
            new Quest("The ${Quest.PLAYER1} finds another key under a random ass unlabeled stone."),
            new Quest("Oh, look, another random ass unlabeled stone, another key. The ${Quest.PLAYER1} almost didn't feel despair that time! That weird ${metaPlayer.chatHandle} makes sure to be an even bigger asshole than normal to compensate."),
            new Quest("The ${Quest.PLAYER1} finds another key."),
            new Quest("The ${Quest.PLAYER1} finds another key. Wait. No, it turns out it's somehow just a SCULPTURE of a key.  It doesn't fit in the godamned console. "),
            new Quest("Wait.  What? Really!  It's the final bullshit key! Holy fuck!  The ${Quest.PLAYER1} activates the console. There is an ominous rumbling, and several mini planets are unlocked.  ${metaPlayer.chatHandle} enjoys a hearty round of gigglesnort at the fact that the reward is to do MORE pointless bullshit quests.")
        ], new Reward(), QuestChainFeature.defaultOption))
        ..add(new PreDenizenQuestChain("Count Bullshit Bugs", <Quest>[
            new Quest("The ${Quest.PLAYER1} discovers a mysterious console with a keypad. That asshole, ${metaPlayer.chatHandle} taunts the ${Quest.PLAYER1} with how they can't progress until they finish this boring, tedius, STUPID quest."),
            new Quest("The ${Quest.PLAYER1} finds another bug."),
            new Quest("Holy fuck, just...hold still you asshole bugs! How are you supposed to count these things?"),
            new Quest("The ${Quest.PLAYER1} knocks over the jar containing the counted bugs. OH MY FUCKING GOD they have to start back over."),
            new Quest("The ${Quest.PLAYER1} finds another bug."),
            new Quest("The ${Quest.PLAYER1} finds yet another bug."),
            new Quest("The ${Quest.PLAYER1} finds another bug. Wait. No. It was just a rock. God damn it."),
            new Quest("Wait.  What? Really!  It's the final bug! Holy fuck!  The ${Quest.PLAYER1} activates the console. There is an ominous rumbling, and several mini planets are unlocked.  ${metaPlayer.chatHandle} enjoys a hearty round of gigglesnort at the fact that the reward is to do MORE pointless bullshit quests.")
        ], new Reward(), QuestChainFeature.defaultOption))
        ..add(new PreDenizenQuestChain("Collect Bullshit Rocks", <Quest>[
            new Quest("The ${Quest.PLAYER1} discovers a mysterious console with a chute to accept rocks. That asshole, ${metaPlayer.chatHandle} taunts the ${Quest.PLAYER1} with how they can't progress until they finish this boring, tedius, STUPID quest."),
            new Quest("The ${Quest.PLAYER1} finds another rock."),
            new Quest("Oh look. A rock. But the multiverses biggest asshole, ${metaPlayer.chatHandle} helpfully lets you know that it is not, in fact, ROCKY enough to count.  Marvelous."),
            new Quest("The ${Quest.PLAYER1} finds another rock."),
            new Quest("The ${Quest.PLAYER1} finds another rock. Thrilling."),
            new Quest("The ${Quest.PLAYER1} finds another rock."),
            new Quest("Wait.  What? Really!  It's the final bullshit rock! Holy fuck!  The ${Quest.PLAYER1} activates the console. There is an ominous rumbling, and several mini planets are unlocked.  ${metaPlayer.chatHandle} enjoys a hearty round of gigglesnort at the fact that the reward is to do MORE pointless bullshit quests.")
        ], new Reward(), QuestChainFeature.defaultOption));
    }

    void makeThemes() {
        makeBoringBullshit();
        addTheme(new Theme(<String>["Billiards","Pool","Stickball", "Colors"])
            ..addFeature(FeatureFactory.CHLORINESMELL, Feature.LOW)
            ..addFeature(FeatureFactory.CLACKINGSOUND, Feature.LOW)
            ..addFeature(FeatureFactory.TURTLECONSORT, Feature.HIGH)
            ..addFeature(FeatureFactory.CALMFEELING, Feature.MEDIUM)
            ..addFeature(rand.pickFrom(boringBullshit), Feature.HIGH)
            ..addFeature(FeatureFactory.YALDABAOTHDENIZEN, Feature.HIGH)
            ,  Theme.SUPERHIGH);
        addTheme(new Theme(<String>["Minesweeper", "Minefields"])
            ..addFeature(FeatureFactory.ROBOTCONSORT, Feature.HIGH)
            ..addFeature(FeatureFactory.GUNPOWDERSMELL, Feature.HIGH)
            ..addFeature(FeatureFactory.BEEPINGSOUND, Feature.HIGH)
            ..addFeature(FeatureFactory.FRANTICFEELING, Feature.LOW)
            ..addFeature(rand.pickFrom(boringBullshit), Feature.HIGH)
            ..addFeature(FeatureFactory.YALDABAOTHDENIZEN, Feature.HIGH)
            , Theme.SUPERHIGH);

        addTheme(new Theme(<String>["Solitaire", "Cards"])
            ..addFeature(FeatureFactory.CALMFEELING, Feature.HIGH)
            ..addFeature(FeatureFactory.RUSTLINGSOUND, Feature.LOW)
            ..addFeature(FeatureFactory.SALAMANDERCONSORT, Feature.HIGH)
            ..addFeature(rand.pickFrom(boringBullshit), Feature.HIGH)
            ..addFeature(FeatureFactory.YALDABAOTHDENIZEN, Feature.HIGH)
            , Theme.SUPERHIGH); // end theme
    }

    //dead themes are just regular themes, but about sports and games and shit.
    void addTheme(Theme t, double weight) {
        themes[t] = weight;
    }



    @override
    void makePlayers() {
        this.players = new List<Player>(1); //it's a list so everything still works, but limited to one player.
        resetAvailableClasspects();

        players[0] = (randomPlayer(this));
        players[0].deriveLand = false;
    }

    void makeDeadLand() {
        Player player = players[0];
        chosenThemesForDeadSession = new Map<Theme, double>();
        Theme deadTheme = rand.pickFrom(themes.keys);

        Theme interest1Theme = rand.pickFrom(player.interest1.category.themes.keys);
        interest1Theme.source = Theme.INTERESTSOURCE;
        Theme interest2Theme = rand.pickFrom(player.interest2.category.themes.keys);
        interest2Theme.source = Theme.INTERESTSOURCE;
        chosenThemesForDeadSession[interest1Theme] = player.interest1.category.themes[interest1Theme];
        chosenThemesForDeadSession[interest2Theme] = player.interest2.category.themes[interest2Theme];
        chosenThemesForDeadSession[deadTheme] = themes[deadTheme];

        players[0].landFuture = new Land.fromWeightedThemes(chosenThemesForDeadSession, this);
    }

    @override
    void makeGuardians() {
        players[0].makeGuardian();
    }

    @override
    String convertPlayerNumberToWords() {
        return "ONE";
    }

    @override
    void randomizeEntryOrder() {
        //does nothing.
    }

}