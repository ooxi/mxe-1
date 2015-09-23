/*
 * This file is part of MXE.
 * See index.html for further information.
 */

#include <enet/enet.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if (enet_initialize() != 0)
    {
        fprintf(stderr, "An error occurred while initializing ENet.\n");
        return EXIT_FAILURE;
    }
    atexit (enet_deinitialize);

    return EXIT_SUCCESS;
}

