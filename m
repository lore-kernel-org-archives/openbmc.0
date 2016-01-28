Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 21A0D1A1A2D
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2016 09:50:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454021421988133.37386335954614;
 Thu, 28 Jan 2016 14:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/8] Create obmc-phosphor-initfs startup and shutdown
 scripts
Date: Thu, 28 Jan 2016 16:50:13 -0600
Message-Id: <1454021419-16743-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 28 Jan 2016 22:50:27 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This recipe holds the key scripts for an initramfs image.
Written in sh to run with busybox, these three scripts handle
mounting, unmounting, and updating a set of mtd partitions to
form a read-write overlay on a read-only compressed base.

The init script will mount the base sysfs, proc, and devtmpfs as
well as run.  It copies the filesystem to run/initramfs to create
the shutdown and update environment.  It then mounts a base
read-only and read-write file system and then an overlay of them
combined, then continues with chroot into the overlay and execute
the normal /sbin/init.

The shutdown script will unmount the remaining nodev and root
filesystems from oldroot where systemd-shutdown pivots the old
file system, then looks for image- files. If any are found it
invokes update otherwise it performs the final reboot, powerdown,
or kexec, or halt.

The update script will attempt to mount the read/write overlay
and preserve selected files and directories based on a whitelist.
It then unmounts that fs and writes all image files to their
named mtd partition using flashcp, mounts and restores the saved
files, and finally unmounts the fs and performs the final reboot,
shutdown, kexec, or halt.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 meta-phosphor/classes/obmc-phosphor-initfs.bbclass |   4 +
 .../obmc-phosphor-initfs/files/obmc-init.sh        |  78 +++++++++++++++
 .../obmc-phosphor-initfs/files/obmc-shutdown.sh    |  55 +++++++++++
 .../obmc-phosphor-initfs/files/obmc-update.sh      | 106 +++++++++++++++++++++
 .../obmc-phosphor-initfs/files/whitelist           |   8 ++
 .../obmc-phosphor-initfs/obmc-phosphor-init.bb     |  23 +++++
 6 files changed, 274 insertions(+)
 create mode 100644 meta-phosphor/classes/obmc-phosphor-initfs.bbclass
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
 create mode 100755 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb

diff --git a/meta-phosphor/classes/obmc-phosphor-initfs.bbclass b/meta-phosphor/classes/obmc-phosphor-initfs.bbclass
new file mode 100644
index 0000000..de7923e
--- /dev/null
+++ b/meta-phosphor/classes/obmc-phosphor-initfs.bbclass
@@ -0,0 +1,4 @@
+# Common code for recipes that implement Phosphor OpenBMC filesystem
+
+RPROVIDES_${PN} += "obmc-phosphor-initfs"
+PROVIDES += "obmc-phosphor-initfs"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
new file mode 100644
index 0000000..431780a
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-init.sh
@@ -0,0 +1,78 @@
+#!/bin/sh
+
+rodir=run/initramfs/ro
+rwdir=run/initramfs/rw
+upper=$rwdir/cow
+work=$rwdir/work
+
+cd /
+mkdir -p sys proc dev run
+mount dev dev -tdevtmpfs
+mount sys sys -tsysfs
+mount proc proc -tproc
+if ! grep run proc/mounts
+then
+	mount tmpfs run -t tmpfs -o mode=755,nodev
+fi
+
+mkdir -p $rodir $rwdir
+
+cp -rp init shutdown update whitelist bin sbin usr lib etc var run/initramfs
+
+# To start a interactive shell with job control at this point, run
+# getty 38400 ttyS4
+
+findmtd() {
+	m=$(grep -xl "$1" /sys/class/mtd/*/name)
+	m=${m%/name}
+	m=${m##*/}
+	echo $m
+}
+
+rofs=$(findmtd rofs)
+rwfs=$(findmtd rwfs)
+
+rofst=squashfs
+rwfst=ext4
+
+echo rofs = $rofs $rofst   rwfs = $rwfs $rwfst
+
+if grep -w debug-init-sh /proc/cmdline ||
+	! mount -o rw /dev/mtdblock${rwfs#mtd} $rwdir -t $rwfst
+then
+	echo Please mount the rw file system on $rwdir from this shell
+	while ! sulogin && ! test -f /takeover
+	do
+		echo getty failed, retrying
+	done
+fi
+
+# Touch /takeover in the above getty to become pid 1
+if test -e /takeover
+then
+	export PS1=init#\ 
+	exec /bin/sh
+fi
+
+mount -o ro /dev/mtdblock${rofs#mtd} $rodir -t $rofst
+
+rm -rf $work
+mkdir -p $upper
+mkdir -p $work
+
+mount -t overlay -o lowerdir=$rodir,upperdir=$upper,workdir=$work cow /root
+
+if ! chroot /root /bin/sh -c exit
+then
+	echo 'chroot test failed; invoking emergency shell.'
+	PS1=rescue#\  sulogin
+fi
+
+for f in sys dev proc run
+do
+	mount --move $f root/$f
+done
+
+# switch_root /root /sbin/init
+exec chroot /root /sbin/init
+
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
new file mode 100644
index 0000000..029cd65
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh
@@ -0,0 +1,55 @@
+#!/bin/sh
+
+echo shutdown: "$@"
+
+export PS1=shutdown-sh#\ 
+# exec bin/sh
+
+if [ ! -e /proc/mounts ]
+then
+	mkdir -p /proc
+	mount  proc proc -tproc
+	umount_proc=1
+else
+	umount_proc=
+fi
+
+# remove an empty oldroot, that means we are not invoked from systemd-shutdown
+rmdir /oldroot 2>/dev/null
+
+set -x
+for f in $( awk '/oldroot/ { print $2 }' < /proc/mounts | sort -r )
+do
+	umount $f
+done
+set +x
+
+
+if test -x /update && ls image-* > /dev/null 2>&1
+then
+	exec /update ${1+"$@"}
+fi
+
+echo Remaining mounts:
+cat /proc/mounts
+
+test "umount_proc" && umount /proc && rmdir /proc
+
+
+
+# Execute the command systemd told us to ...
+if test -d /oldroot  && test "$1"
+then
+	if test "$1" == kexec
+	then
+		$1 -f -e
+	else
+		$1 -f
+	fi
+fi
+
+
+echo "Execute ${1-reboot} -f if all unounted ok, or exec /init"
+
+export PS1=shutdown-sh#\ 
+exec /bin/sh
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
new file mode 100755
index 0000000..1122e83
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/obmc-update.sh
@@ -0,0 +1,106 @@
+#!/bin/sh
+
+echo update: "$@"
+
+export PS1=update-sh#\ 
+# exec /bin/sh
+
+cd /
+if ! test -r /proc/mounts || ! test -f /proc/mounts
+then
+	mkdir -p /proc
+	mount -t proc proc proc
+fi
+if ! test -d /sys/class
+then
+	mkdir -p /sys
+	mount -t sysfs sys sys
+fi
+if ! test -c /dev/null
+then
+	mkdir -p /dev
+	mount -t devtmpfs dev dev
+fi
+while grep mtd /proc/mounts
+do
+	echo 1>&2 "Error: A mtd device is mounted."
+	sulogin
+	# exec /bin/sh
+done
+
+findmtd() {
+	m=$(grep -xl "$1" /sys/class/mtd/*/name)
+	m=${m%/name}
+	m=${m##*/}
+	echo $m
+}
+
+rofs=$(findmtd rofs)
+rwfs=$(findmtd rwfs)
+
+rofst=squahsfs
+rwfst=ext4
+
+if test -n "$rwfs" && test -s whitelist
+then
+
+	mkdir -p rw
+	mount /dev/mtdblock${rwfs#mtd} rw -oro -t $rwfst
+
+	while read f
+	do
+		if ! test -e rw/cow/$f
+		then
+			continue
+		fi
+		d="save/cow/$f"
+		mkdir -p "${d%/*}"
+		cp -rp rw/cow/$f "${d%/*}/"
+	done < whitelist
+
+	umount rw
+fi
+
+
+for f in image-*
+do
+	m=$(findmtd ${f#image-})
+	if test -z "$m"
+	then
+		echo 1>&2  "Unable to find mtd partiton for $f"
+		exec /bin/sh
+	fi
+done
+
+for f in image-*
+do
+	m=$(findmtd ${f#image-})
+	echo "Updating ${f#image-}"
+	# flasheraseall /dev/$m && dd if=$f of=/dev/$m
+	flashcp -v $f /dev/$m
+done
+
+
+if test -d save/cow
+then
+	mount /dev/mtdblock${rwfs#mtd} rw -o rw -t $rwfst
+	cp -rp save/cow/. rw/cow/
+	umount rw
+fi
+
+# Execute the command systemd told us to ...
+if test -d /oldroot && test -x "/sbin/$1" && test -f "/sbin/$1"
+then
+	if test "$1" == kexec
+	then
+		/sbin/$1 -f -e
+	else
+		/sbin/$1 -f
+	fi
+fi
+
+
+echo "Execute ${1-reboot} -f if all is ok"
+
+export PS1=update-sh#\ 
+exec /bin/sh
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
new file mode 100644
index 0000000..80f9c81
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/whitelist
@@ -0,0 +1,8 @@
+/etc/dropbear/dropbear_rsa_host_key
+/etc/systemd/network
+/etc/resolv.conf
+/etc/machine-id
+/etc/passwd
+/etc/group
+/etc/shadow
+/etc/gshadow
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
new file mode 100644
index 0000000..68ee00d
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/obmc-phosphor-init.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Phosphor OpenBMC pre-init scripts"
+DESCRIPTION = "Phosphor OpenBMC filesytem mount reference implementation."
+PR = "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-initfs
+
+S = "${WORKDIR}"
+SRC_URI += "file://obmc-init.sh"
+SRC_URI += "file://obmc-shutdown.sh"
+SRC_URI += "file://obmc-update.sh"
+SRC_URI += "file://whitelist"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/obmc-init.sh ${D}/init
+        install -m 0755 ${WORKDIR}/obmc-shutdown.sh ${D}/shutdown
+        install -m 0755 ${WORKDIR}/obmc-update.sh ${D}/update
+        install -m 0644 ${WORKDIR}/whitelist ${D}/whitelist
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
+}
+
+FILES_${PN} += " /init /shutdown /update /whitelist /dev "
-- 
2.6.4
