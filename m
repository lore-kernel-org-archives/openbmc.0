Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX511zwzDq72
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=K3p2vSQp; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id 9C7A7334076
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 mib6koyiG2eUIWxCcXROhjy7QI4=; b=K3p2vSQpkZrL9kdA3Qw/G86U1VnovDaG
 zGtUfjo5Seoi8+KTgnvqE6o5t7YyRrlOTtqLv1hE1vWwRYvQJPNriQ3ipSQeMn9e
 WoI4eWns+4QueMUOBZGDBVb2wVI3fpHhWlb7InXXK1Rn3PVc3EGDkXnVvL37Vvr0
 k6IfUuKvJ/Q=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 264C033406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:46 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 2/8] runqemu: Add palmetto target
Date: Wed, 23 Mar 2016 18:33:29 +1030
Message-Id: <1458720215-25302-3-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:49 -0000

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
index 23cf5be..f09da50 100755
--- a/yocto-poky/scripts/runqemu
+++ b/yocto-poky/scripts/runqemu
@@ -110,7 +110,7 @@ while true; do
     arg=${1}
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
-        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
+        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "palmetto")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -236,13 +236,13 @@ fi
 
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
@@ -332,6 +332,9 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
 QEMUZYNQ_DEFAULT_KERNEL=uImage
 QEMUZYNQ_DEFAULT_FSTYPE=cpio
 
+PALMETTO_DEFAULT_KERNEL=cuImage
+PALMETTO_DEFAULT_FSTYPE=cpio.gz
+
 AKITA_DEFAULT_KERNEL=zImage-akita.bin
 AKITA_DEFAULT_FSTYPE=jffs2
 
diff --git a/yocto-poky/scripts/runqemu-internal b/yocto-poky/scripts/runqemu-internal
index 1527268..479d61c 100755
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
             mem_size=64
             ;;
@@ -295,6 +298,7 @@ fi
 
 case "$MACHINE" in
     "qemuarm") ;;
+    "palmetto") ;;
     "qemuarm64") ;;
     "qemumicroblaze") ;;
     "qemumips") ;;
@@ -384,6 +388,14 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
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
2.5.0
