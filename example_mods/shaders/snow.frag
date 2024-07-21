#pragma header

uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor

const float intensity = 0.5;
void main() {
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
int numSnowflakes = 6;
int numCellsX = 12;
int numCellsY = 12;
float cellSize = 2.0 + (float(numCellsX) * intensity);
float downSpeed = 0.4 + (sin(iTime * 0.4) + 1.0) * 0.00008;
float randomMagnitude1 = cos(iTime * 0.6) * 0.7 / cellSize;
float randomMagnitude2 = sin(iTime * 0.6) * 0.7 / cellSize;
float dThreshold = 0.08 + (numCellsX * 0.3) / (cellSize / 1.4);

float snow = 0.0;
float random;
for (int k = 0; k < numSnowflakes; k++) {
    float x = fract(sin(dot(fragCoord.xy, vec2(12.9898 + float(k) * 12.0, 78.233 + float(k) * 315.156))) * 43758.5453 + float(k) * 12.0) - 0.5;
    float y = fract(sin(dot(fragCoord.xy, vec2(62.2364 + float(k) * 23.0, 94.674 + float(k) * 95.0))) * 62159.8432 + float(k) * 12.0) - 0.5;

    random = fract(sin(dot(fragCoord.xy, vec2(12.9898, 78.233))) * 43758.5453);
    for (int i = 0; i < numCellsX; i++) {
        for (int j = 0; j < numCellsY; j++) {
            float cellUvX = (fragCoord.x / iResolution.x) + vec2(0.01 * sin((iTime + float(k * 6185)) * 0.6 + float(i)) * (5.0 / float(i)), downSpeed * (iTime + float(k * 1352)) * (1.0 / float(i)));
            float cellUvY = (fragCoord.y / iResolution.y) + vec2(0.0, downSpeed * (iTime + float(k * 1352)) * (2.0 / float(i)));
            vec2 cellUv = cellUvX - cellUvY;
            vec2 cellUvStep = (ceil((cellUv) * cellSize - vec2(0.5, 0.5)) / cellSize);

            float xCell = fract(sin(dot(cellUvStep.xy, vec2(12.9898 + float(k) * 12.0, 78.233 + float(k) * 315.156))) * 43758.5453 + float(k) * 12.0) - 0.5;
            float yCell = fract(sin(dot(cellUvStep.xy, vec2(62.2364 + float(k) * 23.0, 94.674 + float(k) * 95.0))) * 62159.8432 + float(k) * 12.0) - 0.5;

            float d = 5.0 * distance((cellUvStep.xy + vec2(xCell * sin(yCell), yCell) * randomMagnitude1 + vec2(yCell, xCell) * randomMagnitude2), cellUv.xy);

            float omiVal = fract(sin(dot(cellUvStep.xy, vec2(32.4691, 94.615))) * 31572.1684);
            if (omiVal < 0.05) {
                float newd = (x + 1.0) * 0.4 * clamp(1.9 - d * (15.0 + (x * 6.3)) * (cellSize / 1.4), 0.0, 1.0);
                snow += d < dThreshold ? newd : newd;
            }
        }
    }
}

gl_FragColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
gl_FragColor += vec4(snow) * vec4(1.0, 1.0, 1.0, 0.0) + random * 0.01;
}