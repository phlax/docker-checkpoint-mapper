# docker-triggers

Daemon to trigger scripts in response to Docker events


## Example

Config

The following config placed in `/etc/docker-triggers/config.json`
will trigger the `do-something` script whenever a `container` or
a `service` emit one of the events listed, on condition that the
emitted event matches ones onf the listed triggers. The triggers
are `jq` selectors.

```json
{
    "filters": [
        "type=container",
        "type=service",
        "event=connect",
        "event=checkpoint",
        "event=start",
        "event=mount",
        "event=pause",
        "event=unpause",
        "event=create"],
    "triggers": {
        "/usr/local/bin/do-something": [
            ". | select(.from | test(\"nginx\"))",
            ". | select(.from | test(\"redis\"))"]
    }
}

```
