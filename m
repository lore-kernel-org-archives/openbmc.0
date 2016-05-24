Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rDHt56GvtzDqPF
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2016 11:30:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464053449201894.6574137217349;
 Mon, 23 May 2016 18:30:49 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 4/7] initfs: update: no error if no files to copy to
 ram
Date: Mon, 23 May 2016 20:30:37 -0500
Message-Id: <20160524013040.30742-5-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160524013040.30742-1-openbmc-patches@stwcx.xyz>
References: <20160524013040.30742-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 May 2016 01:30:54 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

If the saved files directory is empty because there were no files in
the read-write overlay file system that were in the persistent file
list, then the save directory will not exist, so skip copying the
non-existant directory in that case.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
index 69c3fc8..147708d 100755
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -146,7 +146,7 @@ do
 	flashcp -v $f /dev/$m && rm $f
 done
 
-if test "x$toram" = xy
+if test -d $save -a "x$toram" = xy
 then
 	mkdir -p $upper
 	cp -rp $save/. $upper/
-- 
2.8.3
