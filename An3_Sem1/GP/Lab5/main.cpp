//
//  main.cpp
//  OpenGL Transformations
//

#define GLEW_STATIC

#include <iostream>

#include <GL\glew.h>
#include <GLFW\glfw3.h>

#include <glm/glm.hpp>//core glm functionality
#include <glm/gtc/matrix_transform.hpp>//glm extension for generating common transformation matrices
#include <glm/gtc/type_ptr.hpp>//glm extension for accessing the internal data structure of glm types

#include "Shader.hpp"
#include "Camera.hpp"

int glWindowWidth = 800;
int glWindowHeight = 600;
int retina_width, retina_height;
float step = 0.1f;
GLFWwindow* glWindow = NULL;

//vertex data --- position and color
//vertex position data has been duplicated to ensure constant color across each face
GLfloat vertices[] = {
	-0.5f, -0.5f, -0.5f, 1.0f, 0.0f, 0.0f, //0
	0.5f, -0.5f, -0.5f, 1.0f, 0.0f, 0.0f, //1
	0.5f, -0.5f, 0.5f, 1.0f, 0.0f, 0.0f, //2
	-0.5f, -0.5f, 0.5f, 1.0f, 0.0f, 0.0f, //3
	-0.5f, 0.5f, -0.5f, 0.0f, 0.0f, 1.0f, //4
	0.5f, 0.5f, -0.5f, 0.0f, 0.0f, 1.0f, //5
	0.5f, 0.5f, 0.5f, 0.0f, 1.0f, 1.0f, //6
	-0.5f, 0.5f, 0.5f, 0.0f, 1.0f, 0.0f, //7
	-0.5f, -0.5f, -0.5f, 0.0f, 0.0f, 1.0f, //8   0'
	0.5f, -0.5f, -0.5f, 0.0f, 0.0f, 1.0f, //9   1'
	0.5f, -0.5f, 0.5f, 0.0f, 1.0f, 1.0f, //10   2'
	-0.5f, -0.5f, 0.5f, 0.0f, 1.0f, 0.0f, //11   3'
	-0.5f, 0.5f, -0.5f, 0.0f, 1.0f, 0.0f, //12   4'
	0.5f, 0.5f, -0.5f, 0.0f, 1.0f, 1.0f, //13   5'
	0.5f, 0.5f, 0.5f, 1.0f, 1.0f, 0.0f, //14   6'
	-0.5f, 0.5f, 0.5f, 1.0f, 1.0f, 0.0f, //15   7'
	-0.5f, -0.5f, -0.5f, 0.0f, 1.0f, 0.0f, //16   0''
	0.5f, -0.5f, -0.5f, 0.0f, 1.0f, 1.0f, //17   1''
	0.5f, -0.5f, 0.5f, 1.0f, 0.0f, 1.0f, //18   2''
	-0.5f, -0.5f, 0.5f, 1.0f, 0.0f, 1.0f, //19   3''
	-0.5f, 0.5f, -0.5f, 1.0f, 1.0f, 0.0f, //20   4''
	0.5f, 0.5f, -0.5f, 1.0f, 1.0f, 0.0f, //21   5''
	0.5f, 0.5f, 0.5f, 1.0f, 0.0f, 1.0f, //22   6''
	-0.5f, 0.5f, 0.5f, 1.0f, 0.0f, 1.0f, //23   7''
};

GLuint indices[] = {
	0, 1, 2, 0, 2, 3, // bottom plane triangles
	8, 9, 5, 8, 5, 4, // back plane triangles
	17, 10, 6, 17, 6, 13, // right plane triangles
	16, 12, 7, 16, 7, 11, // left plane triangles
	20, 21, 14, 20, 14, 15, // top plane triangles
	19, 18, 22, 19, 22, 23 // front plane triangles
};

GLuint verticesVBO;
GLuint verticesEBO;
GLuint objectVAO;
GLint projLoc;

gps::Shader myCustomShader;
glm::mat4 model;
glm::mat4 view;
glm::mat4 projection;
GLint modelLoc;
GLint viewLoc;

void windowResizeCallback(GLFWwindow* window, int width, int height)
{
	fprintf(stdout, "window resized to width: %d , and height: %d\n", width, height);
	//TODO
}

void initObjects()
{
	glGenVertexArrays(1, &objectVAO);
	glBindVertexArray(objectVAO);

	glGenBuffers(1, &verticesVBO);
	glBindBuffer(GL_ARRAY_BUFFER, verticesVBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);

	glGenBuffers(1, &verticesEBO);
	glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, verticesEBO);
	glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);

	//vertex position attribute
	glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (GLvoid*)0);
	glEnableVertexAttribArray(0);

	//vertex colour attribute
	glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (GLvoid*)(3 * sizeof(float)));
	glEnableVertexAttribArray(1);

	glBindVertexArray(0);
}

bool initOpenGLWindow()
{
	if (!glfwInit()) {
		fprintf(stderr, "ERROR: could not start GLFW3\n");
		return false;
	}

	// window hints
	glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

	// for multisampling/antialising
	glfwWindowHint(GLFW_SAMPLES, 4);

	glWindow = glfwCreateWindow(glWindowWidth, glWindowHeight, "OpenGL Transformations", NULL, NULL);
	if (!glWindow) {
		fprintf(stderr, "ERROR: could not open window with GLFW3\n");		
		return false;
	}

	glfwSetWindowSizeCallback(glWindow, windowResizeCallback);
	glfwMakeContextCurrent(glWindow);	

	// start GLEW extension handler
	glewExperimental = GL_TRUE;
	glewInit();

	// get version info
	const GLubyte* renderer = glGetString(GL_RENDERER); // get renderer string
	const GLubyte* version = glGetString(GL_VERSION); // version as a string
	printf("Renderer: %s\n", renderer);
	printf("OpenGL version supported %s\n", version);

	//for RETINA display
	glfwGetFramebufferSize(glWindow, &retina_width, &retina_height);

	return true;
}

float angle = 0;
float angleT = 0;
bool isRDown = false;
bool isTDown = false;


void keyboardCallback(GLFWwindow* window, int key, int scancode, int action, int mode) {

	if (key == GLFW_KEY_R && action == GLFW_PRESS) {
		isRDown = true;
	}
	else if (key == GLFW_KEY_R && action == GLFW_RELEASE) {
		isRDown = false;
	}
	if (key == GLFW_KEY_T && action == GLFW_PRESS) {
		isTDown = true;
	}
	else if (key == GLFW_KEY_T && action == GLFW_RELEASE) {
		isTDown = false;
	}

	if (isRDown)
		angle += step;
	if (isTDown)
		angleT += step;
}


void renderScene()
{
	glClearColor(0.8, 0.8, 0.8, 1.0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	glViewport(0, 0, retina_width, retina_height);

	if (glfwGetKey(glWindow, GLFW_KEY_Q)) {
		glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
	}

	if (glfwGetKey(glWindow, GLFW_KEY_E)) {
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
	}

	model = glm::mat4(1.0f);

	#pragma region firstCube

		model = glm::translate(model, glm::vec3(-2, 0, 0));
		model = glm::rotate(model, angle, glm::vec3(0, 1, 0));
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));

		myCustomShader.useShaderProgram();
		glBindVertexArray(objectVAO);
		glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);

		model = glm::rotate(model, -angle, glm::vec3(0, 1, 0));
		model = glm::translate(model, glm::vec3(2, 0, 0));
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));

	#pragma endregion


	#pragma region secondCube

		model = glm::translate(model, glm::vec3(2, 0, 0));
		model = glm::rotate(model, angleT, glm::vec3(1, 0, 0));
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));

		myCustomShader.useShaderProgram();
		glBindVertexArray(objectVAO);
		glDrawElements(GL_TRIANGLES, 36, GL_UNSIGNED_INT, 0);

		model = glm::rotate(model, angleT, glm::vec3(1, 0, 0));
		model = glm::translate(model, glm::vec3(2, 0, 0));
		glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model));

	#pragma endregion

}

void cleanup() {
	glfwDestroyWindow(glWindow);
	//close GL context and any other GLFW resources
	glfwTerminate();
}

int main(int argc, const char * argv[]) {

	if (!initOpenGLWindow()) {
		glfwTerminate();
		return 1;
	}

	initObjects();

	glEnable(GL_DEPTH_TEST);

	myCustomShader.loadShader("shaders/shaderStart.vert", "shaders/shaderStart.frag");
	myCustomShader.useShaderProgram(); 

	model = glm::mat4(1.0f);
	modelLoc = glGetUniformLocation(myCustomShader.shaderProgram, "model");
	glUniformMatrix4fv(modelLoc, 1, GL_FALSE, glm::value_ptr(model)); 

	view = glm::lookAt(glm::vec3(0.0f, 0.0f, 5.0f), glm::vec3(0.0f, 0.0f, -10.0f), glm::vec3(0.0f, 1.0f,0.0f));
	viewLoc = glGetUniformLocation(myCustomShader.shaderProgram, "view");
	glUniformMatrix4fv(viewLoc, 1, GL_FALSE, glm::value_ptr(view));
	
	projection = glm::perspective(70.0f, (float)glWindowWidth / (float)glWindowHeight, 0.1f, 1000.0f);
	projLoc = glGetUniformLocation(myCustomShader.shaderProgram, "projection");
	glUniformMatrix4fv(projLoc, 1, GL_FALSE, glm::value_ptr(projection));

	glfwSetKeyCallback(glWindow, keyboardCallback);

	while (!glfwWindowShouldClose(glWindow)) {
		renderScene();

		glfwPollEvents();
		glfwSwapBuffers(glWindow);
	}

	cleanup();

	return 0;
}
