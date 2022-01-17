# Changelog for Durex

## v0.3.0

### Removed

* `Durex.parse/1` - Use `Durex.ms/1` insted
* `Durex.parse!/1` - Use `Durex.ms!/1` insted


## v0.2.0

### Additions

* `Durex.ms/1` - parse duration to milliseconds
* `Durex.ms!/1` - parse duration to milliseconds (raise if it fails)


### Hard-Deprecations (warnings emitted)

* Deprecate `Durex.parse/1` in favor of `Durex.ms/1`
* Deprecate `Durex.parse!/1` in favor of `Durex.ms!/1`


## v0.1.0

* Initial release