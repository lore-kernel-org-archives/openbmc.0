Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZj770LwczDqlF
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 10:30:58 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14666418528161008.2096065700855;
 Wed, 22 Jun 2016 17:30:52 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v6 10/18] initfs: update: add option to perform checks
 but skip actual update
Date: Wed, 22 Jun 2016 19:30:30 -0500
Message-Id: <20160623003038.2361-11-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 23 Jun 2016 00:31:00 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Provide a way to check if update is likely to succeed without
attempting actual updates.

This will check the image names correspond to mtd partition names,
and will be enhanced with additional checking for file size and
individual partition mounts.

This is not called --dry-run because it will still do file save
and restore if those are enabled.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 31 +++++++++++++---------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 4249161..4442e5b 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -57,6 +57,7 @@ upper=$rwdir/cow
 save=/run/save/${upper##*/}
 
 mounted=
+doflash=y
 doclean=
 dosave=y
 dorestore=y
@@ -88,6 +89,9 @@ do
 	--restore-files)
 		dorestore=y
 		shift ;;
+	--no-flash)
+		doflash=
+		shift ;;
 	--copy-files)
 		toram=y
 		shift ;;
@@ -133,18 +137,21 @@ do
 	fi
 done
 
-for f in $image*
-do
-	if test ! -s $f
-	then
-		echo "Skipping empty update of ${f#$image}."
-		rm $f
-		continue
-	fi
-	m=$(findmtd ${f#$image})
-	echo "Updating ${f#$image}..."
-	flashcp -v $f /dev/$m && rm $f
-done
+if test -n "$doflash"
+then
+	for f in $image*
+	do
+		if test ! -s $f
+		then
+			echo "Skipping empty update of ${f#$image}."
+			rm $f
+			continue
+		fi
+		m=$(findmtd ${f#$image})
+		echo "Updating ${f#$image}..."
+		flashcp -v $f /dev/$m && rm $f
+	done
+fi
 
 if test -d $save -a "x$toram" = xy
 then
-- 
2.9.0
