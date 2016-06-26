Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcYQj2vxlzDqmH
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:50:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466902248320918.0004195519294;
 Sat, 25 Jun 2016 17:50:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v7 14/15] initfs: update: Sanitize whitelist directory
 entries
Date: Sat, 25 Jun 2016 19:50:32 -0500
Message-Id: <20160626005033.21336-15-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
References: <20160626005033.21336-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:50:54 -0000

From: Milton Miller <miltonm@us.ibm.com>

Repeatedly strip trailing "/" and "/." from whitelist entries
and fail if an entry includes "/../", ends with "/..", or doesn't
start with a "/".  Also use the entries quoted to avoid any glob.

It was noticed the save code was saving directories that ended
in "/" into a subdirectory of the last component name.  This was
traced the the code creating the directory just stripping the last
"/" and then copying to the directory.

Choose to sanitize the entry where possible for ease of use verses
a small performance penalty.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-update.sh             | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 97d4402..f0c41a7 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -173,13 +173,24 @@ then
 
 	while read f
 	do
-		if ! test -e $upper/$f
+		# Entries shall start with /, no trailing /.. or embedded /../
+		if test "/${f#/}" != "$f" -o "${f%/..}" != "${f#*/../}"
+		then
+			echo 1>&2 "WARNING: Skipping bad whitelist entry $f."
+			continue
+		fi
+		if ! test -e "$upper/$f"
 		then
 			continue
 		fi
 		d="$save/$f"
+		while test "${d%/}" != "${d%/.}"
+		do
+			d="${d%/.}"
+			d="${d%/}"
+		done
 		mkdir -p "${d%/*}"
-		cp -rp $upper/$f "${d%/*}/"
+		cp -rp "$upper/$f" "${d%/*}/"
 	done < $whitelist
 
 	if test -n "$mounted"
-- 
2.9.0
