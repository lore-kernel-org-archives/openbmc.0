Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 10CC61A0399
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2016 05:00:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455040830509926.3763526753016;
 Tue, 9 Feb 2016 10:00:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/9] obmc-initfs: init: check init is an executable
 file
Date: Tue,  9 Feb 2016 12:00:16 -0600
Message-Id: <1455040822-14038-4-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 09 Feb 2016 18:00:36 -0000

From: Milton Miller <miltonm@us.ibm.com>

In init, check the new init is an executable file with non-zero
size in addition to the shell being executable with its shared
libraries.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 0dc4c35..eed8cf5 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -69,9 +69,10 @@ mkdir -p $work
 
 mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
 
-if ! chroot /root /bin/sh -c exit
+if ! chroot /root /bin/sh -c "test -x /sbin/init -a -s /sbin/init"
 then
-	echo 'chroot test failed; invoking emergency shell.'
+	echo "Unable to confirm /sbin/init is an executable non-empty file."
+	echo "Change Root test failed!  Invoking emergency shell."
 	PS1=rescue#\  sulogin
 fi
 
-- 
2.6.4
