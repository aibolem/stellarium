
/*
 * Stellarium Scenery3d Plug-in
 *
 * Copyright (C) 2015 Simon Parzer, Peter Neubauer, Georg Zotti, Andrei Borza, Florian Schaukowitsch
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335, USA.
 */

/*
	This is the shader used for debugging bounding boxes, frustums, polyhedra etc.
	Because the old code extensively uses the immediate GL mode (glBegin/glEnd), this 
	shader currently uses part of the fixed-function pipeline. This will make this shader
	fail to compile on OpenGL ES!
*/

uniform mat4 u_mMVP;

void main(void)
{
	//this should result in the vertices specified by glBegin/glEnd
	//transforms are assumed to be identity matrices
	vec4 oldVert = ftransform();
	//we do the "real" transform ourselves using the same matrices as the other shaders use
    gl_Position = u_mMVP * oldVert;
	gl_FrontColor = gl_Color;
}
