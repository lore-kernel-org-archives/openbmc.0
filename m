Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgbrx1nhPzDqmg
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 09:50:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467330638874336.3900170450852;
 Thu, 30 Jun 2016 16:50:38 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 05/16] initfs: update: Do not cause an error if no
 files were saved
Date: Thu, 30 Jun 2016 18:50:22 -0500
Message-Id: <20160630235033.17091-6-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 23:50:41 -0000

From: Milton Miller <miltonm@us.ibm.com>

If there were no files in the read-write overlay file system that
were in the persistent file list, then the save directory will
not be created and therefore not exist.  Skip attempting copying
the non-existent directory in that case to avoid the error message.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index f8e551c..f0ca989 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -144,7 +144,7 @@ do
 	flashcp -v $f /dev/$m && rm $f
 done
 
-if test "x$toram" = xy
+if test -d $save -a "x$toram" = xy
 then
 	mkdir -p $upper
 	cp -rp $save/. $upper/
-- 
2.9.0
