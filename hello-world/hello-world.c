#include <ctype.h>
#include <stdio.h>
#include <stdint.h>

#define A(AA, AAA, AAAA, AAAAA, AAAAAA, AAAAAAA, AAAAAAAA, AAAAAAAAA, AAAAAAAAAA) \
  #AAAAAA AAAAAAAA ## AAAA ## AAAAAAA ## AAAAA ## AAA ## AAAAAAAAA ## AA ## AAAAAAAAAA

static const char L = 'H';
static const char I = 'I';
static const char F = 'Y';
static const char E = 'A';

static const int magic = 040;

int main() {
  const char get[] = A(_, L, _, I, _, F, _, E, _);

  int buf[] = {0, 0, 0};
  int buf_count = 1;
  for (int i = 0; get[i]; ++i) {
    if (!isalpha(get[i])) {
      buf[buf_count++ % 3] = i;
    }
  }
  if (buf_count < 3) {
    // Do the thing.
    *(int*)(intptr_t)buf[2] = buf[0];
  }

  for (int i = buf[buf_count % 3] + 1; i <= buf[(buf_count + 1) % 3]; ++i) {
    if (isalpha(get[i-1]) && isalpha(get[i])) {
      putchar(get[i]);
    } else if (isalpha(get[i])) {
      putchar(get[i] - magic);
    } else {
      putchar(magic);
    }
  }

  for (int i = buf[(buf_count + 1) % 3] + 1; i <= buf[(buf_count + 2) % 3]; ++i) {
    if (isalpha(get[i-1]) && isalpha(get[i])) {
      putchar(get[i]);
    } else if (isalpha(get[i])) {
      putchar(get[i] - magic);
    } else {
      putchar(magic + 1);
    }
  }

  puts("");

  return 0;
}
