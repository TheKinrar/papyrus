# Papyrus

This is a fork of [Paper](https://github.com/PaperMC/Paper) that adds some features that have been proven
useful to me or a project I take part in.

The project aims at being a drop-in replacement for Paper with ideally zero breaking changes in the default
configuration. This should be the case in most situations.

## Main features

- Hybrid online-offline mode that allows online players to login as usual while offline players need to use login and
  register commands. This requires the use of [Waterdrop](https://git.atlanti.se/papyrus/waterdrop) proxy.
- [Forge handshake support](#forge-support)
- [SmartListener](#smartlistener)
- Player canSeePlayerEntities API that allows hiding all other players to a player
- CommandBlockEditEvent and Player#canAlwaysOpenCommandBlocks
- CommandBlockExecuteEvent
- ServerShutdownEvent
- Skeleton getAttackDelay and setAttackDelay
- New Material helper methods
- Compatibility with old command block selectors (like `@a[r=3,m=2]`) in plugin commands
- VersionFetcher#isUpToDate
- `show-invalid-bed-message` world config
- `forceUpgradeWorlds` command line option to filter worlds when using `forceUpgrade`, and ETA when force-upgrading
- `ignoreChunkMismatch` command line option to hide these errors
- [Blocks and items registration API (WIP)](#blocks-and-items-registration-api)

## Forge support

Right now Papyrus supports the forge handshake protocol, meaning it will appear as a forge server to forge clients,
while connecting but also in the server list. Mods used by forge clients are logged.

In the long term it should support more of the protocol, allowing for seamless integration of the
[block / item registration API](#blocks-and-items-registration-api) with forge client mods. 

## SmartListener

This is very similar to the usual `Listener` class but supports the use of event filters that can be used to
replace long conditions on the beginning on event handlers. A few filters are provided but custom ones can easily
be written. Filters can be mixed using `and`, `or` and `negate`.

```java
public class MyListener extends SmartListener {

    public MyListener() {
        setFilter(new WorldFilter(MyPlugin.getMyWorld()));
    }
    
    // ...
}
```

In this example only events that occur in the provided world will be sent to the handlers.

## Blocks and items registration API

*This feature is currently WIP.*

Papyrus allows blocks and items registration at runtime (more precisely, at plugin load time).  
The API is not done yet and is not available in current builds.  
*Material* class has been rewritten and is not an enum anymore. This is obviously a breaking change but
most plugins compiled for CraftBukkit/Spigot/Paper should work fine because of various compatibility layers
that are being applied.  
Plugins that do not work with Papyrus should be reported (please open an issue). 
