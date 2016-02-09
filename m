Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9AD6B1A03A1
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 05:00:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455040828467958.7374022453185;
 Tue, 9 Feb 2016 10:00:28 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/9] obmc-initfs: shutdown: use absolute paths
Date: Tue,  9 Feb 2016 12:00:15 -0600
Message-Id: <1455040822-14038-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1455040822-14038-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455040822-14038-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 18:00:33 -0000

From: Milton Miller <miltonm@us.ibm.com>

In shutdown, cd to / like init and update, but do not switch
paths to assume this.  Instead switch a few more paths to be
absolute.  This will clarify the expcted execution environment
and the location of files being tested.  It also provides
consistency when calling /update and creating and testing
the /image- symlinks.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
index d29db26..c550e06 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -5,10 +5,11 @@ echo shutdown: "$@"
 export PS1=shutdown-sh#\ 
 # exec bin/sh
 
+cd /
 if [ ! -e /proc/mounts ]
 then
 	mkdir -p /proc
-	mount  proc proc -tproc
+	mount  proc /proc -tproc
 	umount_proc=1
 else
 	umount_proc=
@@ -30,7 +31,7 @@ then
 	ln -sn /run/fw_env /image-u-boot-env
 fi
 
-if test -x /update && ls image-* > /dev/null 2>&1
+if test -x /update && ls /image-* > /dev/null 2>&1
 then
 	exec /update ${1+"$@"}
 fi
-- 
2.6.4
