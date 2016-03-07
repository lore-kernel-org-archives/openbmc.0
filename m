Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DAE001A035C
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 08:30:54 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457386250314331.15904001912884;
 Mon, 7 Mar 2016 13:30:50 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 31/34] init: Add a hook to download files
Date: Mon,  7 Mar 2016 15:30:20 -0600
Message-Id: <1457386223-5725-32-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457386223-5725-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 21:30:55 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Add a hook to download a read-only file system image file from
a URL using TFTP, HTTP, or FTP.  The URL is retrieved from a
u-boot environment variable unless the file is already in the
initramfs image.  Only execute this command if the previously
established options file has a keyword trigger.  Do not even
consider the option if a build option flag is not set to y,
and allow each protocol to be disabled by simiar build options.

This allows one to specify at u-boot commands that would download
a read-only file system into memory for execution this boot instead
of needing to create a custom initramfs to netboot or specifying
debug-init-sh, entering the password, and doing the download from
the shell.

Note: Access to set u-boot environment variables implys the
ability to replace the kernel and initramfs session.  Access to
the variables and the serial console likely gives full root access
to the system at this time.  The existing shutdown and update
scripts have paths that expose a root shell to the serial port
without a prior password challenge.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../obmc-phosphor-initfs/files/obmc-init.sh        | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
index 814ee07..4f24246 100644
--- a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -57,6 +57,58 @@ get_fw_env_var() {
 	strings /run/fw_env | sed -ne "s/^$1=//p"
 }
 
+setup_resolv() {
+	runresolv=/run/systemd/resolve/resolv.conf
+	etcresolv=/etc/resolv.conf
+
+	if test ! -e $etcresolv -a ! -L $etcresolv
+	then
+		mkdir -p ${runresolv%/*}
+		ln -s $runresolv $etcresolv
+	fi
+	if test ! -f $runresolv
+	then
+		cat  /proc/net/pnp > $runresolv
+	fi
+
+	return 0
+}
+
+try_tftp() {
+	# split into  tftp:// host:port/ path/on/remote
+	# then spilt off / and then :port from the end of host:port/
+	# and : from the beginning of port
+
+	rest="${1#tftp://}"
+	path=${rest#*/}
+	host=${rest%$path}
+	host="${host%/}"
+	port="${host#${host%:*}}"
+	host="${host%$port}"
+	port="${port#:}"
+
+	setup_resolv
+
+	if test -z "$host" -o -z "$path"
+	then
+		debug_takeover "Invalid tftp download url '$url'."
+	elif echo "Downloading '$url' from $host ..."  &&
+		! tftp -g -r "$path" -l /run/image-rofs "$host" ${port+"$port"}
+	then
+		debug_takeover "Download of '$url' failed."
+	fi
+}
+
+try_wget() {
+	setup_resolv
+
+	echo "Downloading '$1' ..."
+	if ! wget -O /run/image-rofs "$1"
+	then
+		debug_takeover "Download of '$url' failed."
+	fi
+}
+
 debug_takeover() {
 	echo "$@"
 	test -n "$@" && echo Enter password to try to manually fix.
@@ -101,6 +153,10 @@ rwdev=/dev/mtdblock${rwfs#mtd}
 # Set to y for yes, anything else for no.
 force_rwfst_jffs2=y
 flash_images_before_init=n
+consider_download_files=y
+consider_download_tftp=y
+consider_download_http=y
+consider_download_ftp=y
 
 rofst=squashfs
 rwfst=$(probe_fs_type $rwdev)
@@ -115,6 +171,7 @@ fsckbase=/sbin/fsck.
 fsck=$fsckbase$rwfst
 fsckopts=-a
 optfile=/run/initramfs/init-options
+urlfile=/run/initramfs/init-download-url
 update=/run/initramfs/update
 
 if test -e /${optfile##*/}
@@ -136,6 +193,56 @@ then
 	debug_takeover "Debug initial shell requested by command line."
 fi
 
+if test "x$consider_download_files" = xy &&
+	grep -w openbmc-init-download-files $optfile
+then
+	if test -f ${urlfile##*/}
+	then
+		cp ${urlfile##*/} $urlfile
+	fi
+	if test ! -f $urlfile
+	then
+		get_fw_env_var openbmcinitdownloadurl > $urlfile
+	fi
+	url="$(cat $urlfile)"
+	rest="${url#*://}"
+	proto="${url%$rest}"
+
+	if test -z "$url"
+	then
+		echo "Download url empty.  Ignoring download request."
+	elif test -z "$proto"
+	then
+		echo "Download failed."
+	elif test "$proto" = tftp://
+	then
+		if test "x$consider_download_tftp" = xy
+		then
+			try_tftp "$url"
+		else
+			echo "Download failed."
+		fi
+	elif test "$proto" = http://
+	then
+		if test "x$consider_download_http" = xy
+		then
+			try_wget "$url"
+		else
+			echo "Download failed."
+		fi
+	elif test "$proto" = ftp://
+	then
+		if test "x$consider_download_ftp" = xy
+		then
+			try_wget "$url"
+		else
+			echo "Download failed."
+		fi
+	else
+		echo "Download failed."
+	fi
+fi
+
 # If there are images in root move them to /run/initramfs/ or /run/ now.
 imagebasename=${image##*/}
 if test -n "${imagebasename}" && ls /${imagebasename}* > /dev/null 2>&1
-- 
2.7.1
