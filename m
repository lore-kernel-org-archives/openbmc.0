Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 83E491A03DF
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2016 23:30:53 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457181048402511.85940878783174;
 Sat, 5 Mar 2016 04:30:48 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 30/32] init: Add a hook to download files
Date: Sat,  5 Mar 2016 06:30:21 -0600
Message-Id: <1457181023-23569-31-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 05 Mar 2016 12:30:54 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Add a hook to run a shell command line that is stored in a u-boot
environment variable.  Only execute this command if the previously
established options file has a keyword trigger.  Do not even consider
the option if a build option flag is not set to y.

This allows one to specify at u-boot commands that would download
a read-only file system into memory for execution this boot instead
of needing to create a custom initramfs to netboot or specifing
debug-init-sh, entering the password, and doing the download from
the shell.

If the u-boot environment variable is empty or missing but both
the build variable is set and the keyword trigger are set print
a diagnostic message.  If the command fails invoke standard
debug_takeover for corrective action.

An example script:
fw_setenv openbmcinitdownload 'cp /proc/net/pnp /run/resolv.conf ; ln -snf ../run/resolv.conf /etc/resolv.conf ; wget -O /run/image-rofs http://server.example.com/path/image-test-rofs'
---
 .../obmc-phosphor-initfs/files/obmc-init.sh               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 87f71e6..71a72fb 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -101,6 +101,7 @@ rwdev=/dev/mtdblock${rwfs#mtd}
 # Set to y for yes, anything else for no.
 force_rwfst_jffs2=y
 flash_images_before_init=n
+consider_openbmc_download_files=y
 
 rofst=squashfs
 rwfst=$(probe_fs_type $rwdev)
@@ -131,6 +132,20 @@ then
 	debug_takeover "Debug initial shell requested by command line."
 fi
 
+if test "x$consider_openbmc_download_files" = xy &&
+	grep -w openbmc-init-download-files $optfile
+then
+	echo "Executing download hook..."
+	cmd="$(get_fw_env_var openbmcinitdownload)"
+	if test -z "$cmd"
+	then
+		echo 2>&1 "Download command not found or empty, skipping."
+	elif ! sh -xc "$cmd"
+	then
+		debug_takeover "Download command '$cmd' failed."
+	fi
+fi
+
 # If there are images in root move them to /run/initramfs/ or /run/ now.
 imagebasename=${image##*/}
 if test -n "${imagebasename}" && ls /${imagebasename}* > /dev/null 2>&1
-- 
2.7.1
