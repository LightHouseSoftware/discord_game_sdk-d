module discord_game_sdk;

import core.stdc.string : memset;

extern (C) @nogc nothrow:

enum DISCORD_VERSION = 3;
enum DISCORD_APPLICATION_MANAGER_VERSION = 1;
enum DISCORD_USER_MANAGER_VERSION = 1;
enum DISCORD_IMAGE_MANAGER_VERSION = 1;
enum DISCORD_ACTIVITY_MANAGER_VERSION = 1;
enum DISCORD_RELATIONSHIP_MANAGER_VERSION = 1;
enum DISCORD_LOBBY_MANAGER_VERSION = 1;
enum DISCORD_NETWORK_MANAGER_VERSION = 1;
enum DISCORD_OVERLAY_MANAGER_VERSION = 2;
enum DISCORD_STORAGE_MANAGER_VERSION = 1;
enum DISCORD_STORE_MANAGER_VERSION = 1;
enum DISCORD_VOICE_MANAGER_VERSION = 1;
enum DISCORD_ACHIEVEMENT_MANAGER_VERSION = 1;

enum DiscordResult
{
    Ok = 0,
    ServiceUnavailable = 1,
    InvalidVersion = 2,
    LockFailed = 3,
    InternalError = 4,
    InvalidPayload = 5,
    InvalidCommand = 6,
    InvalidPermissions = 7,
    NotFetched = 8,
    NotFound = 9,
    Conflict = 10,
    InvalidSecret = 11,
    InvalidJoinSecret = 12,
    NoEligibleActivity = 13,
    InvalidInvite = 14,
    NotAuthenticated = 15,
    InvalidAccessToken = 16,
    ApplicationMismatch = 17,
    InvalidDataUrl = 18,
    InvalidBase64 = 19,
    NotFiltered = 20,
    LobbyFull = 21,
    InvalidLobbySecret = 22,
    InvalidFilename = 23,
    InvalidFileSize = 24,
    InvalidEntitlement = 25,
    NotInstalled = 26,
    NotRunning = 27,
    InsufficientBuffer = 28,
    PurchaseCanceled = 29,
    InvalidGuild = 30,
    InvalidEvent = 31,
    InvalidChannel = 32,
    InvalidOrigin = 33,
    RateLimited = 34,
    OAuth2Error = 35,
    SelectChannelTimeout = 36,
    GetGuildTimeout = 37,
    SelectVoiceForceRequired = 38,
    CaptureShortcutAlreadyListening = 39,
    UnauthorizedForAchievement = 40,
    InvalidGiftCode = 41,
    PurchaseError = 42,
    TransactionAborted = 43,
    DrawingInitFailed = 44,
}

enum DiscordCreateFlags
{
    Default = 0,
    NoRequireDiscord = 1,
}

enum DiscordLogLevel
{
    Error = 1,
    Warn,
    Info,
    Debug,
}

enum DiscordUserFlag
{
    Partner = 2,
    HypeSquadEvents = 4,
    HypeSquadHouse1 = 64,
    HypeSquadHouse2 = 128,
    HypeSquadHouse3 = 256,
}

enum DiscordPremiumType
{
    None = 0,
    Tier1 = 1,
    Tier2 = 2,
}

enum DiscordImageType
{
    User,
}

enum DiscordActivityPartyPrivacy
{
    Private = 0,
    Public = 1,
}

enum DiscordActivityType
{
    Playing,
    Streaming,
    Listening,
    Watching,
}

enum DiscordActivityActionType
{
    Join = 1,
    Spectate,
}

enum DiscordActivitySupportedPlatformFlags
{
    Desktop = 1,
    Android = 2,
    iOS = 4,
}

enum DiscordActivityJoinRequestReply
{
    No,
    Yes,
    Ignore,
}

enum DiscordStatus
{
    Offline = 0,
    Online = 1,
    Idle = 2,
    DoNotDisturb = 3,
}

enum DiscordRelationshipType
{
    None,
    Friend,
    Blocked,
    PendingIncoming,
    PendingOutgoing,
    Implicit,
}

enum DiscordLobbyType
{
    Private = 1,
    Public,
}

enum DiscordLobbySearchComparison
{
    LessThanOrEqual = -2,
    LessThan,
    Equal,
    GreaterThan,
    GreaterThanOrEqual,
    NotEqual,
}

enum DiscordLobbySearchCast
{
    String = 1,
    Number,
}

enum DiscordLobbySearchDistance
{
    Local,
    Default,
    Extended,
    Global,
}

enum DiscordKeyVariant
{
    Normal,
    Right,
    Left,
}

enum DiscordMouseButton
{
    Left,
    Middle,
    Right,
}

enum DiscordEntitlementType
{
    Purchase = 1,
    PremiumSubscription,
    DeveloperGift,
    TestModePurchase,
    FreePurchase,
    UserGift,
    PremiumPurchase,
}

enum DiscordSkuType
{
    Application = 1,
    DLC,
    Consumable,
    Bundle,
}

enum DiscordInputModeType
{
    VoiceActivity = 0,
    PushToTalk,
}

// types
alias DiscordClientId = long;
alias DiscordVersion = int;
alias DiscordSnowflake = long;
alias DiscordTimestamp = long;
alias DiscordUserId = DiscordSnowflake;
alias DiscordLocale = char[128];
alias DiscordBranch = char[4096];
alias DiscordLobbyId = DiscordSnowflake;
alias DiscordLobbySecret = char[128];
alias DiscordMetadataKey = char[256];
alias DiscordMetadataValue = char[4096];
alias DiscordNetworkPeerId = ulong;
alias DiscordNetworkChannelId = ubyte;
alias DiscordPath = char[4096];
alias DiscordDateTime = char[64];

version (Posix)
{
    alias IDXGISwapChain = void*;
    alias MSG = void*;
}

struct DiscordUser
{
    DiscordUserId id;
    char[256] username;
    char[8] discriminator;
    char[128] avatar;
    bool bot;
}

struct DiscordOAuth2Token
{
    char[128] accessToken;
    char[1024] scopes;
    DiscordTimestamp expires;
}

struct DiscordImageHandle
{
    DiscordImageType type;
    long id;
    uint size;
}

struct DiscordImageDimensions
{
    uint width;
    uint height;
}

struct DiscordActivityTimestamps
{
    DiscordTimestamp start;
    DiscordTimestamp end;
}

struct DiscordActivityAssets
{
    char[128] largeImage;
    char[128] largeText;
    char[128] smallImage;
    char[128] smallText;
}

struct DiscordPartySize
{
    int currentSize;
    int maxSize;
}

struct DiscordActivityParty
{
    char[128] id;
    DiscordPartySize size;
    DiscordActivityPartyPrivacy privacy;
}

struct DiscordActivitySecrets
{
    char[128] match;
    char[128] join;
    char[128] spectate;
}

struct DiscordActivity
{
    DiscordActivityType type;
    long applicationId;
    char[128] name;
    char[128] state;
    char[128] details;
    DiscordActivityTimestamps timestamps;
    DiscordActivityAssets assets;
    DiscordActivityParty party;
    DiscordActivitySecrets secrets;
    bool instance;
    uint supportedPlatforms;
}

struct DiscordPresence
{
    DiscordStatus status;
    DiscordActivity activity;
}

struct DiscordRelationship
{
    DiscordRelationshipType type;
    DiscordUser user;
    DiscordPresence presence;
}

struct DiscordLobby
{
    DiscordSnowflake id;
    DiscordLobbyType type;
    DiscordUserId ownerId;
    char[128] secret;
    uint capacity;
    bool locked;
}

struct DiscordImeUnderline
{
    int from;
    int to;
    uint color;
    uint backgroundColor;
    bool thick;
}

struct DiscordRect
{
    int left;
    int top;
    int right;
    int bottom;
}

struct DiscordFileStat
{
    char[260] filename;
    ulong size;
    ulong last_modified;
}

struct DiscordEntitlement
{
    DiscordSnowflake id;
    DiscordEntitlementType type;
    DiscordSnowflake skuId;
}

struct DiscordSkuPrice
{
    uint amount;
    char[16] currency;
}

struct DiscordSku
{
    DiscordSnowflake id;
    DiscordSkuType type;
    char[256] name;
    DiscordSkuPrice price;
}

struct DiscordInputMode
{
    DiscordInputModeType type;
    char[256] shortcut;
}

struct DiscordUserAchievement
{
    DiscordSnowflake userId;
    DiscordSnowflake achievementId;
    ubyte percentComplete;
    DiscordDateTime unlockedAt;
}

struct IDiscordLobbyTransaction
{
    private
    {
        DiscordResult function(IDiscordLobbyTransaction*, DiscordLobbyType) set_typeFunc;
        DiscordResult function(IDiscordLobbyTransaction*, DiscordUserId) set_ownerFunc;
        DiscordResult function(IDiscordLobbyTransaction*, uint) set_capacityFunc;
        DiscordResult function(IDiscordLobbyTransaction*, DiscordMetadataKey, DiscordMetadataValue) set_metadataFunc;
        DiscordResult function(IDiscordLobbyTransaction*, DiscordMetadataKey) delete_metadataFunc;
        DiscordResult function(IDiscordLobbyTransaction*, bool) set_lockedFunc;
    }

    DiscordResult setType(DiscordLobbyType type)
    {
        return set_typeFunc(&this, type);
    }

    DiscordResult setOwner(DiscordUserId ownerId)
    {
        return set_ownerFunc(&this, ownerId);
    }

    DiscordResult setCapacity(uint capacity)
    {
        return set_capacityFunc(&this, capacity);
    }

    DiscordResult setMetadata(DiscordMetadataKey key, DiscordMetadataValue value)
    {
        return set_metadataFunc(&this, key, value);
    }

    DiscordResult deleteMetadata(DiscordMetadataKey key)
    {
        return delete_metadataFunc(&this, key);
    }

    DiscordResult setLocked(bool locked)
    {
        return set_lockedFunc(&this, locked);
    }
}

struct IDiscordLobbyMemberTransaction
{
    private
    {
        DiscordResult function(IDiscordLobbyMemberTransaction*, DiscordMetadataKey, DiscordMetadataValue) set_metadataFunc;
        DiscordResult function(IDiscordLobbyMemberTransaction*, DiscordMetadataKey) delete_metadataFunc;
    }

    DiscordResult setMetadata(DiscordMetadataKey key, DiscordMetadataValue value)
    {
        return set_metadataFunc(&this, key, value);
    }

    DiscordResult deleteMetadata(DiscordMetadataKey key)
    {
        return delete_metadataFunc(&this, key);
    }
}

struct IDiscordLobbySearchQuery
{
    private
    {
        DiscordResult function(IDiscordLobbySearchQuery*, DiscordMetadataKey, DiscordLobbySearchComparison, DiscordLobbySearchCast, DiscordMetadataValue) filterFunc;
        DiscordResult function(IDiscordLobbySearchQuery*, DiscordMetadataKey, DiscordLobbySearchCast, DiscordMetadataValue) sortFunc;
        DiscordResult function(IDiscordLobbySearchQuery*, uint) limitFunc;
        DiscordResult function(IDiscordLobbySearchQuery*, DiscordLobbySearchDistance) distanceFunc;
    }

    DiscordResult filter(DiscordMetadataKey key, DiscordLobbySearchComparison comparison, DiscordLobbySearchCast searchCast, DiscordMetadataValue value)
    {
        return filterFunc(&this, key, comparison, searchCast, value);
    }

    DiscordResult sort(DiscordMetadataKey key, DiscordLobbySearchCast searchCast, DiscordMetadataValue value)
    {
        return sortFunc(&this, key, searchCast, value);
    }

    DiscordResult limit(uint limit)
    {
        return limitFunc(&this, limit);
    }

    DiscordResult distance(DiscordLobbySearchDistance searchDistance)
    {
        return distanceFunc(&this, searchDistance);
    }
}

alias IDiscordApplicationEvents = void*;

struct IDiscordApplicationManager
{
    private
    {
        void function(IDiscordApplicationManager*, void*, void function(void*, DiscordResult)) validate_or_exitFunc;
        void function(IDiscordApplicationManager*, DiscordLocale*) get_current_localeFunc;
        void function(IDiscordApplicationManager*, DiscordBranch*) get_current_branchFunc;
        void function(IDiscordApplicationManager*, void*, void function(void*, DiscordResult, DiscordOAuth2Token*)) get_oauth2_tokenFunc;
        void function(IDiscordApplicationManager*, void*, void function(void*, DiscordResult, const(char)*)) get_ticketFunc;
    }

    void validateOrExit(void* callbackData, void function(void*, DiscordResult) callback)
    {
        validate_or_exitFunc(&this, callbackData, callback);
    }

    void getCurrentLocale(DiscordLocale* locale)
    {
        get_current_localeFunc(&this, locale);
    }

    void getCurrentBranch(DiscordBranch* branch)
    {
        get_current_branchFunc(&this, branch);
    }

    void getOauth2Token(void* callbackData, void function(void*, DiscordResult, DiscordOAuth2Token*) callback)
    {
        get_oauth2_tokenFunc(&this, callbackData, callback);
    }

    void getTicket(void* callbackData, void function(void*, DiscordResult, const(char)*) callback)
    {
        get_ticketFunc(&this, callbackData, callback);
    }
}

struct IDiscordUserEvents
{
    void function(void*) onCurrentUserUpdate;
}

struct IDiscordUserManager
{
    private
    {
        DiscordResult function(IDiscordUserManager*, DiscordUser*) get_current_userFunc;
        void function(IDiscordUserManager*, DiscordUserId, void*, void function(void*, DiscordResult, DiscordUser*)) get_userFunc;
        DiscordResult function(IDiscordUserManager*, DiscordPremiumType*) get_current_user_premium_typeFunc;
        DiscordResult function(IDiscordUserManager*, DiscordUserFlag, bool*) current_user_has_flagFunc;
    }

    DiscordResult getCurrentUser(DiscordUser* user)
    {
        return get_current_userFunc(&this, user);
    }

    void getUser(DiscordUserId userId, void* callbackData, void function(void*, DiscordResult, DiscordUser*) callback)
    {
        get_userFunc(&this, userId, callbackData, callback);
    }

    DiscordResult getCurrentUserPremiumType(DiscordPremiumType* premiumType)
    {
        return get_current_user_premium_typeFunc(&this, premiumType);
    }

    DiscordResult currentUserHasFlag(DiscordUserFlag flag, bool* hasFlag)
    {
        return current_user_has_flagFunc(&this, flag, hasFlag);
    }
}

alias IDiscordImageEvents = void*;

struct IDiscordImageManager
{
    private
    {
        void function(IDiscordImageManager*, DiscordImageHandle, bool, void*, void function(void*, DiscordResult, DiscordImageHandle)) fetchFunc;
        DiscordResult function(IDiscordImageManager*, DiscordImageHandle, DiscordImageDimensions*) get_dimensionsFunc;
        DiscordResult function(IDiscordImageManager*, DiscordImageHandle, ubyte*, uint) get_dataFunc;
    }

    void fetch(DiscordImageHandle handle, bool refresh, void* callbackData, void function(void*, DiscordResult, DiscordImageHandle) callback)
    {
        fetchFunc(&this, handle, refresh, callbackData, callback);
    }

    DiscordResult getDimensions(DiscordImageHandle handle, DiscordImageDimensions* dimensions)
    {
        return get_dimensionsFunc(&this, handle, dimensions);
    }

    DiscordResult getData(DiscordImageHandle handle, ubyte* data, uint dataLength)
    {
        return get_dataFunc(&this, handle, data, dataLength);
    }
}

struct IDiscordActivityEvents
{
    void function(void*, const(char)*) onActivityJoin;
    void function(void*, const(char)*) onActivitySpectate;
    void function(void*, DiscordUser*) onActivityJoinRequest;
    void function(void*, DiscordActivityActionType, DiscordUser*, DiscordActivity*) onActivityInvite;
}

struct IDiscordActivityManager
{
    private
    {
        DiscordResult function(IDiscordActivityManager*, const(char)*) register_commandFunc;
        DiscordResult function(IDiscordActivityManager*, uint) register_steamFunc;
        void function(IDiscordActivityManager*, DiscordActivity*, void*, void function(void*, DiscordResult)) update_activityFunc;
        void function(IDiscordActivityManager*, void*, void function(void*, DiscordResult)) clear_activityFunc;
        void function(IDiscordActivityManager*, DiscordUserId, DiscordActivityJoinRequestReply, void*, void function(void*, DiscordResult)) send_request_replyFunc;
        void function(IDiscordActivityManager*, DiscordUserId, DiscordActivityActionType, const(char)*, void*, void function(void*, DiscordResult)) send_inviteFunc;
        void function(IDiscordActivityManager*, DiscordUserId, void*, void function(void*, DiscordResult)) accept_inviteFunc;
    }

    DiscordResult registerCommand(const(char)* command)
    {
        return register_commandFunc(&this, command);
    }

    DiscordResult registerSteam(uint steamId)
    {
        return register_steamFunc(&this, steamId);
    }

    extern (D) void updateActivity(DiscordActivity* activity, void function(DiscordResult) callback)
    {
        update_activityFunc(&this, activity, cast(void*) callback, &callbackWrapper);
    }

    extern (D) void clearActivity(void function(DiscordResult) callback)
    {
        clear_activityFunc(&this, cast(void*) callback, &callbackWrapper);
    }

    extern (D) void sendRequestReply(DiscordUserId userId, DiscordActivityJoinRequestReply reply, void function(
            DiscordResult) callback)
    {
        send_request_replyFunc(&this, userId, reply, cast(void*) callback, &callbackWrapper);
    }

    extern (D) void sendInvite(DiscordUserId userId, DiscordActivityActionType actionType, const(
            char)* content, void function(DiscordResult) callback)
    {
        send_inviteFunc(&this, userId, actionType, content, cast(void*) callback, &callbackWrapper);
    }

    extern (D) void acceptInvite(DiscordUserId userId, void function(DiscordResult) callback)
    {
        accept_inviteFunc(&this, userId, cast(void*) callback, &callbackWrapper);
    }

    private static void callbackWrapper(void* data, DiscordResult result)
    {
        auto func = cast(void function(DiscordResult) nothrow) data;
        func(result);
    }
}

struct IDiscordRelationshipEvents
{
    void function(void*) onRefresh;
    void function(void*, DiscordRelationship*) onRelationshipUpdate;
}

struct IDiscordRelationshipManager
{
    private
    {
        void function(IDiscordRelationshipManager*, void*, bool function(void*, DiscordRelationship*)) filterFunc;
        DiscordResult function(IDiscordRelationshipManager*, int*) countFunc;
        DiscordResult function(IDiscordRelationshipManager*, DiscordUserId, DiscordRelationship*) getFunc;
        DiscordResult function(IDiscordRelationshipManager*, uint, DiscordRelationship*) get_atFunc;
    }

    extern (D) void filter(bool function(DiscordRelationship*) callback)
    {
        filterFunc(&this, null, &callbackWrapper);
    }

    DiscordResult count(int* count)
    {
        return countFunc(&this, count);
    }

    DiscordResult get(DiscordUserId userId, DiscordRelationship* relationship)
    {
        return getFunc(&this, userId, relationship);
    }

    DiscordResult getAt(uint index, DiscordRelationship* relationship)
    {
        return get_atFunc(&this, index, relationship);
    }

    private static bool callbackWrapper(void* data, DiscordRelationship* relationship)
    {
        auto func = cast(bool function(DiscordRelationship*) nothrow) data;
        return func(relationship);
    }
}

struct IDiscordLobbyEvents
{
    void function(void*, long) onLobbyUpdate;
    void function(void*, long, uint) onLobbyDelete;
    void function(void*, long, long) onMemberConnect;
    void function(void*, long, long) onMemberUpdate;
    void function(void*, long, long) onMemberDisconnect;
    void function(void*, long, long, ubyte*, uint) onLobbyMessage;
    void function(void*, long, long, bool) onSpeaking;
    void function(void*, long, long, ubyte, ubyte*, uint) onNetworkMessage;
}

struct IDiscordLobbyManager
{
    private
    {
        DiscordResult function(IDiscordLobbyManager*, IDiscordLobbyTransaction**) get_lobby_create_transactionFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, IDiscordLobbyTransaction**) get_lobby_update_transactionFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, IDiscordLobbyMemberTransaction**) get_member_update_transactionFunc;
        void function(IDiscordLobbyManager*, IDiscordLobbyTransaction*, void*, void function(void*, DiscordResult, DiscordLobby*)) create_lobbyFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, IDiscordLobbyTransaction*, void*, void function(void*, DiscordResult)) update_lobbyFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, void*, void function(void*, DiscordResult)) delete_lobbyFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, DiscordLobbySecret, void*, void function(void*, DiscordResult, DiscordLobby*)) connect_lobbyFunc;
        void function(IDiscordLobbyManager*, DiscordLobbySecret, void*, void function(void*, DiscordResult, DiscordLobby*)) connect_lobby_with_activity_secretFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, void*, void function(void*, DiscordResult)) disconnect_lobbyFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordLobby*) get_lobbyFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordLobbySecret*) get_lobby_activity_secretFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordMetadataKey, DiscordMetadataValue*) get_lobby_metadata_valueFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, int, DiscordMetadataKey*) get_lobby_metadata_keyFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, int*) lobby_metadata_countFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, int*) member_countFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, int, DiscordUserId*) get_member_user_idFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, DiscordUser*) get_member_userFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, DiscordMetadataKey, DiscordMetadataValue*) get_member_metadata_valueFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, int, DiscordMetadataKey*) get_member_metadata_keyFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, int*) member_metadata_countFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, IDiscordLobbyMemberTransaction*, void*, void function(void*, DiscordResult)) update_memberFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, ubyte*, uint, void*, void function(void*, DiscordResult)) send_lobby_messageFunc;
        DiscordResult function(IDiscordLobbyManager*, IDiscordLobbySearchQuery**) get_search_queryFunc;
        void function(IDiscordLobbyManager*, IDiscordLobbySearchQuery*, void*, void function(void*, DiscordResult)) searchFunc;
        void function(IDiscordLobbyManager*, int*) lobby_countFunc;
        DiscordResult function(IDiscordLobbyManager*, int, DiscordLobbyId*) get_lobby_idFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, void*, void function(void*, DiscordResult)) connect_voiceFunc;
        void function(IDiscordLobbyManager*, DiscordLobbyId, void*, void function(void*, DiscordResult)) disconnect_voiceFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId) connect_networkFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId) disconnect_networkFunc;
        DiscordResult function(IDiscordLobbyManager*) flush_networkFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, ubyte, bool) open_network_channelFunc;
        DiscordResult function(IDiscordLobbyManager*, DiscordLobbyId, DiscordUserId, ubyte, ubyte*, uint) send_network_messageFunc;
    }

    DiscordResult getLobbyCreateTransaction(IDiscordLobbyTransaction** transaction)
    {
        return get_lobby_create_transactionFunc(&this, transaction);
    }

    DiscordResult getLobbyUpdateTransaction(DiscordLobbyId lobbyId, IDiscordLobbyTransaction** transaction)
    {
        return get_lobby_update_transactionFunc(&this, lobbyId, transaction);
    }

    DiscordResult getMemberUpdateTransaction(DiscordLobbyId lobbyId, DiscordUserId userId, IDiscordLobbyMemberTransaction** transaction)
    {
        return get_member_update_transactionFunc(&this, lobbyId, userId, transaction);
    }

    void createLobby(IDiscordLobbyTransaction* transaction, void function(DiscordResult, DiscordLobby*) callback)
    {
        create_lobbyFunc(&this, transaction, cast(void*) callback, &lobbyCallbackWrapper);
    }

    void updateLobby(DiscordLobbyId lobbyId, IDiscordLobbyTransaction* transaction, void function(DiscordResult) callback)
    {
        update_lobbyFunc(&this, lobbyId, transaction, cast(void*) callback, &resultCallbackWrapper);
    }

    void deleteLobby(DiscordLobbyId lobbyId, void function(DiscordResult) callback)
    {
        delete_lobbyFunc(&this, lobbyId, cast(void*) callback, &resultCallbackWrapper);
    }

    void connectLobby(DiscordLobbyId lobbyId, DiscordLobbySecret secret, void function(DiscordResult, DiscordLobby*) callback)
    {
        connect_lobbyFunc(&this, lobbyId, secret, cast(void*) callback, &lobbyCallbackWrapper);
    }

    void connectLobbyWithActivitySecret(DiscordLobbySecret activitySecret, void function(DiscordResult, DiscordLobby*) callback)
    {
        connect_lobby_with_activity_secretFunc(&this, activitySecret, cast(void*) callback, &lobbyCallbackWrapper);
    }

    void disconnectLobby(DiscordLobbyId lobbyId, void function(DiscordResult) callback)
    {
        disconnect_lobbyFunc(&this, lobbyId, cast(void*) callback, &resultCallbackWrapper);
    }

    DiscordResult getLobby(DiscordLobbyId lobbyId, DiscordLobby* lobby)
    {
        return get_lobbyFunc(&this, lobbyId, lobby);
    }

    DiscordResult getLobbyActivitySecret(DiscordLobbyId lobbyId, DiscordLobbySecret* secret)
    {
        return get_lobby_activity_secretFunc(&this, lobbyId, secret);
    }

    DiscordResult getLobbyMetadataValue(DiscordLobbyId lobbyId, DiscordMetadataKey key, DiscordMetadataValue* value)
    {
        return get_lobby_metadata_valueFunc(&this, lobbyId, key, value);
    }

    DiscordResult getLobbyMetadataKey(DiscordLobbyId lobbyId, int index, DiscordMetadataKey* key)
    {
        return get_lobby_metadata_keyFunc(&this, lobbyId, index, key);
    }

    DiscordResult lobbyMetadataCount(DiscordLobbyId lobbyId, int* count)
    {
        return lobby_metadata_countFunc(&this, lobbyId, count);
    }

    DiscordResult memberCount(DiscordLobbyId lobbyId, int* count)
    {
        return member_countFunc(&this, lobbyId, count);
    }

    DiscordResult getMemberUserId(DiscordLobbyId lobbyId, int index, DiscordUserId* userId)
    {
        return get_member_user_idFunc(&this, lobbyId, index, userId);
    }

    DiscordResult getMemberUser(DiscordLobbyId lobbyId, DiscordUserId userId, DiscordUser* user)
    {
        return get_member_userFunc(&this, lobbyId, userId, user);
    }

    DiscordResult getMemberMetadataValue(DiscordLobbyId lobbyId, DiscordUserId userId, DiscordMetadataKey key, DiscordMetadataValue* value)
    {
        return get_member_metadata_valueFunc(&this, lobbyId, userId, key, value);
    }

    DiscordResult getMemberMetadataKey(DiscordLobbyId lobbyId, DiscordUserId userId, int index, DiscordMetadataKey* key)
    {
        return get_member_metadata_keyFunc(&this, lobbyId, userId, index, key);
    }

    DiscordResult memberMetadataCount(DiscordLobbyId lobbyId, DiscordUserId userId, int* count)
    {
        return member_metadata_countFunc(&this, lobbyId, userId, count);
    }

    void updateMember(DiscordLobbyId lobbyId, DiscordUserId userId, IDiscordLobbyMemberTransaction* transaction, void function(DiscordResult) callback)
    {
        update_memberFunc(&this, lobbyId, userId, transaction, cast(void*) callback, &resultCallbackWrapper);
    }

    void sendLobbyMessage(DiscordLobbyId lobbyId, ubyte* data, uint dataLength, void function(DiscordResult) callback)
    {
        send_lobby_messageFunc(&this, lobbyId, data, dataLength, cast(void*) callback, &resultCallbackWrapper);
    }

    DiscordResult getSearchQuery(IDiscordLobbySearchQuery** query)
    {
        return get_search_queryFunc(&this, query);
    }

    void search(IDiscordLobbySearchQuery* query, void function(DiscordResult) callback)
    {
        searchFunc(&this, query, cast(void*) callback, &resultCallbackWrapper);
    }

    void lobbyCount(int* count)
    {
        lobby_countFunc(&this, count);
    }

    DiscordResult getLobbyId(int index, DiscordLobbyId* lobbyId)
    {
        return get_lobby_idFunc(&this, index, lobbyId);
    }

    void connectVoice(DiscordLobbyId lobbyId, void function(DiscordResult) callback)
    {
        connect_voiceFunc(&this, lobbyId, cast(void*) callback, &resultCallbackWrapper);
    }

    void disconnectVoice(DiscordLobbyId lobbyId, void function(DiscordResult) callback)
    {
        disconnect_voiceFunc(&this, lobbyId, cast(void*) callback, &resultCallbackWrapper);
    }

    DiscordResult connectNetwork(DiscordLobbyId lobbyId)
    {
        return connect_networkFunc(&this, lobbyId);
    }

    DiscordResult disconnectNetwork(DiscordLobbyId lobbyId)
    {
        return disconnect_networkFunc(&this, lobbyId);
    }

    DiscordResult flushNetwork()
    {
        return flush_networkFunc(&this);
    }

    DiscordResult openNetworkChannel(DiscordLobbyId lobbyId, ubyte channelId, bool reliable)
    {
        return open_network_channelFunc(&this, lobbyId, channelId, reliable);
    }

    DiscordResult sendNetworkMessage(DiscordLobbyId lobbyId, DiscordUserId userId, ubyte channelId, ubyte* data, uint dataLength)
    {
        return send_network_messageFunc(&this, lobbyId, userId, channelId, data, dataLength);
    }

    private static void lobbyCallbackWrapper(void* data, DiscordResult result, DiscordLobby* lobby)
    {
        auto func = cast(void function(DiscordResult, DiscordLobby*) nothrow) data;
        func(result, lobby);
    }

    private static void resultCallbackWrapper(void* data, DiscordResult result)
    {
        auto func = cast(void function(DiscordResult) nothrow) data;
        func(result);
    }
}

struct IDiscordNetworkEvents
{
    void function(void*, DiscordNetworkPeerId, DiscordNetworkChannelId, ubyte*, uint) onMessage;
    void function(void*, const(char)*) onRouteUpdate;
}

struct IDiscordNetworkManager
{
    private
    {
        void function(IDiscordNetworkManager*, DiscordNetworkPeerId*) get_peer_idFunc;
        DiscordResult function(IDiscordNetworkManager*) flushFunc;
        DiscordResult function(IDiscordNetworkManager*, DiscordNetworkPeerId, const(char)*) open_peerFunc;
        DiscordResult function(IDiscordNetworkManager*, DiscordNetworkPeerId, const(char)*) update_peerFunc;
        DiscordResult function(IDiscordNetworkManager*, DiscordNetworkPeerId) close_peerFunc;
        DiscordResult function(IDiscordNetworkManager*, DiscordNetworkPeerId, DiscordNetworkChannelId, bool) open_channelFunc;
        DiscordResult function(IDiscordNetworkManager*, DiscordNetworkPeerId, DiscordNetworkChannelId) close_channelFunc;
        DiscordResult function(IDiscordNetworkManager*, DiscordNetworkPeerId, DiscordNetworkChannelId, ubyte*, uint) send_messageFunc;
    }

    /**
    * Get the local peer ID for this process.
    */
    void getPeerId(DiscordNetworkPeerId* peerId)
    {
        get_peer_idFunc(&this, peerId);
    }

    /**
    * Send pending network messages.
    */
    DiscordResult flush()
    {
        return flushFunc(&this);
    }

    /**
    * Open a connection to a remote peer.
    */
    DiscordResult openPeer(DiscordNetworkPeerId peerId, const(char)* routeData)
    {
        return open_peerFunc(&this, peerId, routeData);
    }

    /**
    * Update the route data for a connected peer.
    */
    DiscordResult updatePeer(DiscordNetworkPeerId peerId, const(char)* routeData)
    {
        return update_peerFunc(&this, peerId, routeData);
    }

    /**
    * Close the connection to a remote peer.
    */
    DiscordResult closePeer(DiscordNetworkPeerId peerId)
    {
        return close_peerFunc(&this, peerId);
    }

    /**
    * Open a message channel to a connected peer.
    */
    DiscordResult openChannel(DiscordNetworkPeerId peerId, DiscordNetworkChannelId channelId, bool reliable)
    {
        return open_channelFunc(&this, peerId, channelId, reliable);
    }

    /**
    * Close a message channel to a connected peer.
    */
    DiscordResult closeChannel(DiscordNetworkPeerId peerId, DiscordNetworkChannelId channelId)
    {
        return close_channelFunc(&this, peerId, channelId);
    }

    /**
    * Send a message to a connected peer over an opened message channel.
    */
    DiscordResult sendMessage(DiscordNetworkPeerId peerId, DiscordNetworkChannelId channelId, ubyte* data, uint dataLength)
    {
        return send_messageFunc(&this, peerId, channelId, data, dataLength);
    }
}

struct IDiscordOverlayEvents
{
    void function(void*, bool) onToggle;
}

struct IDiscordOverlayManager
{
    private
    {
        void function(IDiscordOverlayManager*, bool*) is_enabledFunc;
        void function(IDiscordOverlayManager*, bool*) is_lockedFunc;
        void function(IDiscordOverlayManager*, bool, void*, void function(void*, DiscordResult)) set_lockedFunc;
        void function(IDiscordOverlayManager*, DiscordActivityActionType, void*, void function(void*, DiscordResult)) open_activity_inviteFunc;
        void function(IDiscordOverlayManager*, const(char)*, void*, void function(void*, DiscordResult)) open_guild_inviteFunc;
        void function(IDiscordOverlayManager*, void*, void function(void*, DiscordResult)) open_voice_settingsFunc;
        DiscordResult function(IDiscordOverlayManager*, void*, bool) init_drawing_dxgiFunc;
        void function(IDiscordOverlayManager*) on_presentFunc;
        void function(IDiscordOverlayManager*, void*) forward_messageFunc;
        void function(IDiscordOverlayManager*, bool, const(char)*, DiscordKeyVariant) key_eventFunc;
        void function(IDiscordOverlayManager*, const(char)*) char_eventFunc;
        void function(IDiscordOverlayManager*, ubyte, int, DiscordMouseButton, int, int) mouse_button_eventFunc;
        void function(IDiscordOverlayManager*, int, int) mouse_motion_eventFunc;
        void function(IDiscordOverlayManager*, const(char)*) ime_commit_textFunc;
        void function(IDiscordOverlayManager*, const(char)*, DiscordImeUnderline*, uint, int, int) ime_set_compositionFunc;
        void function(IDiscordOverlayManager*) ime_cancel_compositionFunc;
        void function(IDiscordOverlayManager*, void*, void function(void*, int, int, DiscordRect*, uint)) set_ime_composition_range_callbackFunc;
        void function(IDiscordOverlayManager*, void*, void function(void*, DiscordRect, DiscordRect, bool)) set_ime_selection_bounds_callbackFunc;
        bool function(IDiscordOverlayManager*, int, int) is_point_inside_click_zoneFunc;
    }

    void isEnabled(bool* enabled)
    {
        is_enabledFunc(&this, enabled);
    }

    void isLocked(bool* locked)
    {
        is_lockedFunc(&this, locked);
    }

    void setLocked(bool locked, void function(DiscordResult) callback)
    {
        set_lockedFunc(&this, locked, cast(void*) callback, &resultCallbackWrapper);
    }

    void openActivityInvite(DiscordActivityActionType type, void function(DiscordResult) callback)
    {
        open_activity_inviteFunc(&this, type, cast(void*) callback, &resultCallbackWrapper);
    }

    void openGuildInvite(const(char)* code, void function(DiscordResult) callback)
    {
        open_guild_inviteFunc(&this, code, cast(void*) callback, &resultCallbackWrapper);
    }

    void openVoiceSettings(void function(DiscordResult) callback)
    {
        open_voice_settingsFunc(&this, cast(void*) callback, &resultCallbackWrapper);
    }

    DiscordResult initDrawingDxgi(void* swapChain, bool useMessageForwarding)
    {
        return init_drawing_dxgiFunc(&this, swapChain, useMessageForwarding);
    }

    void onPresent()
    {
        on_presentFunc(&this);
    }

    void forwardMessage(void* message)
    {
        forward_messageFunc(&this, message);
    }

    void keyEvent(bool down, const(char)* keyCode, DiscordKeyVariant variant)
    {
        key_eventFunc(&this, down, keyCode, variant);
    }

    void charEvent(const(char)* character)
    {
        char_eventFunc(&this, character);
    }

    void mouseButtonEvent(ubyte down, int clickCount, DiscordMouseButton button, int x, int y)
    {
        mouse_button_eventFunc(&this, down, clickCount, button, x, y);
    }

    void mouseMotionEvent(int x, int y)
    {
        mouse_motion_eventFunc(&this, x, y);
    }

    void imeCommitText(const(char)* text)
    {
        ime_commit_textFunc(&this, text);
    }

    void imeSetComposition(const(char)* text, DiscordImeUnderline* underlines, uint underlineLength, int from, int to)
    {
        ime_set_compositionFunc(&this, text, underlines, underlineLength, from, to);
    }

    void imeCancelComposition()
    {
        ime_cancel_compositionFunc(&this);
    }

    void setImeCompositionRangeCallback(void function(int, int, DiscordRect*, uint) callback)
    {
        set_ime_composition_range_callbackFunc(&this, cast(void*) callback, &imeCompositionCallbackWrapper);
    }

    void setImeSelectionBoundsCallback(void function(DiscordRect, DiscordRect, bool) callback)
    {
        set_ime_selection_bounds_callbackFunc(&this, cast(void*) callback, &imeSelectionBoundsCallbackWrapper);
    }

    bool isPointInsideClickZone(int x, int y)
    {
        return is_point_inside_click_zoneFunc(&this, x, y);
    }

    private static void resultCallbackWrapper(void* data, DiscordResult result)
    {
        auto func = cast(void function(DiscordResult) nothrow) data;
        func(result);
    }

    private static void imeCompositionCallbackWrapper(void* data, int from, int to, DiscordRect* bounds, uint boundsLength)
    {
        auto func = cast(void function(int, int, DiscordRect*, uint) nothrow) data;
        func(from, to, bounds, boundsLength);
    }

    private static void imeSelectionBoundsCallbackWrapper(void* data, DiscordRect anchor, DiscordRect focus, bool isAnchorFirst)
    {
        auto func = cast(void function(DiscordRect, DiscordRect, bool) nothrow) data;
        func(anchor, focus, isAnchorFirst);
    }
}

alias IDiscordStorageEvents = void*;

struct IDiscordStorageManager
{
    private
    {
        DiscordResult function(IDiscordStorageManager*, const(char)*, ubyte*, uint, uint*) readFunc;
        void function(IDiscordStorageManager*, const(char)*, void*, void function(void*, DiscordResult, ubyte*, uint)) read_asyncFunc;
        void function(IDiscordStorageManager*, const(char)*, ulong, ulong, void*, void function(void*, DiscordResult, ubyte*, uint)) read_async_partialFunc;
        DiscordResult function(IDiscordStorageManager*, const(char)*, ubyte*, uint) writeFunc;
        void function(IDiscordStorageManager*, const(char)*, ubyte*, uint, void*, void function(void*, DiscordResult)) write_asyncFunc;
        DiscordResult function(IDiscordStorageManager*, const(char)*) delete_Func;
        DiscordResult function(IDiscordStorageManager*, const(char)*, bool*) existsFunc;
        void function(IDiscordStorageManager*, int*) countFunc;
        DiscordResult function(IDiscordStorageManager*, const(char)*, DiscordFileStat*) statFunc;
        DiscordResult function(IDiscordStorageManager*, int, DiscordFileStat*) stat_atFunc;
        DiscordResult function(IDiscordStorageManager*, DiscordPath*) get_pathFunc;
    }

    DiscordResult read(const(char)* name, ubyte* data, uint dataLength, uint* read)
    {
        return readFunc(&this, name, data, dataLength, read);
    }

    void readAsync(const(char)* name, void* callbackData, void function(void*, DiscordResult, ubyte*, uint) callback)
    {
        read_asyncFunc(&this, name, callbackData, callback);
    }

    void readAsyncPartial(const(char)* name, ulong offset, ulong length, void* callbackData, void function(void*, DiscordResult, ubyte*, uint) callback)
    {
        read_async_partialFunc(&this, name, offset, length, callbackData, callback);
    }

    DiscordResult write(const(char)* name, ubyte* data, uint dataLength)
    {
        return writeFunc(&this, name, data, dataLength);
    }

    void writeAsync(const(char)* name, ubyte* data, uint dataLength, void* callbackData, void function(void*, DiscordResult) callback)
    {
        write_asyncFunc(&this, name, data, dataLength, callbackData, callback);
    }

    DiscordResult delete_(const(char)* name)
    {
        return delete_Func(&this, name);
    }

    DiscordResult exists(const(char)* name, bool* exists)
    {
        return existsFunc(&this, name, exists);
    }

    void count(int* count)
    {
        countFunc(&this, count);
    }

    DiscordResult stat(const(char)* name, DiscordFileStat* stat)
    {
        return statFunc(&this, name, stat);
    }

    DiscordResult statAt(int index, DiscordFileStat* stat)
    {
        return stat_atFunc(&this, index, stat);
    }

    DiscordResult getPath(DiscordPath* path)
    {
        return get_pathFunc(&this, path);
    }
}

struct IDiscordStoreEvents
{
    void function(void*, DiscordEntitlement*) onEntitlementCreate;
    void function(void*, DiscordEntitlement*) onEntitlementDelete;
}

struct IDiscordStoreManager
{
    private
    {
        void function(IDiscordStoreManager*, void*, void function(void*, DiscordResult)) fetch_skusFunc;
        void function(IDiscordStoreManager*, int*) count_skusFunc;
        DiscordResult function(IDiscordStoreManager*, DiscordSnowflake, DiscordSku*) get_skuFunc;
        DiscordResult function(IDiscordStoreManager*, int, DiscordSku*) get_sku_atFunc;
        void function(IDiscordStoreManager*, void*, void function(void*, DiscordResult)) fetch_entitlementsFunc;
        void function(IDiscordStoreManager*, int*) count_entitlementsFunc;
        DiscordResult function(IDiscordStoreManager*, DiscordSnowflake, DiscordEntitlement*) get_entitlementFunc;
        DiscordResult function(IDiscordStoreManager*, int, DiscordEntitlement*) get_entitlement_atFunc;
        DiscordResult function(IDiscordStoreManager*, DiscordSnowflake, bool*) has_sku_entitlementFunc;
        void function(IDiscordStoreManager*, DiscordSnowflake, void*, void function(void*, DiscordResult)) start_purchaseFunc;
    }

    void fetchSkus(void function(DiscordResult) callback)
    {
        fetch_skusFunc(&this, cast(void*) callback, &resultCallbackWrapper);
    }

    void countSkus(int* count)
    {
        count_skusFunc(&this, count);
    }

    DiscordResult getSku(DiscordSnowflake skuId, DiscordSku* sku)
    {
        return get_skuFunc(&this, skuId, sku);
    }

    DiscordResult getSkuAt(int index, DiscordSku* sku)
    {
        return get_sku_atFunc(&this, index, sku);
    }

    void fetchEntitlements(void function(DiscordResult) callback)
    {
        fetch_entitlementsFunc(&this, cast(void*) callback, &resultCallbackWrapper);
    }

    void countEntitlements(int* count)
    {
        count_entitlementsFunc(&this, count);
    }

    DiscordResult getEntitlement(DiscordSnowflake entitlementId, DiscordEntitlement* entitlement)
    {
        return get_entitlementFunc(&this, entitlementId, entitlement);
    }

    DiscordResult getEntitlementAt(int index, DiscordEntitlement* entitlement)
    {
        return get_entitlement_atFunc(&this, index, entitlement);
    }

    DiscordResult hasSkuEntitlement(DiscordSnowflake skuId, bool* hasEntitlement)
    {
        return has_sku_entitlementFunc(&this, skuId, hasEntitlement);
    }

    void startPurchase(DiscordSnowflake skuId, void function(DiscordResult) callback)
    {
        start_purchaseFunc(&this, skuId, cast(void*) callback, &resultCallbackWrapper);
    }

    private static void resultCallbackWrapper(void* data, DiscordResult result)
    {
        auto func = cast(void function(DiscordResult) nothrow) data;
        func(result);
    }
}

struct IDiscordVoiceEvents
{
    void function(void*) onSettingsUpdate;
}

struct IDiscordVoiceManager
{
    private
    {
        DiscordResult function(IDiscordVoiceManager*, DiscordInputMode*) get_input_modeFunc;
        void function(IDiscordVoiceManager*, DiscordInputMode, void*, void function(void*, DiscordResult)) set_input_modeFunc;
        DiscordResult function(IDiscordVoiceManager*, bool*) is_self_muteFunc;
        DiscordResult function(IDiscordVoiceManager*, bool) set_self_muteFunc;
        DiscordResult function(IDiscordVoiceManager*, bool*) is_self_deafFunc;
        DiscordResult function(IDiscordVoiceManager*, bool) set_self_deafFunc;
        DiscordResult function(IDiscordVoiceManager*, DiscordSnowflake, bool*) is_local_muteFunc;
        DiscordResult function(IDiscordVoiceManager*, DiscordSnowflake, bool) set_local_muteFunc;
        DiscordResult function(IDiscordVoiceManager*, DiscordSnowflake, ubyte*) get_local_volumeFunc;
        DiscordResult function(IDiscordVoiceManager*, DiscordSnowflake, ubyte) set_local_volumeFunc;
    }

    DiscordResult getInputMode(DiscordInputMode* inputMode)
    {
        return get_input_modeFunc(&this, inputMode);
    }

    void setInputMode(DiscordInputMode inputMode, void function(DiscordResult) callback)
    {
        set_input_modeFunc(&this, inputMode, cast(void*) callback, &resultCallbackWrapper);
    }

    DiscordResult isSelfMute(bool* mute)
    {
        return is_self_muteFunc(&this, mute);
    }

    DiscordResult setSelfMute(bool mute)
    {
        return set_self_muteFunc(&this, mute);
    }

    DiscordResult isSelfDeaf(bool* deaf)
    {
        return is_self_deafFunc(&this, deaf);
    }

    DiscordResult setSelfDeaf(bool deaf)
    {
        return set_self_deafFunc(&this, deaf);
    }

    DiscordResult isLocalMute(DiscordSnowflake userId, bool* mute)
    {
        return is_local_muteFunc(&this, userId, mute);
    }

    DiscordResult setLocalMute(DiscordSnowflake userId, bool mute)
    {
        return set_local_muteFunc(&this, userId, mute);
    }

    DiscordResult getLocalVolume(DiscordSnowflake userId, ubyte* volume)
    {
        return get_local_volumeFunc(&this, userId, volume);
    }

    DiscordResult setLocalVolume(DiscordSnowflake userId, ubyte volume)
    {
        return set_local_volumeFunc(&this, userId, volume);
    }

    private static void resultCallbackWrapper(void* data, DiscordResult result)
    {
        auto func = cast(void function(DiscordResult) nothrow) data;
        func(result);
    }
}

struct IDiscordAchievementEvents
{
    void function(void*, DiscordUserAchievement*) onUserAchievementUpdate;
}

struct IDiscordAchievementManager
{
    private
    {
        void function(IDiscordAchievementManager*, DiscordSnowflake, ubyte, void*, void function(void*, DiscordResult)) set_user_achievementFunc;
        void function(IDiscordAchievementManager*, void*, void function(void*, DiscordResult)) fetch_user_achievementsFunc;
        void function(IDiscordAchievementManager*, int*) count_user_achievementsFunc;
        DiscordResult function(IDiscordAchievementManager*, DiscordSnowflake, DiscordUserAchievement*) get_user_achievementFunc;
        DiscordResult function(IDiscordAchievementManager*, int, DiscordUserAchievement*) get_user_achievement_atFunc;
    }

    void setUserAchievement(DiscordSnowflake achievementId, ubyte percentComplete, void function(
            DiscordResult) callback)
    {
        set_user_achievementFunc(&this, achievementId, percentComplete, cast(void*) callback, &resultCallbackWrapper);
    }

    void fetchUserAchievements(void function(DiscordResult) callback)
    {
        fetch_user_achievementsFunc(&this, cast(void*) callback, &resultCallbackWrapper);
    }

    void countUserAchievements(int* count)
    {
        count_user_achievementsFunc(&this, count);
    }

    DiscordResult getUserAchievement(DiscordSnowflake achievementId, DiscordUserAchievement* userAchievement)
    {
        return get_user_achievementFunc(&this, achievementId, userAchievement);
    }

    DiscordResult getUserAchievementAt(int index, DiscordUserAchievement* userAchievement)
    {
        return get_user_achievement_atFunc(&this, index, userAchievement);
    }

    private static void resultCallbackWrapper(void* data, DiscordResult result)
    {
        auto func = cast(void function(DiscordResult) nothrow) data;
        func(result);
    }
}

alias IDiscordCoreEvents = void*;

struct IDiscordCore
{
    private
    {
        void function(IDiscordCore*) destroyFunc;
        DiscordResult function(IDiscordCore*) run_callbacksFunc;
        void function(IDiscordCore*, DiscordLogLevel, void*, void function(void*, DiscordLogLevel, const(char)*)) set_log_hookFunc;
        IDiscordApplicationManager* function(IDiscordCore*) get_application_managerFunc;
        IDiscordUserManager* function(IDiscordCore*) get_user_managerFunc;
        IDiscordImageManager* function(IDiscordCore*) get_image_managerFunc;
        IDiscordActivityManager* function(IDiscordCore*) get_activity_managerFunc;
        IDiscordRelationshipManager* function(IDiscordCore*) get_relationship_managerFunc;
        IDiscordLobbyManager* function(IDiscordCore*) get_lobby_managerFunc;
        IDiscordNetworkManager* function(IDiscordCore*) get_network_managerFunc;
        IDiscordOverlayManager* function(IDiscordCore*) get_overlay_managerFunc;
        IDiscordStorageManager* function(IDiscordCore*) get_storage_managerFunc;
        IDiscordStoreManager* function(IDiscordCore*) get_store_managerFunc;
        IDiscordVoiceManager* function(IDiscordCore*) get_voice_managerFunc;
        IDiscordAchievementManager* function(IDiscordCore*) get_achievement_managerFunc;
    }

    void destroy()
    {
        destroyFunc(&this);
    }

    DiscordResult runCallbacks()
    {
        return run_callbacksFunc(&this);
    }

    void setLogHook(DiscordLogLevel minLevel, void function(DiscordLogLevel, const(char)*) hook)
    {
        set_log_hookFunc(&this, minLevel, cast(void*) hook, &logHookCallbackWrapper);
    }

    IDiscordApplicationManager* getApplicationManager()
    {
        return get_application_managerFunc(&this);
    }

    IDiscordUserManager* getUserManager()
    {
        return get_user_managerFunc(&this);
    }

    IDiscordImageManager* getImageManager()
    {
        return get_image_managerFunc(&this);
    }

    IDiscordActivityManager* getActivityManager()
    {
        return get_activity_managerFunc(&this);
    }

    IDiscordRelationshipManager* getRelationshipManager()
    {
        return get_relationship_managerFunc(&this);
    }

    IDiscordLobbyManager* getLobbyManager()
    {
        return get_lobby_managerFunc(&this);
    }

    IDiscordNetworkManager* getNetworkManager()
    {
        return get_network_managerFunc(&this);
    }

    IDiscordOverlayManager* getOverlayManager()
    {
        return get_overlay_managerFunc(&this);
    }

    IDiscordStorageManager* getStorageManager()
    {
        return get_storage_managerFunc(&this);
    }

    IDiscordStoreManager* getStoreManager()
    {
        return get_store_managerFunc(&this);
    }

    IDiscordVoiceManager* getVoiceManager()
    {
        return get_voice_managerFunc(&this);
    }

    IDiscordAchievementManager* getAchievementManager()
    {
        return get_achievement_managerFunc(&this);
    }

    private static void logHookCallbackWrapper(void* data, DiscordLogLevel level, const(char)* message)
    {
        auto func = cast(void function(DiscordLogLevel, const(char)*) nothrow) data;
        func(level, message);
    }
}

struct DiscordCreateParams
{
    DiscordClientId clientId;
    ulong flags;
    IDiscordCoreEvents* events;
    void* eventData;
    IDiscordApplicationEvents* applicationEvents;
    DiscordVersion applicationVersion;
    IDiscordUserEvents* userEvents;
    DiscordVersion userVersion;
    IDiscordImageEvents* imageEvents;
    DiscordVersion imageVersion;
    IDiscordActivityEvents* activityEvents;
    DiscordVersion activityVersion;
    IDiscordRelationshipEvents* relationshipEvents;
    DiscordVersion relationshipVersion;
    IDiscordLobbyEvents* lobbyEvents;
    DiscordVersion lobbyVersion;
    IDiscordNetworkEvents* networkEvents;
    DiscordVersion networkVersion;
    IDiscordOverlayEvents* overlayEvents;
    DiscordVersion overlayVersion;
    IDiscordStorageEvents* storageEvents;
    DiscordVersion storageVersion;
    IDiscordStoreEvents* storeEvents;
    DiscordVersion storeVersion;
    IDiscordVoiceEvents* voiceEvents;
    DiscordVersion voiceVersion;
    IDiscordAchievementEvents* achievementEvents;
    DiscordVersion achievementVersion;
}

void DiscordCreateParamsSetDefault(DiscordCreateParams* params)
{
    memset(params, 0, DiscordCreateParams.sizeof);
    params.applicationVersion = DISCORD_APPLICATION_MANAGER_VERSION;
    params.userVersion = DISCORD_USER_MANAGER_VERSION;
    params.imageVersion = DISCORD_IMAGE_MANAGER_VERSION;
    params.activityVersion = DISCORD_ACTIVITY_MANAGER_VERSION;
    params.relationshipVersion = DISCORD_RELATIONSHIP_MANAGER_VERSION;
    params.lobbyVersion = DISCORD_LOBBY_MANAGER_VERSION;
    params.networkVersion = DISCORD_NETWORK_MANAGER_VERSION;
    params.overlayVersion = DISCORD_OVERLAY_MANAGER_VERSION;
    params.storageVersion = DISCORD_STORAGE_MANAGER_VERSION;
    params.storeVersion = DISCORD_STORE_MANAGER_VERSION;
    params.voiceVersion = DISCORD_VOICE_MANAGER_VERSION;
    params.achievementVersion = DISCORD_ACHIEVEMENT_MANAGER_VERSION;
}

DiscordResult DiscordCreate(DiscordVersion ver, DiscordCreateParams * params, IDiscordCore** result);