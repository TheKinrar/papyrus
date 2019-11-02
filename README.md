# Papyrus

This is a fork of [Paper](https://github.com/PaperMC/Paper) that adds some features that have been proven
useful to me or a project I take part in.

## Main features

- **Blocks and items registration API** - see below (WIP)
- CommandBlockEditEvent and Player#canAlwaysOpenCommandBlocks
- New helper methods to Material

## Planned

- Hybrid online-offline mode with built-in authentication procedure for offline users
- **Entity registration API**

## Blocks and items registration API

*This feature is currently WIP.*

Papyrus allows blocks and items registration at runtime (more precisely, at plugin load time).  
The API is not done yet and is not available in current builds.  
*Material* class has been rewritten and is not an enum anymore. This is obviously a breaking change but
most plugins compiled for CraftBukkit/Spigot/Paper should work fine because of various compatibility layers
that are being applied.  
Plugins that do not work with Papyrus should be reported (please open an issue). 