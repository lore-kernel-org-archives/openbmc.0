Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7DCB81A080F
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 01:16:48 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144465940549485.85680104495611;
 Mon, 12 Oct 2015 07:16:45 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/7] Add kernel-cuimage class
Date: Mon, 12 Oct 2015 09:16:34 -0500
Message-Id: <1444659400-4196-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
References: <1444659400-4196-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 14:16:49 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Combined kernel /  device tree kernel target emulation.
Copied from kernel-uimage.
---
 meta-phosphor/classes/kernel-cuimage.bbclass | 45 ++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta-phosphor/classes/kernel-cuimage.bbclass

diff --git a/meta-phosphor/classes/kernel-cuimage.bbclass b/meta-phosphor/classes/kernel-cuimage.bbclass
new file mode 100644
index 0000000..25d8f24
--- /dev/null
+++ b/meta-phosphor/classes/kernel-cuimage.bbclass
@@ -0,0 +1,45 @@
+# Essentially kernel-uimage, but for cuImage.
+
+inherit kernel-uboot
+
+KBUILD_HAS_CUIMAGE ?= "no"
+
+python __anonymous () {
+    kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
+    if kerneltype == 'cuImage':
+        depends = d.getVar("DEPENDS", True)
+        depends = "%s u-boot-mkimage-native" % depends
+        d.setVar("DEPENDS", depends)
+
+	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+	# to kernel.bbclass . We override the variable here, since we need
+	# to build cuImage using the kernel build system if and only if
+	# KBUILD_HAS_CUIMAGE == yes. Otherwise, we pack compressed vmlinux into
+	# the cuImage .
+	if d.getVar("KBUILD_HAS_CUIMAGE", True) != 'yes':
+            d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", "zImage")
+}
+
+do_uboot_mkcimage() {
+        dt="arch/${ARCH}/boot/dts/${KERNEL_DEVICETREE}"
+        if ! test -r $dt; then
+		dt=""
+        fi
+
+	if test "x${KERNEL_IMAGETYPE}" = "xcuImage" ; then
+		if test "x${KBUILD_HAS_CUIMAGE}" != "xyes" ; then
+			uboot_prep_kimage
+                        cat linux.bin $dt > linux-dts.bin
+			ENTRYPOINT=${UBOOT_ENTRYPOINT}
+			if test -n "${UBOOT_ENTRYSYMBOL}"; then
+				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
+					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
+			fi
+
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux-dts.bin arch/${ARCH}/boot/cuImage
+			rm -f linux.bin linux-dts.bin
+		fi
+	fi
+}
+
+addtask uboot_mkcimage before do_bundle_initramfs after do_compile
-- 
2.6.0
