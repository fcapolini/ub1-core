/*
 * Copyright (c) 2018-2019 Ubimate Technologies Ltd and Ub1 contributors.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package pageamp_test.core;

import pageamp.core.*;
import pageamp.util.Test;
import pageamp.web.DomTools;
using pageamp.web.DomTools;

class ElementTest extends Test {

	function testClassAttribute1() {
		willDelay();
		DomTools.testDoc(null, function(doc:DomDocument, cleanup:Void->Void) {
			var p = new Page(doc, {c_base:true});

			assert(doc.domToString(), '<html>'
			+ '<head></head><body class="base">'
			+ '</body></html>');

			p.set('c_class2', true);
			assert(doc.domToString(), '<html>'
			+ '<head></head><body class="base class2">'
			+ '</body></html>');

			p.set('c_base', false);
			assert(doc.domToString(), '<html>'
			+ '<head></head><body class="class2">'
			+ '</body></html>');

			cleanup();
			didDelay();
		});
	}

	function testClassAttribute2() {
		willDelay();
		DomTools.testDoc(null, function(doc:DomDocument, cleanup:Void->Void) {
			var p = new Page(doc, {c_baseClass:true});

			assert(doc.domToString(), '<html>'
			+ '<head></head><body class="base-class">'
			+ '</body></html>');

			p.set('c_ub1Foo', true);
			assert(doc.domToString(), '<html>'
			+ '<head></head><body class="base-class ub1-foo">'
			+ '</body></html>');

			cleanup();
			didDelay();
		});
	}

}