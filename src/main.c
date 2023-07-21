#include <stdio.h>
#include "aes-stream.h"

int main() {
    aes_stream_state * st;
    unsigned char opaque[((AES_STREAM_ROUNDS) + 1) * 16 + 16];
    st = &opaque;
    unsigned char seed[AES_STREAM_SEEDBYTES];
    unsigned char buf[100];
    size_t buf_len = 100;
    aes_stream_init(st, seed);
    aes_stream(st, buf, buf_len);
    for (int i = 0; i < buf_len; i++) {
        printf("%d\n", buf[i]);
    }
}
