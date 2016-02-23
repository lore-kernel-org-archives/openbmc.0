Return-Path: <andrew@aj.id.au>
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 9583B1A0409
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 01:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=bwjZOJ9/; 
 dkim-atps=neutral
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id BE72C458081;
 Tue, 23 Feb 2016 06:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
 iD1c35WTAjBJKhE0TZrYtK7tntM=; b=bwjZOJ9/1pppzDNpafUKcfbfLFawcoqi
 rGP+vrK98cBSqR4u1WBWtbzpXQ+Kz6OJoww+IELgIpMFoEu3oAhMXAmNjqiS1Dua
 h8BwunGr88eBwnE/SvU8t9YGdVet7r0et0b1Vai3oFo83HryKWdytch5FPt0zBsZ
 bJQBYSWcauc=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 08EAA45807C;
 Tue, 23 Feb 2016 06:45:17 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 3/6] obmc-{init, update}.sh: Cope with alternate RW FS types
Date: Wed, 24 Feb 2016 01:15:00 +1030
Message-Id: <1456238703-11117-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
References: <1456238703-11117-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Tue, 23 Feb 2016 14:45:20 -0000

Busybox's blkid is a little hamstrung, requiring some processing of the
output to emulate what can be achieved with a couple of options with
blkid from util-linux.

Similar to findmtd(), the code for probe_fs_type() and blkid_fs_type()
is duplicated between obmc-{init,update}.sh. Some consideration should
be given to splitting out common functionality into well-defined
sourcable scripts.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh            | 15 ++++++++++++++-
 .../obmc-phosphor-initfs/files/obmc-update.sh          | 18 +++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 9674765..1d268bb 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -30,6 +30,19 @@ findmtd() {
 	echo $m
 }
 
+blkid_fs_type() {
+	# Emulate util-linux's `blkid -s TYPE -o value $1`
+	blkid $1 \
+		| tr ' ' '\n' \
+		| awk -F= '/TYPE/ { print $2 }' \
+		| tr -d '"'
+}
+
+probe_fs_type() {
+	fst=$(blkid_fs_type $1)
+	echo ${fst:=jffs2}
+}
+
 debug_takeover() {
 	echo "$@"
 	test -n "$@" && echo Enter password to try to manually fix.
@@ -72,7 +85,7 @@ rodev=/dev/mtdblock${rofs#mtd}
 rwdev=/dev/mtdblock${rwfs#mtd}
 
 rofst=squashfs
-rwfst=ext4
+rwfst=$(probe_fs_type $rwdev)
 roopts=ro
 rwopts=rw
 
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index face06d..cec4062 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -35,10 +35,22 @@ findmtd() {
 	echo $m
 }
 
+blkid_fs_type() {
+	# Emulate util-linux's `blkid -s TYPE -o value $1`
+	blkid $1 \
+		| tr ' ' '\n' \
+		| awk -F= '/TYPE/ { print $2 }' \
+		| tr -d '"'
+}
+
+probe_fs_type() {
+	fst=$(blkid_fs_type $1)
+	echo ${fst:=jffs2}
+}
+
 rwfs=$(findmtd rwfs)
 
 rwdev=/dev/mtdblock${rwfs#mtd}
-rwfst=ext4
 rwopts=rw
 rorwopts=ro${rwopts#rw}
 
@@ -50,7 +62,7 @@ if test -n "$rwfs" && test -s whitelist
 then
 
 	mkdir -p $rwdir
-	mount $rwdev $rwdir -t $rwfst -o $rorwopts
+	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rorwopts
 
 	while read f
 	do
@@ -87,7 +99,7 @@ done
 
 if test -d $save
 then
-	mount $rwdev $rwdir -t $rwfst -o $rwopts
+	mount $rwdev $rwdir -t $(probe_fs_type $rwdev) -o $rwopts
 	cp -rp $save/. $upper/
 	umount $rwdir
 fi
-- 
2.5.0
