Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcYQT2HZszDqlj
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:50:41 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466902237155423.92347799616846;
 Sat, 25 Jun 2016 17:50:37 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v7 03/15] initfs: shutdown: comment on update success
Date: Sat, 25 Jun 2016 19:50:21 -0500
Message-Id: <20160626005033.21336-4-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:50:42 -0000

From: Milton Miller <miltonm@us.ibm.com>

Print an error from the shutdown script when the update fails.

Update is changing to return codes when its preconditions are not
met, so be more verbose about its success to provide a means to
debug flash updates not occurring.

We could add a sulogin or sushell but its not clear what would be
desired here.  If so the message should include "rmdir /oldroot
to get a PID 1 shell" like /takever works in init.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index 8d5d0c9..8d5c672 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -44,6 +44,14 @@ then
 	if test -x $update
 	then
 		$update --clean-saved-files
+		remaining=$(ls $image*)
+		if test -n "$remaining"
+		then
+			echo 1>&2 "Flash update failed to flash these images:"
+			echo 1>&2 "$remaining"
+		else
+			echo "Flash update completed."
+		fi
 	else
 		echo 1>&2 "Flash update requested but $update program missing!"
 	fi
-- 
2.9.0
