Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D39FC1A074A
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 03:10:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447863022083930.90044468739;
 Wed, 18 Nov 2015 08:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Python cleanup
Date: Wed, 18 Nov 2015 11:10:20 -0500
Message-Id: <1447863020-10106-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447863020-10106-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447863020-10106-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 16:10:28 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

CherryPy won't be used so remove it.
Use wsgi and email that comes with python.
Remove wsgi and email standalone recipes.
Update bottle and rocket to use new packages.
---
 .../common/recipes-devtools/python/CherryPy.inc    |  49 ------
 .../recipes-devtools/python/CherryPy_3.8.0.bb      |   4 -
 .../recipes-devtools/python/python-bottle.inc      |   3 +-
 .../python/python-email-utils-standalone.inc       |  29 ----
 .../python/python-email-utils-standalone/LICENSE   | 192 ---------------------
 .../python-email-utils-standalone/setup.patch      |  74 --------
 .../python/python-email-utils-standalone_4.0.2.bb  |   5 -
 .../recipes-devtools/python/python-rocket.inc      |   6 +-
 .../python/python-wsgiref-standalone.inc           |  46 -----
 .../python/python-wsgiref-standalone/LICENSE       | 192 ---------------------
 .../python/python-wsgiref-standalone_0.1.2.bb      |   5 -
 .../python/python/__init__.email_min.py            |   7 +
 .../recipes-devtools/python/python_2.7.9.bbappend  |  33 ++++
 .../python/wsgiref-2.7-manifest.inc                |  33 ++++
 14 files changed, 77 insertions(+), 601 deletions(-)
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/CherryPy.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/CherryPy_3.8.0.bb
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone.inc
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone/LICENSE
 delete mode 100644 meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone_0.1.2.bb
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python/__init__.email_min.py
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python_2.7.9.bbappend
 create mode 100644 meta-phosphor/common/recipes-devtools/python/wsgiref-2.7-manifest.inc

diff --git a/meta-phosphor/common/recipes-devtools/python/CherryPy.inc b/meta-phosphor/common/recipes-devtools/python/CherryPy.inc
deleted file mode 100644
index c69ccad..0000000
--- a/meta-phosphor/common/recipes-devtools/python/CherryPy.inc
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Object-Oriented HTTP framework"
-DESCRIPTION = "CherryPy is a pythonic, object-oriented HTTP framework"
-HOMEPAGE = "http://www.cherrypy.org/"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://cherrypy/LICENSE.txt;md5=a476d86a3f85c89411ecaad012eed1e3"
-
-inherit allarch
-inherit setuptools
-
-PROVIDES+="${PN}-tests ${PN}-tutorials ${PN}-server ${PN}-scaffold ${PN}-daemon ${PN}-docs"
-PACKAGES+="${PN}-tests ${PN}-tutorials ${PN}-server ${PN}-scaffold ${PN}-daemon ${PN}-docs"
-
-base_package_dir = "${libdir}/python2.7/site-packages"
-package_dir = "${base_package_dir}/cherrypy"
-share_dir = "${datadir}/cherrypy"
-
-SUMMARY_${PN}-server="${BPN} server"
-RDEPENDS_${PN}-server="${PN}"
-FILES_${PN}-server="${package_dir}/wsgiserver ${share_dir}/wsgiserver "
-
-SUMMARY_${PN}-scaffold="${BPN} scaffold"
-RDEPENDS_${PN}-scaffold="${PN}"
-FILES_${PN}-scaffold="${package_dir}/scaffold ${share_dir}/scaffold "
-
-SUMMARY_${PN}-tests="${BPN} tests"
-RDEPENDS_${PN}-tests="${PN}"
-FILES_${PN}-tests="${package_dir}/test ${share_dir}/test "
-
-SUMMARY_${PN}-tutorials ="${BPN} tutorials"
-RDEPENDS_${PN}-tutorials ="${PN}"
-FILES_${PN}-tutorials ="${package_dir}/tutorial ${share_dir}/tutorial "
-
-SUMMARY_${PN}-daemon ="${BPN} daemon"
-RDEPENDS_${PN}-daemon ="${PN}"
-FILES_${PN}-daemon ="${bindir} ${share_dir}/cherryd "
-
-SUMMARY_${PN}-docs ="${BPN} docs"
-RDEPENDS_${PN}-docs ="${PN}"
-FILES_${PN}-docs ="${share_dir}/favicon.ico ${share_dir}/LICENSE.txt "
-
-FILES_${PN} = " \
-        ${package_dir}/*.py* \
-        ${package_dir}/lib \
-        ${package_dir}/process \
-        ${share_dir}/process \
-        ${base_package_dir}/*.egg-info \
-	"
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/CherryPy_3.8.0.bb b/meta-phosphor/common/recipes-devtools/python/CherryPy_3.8.0.bb
deleted file mode 100644
index 22a56fc..0000000
--- a/meta-phosphor/common/recipes-devtools/python/CherryPy_3.8.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require CherryPy.inc
-SRC_URI = "https://pypi.python.org/packages/source/C/${BPN}/${BP}.tar.gz;name=tarball"
-SRC_URI[tarball.sha256sum] = "ffcdb43667d4098247efaf8c82dd36d3dd4f8e5dc768ef5e90b480899e523bea"
-SRC_URI[tarball.md5sum] = "542b96b2cd825e8120e8cd822bc18f4b"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-bottle.inc b/meta-phosphor/common/recipes-devtools/python/python-bottle.inc
index d578c8b..cc95998 100644
--- a/meta-phosphor/common/recipes-devtools/python/python-bottle.inc
+++ b/meta-phosphor/common/recipes-devtools/python/python-bottle.inc
@@ -13,8 +13,7 @@ inherit allarch
 inherit setuptools
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-# bottle doesn't send email...it uses a utility in here to parse rfc1123 and rfc850 timestamps.
-RDEPENDS_${PN} += "python-email-utils-standalone"
+RDEPENDS_${PN} += "python-email-utils"
 
 PROVIDES += "${PN}-app"
 PACKAGES += "${PN}-app"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
deleted file mode 100644
index fe041d2..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone.inc
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Standalone email package"
-HOMEPAGE = "http://www.python.org/sigs/email-sig"
-SECTION = "devel/python"
-LICENSE = "PSFv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=a5c8025e305fb49e6d405769358851f6"
-
-inherit allarch
-inherit setuptools
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-PROVIDES += "${PN}-misc"
-PACKAGES += "${PN}-misc"
-RDPENDS_${PN} = "python-core"
-
-package_dir = "${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}"
-
-SUMMARY_${PN}-misc = "${SRCNAME} misc"
-RDEPENDS_${PN}-misc = "${PN}"
-RCONFLICTS_${PN} = "python-email"
-FILES_${PN}-misc = "${PYTHON_SITEPACKAGES_DIR}"
-
-FILES_${PN} = " \
-        ${package_dir}/__init__.py* \
-        ${package_dir}/utils.py* \
-        ${package_dir}/_parseaddr.py* \
-        ${package_dir}/encoders.py* \
-        "
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
deleted file mode 100644
index 9d3e862..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/LICENSE
+++ /dev/null
@@ -1,192 +0,0 @@
-
-PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
---------------------------------------------
-
-1. This LICENSE AGREEMENT is between the Python Software Foundation
-("PSF"), and the Individual or Organization ("Licensee") accessing and
-otherwise using this software ("Python") in source or binary form and
-its associated documentation.
-
-2. Subject to the terms and conditions of this License Agreement, PSF
-hereby grants Licensee a nonexclusive, royalty-free, world-wide
-license to reproduce, analyze, test, perform and/or display publicly,
-prepare derivative works, distribute, and otherwise use Python
-alone or in any derivative version, provided, however, that PSF`s
-License Agreement and PSF`s notice of copyright, i.e., "Copyright (c)
-2001, 2002, 2003, 2004, 2005, 2006 Python Software Foundation; All Rights
-Reserved" are retained in Python alone or in any derivative version
-prepared by Licensee.
-
-3. In the event Licensee prepares a derivative work that is based on
-or incorporates Python or any part thereof, and wants to make
-the derivative work available to others as provided herein, then
-Licensee hereby agrees to include in any such work a brief summary of
-the changes made to Python.
-
-4. PSF is making Python available to Licensee on an "AS IS"
-basis. PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
-IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
-DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
-FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
-INFRINGE ANY THIRD PARTY RIGHTS.
-
-5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
-FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
-A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
-OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
-
-6. This License Agreement will automatically terminate upon a material
-breach of its terms and conditions.
-
-7. Nothing in this License Agreement shall be deemed to create any
-relationship of agency, partnership, or joint venture between PSF and
-Licensee. This License Agreement does not grant permission to use PSF
-trademarks or trade name in a trademark sense to endorse or promote
-products or services of Licensee, or any third party.
-
-8. By copying, installing or otherwise using Python, Licensee
-agrees to be bound by the terms and conditions of this License
-Agreement.
-
-BEOPEN.COM LICENSE AGREEMENT FOR PYTHON 2.0
--------------------------------------------
-
-BEOPEN PYTHON OPEN SOURCE LICENSE AGREEMENT VERSION 1
-
-1. This LICENSE AGREEMENT is between BeOpen.com ("BeOpen"), having an
-office at 160 Saratoga Avenue, Santa Clara, CA 95051, and the
-Individual or Organization ("Licensee") accessing and otherwise using
-this software in source or binary form and its associated
-documentation ("the Software").
-
-2. Subject to the terms and conditions of this BeOpen Python License
-Agreement, BeOpen hereby grants Licensee a non-exclusive,
-royalty-free, world-wide license to reproduce, analyze, test, perform
-and/or display publicly, prepare derivative works, distribute, and
-otherwise use the Software alone or in any derivative version,
-provided, however, that the BeOpen Python License is retained in the
-Software, alone or in any derivative version prepared by Licensee.
-
-3. BeOpen is making the Software available to Licensee on an "AS IS"
-basis. BEOPEN MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
-IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, BEOPEN MAKES NO AND
-DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
-FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE SOFTWARE WILL NOT
-INFRINGE ANY THIRD PARTY RIGHTS.
-
-4. BEOPEN SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF THE
-SOFTWARE FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS
-AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THE SOFTWARE, OR ANY
-DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
-
-5. This License Agreement will automatically terminate upon a material
-breach of its terms and conditions.
-
-6. This License Agreement shall be governed by and interpreted in all
-respects by the law of the State of California, excluding conflict of
-law provisions. Nothing in this License Agreement shall be deemed to
-create any relationship of agency, partnership, or joint venture
-between BeOpen and Licensee. This License Agreement does not grant
-permission to use BeOpen trademarks or trade names in a trademark
-sense to endorse or promote products or services of Licensee, or any
-third party. As an exception, the "BeOpen Python" logos available at
-http://www.pythonlabs.com/logos.html may be used according to the
-permissions granted on that web page.
-
-7. By copying, installing or otherwise using the software, Licensee
-agrees to be bound by the terms and conditions of this License
-Agreement.
-
-CNRI LICENSE AGREEMENT FOR PYTHON 1.6.1
----------------------------------------
-
-1. This LICENSE AGREEMENT is between the Corporation for National
-Research Initiatives, having an office at 1895 Preston White Drive,
-Reston, VA 20191 ("CNRI"), and the Individual or Organization
-("Licensee") accessing and otherwise using Python 1.6.1 software in
-source or binary form and its associated documentation.
-
-2. Subject to the terms and conditions of this License Agreement, CNRI
-hereby grants Licensee a nonexclusive, royalty-free, world-wide
-license to reproduce, analyze, test, perform and/or display publicly,
-prepare derivative works, distribute, and otherwise use Python 1.6.1
-alone or in any derivative version, provided, however, that CNRI`s
-License Agreement and CNRI`s notice of copyright, i.e., "Copyright (c)
-1995-2001 Corporation for National Research Initiatives; All Rights
-Reserved" are retained in Python 1.6.1 alone or in any derivative
-version prepared by Licensee. Alternately, in lieu of CNRI`s License
-Agreement, Licensee may substitute the following text (omitting the
-quotes): "Python 1.6.1 is made available subject to the terms and
-conditions in CNRI`s License Agreement. This Agreement together with
-Python 1.6.1 may be located on the Internet using the following
-unique, persistent identifier (known as a handle): 1895.22/1013. This
-Agreement may also be obtained from a proxy server on the Internet
-using the following URL: http://hdl.handle.net/1895.22/1013".
-
-3. In the event Licensee prepares a derivative work that is based on
-or incorporates Python 1.6.1 or any part thereof, and wants to make
-the derivative work available to others as provided herein, then
-Licensee hereby agrees to include in any such work a brief summary of
-the changes made to Python 1.6.1.
-
-4. CNRI is making Python 1.6.1 available to Licensee on an "AS IS"
-basis. CNRI MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
-IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, CNRI MAKES NO AND
-DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
-FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON 1.6.1 WILL NOT
-INFRINGE ANY THIRD PARTY RIGHTS.
-
-5. CNRI SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
-1.6.1 FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
-A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON 1.6.1,
-OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
-
-6. This License Agreement will automatically terminate upon a material
-breach of its terms and conditions.
-
-7. This License Agreement shall be governed by the federal
-intellectual property law of the United States, including without
-limitation the federal copyright law, and, to the extent such
-U.S. federal law does not apply, by the law of the Commonwealth of
-Virginia, excluding Virginia`s conflict of law provisions.
-Notwithstanding the foregoing, with regard to derivative works based
-on Python 1.6.1 that incorporate non-separable material that was
-previously distributed under the GNU General Public License (GPL), the
-law of the Commonwealth of Virginia shall govern this License
-Agreement only as to issues arising under or with respect to
-Paragraphs 4, 5, and 7 of this License Agreement. Nothing in this
-License Agreement shall be deemed to create any relationship of
-agency, partnership, or joint venture between CNRI and Licensee. This
-License Agreement does not grant permission to use CNRI trademarks or
-trade name in a trademark sense to endorse or promote products or
-services of Licensee, or any third party.
-
-8. By clicking on the "ACCEPT" button where indicated, or by copying,
-installing or otherwise using Python 1.6.1, Licensee agrees to be
-bound by the terms and conditions of this License Agreement.
-
-ACCEPT
-
-CWI LICENSE AGREEMENT FOR PYTHON 0.9.0 THROUGH 1.2
---------------------------------------------------
-
-Copyright (c) 1991 - 1995, Stichting Mathematisch Centrum Amsterdam,
-The Netherlands. All rights reserved.
-
-Permission to use, copy, modify, and distribute this software and its
-documentation for any purpose and without fee is hereby granted,
-provided that the above copyright notice appear in all copies and that
-both that copyright notice and this permission notice appear in
-supporting documentation, and that the name of Stichting Mathematisch
-Centrum or CWI not be used in advertising or publicity pertaining to
-distribution of the software without specific, written prior
-permission.
-
-STICHTING MATHEMATISCH CENTRUM DISCLAIMS ALL WARRANTIES WITH REGARD TO
-THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS, IN NO EVENT SHALL STICHTING MATHEMATISCH CENTRUM BE LIABLE
-FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
-OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
deleted file mode 100644
index 8087641..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone/setup.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Index: email-4.0.2/email/__init__.py
-===================================================================
---- email-4.0.2.orig/email/__init__.py
-+++ email-4.0.2/email/__init__.py
-@@ -8,7 +8,6 @@ __version__ = '4.0.2'
- 
- __all__ = [
-     # Old names
--    'base64MIME',
-     'Charset',
-     'Encoders',
-     'Errors',
-@@ -16,20 +15,11 @@ __all__ = [
-     'Header',
-     'Iterators',
-     'Message',
--    'MIMEAudio',
--    'MIMEBase',
--    'MIMEImage',
--    'MIMEMessage',
--    'MIMEMultipart',
--    'MIMENonMultipart',
--    'MIMEText',
-     'Parser',
--    'quopriMIME',
-     'Utils',
-     'message_from_string',
-     'message_from_file',
-     # new names
--    'base64mime',
-     'charset',
-     'encoders',
-     'errors',
-@@ -37,9 +27,7 @@ __all__ = [
-     'header',
-     'iterators',
-     'message',
--    'mime',
-     'parser',
--    'quoprimime',
-     'utils',
-     ]
- 
-@@ -94,30 +82,9 @@ _LOWERNAMES = [
-     'Message',
-     'Parser',
-     'Utils',
--    'base64MIME',
--    'quopriMIME',
--    ]
--
--_MIMENAMES = [
--    # email.MIME<old name> -> email.mime.<new name is lowercased old name>
--    'Audio',
--    'Base',
--    'Image',
--    'Message',
--    'Multipart',
--    'NonMultipart',
--    'Text',
-     ]
- 
- for _name in _LOWERNAMES:
-     importer = LazyImporter(_name.lower())
-     sys.modules['email.' + _name] = importer
-     setattr(sys.modules['email'], _name, importer)
--
--
--import email.mime
--for _name in _MIMENAMES:
--    importer = LazyImporter('mime.' + _name.lower())
--    sys.modules['email.MIME' + _name] = importer
--    setattr(sys.modules['email'], 'MIME' + _name, importer)
--    setattr(sys.modules['email.mime'], _name, importer)
diff --git a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb b/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
deleted file mode 100644
index 0839744..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-email-utils-standalone_4.0.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-SRCNAME = "email"
-SRC_URI = "https://pypi.python.org/packages/source/e/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=tarball file://LICENSE file://setup.patch"
-SRC_URI[tarball.sha256sum] = "e2254c9b4e4cf33553f7dfc85b500eea4c3e96733736f38c9dbfc3dcc6303705"
-SRC_URI[tarball.md5sum] = "67707dc0fab874edc5ac45f95ec9ec87"
-require python-email-utils-standalone.inc
diff --git a/meta-phosphor/common/recipes-devtools/python/python-rocket.inc b/meta-phosphor/common/recipes-devtools/python/python-rocket.inc
index b2e6d31..73e7d1d 100644
--- a/meta-phosphor/common/recipes-devtools/python/python-rocket.inc
+++ b/meta-phosphor/common/recipes-devtools/python/python-rocket.inc
@@ -15,9 +15,9 @@ inherit setuptools
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 RDEPENDS_${PN} += "\
-        python-wsgiref-standalone-util \
-        python-wsgiref-standalone-headers \
-        python-email-utils-standalone \
+        python-wsgiref-util \
+        python-wsgiref-headers \
+        python-email-utils \
 	"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone.inc b/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone.inc
deleted file mode 100644
index bbac61c..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone.inc
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "WSGI (PEP 333) Reference Library"
-DESCRIPTION = "This is a standalone release of the wsgiref library, \
-that provides validation support for WSGI 1.0.1 (PEP 3333) for Python \
-versions < 3.2, and includes the new wsgiref.util.test() utility function."
-HOMEPAGE = "http://cheeseshop.python.org/pypi/wsgiref"
-SECTION = "devel/python"
-LICENSE = "PSFv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=a5c8025e305fb49e6d405769358851f6"
-
-inherit allarch
-inherit setuptools
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-PROVIDES += "${PN}-headers ${PN}-handlers ${PN}-validate ${PN}-simple_server ${PN}-util"
-PACKAGES += "${PN}-headers ${PN}-handlers ${PN}-validate ${PN}-simple_server ${PN}-util"
-RDEPENDS_${PN} = "python-core"
-RCONFLICTS_${PN} = "python-misc"
-
-package_dir = "${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}"
-
-SUMMARY_${PN}-handlers = "${SRCNAME} handlers"
-RDEPENDS_${PN}-handlers = "${PN}-util ${PN}-headers"
-FILES_${PN}-handlers = "${package_dir}/handlers.py*"
-
-SUMMARY_${PN}-headers = "${SRCNAME} headers"
-RDEPENDS_${PN}-headers = "${PN}"
-FILES_${PN}-headers = "${package_dir}/headers.py*"
-
-SUMMARY_${PN}-simple_server = "${SRCNAME} simple_server"
-RDEPENDS_${PN}-simple_server = "${PN}-handlers"
-FILES_${PN}-simple_server = "${package_dir}/simple_server.py*"
-
-SUMMARY_${PN}-util = "${SRCNAME} util"
-RDEPENDS_${PN}-util = "${PN}"
-FILES_${PN}-util = "${package_dir}/util.py*"
-
-SUMMARY_${PN}-validate = "${SRCNAME} validate"
-RDEPENDS_${PN}-validate = "${PN}"
-FILES_${PN}-validate = "${package_dir}/validate.py*"
-
-FILES_${PN} = " \
-        ${package_dir}/__init__.py* \
-        ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}-*.egg-info \
-        "
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone/LICENSE b/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone/LICENSE
deleted file mode 100644
index 9d3e862..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone/LICENSE
+++ /dev/null
@@ -1,192 +0,0 @@
-
-PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
---------------------------------------------
-
-1. This LICENSE AGREEMENT is between the Python Software Foundation
-("PSF"), and the Individual or Organization ("Licensee") accessing and
-otherwise using this software ("Python") in source or binary form and
-its associated documentation.
-
-2. Subject to the terms and conditions of this License Agreement, PSF
-hereby grants Licensee a nonexclusive, royalty-free, world-wide
-license to reproduce, analyze, test, perform and/or display publicly,
-prepare derivative works, distribute, and otherwise use Python
-alone or in any derivative version, provided, however, that PSF`s
-License Agreement and PSF`s notice of copyright, i.e., "Copyright (c)
-2001, 2002, 2003, 2004, 2005, 2006 Python Software Foundation; All Rights
-Reserved" are retained in Python alone or in any derivative version
-prepared by Licensee.
-
-3. In the event Licensee prepares a derivative work that is based on
-or incorporates Python or any part thereof, and wants to make
-the derivative work available to others as provided herein, then
-Licensee hereby agrees to include in any such work a brief summary of
-the changes made to Python.
-
-4. PSF is making Python available to Licensee on an "AS IS"
-basis. PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
-IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
-DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
-FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
-INFRINGE ANY THIRD PARTY RIGHTS.
-
-5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
-FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
-A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
-OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
-
-6. This License Agreement will automatically terminate upon a material
-breach of its terms and conditions.
-
-7. Nothing in this License Agreement shall be deemed to create any
-relationship of agency, partnership, or joint venture between PSF and
-Licensee. This License Agreement does not grant permission to use PSF
-trademarks or trade name in a trademark sense to endorse or promote
-products or services of Licensee, or any third party.
-
-8. By copying, installing or otherwise using Python, Licensee
-agrees to be bound by the terms and conditions of this License
-Agreement.
-
-BEOPEN.COM LICENSE AGREEMENT FOR PYTHON 2.0
--------------------------------------------
-
-BEOPEN PYTHON OPEN SOURCE LICENSE AGREEMENT VERSION 1
-
-1. This LICENSE AGREEMENT is between BeOpen.com ("BeOpen"), having an
-office at 160 Saratoga Avenue, Santa Clara, CA 95051, and the
-Individual or Organization ("Licensee") accessing and otherwise using
-this software in source or binary form and its associated
-documentation ("the Software").
-
-2. Subject to the terms and conditions of this BeOpen Python License
-Agreement, BeOpen hereby grants Licensee a non-exclusive,
-royalty-free, world-wide license to reproduce, analyze, test, perform
-and/or display publicly, prepare derivative works, distribute, and
-otherwise use the Software alone or in any derivative version,
-provided, however, that the BeOpen Python License is retained in the
-Software, alone or in any derivative version prepared by Licensee.
-
-3. BeOpen is making the Software available to Licensee on an "AS IS"
-basis. BEOPEN MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
-IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, BEOPEN MAKES NO AND
-DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
-FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE SOFTWARE WILL NOT
-INFRINGE ANY THIRD PARTY RIGHTS.
-
-4. BEOPEN SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF THE
-SOFTWARE FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS
-AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THE SOFTWARE, OR ANY
-DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
-
-5. This License Agreement will automatically terminate upon a material
-breach of its terms and conditions.
-
-6. This License Agreement shall be governed by and interpreted in all
-respects by the law of the State of California, excluding conflict of
-law provisions. Nothing in this License Agreement shall be deemed to
-create any relationship of agency, partnership, or joint venture
-between BeOpen and Licensee. This License Agreement does not grant
-permission to use BeOpen trademarks or trade names in a trademark
-sense to endorse or promote products or services of Licensee, or any
-third party. As an exception, the "BeOpen Python" logos available at
-http://www.pythonlabs.com/logos.html may be used according to the
-permissions granted on that web page.
-
-7. By copying, installing or otherwise using the software, Licensee
-agrees to be bound by the terms and conditions of this License
-Agreement.
-
-CNRI LICENSE AGREEMENT FOR PYTHON 1.6.1
----------------------------------------
-
-1. This LICENSE AGREEMENT is between the Corporation for National
-Research Initiatives, having an office at 1895 Preston White Drive,
-Reston, VA 20191 ("CNRI"), and the Individual or Organization
-("Licensee") accessing and otherwise using Python 1.6.1 software in
-source or binary form and its associated documentation.
-
-2. Subject to the terms and conditions of this License Agreement, CNRI
-hereby grants Licensee a nonexclusive, royalty-free, world-wide
-license to reproduce, analyze, test, perform and/or display publicly,
-prepare derivative works, distribute, and otherwise use Python 1.6.1
-alone or in any derivative version, provided, however, that CNRI`s
-License Agreement and CNRI`s notice of copyright, i.e., "Copyright (c)
-1995-2001 Corporation for National Research Initiatives; All Rights
-Reserved" are retained in Python 1.6.1 alone or in any derivative
-version prepared by Licensee. Alternately, in lieu of CNRI`s License
-Agreement, Licensee may substitute the following text (omitting the
-quotes): "Python 1.6.1 is made available subject to the terms and
-conditions in CNRI`s License Agreement. This Agreement together with
-Python 1.6.1 may be located on the Internet using the following
-unique, persistent identifier (known as a handle): 1895.22/1013. This
-Agreement may also be obtained from a proxy server on the Internet
-using the following URL: http://hdl.handle.net/1895.22/1013".
-
-3. In the event Licensee prepares a derivative work that is based on
-or incorporates Python 1.6.1 or any part thereof, and wants to make
-the derivative work available to others as provided herein, then
-Licensee hereby agrees to include in any such work a brief summary of
-the changes made to Python 1.6.1.
-
-4. CNRI is making Python 1.6.1 available to Licensee on an "AS IS"
-basis. CNRI MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
-IMPLIED. BY WAY OF EXAMPLE, BUT NOT LIMITATION, CNRI MAKES NO AND
-DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
-FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON 1.6.1 WILL NOT
-INFRINGE ANY THIRD PARTY RIGHTS.
-
-5. CNRI SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
-1.6.1 FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
-A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON 1.6.1,
-OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
-
-6. This License Agreement will automatically terminate upon a material
-breach of its terms and conditions.
-
-7. This License Agreement shall be governed by the federal
-intellectual property law of the United States, including without
-limitation the federal copyright law, and, to the extent such
-U.S. federal law does not apply, by the law of the Commonwealth of
-Virginia, excluding Virginia`s conflict of law provisions.
-Notwithstanding the foregoing, with regard to derivative works based
-on Python 1.6.1 that incorporate non-separable material that was
-previously distributed under the GNU General Public License (GPL), the
-law of the Commonwealth of Virginia shall govern this License
-Agreement only as to issues arising under or with respect to
-Paragraphs 4, 5, and 7 of this License Agreement. Nothing in this
-License Agreement shall be deemed to create any relationship of
-agency, partnership, or joint venture between CNRI and Licensee. This
-License Agreement does not grant permission to use CNRI trademarks or
-trade name in a trademark sense to endorse or promote products or
-services of Licensee, or any third party.
-
-8. By clicking on the "ACCEPT" button where indicated, or by copying,
-installing or otherwise using Python 1.6.1, Licensee agrees to be
-bound by the terms and conditions of this License Agreement.
-
-ACCEPT
-
-CWI LICENSE AGREEMENT FOR PYTHON 0.9.0 THROUGH 1.2
---------------------------------------------------
-
-Copyright (c) 1991 - 1995, Stichting Mathematisch Centrum Amsterdam,
-The Netherlands. All rights reserved.
-
-Permission to use, copy, modify, and distribute this software and its
-documentation for any purpose and without fee is hereby granted,
-provided that the above copyright notice appear in all copies and that
-both that copyright notice and this permission notice appear in
-supporting documentation, and that the name of Stichting Mathematisch
-Centrum or CWI not be used in advertising or publicity pertaining to
-distribution of the software without specific, written prior
-permission.
-
-STICHTING MATHEMATISCH CENTRUM DISCLAIMS ALL WARRANTIES WITH REGARD TO
-THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
-FITNESS, IN NO EVENT SHALL STICHTING MATHEMATISCH CENTRUM BE LIABLE
-FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
-ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
-OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-
diff --git a/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone_0.1.2.bb b/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone_0.1.2.bb
deleted file mode 100644
index 5d4e81f..0000000
--- a/meta-phosphor/common/recipes-devtools/python/python-wsgiref-standalone_0.1.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-SRCNAME = "wsgiref"
-SRC_URI = "https://pypi.python.org/packages/source/w/${SRCNAME}/${SRCNAME}-${PV}.zip;name=tarball file://LICENSE"
-SRC_URI[tarball.sha256sum] = "c7e610c800957046c04c8014aab8cce8f0b9f0495c8cd349e57c1f7cabf40e79"
-SRC_URI[tarball.md5sum] = "29b146e6ebd0f9fb119fe321f7bcf6cb"
-require python-wsgiref-standalone.inc
diff --git a/meta-phosphor/common/recipes-devtools/python/python/__init__.email_min.py b/meta-phosphor/common/recipes-devtools/python/python/__init__.email_min.py
new file mode 100644
index 0000000..6c8aef1
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python/__init__.email_min.py
@@ -0,0 +1,7 @@
+try:
+	import email_full
+
+except ImportError:
+	import sys
+	import email.utils
+	sys.modules['email.Utils'] = sys.modules['email.utils']
diff --git a/meta-phosphor/common/recipes-devtools/python/python_2.7.9.bbappend b/meta-phosphor/common/recipes-devtools/python/python_2.7.9.bbappend
new file mode 100644
index 0000000..a4df15b
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python_2.7.9.bbappend
@@ -0,0 +1,33 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://__init__.email_min.py"
+
+do_install_append() {
+	dir=${libdir}/python${PYTHON_MAJMIN}/email
+        mv ${D}/$dir/__init__.py \
+                ${D}/$dir/email_full.py
+        install -m644 ${WORKDIR}/__init__.email_min.py \
+                ${D}/$dir/__init__.py
+}
+
+require wsgiref-${PYTHON_MAJMIN}-manifest.inc
+
+PROVIDES_prepend = "${PN}-spwd ${PN}-email-utils "
+PACKAGES_prepend = "${PN}-spwd ${PN}-email-utils "
+
+SUMMARY_${PN}-spwd = "Shadow database support"
+RDEPENDS_${PN}-spwd = "${PN}-core"
+FILES_${PN}-spwd= " \
+        ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/spwd.so \
+        ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.so \
+        "
+
+SUMMARY_${PN}-email-utils = "Utils from the email package"
+RDEPENDS_${PN}-email-utils = "${PN}-core"
+FILES_${PN}-email-utils = " \
+        ${libdir}/python${PYTHON_MAJMIN}/email/__init__.py* \
+        ${libdir}/python${PYTHON_MAJMIN}/email/utils.py* \
+        ${libdir}/python${PYTHON_MAJMIN}/email/_parseaddr.py* \
+        ${libdir}/python${PYTHON_MAJMIN}/email/encoders.py* \
+        "
+RDEPENDS_${PN}-email += "${PN}-email-utils"
+FILES_${PN}-email += "${libdir}/python${PYTHON_MAJMIN}/email/email_full.py"
diff --git a/meta-phosphor/common/recipes-devtools/python/wsgiref-2.7-manifest.inc b/meta-phosphor/common/recipes-devtools/python/wsgiref-2.7-manifest.inc
new file mode 100644
index 0000000..a21d05e
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/wsgiref-2.7-manifest.inc
@@ -0,0 +1,33 @@
+NAME = "wsgiref"
+
+PROVIDES_prepend = "${PN}-${NAME} ${PN}-${NAME}-headers ${PN}-${NAME}-handlers ${PN}-${NAME}-validate ${PN}-${NAME}-simple_server ${PN}-${NAME}-util "
+PACKAGES_prepend = "${PN}-${NAME} ${PN}-${NAME}-headers ${PN}-${NAME}-handlers ${PN}-${NAME}-validate ${PN}-${NAME}-simple_server ${PN}-${NAME}-util "
+
+package_dir = "${libdir}/python${PYTHON_MAJMIN}/${NAME}"
+
+SUMMARY_${PN}-${NAME}-handlers = "${NAME} handlers"
+RDEPENDS_${PN}-${NAME}-handlers = "${PN}-${NAME}-util ${PN}-${NAME}-headers"
+FILES_${PN}-${NAME}-handlers = "${package_dir}/handlers.py*"
+
+SUMMARY_${PN}-${NAME}-headers = "${NAME} headers"
+RDEPENDS_${PN}-${NAME}-headers = "${PN}-${NAME}"
+FILES_${PN}-${NAME}-headers = "${package_dir}/headers.py*"
+
+SUMMARY_${PN}-${NAME}-simple_server = "${NAME} simple server"
+RDEPENDS_${PN}-${NAME}-simple_server = "${PN}-${NAME}-handlers"
+FILES_${PN}-${NAME}-simple_server = "${package_dir}/simple_server.py*"
+
+SUMMARY_${PN}-${NAME}-util = "${NAME} util"
+RDEPENDS_${PN}-${NAME}-util = "${PN}-${NAME}"
+FILES_${PN}-${NAME}-util = "${package_dir}/util.py*"
+
+SUMMARY_${PN}-${NAME}-validate = "${NAME} validate"
+RDEPENDS_${PN}-${NAME}-validate = "${PN}-${NAME}"
+FILES_${PN}-${NAME}-validate = "${package_dir}/validate.py*"
+
+SUMMARY_${PN}-${NAME} = "WSGI (PEP 333) Reference Library"
+RDEPENDS_${PN}-${NAME} = "${PN}-core"
+FILES_${PN}-${NAME} = " \
+        ${package_dir}/__init__.py* \
+        ${package_dir}.egg-info \
+        "
-- 
2.6.3
