Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7F2701A0908
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 01:30:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447425021923722.9915786661829;
 Fri, 13 Nov 2015 06:30:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/5] Add python-email-utils-standalone recipe
Date: Fri, 13 Nov 2015 09:30:16 -0500
Message-Id: <1447425020-2483-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447425020-2483-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 14:30:29 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This is a stripped down version of python-email without any
dependencies, for packages that just use email.utils.
---
 .../python/python-email-utils-standalone.inc       |  29 ++++
 .../python/python-email-utils-standalone/LICENSE   | 192 +++++++++++++++++++++
 .../python-email-utils-standalone/setup.patch      |  74 ++++++++
 .../python/python-email-utils-standalone_4.0.2.bb  |   5 +
 4 files changed, 300 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb

diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
new file mode 100644
index 0000000..fe041d2
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
@@ -0,0 +1,29 @@
+SUMMARY = "Standalone email package"
+HOMEPAGE = "http://www.python.org/sigs/email-sig"
+SECTION = "devel/python"
+LICENSE = "PSFv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=a5c8025e305fb49e6d405769358851f6"
+
+inherit allarch
+inherit setuptools
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+PROVIDES += "${PN}-misc"
+PACKAGES += "${PN}-misc"
+RDPENDS_${PN} = "python-core"
+
+package_dir = "${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}"
+
+SUMMARY_${PN}-misc = "${SRCNAME} misc"
+RDEPENDS_${PN}-misc = "${PN}"
+RCONFLICTS_${PN} = "python-email"
+FILES_${PN}-misc = "${PYTHON_SITEPACKAGES_DIR}"
+
+FILES_${PN} = " \
+        ${package_dir}/__init__.py* \
+        ${package_dir}/utils.py* \
+        ${package_dir}/_parseaddr.py* \
+        ${package_dir}/encoders.py* \
+        "
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
new file mode 100644
index 0000000..9d3e862
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
@@ -0,0 +1,192 @@
+
+PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
+--------------------------------------------
+
+1. This LICENSE AGREEMENT is between the Python Software Foundation
+("PSF"), and the Individual or Organization ("Licensee") accessing and
+otherwise using this software ("Python") in source or binary form and
+its associated documentation.
+
+2. Subject to the terms and conditions of this License Agreement, PSF
+hereby grants Licensee a nonexclusive, royalty-free, world-wide
+license to reproduce, analyze, test, perform and/or display publicly,
+prepare derivative works, distribute, and otherwise use Python
+alone or in any derivative version, provided, however, that PSF`s
+License Agreement and PSF`s notice of copyright, i.e., "Copyright (c)
+2001, 2002, 2003, 2004, 2005, 2006 Python Software Foundation; All Rights
+Reserved" are retained in Python alone or in any derivative version
+prepared by Licensee.
+
+3. In the event Licensee prepares a derivative work that is based on
+or incorporates Python or any part thereof, and wants to make
+the derivative work available to others as provided herein, then
+Licensee hereby agrees to include in any such work a brief summary of
+the changes made to Python.
+
+4. PSF is making Python available to Licensee on an "AS IS"
+basis. PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
+FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
+A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
+OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+6. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+7. Nothing in this License Agreement shall be deemed to create any
+relationship of agency, partnership, or joint venture between PSF and
+Licensee. This License Agreement does not grant permission to use PSF
+trademarks or trade name in a trademark sense to endorse or promote
+products or services of Licensee, or any third party.
+
+8. By copying, installing or otherwise using Python, Licensee
+agrees to be bound by the terms and conditions of this License
+Agreement.
+
+BEOPEN.COM LICENSE AGREEMENT FOR PYTHON 2.0
+-------------------------------------------
+
+BEOPEN PYTHON OPEN SOURCE LICENSE AGREEMENT VERSION 1
+
+1. This LICENSE AGREEMENT is between BeOpen.com ("BeOpen"), having an
+office at 160 Saratoga Avenue, Santa Clara, CA 95051, and the
+Individual or Organization ("Licensee") accessing and otherwise using
+this software in source or binary form and its associated
+documentation ("the Software").
+
+2. Subject to the terms and conditions of this BeOpen Python License
+Agreement, BeOpen hereby grants Licensee a non-exclusive,
+royalty-free, world-wide license to reproduce, analyze, test, perform
+and/or display publicly, prepare derivative works, distribute, and
+otherwise use the Software alone or in any derivative version,
+provided, however, that the BeOpen Python License is retained in the
+Software, alone or in any derivative version prepared by Licensee.
+
+3. BeOpen is making the Software available to Licensee on an "AS IS"
+basis. BEOPEN MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, BEOPEN MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE SOFTWARE WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+4. BEOPEN SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF THE
+SOFTWARE FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS
+AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THE SOFTWARE, OR ANY
+DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+5. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+6. This License Agreement shall be governed by and interpreted in all
+respects by the law of the State of California, excluding conflict of
+law provisions. Nothing in this License Agreement shall be deemed to
+create any relationship of agency, partnership, or joint venture
+between BeOpen and Licensee. This License Agreement does not grant
+permission to use BeOpen trademarks or trade names in a trademark
+sense to endorse or promote products or services of Licensee, or any
+third party. As an exception, the "BeOpen Python" logos available at
+http://www.pythonlabs.com/logos.html may be used according to the
+permissions granted on that web page.
+
+7. By copying, installing or otherwise using the software, Licensee
+agrees to be bound by the terms and conditions of this License
+Agreement.
+
+CNRI LICENSE AGREEMENT FOR PYTHON 1.6.1
+---------------------------------------
+
+1. This LICENSE AGREEMENT is between the Corporation for National
+Research Initiatives, having an office at 1895 Preston White Drive,
+Reston, VA 20191 ("CNRI"), and the Individual or Organization
+("Licensee") accessing and otherwise using Python 1.6.1 software in
+source or binary form and its associated documentation.
+
+2. Subject to the terms and conditions of this License Agreement, CNRI
+hereby grants Licensee a nonexclusive, royalty-free, world-wide
+license to reproduce, analyze, test, perform and/or display publicly,
+prepare derivative works, distribute, and otherwise use Python 1.6.1
+alone or in any derivative version, provided, however, that CNRI`s
+License Agreement and CNRI`s notice of copyright, i.e., "Copyright (c)
+1995-2001 Corporation for National Research Initiatives; All Rights
+Reserved" are retained in Python 1.6.1 alone or in any derivative
+version prepared by Licensee. Alternately, in lieu of CNRI`s License
+Agreement, Licensee may substitute the following text (omitting the
+quotes): "Python 1.6.1 is made available subject to the terms and
+conditions in CNRI`s License Agreement. This Agreement together with
+Python 1.6.1 may be located on the Internet using the following
+unique, persistent identifier (known as a handle): 1895.22/1013. This
+Agreement may also be obtained from a proxy server on the Internet
+using the following URL: http://hdl.handle.net/1895.22/1013".
+
+3. In the event Licensee prepares a derivative work that is based on
+or incorporates Python 1.6.1 or any part thereof, and wants to make
+the derivative work available to others as provided herein, then
+Licensee hereby agrees to include in any such work a brief summary of
+the changes made to Python 1.6.1.
+
+4. CNRI is making Python 1.6.1 available to Licensee on an "AS IS"
+basis. CNRI MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, CNRI MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON 1.6.1 WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+5. CNRI SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
+1.6.1 FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
+A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON 1.6.1,
+OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+6. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+7. This License Agreement shall be governed by the federal
+intellectual property law of the United States, including without
+limitation the federal copyright law, and, to the extent such
+U.S. federal law does not apply, by the law of the Commonwealth of
+Virginia, excluding Virginia`s conflict of law provisions.
+Notwithstanding the foregoing, with regard to derivative works based
+on Python 1.6.1 that incorporate non-separable material that was
+previously distributed under the GNU General Public License (GPL), the
+law of the Commonwealth of Virginia shall govern this License
+Agreement only as to issues arising under or with respect to
+Paragraphs 4, 5, and 7 of this License Agreement. Nothing in this
+License Agreement shall be deemed to create any relationship of
+agency, partnership, or joint venture between CNRI and Licensee. This
+License Agreement does not grant permission to use CNRI trademarks or
+trade name in a trademark sense to endorse or promote products or
+services of Licensee, or any third party.
+
+8. By clicking on the "ACCEPT" button where indicated, or by copying,
+installing or otherwise using Python 1.6.1, Licensee agrees to be
+bound by the terms and conditions of this License Agreement.
+
+ACCEPT
+
+CWI LICENSE AGREEMENT FOR PYTHON 0.9.0 THROUGH 1.2
+--------------------------------------------------
+
+Copyright (c) 1991 - 1995, Stichting Mathematisch Centrum Amsterdam,
+The Netherlands. All rights reserved.
+
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
+provided that the above copyright notice appear in all copies and that
+both that copyright notice and this permission notice appear in
+supporting documentation, and that the name of Stichting Mathematisch
+Centrum or CWI not be used in advertising or publicity pertaining to
+distribution of the software without specific, written prior
+permission.
+
+STICHTING MATHEMATISCH CENTRUM DISCLAIMS ALL WARRANTIES WITH REGARD TO
+THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS, IN NO EVENT SHALL STICHTING MATHEMATISCH CENTRUM BE LIABLE
+FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
+OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
new file mode 100644
index 0000000..8087641
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
@@ -0,0 +1,74 @@
+Index: email-4.0.2/email/__init__.py
+===================================================================
+--- email-4.0.2.orig/email/__init__.py
++++ email-4.0.2/email/__init__.py
+@@ -8,7 +8,6 @@ __version__ = '4.0.2'
+ 
+ __all__ = [
+     # Old names
+-    'base64MIME',
+     'Charset',
+     'Encoders',
+     'Errors',
+@@ -16,20 +15,11 @@ __all__ = [
+     'Header',
+     'Iterators',
+     'Message',
+-    'MIMEAudio',
+-    'MIMEBase',
+-    'MIMEImage',
+-    'MIMEMessage',
+-    'MIMEMultipart',
+-    'MIMENonMultipart',
+-    'MIMEText',
+     'Parser',
+-    'quopriMIME',
+     'Utils',
+     'message_from_string',
+     'message_from_file',
+     # new names
+-    'base64mime',
+     'charset',
+     'encoders',
+     'errors',
+@@ -37,9 +27,7 @@ __all__ = [
+     'header',
+     'iterators',
+     'message',
+-    'mime',
+     'parser',
+-    'quoprimime',
+     'utils',
+     ]
+ 
+@@ -94,30 +82,9 @@ _LOWERNAMES = [
+     'Message',
+     'Parser',
+     'Utils',
+-    'base64MIME',
+-    'quopriMIME',
+-    ]
+-
+-_MIMENAMES = [
+-    # email.MIME<old name> -> email.mime.<new name is lowercased old name>
+-    'Audio',
+-    'Base',
+-    'Image',
+-    'Message',
+-    'Multipart',
+-    'NonMultipart',
+-    'Text',
+     ]
+ 
+ for _name in _LOWERNAMES:
+     importer = LazyImporter(_name.lower())
+     sys.modules['email.' + _name] = importer
+     setattr(sys.modules['email'], _name, importer)
+-
+-
+-import email.mime
+-for _name in _MIMENAMES:
+-    importer = LazyImporter('mime.' + _name.lower())
+-    sys.modules['email.MIME' + _name] = importer
+-    setattr(sys.modules['email'], 'MIME' + _name, importer)
+-    setattr(sys.modules['email.mime'], _name, importer)
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
new file mode 100644
index 0000000..0839744
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
@@ -0,0 +1,5 @@
+SRCNAME = "email"
+SRC_URI = "https://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=tarball file://LICENSE file://setup.patch"
+SRC_URI[tarball.sha256sum] = "e2254c9b4e4cf33553f7dfc85b500eea4c3e96733736f38c9dbfc3dcc6303705"
+SRC_URI[tarball.md5sum] = "67707dc0fab874edc5ac45f95ec9ec87"
+require python-email-utils-standalone.inc
-- 
2.6.3
