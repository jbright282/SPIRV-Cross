#version 450
#if defined(GL_AMD_gpu_shader_int16)
#extension GL_AMD_gpu_shader_int16 : require
#elif defined(GL_EXT_shader_16bit_storage)
#extension GL_EXT_shader_16bit_storage : require
#else
#error No extension available for Int16.
#endif
#extension GL_EXT_shader_8bit_storage : require
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_NV_gpu_shader5)
#extension GL_NV_gpu_shader5 : require
#elif defined(GL_EXT_shader_16bit_storage)
#extension GL_EXT_shader_16bit_storage : require
#else
#error No extension available for FP16.
#endif

layout(binding = 0, std140) uniform block
{
    layout(offset = 0) i16vec2 a;
    layout(offset = 4) u16vec2 b;
    layout(offset = 8) i8vec2 c;
    layout(offset = 10) u8vec2 d;
    layout(offset = 12) f16vec2 e;
} _26;

layout(binding = 1, std140) readonly buffer storage
{
    layout(offset = 0) i16vec3 f;
    layout(offset = 8) u16vec3 g;
    layout(offset = 16) i8vec3 h;
    layout(offset = 20) u8vec3 i;
    layout(offset = 24) f16vec3 j;
} _53;

struct pushconst
{
    i16vec4 k;
    u16vec4 l;
    i8vec4 m;
    u8vec4 n;
    f16vec4 o;
};

uniform pushconst _76;

layout(location = 0) out i16vec4 p;
layout(location = 0, component = 0) in int16_t foo;
layout(location = 1) out u16vec4 q;
layout(location = 0, component = 1) in uint16_t bar;
layout(location = 2) out f16vec4 r;
layout(location = 1) in float16_t baz;

void main()
{
    p = i16vec4((((ivec4(int(foo)) + ivec4(ivec2(_26.a), ivec2(_26.c))) - ivec4(ivec3(_53.f) / ivec3(_53.h), 1)) + ivec4(_76.k)) + ivec4(_76.m));
    q = u16vec4((((uvec4(uint(bar)) + uvec4(uvec2(_26.b), uvec2(_26.d))) - uvec4(uvec3(_53.g) / uvec3(_53.i), 1u)) + uvec4(_76.l)) + uvec4(_76.n));
    r = f16vec4(((vec4(float(baz)) + vec4(vec2(_26.e), 0.0, 1.0)) - vec4(vec3(_53.j), 1.0)) + vec4(_76.o));
    gl_Position = vec4(0.0, 0.0, 0.0, 1.0);
}

