Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZj763NkczDql8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:30:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466641851839276.14255792887434;
 Wed, 22 Jun 2016 17:30:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v6 09/18] initfs: update: Consistently add ERROR: and
 print to stderr
Date: Wed, 22 Jun 2016 19:30:29 -0500
Message-Id: <20160623003038.2361-10-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
References: <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2016 00:30:59 -0000

From: Milton Miller <miltonm@us.ibm.com>

Make sure all error messages start with the tag ERROR.  Also redirect
output to stderr (once case had the file descriptors backwards).

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh    | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index f0ca989..4249161 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -21,7 +21,7 @@ fi
 
 if grep mtd /proc/mounts
 then
-	echo 1>&2 "Error: A mtd device is mounted."
+	echo 1>&2 "ERROR: A mtd device is mounted."
 	exit 1
 fi
 
@@ -65,6 +65,8 @@ toram=
 whitelist=/run/initramfs/whitelist
 image=/run/initramfs/image-
 
+E="ERROR:"
+
 while test "$1" != "${1#-}"
 do
 	case "$1" in
@@ -90,7 +92,7 @@ do
 		toram=y
 		shift ;;
 	*)
-		echo 2>&1 "Unknown option $1"
+		echo 1>&2 "$E Unknown option $1"
 		exit 1 ;;
 	esac
 done
@@ -126,7 +128,7 @@ do
 	m=$(findmtd ${f#$image})
 	if test -z "$m"
 	then
-		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
+		echo 1>&2 "$E Unable to find mtd partiton for ${f##*/}."
 		exit 1
 	fi
 done
-- 
2.9.0
