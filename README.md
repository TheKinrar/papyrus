# Papyrus

This is a fork of [Paper](https://github.com/PaperMC/Paper) that adds some features and APIs I use on my server.

The project aims at being a drop-in replacement for Paper with ideally zero breaking changes in the default
configuration. This should be the case in most situations.

## Features

Many features were removed when updating to 1.19. The 1.18 branch README still contains the previous feature set. 

- `noWeight`, `noDeceleration`, `maxVectorLength` API on Minecart to unleash their full power
- `disableVanillaEntityCollisions` API on Entity
- [SmartListener](#smartlistener)
- Player canSeePlayerEntities API that allows hiding all other player entities to a player
- Block#getCenter

### SmartListener

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
