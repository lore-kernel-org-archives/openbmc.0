Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbrz5FPKzDqmw
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:50:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467330640769712.6426284550042;
 Thu, 30 Jun 2016 16:50:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 06/16] initfs: update: Consistently add ERROR: and
 print to stderr
Date: Thu, 30 Jun 2016 18:50:23 -0500
Message-Id: <20160630235033.17091-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
References: <20160630235033.17091-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:50:44 -0000

From: Milton Miller <miltonm@us.ibm.com>

Make sure all error messages start with the tag ERROR and its
printed to stderr by creating an echoerr function.

Previously one case had the file descriptors backwards in the
redirection.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index f0ca989..e51dbf8 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -2,6 +2,10 @@
 
 echo update: "$@"
 
+echoerr() {
+	echo 1>&2 "ERROR: $@"
+}
+
 cd /
 if ! test -r /proc/mounts || ! test -f /proc/mounts
 then
@@ -21,7 +25,7 @@ fi
 
 if grep mtd /proc/mounts
 then
-	echo 1>&2 "Error: A mtd device is mounted."
+	echoerr "A mtd device is mounted."
 	exit 1
 fi
 
@@ -90,7 +94,7 @@ do
 		toram=y
 		shift ;;
 	*)
-		echo 2>&1 "Unknown option $1"
+		echoerr "Unknown option $1"
 		exit 1 ;;
 	esac
 done
@@ -126,7 +130,7 @@ do
 	m=$(findmtd ${f#$image})
 	if test -z "$m"
 	then
-		echo 1>&2  "Unable to find mtd partiton for ${f##*/}."
+		echoerr "Unable to find mtd partiton for ${f##*/}."
 		exit 1
 	fi
 done
-- 
2.9.0
