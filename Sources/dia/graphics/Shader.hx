package dia.graphics;

import kha.Shaders;
import kha.graphics4.VertexStructure;
import kha.graphics4.PipelineState;
import kha.graphics4.VertexShader;
import kha.graphics4.FragmentShader;

class Shader {

	public var pipelineState : PipelineState;

	public function new(vert : VertexShader, frag : FragmentShader) {
		pipelineState.inputLayout = [new VertexStructure()];
		pipelineState.vertexShader = vert; 
		pipelineState.fragmentShader = frag;
		pipelineState.compile();
	}

}