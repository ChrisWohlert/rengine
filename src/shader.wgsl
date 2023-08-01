// Vertex shader

alias vec4f = vec4<f32>;
alias vec2f = vec2<f32>;

struct OurVertexShaderOutput {
    @builtin(position) position: vec4f,
    @location(0) uv: vec2f,
};

@vertex fn vs_main(@builtin(vertex_index) vertexIndex : u32) -> OurVertexShaderOutput {

    var vertices = array<vec2f, 6>(
        vec2(-1.0, -1.0),  // bottom left (first triangle)
        vec2( 1.0, -1.0),  // bottom right (first triangle)
        vec2(-1.0,  1.0),  // top left (first triangle)

        vec2( 1.0, -1.0),  // bottom right (second triangle)
        vec2( 1.0,  1.0),  // top right (second triangle)
        vec2(-1.0,  1.0)   // top left (second triangle)
    );

    var vsOutput: OurVertexShaderOutput;
    vsOutput.position = vec4f(vertices[vertexIndex], 0.0, 1.0);
    vsOutput.uv = (vertices[vertexIndex] + 1.0) * 0.5; // Map from [-1, 1] to [0, 1]

        
    return vsOutput;
}

@fragment fn fs_main(@location(0) uv: vec2f) -> @location(0) vec4f {
    return vec4f(uv.x, uv.y, 0., 1.);
}