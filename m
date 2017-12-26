Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::229; helo=mail-io0-x229.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RFakpHY7"; 
 dkim-atps=neutral
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z5VwT2fhRzDqgR
 for <openbmc@lists.ozlabs.org>; Tue, 26 Dec 2017 20:26:16 +1100 (AEDT)
Received: by mail-io0-x229.google.com with SMTP id k202so23848293ioe.10
 for <openbmc@lists.ozlabs.org>; Tue, 26 Dec 2017 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dF+gcVXS5vp/5PdYGhG4sXkKdae8hQ9GTPtRoa+0ncU=;
 b=RFakpHY7akSsDF6i/mXHWYQH/zUlpjuARoKTqRALQYUet5MN8lSmpuX7WwO0SFps6E
 tKDHbJvOl47JNQieVw5ULDuUZvnxynxII5MvPYw6us5+0nMIPfZ32xzHgj+COhoOgSIc
 Vh2qUGeSVmLBXPZ4WzL7Hd1lzWBliKIfT5mi/OEW87Uf4bywMfcdAfocd21gHfV/4On4
 KKyFKRHPrjdNV7QZ5BZPNrybpsFjKmzKwUtELvivr05UPIEMoeNcXxX5+oGtwvH92HJ2
 ndBKpWkMOb8eT6OcBnUR1y0J60r6CMzZPM9lUCP1hcvTKrCqLSf2XyI6+ZxjyJMl7BDU
 g2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=dF+gcVXS5vp/5PdYGhG4sXkKdae8hQ9GTPtRoa+0ncU=;
 b=sq1cASKQ6QKu+FUx7a5VuGyzGOvLTvZQpnE7VW303FLhVUSYuUR5ln9tQ7/khV7zBV
 yCJx9P8xoywImNJY/hKlJu0fIokSHyGKctk8utZlNtbfzqjKzzMIbVIeDy150D4io60x
 1Idsy7S7n0ZghxPchTfCrcs/ZRTYA6VIWCsIpU1cDtnPlM1OL0TTU+wHfFfmusi3SnrR
 7Yjk6+eO37C2cfwN3HMx98b0ePbDZGiIiAPCs6KSvmSI/CKGFmu/AT68wgLxQxaHOMIn
 MqJGDx54VUN0+nYfZD2koiLm5QaMfZWlv0wSjQvi3q/km2+pSMztJvRKWgRLQZ2Q7HU/
 ug/Q==
X-Gm-Message-State: AKGB3mKZlrwy0qwXe+9G13zBJuhWMFe53dk4Uk2k+6scmkBHiroV3e8+
 V/y+SNoUbwlyMa2EB3tB0e7JjnrovItXCyIBAfqxBfHm
X-Google-Smtp-Source: ACJfBouv6G2FqUDEX7CCJGGm+0PAY4ZuqF6gEkgxl5kKq7P1VLDguY2d6+ys+hbqWDYDJRfFtJ7NOXWw+hZlWRKGigk=
X-Received: by 10.107.232.13 with SMTP id f13mr18615487ioh.207.1514280373731; 
 Tue, 26 Dec 2017 01:26:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.1.67 with HTTP; Tue, 26 Dec 2017 01:26:13 -0800 (PST)
From: Lei YU <mine260309@gmail.com>
Date: Tue, 26 Dec 2017 17:26:13 +0800
Message-ID: <CAARXrtnLa5PrjgT0eNL-y=xJFjbC-oGUaNNd49n60ncwWwo7Dw@mail.gmail.com>
Subject: TFTP kernel + NFS boot for OpenBMC
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Dec 2017 09:26:18 -0000

Hi,

There may be intents to boot from NFS for OpenBMC, e.g. for study or
debug purpose:

It could be much faster than flashing the entire chip;
The rw partition has limited size so sometime it is not possible to
override a large file with overlay fs;
It does not impact the original BMC chip at all.

Here are the steps to boot OpenBMC via tftp kernel + nfs root for
palmetto, just for reference.
If this is well accepted, this could be added to openbmc/doc.

Enable NFS related kernel configs, e.g. CONFIG_NFS_FS, CONFIG_ROOT_NFS, etc
Prepare the below files built by OpenBMC:

zImage # The kernel
zImage-aspeed-bmc-opp-palmetto.dtb # The dt blob
image-rofs # The ro part for root fs

On tftp server, prepare uImage because the uboot does not support zImage

# The entry address may be different for different systems
mkimage -A arm -O linux -T kernel -C none -a 0x40008000 -e 0x40008000
-n "Linux kernel" -d zImage uImage

And put the uImage and dtb on tftp root dir;
On NFS server, prepare rootfs by extracting the rofs image:

sudo unsquashfs -f -d <nfsroot-dir> image-rofs

In rootfs, add etc/systemd/network/00-bmc-eth0.network, e.g.

[Match]
Name=3Deth0
[Network]
Address=3D192.168.0.60/24
[DHCP]
CriticalConnection=3Dtrue

This is needed because when systemd-networkd starts, it will
re-initialize the network;
CriticalConnection=3Dtrue is needed, otherwise it will release the IP
and cause NFS hang.
It could be DHCP or static ip, it does not matter

Now it=E2=80=99s ready, let=E2=80=99s boot from nfs, e.g.

# In uboot, hit any key to stop autoboot
# Config network
setenv ethaddr <mac addr>
setenv ipaddr 192.168.0.60
setenv serverip 192.168.0.10
# Set bootargs to specify nfs rootfs
setenv bootargs root=3D/dev/nfs rw
nfsroot=3D192.168.0.10:/nfsroot/obmc-rofs,nolock console=3DttyS4,115200n8
ip=3D192.168.0.60:192.168.0.10:192.168.0.10:255.255.255.0
# Load kernel and dtb
tftp 0x40000000 uImage
tftp 0x40800000 zImage-aspeed-bmc-opp-palmetto.dtb
# Boot from kernel/dtb in ram
bootm 0x40000000 - 0x40800000

With above steps, the BMC works happily on NFS rootfs, I can replace
kernel/services easily.

=E2=80=94
BRs,
Lei YU
