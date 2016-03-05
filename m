Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 425441A0B52
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14571810475541015.5102539094275;
 Sat, 5 Mar 2016 04:30:47 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 29/32] init: Look for options in u-boot environment
Date: Sat,  5 Mar 2016 06:30:20 -0600
Message-Id: <1457181023-23569-30-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457181023-23569-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:52 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Look in the saved u-boot environment for init options in addition
to the kernel command line.  This allows setting options to run
in the u-boot environment instead of setting bootargs.

Look at specific variables but not the whole environment so that
users can setup variable to run.  Look at two variables so scripts
can automatically clear one on successful boot as one-time options
(defer that to the full filesystem).

Instead of having the full fw_setenv / fw_getenv binaries which
would overflow the existing space for the initramfs, just use the
busybox strings command to extract the variables.  The oldest
variable might get a crc32 character or flag byte if redundant
environment were configured for nand but that is not expected
to be these user defined variables.

[1] The environment consists of a crc32, a flag byte if a
redundant environment is configured, then a series of var=value
strings seperated by NUL bytes.  The flag byte is 1 (active) or 0
(obsolete) for NOR flash, or a counter 0-255 in nand, the flag
byte cycles through 0-255.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index ecf3377..87f71e6 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -44,6 +44,19 @@ probe_fs_type() {
 	echo ${fst:=jffs2}
 }
 
+# This fw_get_env_var is a simple but slightly broken version of fw_printenv: 
+# The u-boot environemnt starts with a crc32, followed by a flag byte
+# when a redundannt environment is configured, followed by var=value\0 sets.
+# The flag byte for nand is a 1 byte counter; for nor it is a 1 or 0 byte.
+# The crc and/or nand flag byte can contain printable characters and be
+# considered part of the first string and parsed as part of the variable
+# name.  In addition a variable could have a "\n" embedded in it, this code
+# would split that variable.  Ignore for now, the last set var is at the end.
+
+get_fw_env_var() {
+	strings /run/fw_env | sed -ne "s/^$1=//p"
+}
+
 debug_takeover() {
 	echo "$@"
 	test -n "$@" && echo Enter password to try to manually fix.
@@ -107,6 +120,8 @@ update=/run/initramfs/update
 if test ! -f $optfile
 then
 	cat /proc/cmdline > $optfile
+	get_fw_env_var openbmcinit >> $optfile
+	get_fw_env_var openbmconce >> $optfile
 fi
 
 echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
-- 
2.7.1
