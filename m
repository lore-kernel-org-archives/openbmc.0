Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D11121A04EC
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 14:50:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447818631086687.5997489864507;
 Tue, 17 Nov 2015 19:50:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] python-dbus dbus.Byte.__str__ produces broken utf8
Date: Tue, 17 Nov 2015 22:50:29 -0500
Message-Id: <1447818629-20624-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447818629-20624-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447818629-20624-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 03:50:37 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Byte to string simply copied the byte, which isn't valid
utf8 for non ascii values.  Since dbus.byte is an int subclass,
should just be using int's __str__  implementation anyway.
---
 .../python/python-dbus/bytes.patch                 | 37 ++++++++++++++++++++++
 .../python/python-dbus_1.2.0.bbappend              |  2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-dbus/bytes.patch
 create mode 100644 meta-phosphor/common/recipes-devtools/python/python-dbus_1.2.0.bbappend

diff --git a/meta-phosphor/common/recipes-devtools/python/python-dbus/bytes.patch b/meta-phosphor/common/recipes-devtools/python/python-dbus/bytes.patch
new file mode 100644
index 0000000..d8a10a0
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-dbus/bytes.patch
@@ -0,0 +1,37 @@
+Index: dbus-python-1.2.0/_dbus_bindings/bytes.c
+===================================================================
+--- dbus-python-1.2.0.orig/_dbus_bindings/bytes.c
++++ dbus-python-1.2.0/_dbus_bindings/bytes.c
+@@ -138,23 +138,6 @@ bad_range:
+     return NULL;
+ }
+ 
+-static PyObject *
+-Byte_tp_str(PyObject *self)
+-{
+-    long i = NATIVEINT_ASLONG(self);
+-    unsigned char str[2] = { 0, 0 };
+-
+-    if (i == -1 && PyErr_Occurred())
+-        return NULL;
+-    if (i < 0 || i > 255) {
+-        PyErr_SetString(PyExc_RuntimeError, "Integer outside range 0-255");
+-        return NULL;
+-    }
+-
+-    str[0] = (unsigned char)i;
+-    return PyUnicode_FromStringAndSize((char *)str, 1);
+-}
+-
+ PyTypeObject DBusPyByte_Type = {
+         PyVarObject_HEAD_INIT(DEFERRED_ADDRESS(&PyType_Type), 0)
+         "dbus.Byte",
+@@ -171,7 +154,7 @@ PyTypeObject DBusPyByte_Type = {
+         0,                                      /* tp_as_mapping */
+         0,                                      /* tp_hash */
+         0,                                      /* tp_call */
+-        Byte_tp_str,                            /* tp_str */
++        0,                                      /* tp_str */
+         0,                                      /* tp_getattro */
+         0,                                      /* tp_setattro */
+         0,                                      /* tp_as_buffer */
diff --git a/meta-phosphor/common/recipes-devtools/python/python-dbus_1.2.0.bbappend b/meta-phosphor/common/recipes-devtools/python/python-dbus_1.2.0.bbappend
new file mode 100644
index 0000000..57d5ef4
--- /dev/null
+++ b/meta-phosphor/common/recipes-devtools/python/python-dbus_1.2.0.bbappend
@@ -0,0 +1,2 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+SRC_URI += "file://bytes.patch"
-- 
2.6.3
