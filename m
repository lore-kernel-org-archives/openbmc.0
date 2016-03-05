Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 84F5F1A0B52
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181032118768.5073116978066;
 Sat, 5 Mar 2016 04:30:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 10/32] update: Read whitelist from the /run/initramfs
 directory
Date: Sat,  5 Mar 2016 06:30:01 -0600
Message-Id: <1457181023-23569-11-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:37 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Find the whitelist under /run/initramfs directory instead of
looking in root directory.  This results in the whitelist always
existing and being the same instance (copy) in all environments.

Currently the update script is invoked from two places: from
shutdown, where systemd bind-mounted the initramfs directory on
itself and made it root (with its parent /run mounted underneath
it in a twist), and from the initramfs init script where it
copied the files from its root directory into the /run/initramfs
directory for use at shutdown time when the original rootfs is
no longer reachable.

By looking under /run/initramfs we will always look at one copy
of the whitelist.  This will also allow future modes where the
update script can be invoked while running from a copies of
the file systems located in RAM.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index f40a546..efdd913 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -63,6 +63,9 @@ doclean=
 dosave=y
 dorestore=y
 
+whitelist=/run/initramfs/whitelist
+image=/run/initramfs/image-
+
 while test "$1" != "${1#-}"
 do
 	case "$1" in
@@ -104,12 +107,11 @@ then
 		d="$save/$f"
 		mkdir -p "${d%/*}"
 		cp -rp $upper/$f "${d%/*}/"
-	done < whitelist
+	done < $whitelist
 
 	umount $rwdir
 fi
 
-image=/run/initramfs/image-
 for f in $image*
 do
 	m=$(findmtd ${f#$image})
-- 
2.7.1
