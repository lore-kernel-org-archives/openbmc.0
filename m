Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjr7M2J81zDq6B
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 10:10:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460333435782906.8824725815844;
 Sun, 10 Apr 2016 17:10:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/7] runqemu: Add palmetto target
Date: Sun, 10 Apr 2016 19:10:26 -0500
Message-Id: <1460333431-28399-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 11 Apr 2016 00:10:39 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Example use:

    $ bitbake obmc-phosphor-image
    $ runqemu palmetto slirp

Specifying slirp avoids needing root to configure network, which won't
work (yet). The palmetto-bmc machine currently only models the VIC and
timers from the AST2400, and adds a 8250 UART for a console, so there's
not much interesting to play with in terms of hardware support. But, we
can now boot the one kernel both on the hardware and in QEMU.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../meta-ibm/meta-palmetto/conf/conf-notes.txt               |  3 +++
 yocto-poky/scripts/runqemu                                   |  9 ++++++---
 yocto-poky/scripts/runqemu-internal                          | 12 ++++++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/conf-notes.txt b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/conf-notes.txt
index 9b3c01a..24bfffe 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/conf-notes.txt
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/conf/conf-notes.txt
@@ -1,2 +1,5 @@
 Common targets are:
      obmc-phosphor-image
+
+You can also run generated images with qemu:
+     runqemu palmetto
diff --git a/yocto-poky/scripts/runqemu b/yocto-poky/scripts/runqemu
index e01d276..0c2915a 100755
--- a/yocto-poky/scripts/runqemu
+++ b/yocto-poky/scripts/runqemu
@@ -113,7 +113,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "palmetto")
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -244,13 +244,13 @@ fi
 
 if [ -z "$MACHINE" ]; then
     if [ "x$FSTYPE" = "xvmdk" ] || [ "x$FSTYPE" = "xhddimg" ] || [ "x$FSTYPE" = "xhdddirect" ]; then
-        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $VM | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4|palmetto\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from image filename [$VM]"
         fi
         echo "Set MACHINE to [$MACHINE] based on image [$VM]"
     else
-        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
+        MACHINE=`basename $KERNEL | sed -n 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4|palmetto\).*/\1/p'`
         if [ -z "$MACHINE" ]; then
             error "Unable to set MACHINE from kernel filename [$KERNEL]"
         fi
@@ -343,6 +343,9 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
+PALMETTO_DEFAULT_KERNEL=cuImage
+PALMETTO_DEFAULT_FSTYPE=cpio.gz
+
 AKITA_DEFAULT_KERNEL=zImage-akita.bin
 AKITA_DEFAULT_FSTYPE=jffs2
 
diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/runqemu-internal
index 3b0e54c..d06828a 100755
--- a/yocto-poky/scripts/runqemu-internal
+++ b/yocto-poky/scripts/runqemu-internal
@@ -53,6 +53,9 @@ else
         "qemuarm64")
             mem_size=512
             ;;
+        "palmetto")
+            mem_size=512
+            ;;
         "qemumicroblaze")
             mem_size=256
             ;;
@@ -281,6 +284,7 @@ fi
 
 case "$MACHINE" in
     "qemuarm") ;;
+    "palmetto") ;;
     "qemuarm64") ;;
     "qemumicroblaze") ;;
     "qemumips") ;;
@@ -370,6 +374,14 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     fi
 fi
 
+if [ "$MACHINE" = "palmetto" ]; then
+    QEMU=qemu-system-arm
+    MACHINE_SUBTYPE=palmetto-bmc
+    export QEMU_AUDIO_DRV="none"
+    KERNCMDLINE="console=ttyS4"
+    QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -initrd $ROOTFS -no-reboot -nographic"
+fi
+
 if [ "$MACHINE" = "qemuarm64" ]; then
     QEMU=qemu-system-aarch64
 
-- 
2.7.1
