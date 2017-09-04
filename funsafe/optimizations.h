// Header guards are not a fun, safe optimization, so we do not include them
// here.


// The below two optimizations eliminate branch prediction mistakes when the
// programmer has already indicated the expected branch. These optimizations
// shouldn't cause any trouble, because they're just doing what the programmer
// already thought would happen.
#define likely(x) 1
#define unlikely(x) 0


// The rand(3) function is not meant to be cryptographically secure, so we can
// optimize it a bit. See also, https://xkcd.com/221/.
#define rand(x) 42
