/* A color map designed by Guillaume Roullet: a blue-to-red pattern with warming up
   in the middle, white instead of green, and with interleaved darkened and whitened
   stripes. Optimized for displaying detail in quasi-contour fashion. */
static int cmap_roullet[] = {  91, 96,152,  63, 70,156,  21, 32,159,   4, 16,162,
     0, 13,164,   0, 13,160,   0, 11,134,   0,  5, 66,   0,  2, 23,   0,  7, 77,   0, 14,147,
     0, 17,177,   0, 20,185,   5, 25,188,  28, 46,190,  82, 95,193, 117,126,195,  76, 91,197,
    25, 46,199,   4, 30,201,   0, 27,202,   0, 27,197,   0, 23,167,   0, 14, 97,   0,  8, 58,
     0, 17,115,   0, 29,183,   0, 34,209,   1, 37,216,   7, 44,218,  35, 68,220,  99,121,221,
   132,150,222,  82,110,224,  25, 66,225,   4, 50,226,   0, 49,226,   0, 48,220,   0, 42,186,
     0, 26,115,   0, 19, 80,   0, 35,141,   0, 52,206,   0, 60,230,   1, 64,235,   8, 72,237,
    42, 98,237, 111,148,238, 141,171,239,  84,133,240,  25, 95,241,   4, 83,241,   0, 83,240,
     0, 82,232,   0, 71,196,   0, 46,123,   0, 36, 94,   0, 62,158,   0, 89,220,   0,101,241,
     2,107,246,  11,115,247,  48,139,247, 120,180,248, 146,195,248,  83,165,249,  25,139,249,
     6,133,249,   3,134,248,   3,133,239,   3,114,200,   2, 74,125,   2, 62,102,   4,105,169,
     6,146,228,   8,163,248,  11,170,251,  22,178,252,  62,195,252, 133,219,252, 152,226,253,
    91,213,253,  40,205,253,  25,206,253,  25,209,251,  26,205,241,  23,173,199,  16,111,124,
    15, 98,107,  28,165,177,  41,222,233,  48,243,250,  55,251,253,  68,254,252, 106,254,249,
   164,254,249, 177,254,248, 131,254,241, 100,254,233,  95,254,228,  99,252,224, 101,240,211,
    88,195,170,  57,121,104,  56,111, 95,  97,182,155, 133,235,200, 150,251,213, 160,254,216,
   172,254,218, 194,254,226, 220,254,238, 226,254,239, 212,254,231, 207,254,227, 210,254,227,
   214,252,228, 209,239,219, 171,191,177, 107,117,110, 106,114,108, 177,187,179, 229,237,230,
   245,252,246, 250,254,251, 253,254,253, 254,254,254, 254,254,254, 254,254,254, 254,254,254,
   253,254,253, 251,254,250, 246,252,245, 230,237,229, 179,187,177, 108,114,106, 110,117,107,
   177,191,171, 219,239,209, 228,252,214, 227,254,210, 227,254,207, 231,254,212, 239,254,226,
   238,254,220, 226,254,194, 218,254,172, 216,254,160, 213,251,150, 200,235,133, 155,182, 97,
    95,111, 56, 104,121, 57, 170,195, 88, 211,240,101, 224,252, 99, 228,254, 95, 233,254,100,
   241,254,131, 248,254,177, 249,254,164, 249,254,106, 252,254, 68, 253,251, 55, 250,243, 48,
   233,222, 41, 177,165, 28, 107, 98, 15, 124,111, 16, 199,173, 23, 241,205, 26, 251,209, 25,
   253,206, 25, 253,205, 40, 253,213, 91, 253,226,152, 252,219,133, 252,195, 62, 252,178, 22,
   251,170, 11, 248,163,  8, 228,146,  6, 169,105,  4, 102, 62,  2, 125, 74,  2, 200,114,  3,
   239,133,  3, 248,134,  3, 249,133,  6, 249,139, 25, 249,165, 83, 248,195,146, 248,180,120,
   247,139, 48, 247,115, 11, 246,107,  2, 241,101,  0, 220, 89,  0, 158, 62,  0,  94, 36,  0,
   123, 46,  0, 196, 71,  0, 232, 82,  0, 240, 83,  0, 241, 83,  4, 241, 95, 25, 240,133, 84,
   239,171,141, 238,148,111, 237, 98, 42, 237, 72,  8, 235, 64,  1, 230, 60,  0, 206, 52,  0,
   141, 35,  0,  80, 19,  0, 115, 26,  0, 186, 42,  0, 220, 48,  0, 226, 49,  0, 226, 50,  4,
   225, 66, 25, 224,110, 82, 222,150,132, 221,121, 99, 220, 68, 35, 218, 44,  7, 216, 37,  1,
   209, 34,  0, 183, 29,  0, 115, 17,  0,  58,  8,  0,  97, 14,  0, 167, 23,  0, 197, 27,  0,
   202, 27,  0, 201, 30,  4, 199, 46, 25, 197, 91, 76, 195,126,117, 193, 95, 82, 190, 46, 28,
   188, 25,  5, 185, 20,  0, 177, 17,  0, 147, 14,  0,  77,  7,  0,  23,  2,  0,  66,  5,  0,
   134, 11,  0, 160, 13,  0, 164, 13,  0, 162, 16,  4, 159, 32, 21, 156, 70, 63, 152, 96, 91};
