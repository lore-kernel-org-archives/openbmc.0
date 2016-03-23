Return-Path: <andrew@aj.id.au>
Received: from homiemail-a13.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVMX44W2FzDq6W
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:03:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=puumX8ys; 
 dkim-atps=neutral
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id B6FD8334072
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id; s=aj.id.au; bh=xAJi8WkVBek6a0Z7nh/hqUi
 u2vs=; b=puumX8yszfV1R7q/hyCGGKoTqlR+CRZL7sGJFT/VUVMtXhLQvAVKRQE
 oid8LUTp/2yZ/VZnnOTrgZ8m+Ts25SwwRK7R/0sA9xbw0KNWYgTTo0ghoRNG3eeX
 J6d11gmHZFvR4Xh6SLpWcb3KmXXDb85BrurfGKSt1fxyipxLCzvY=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 4583233406F
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 01:03:45 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: OpenBMC <openbmc@lists.ozlabs.org>
Subject: [RFC PATCH openbmc v3 0/8] Add palmetto target to runqemu,
 with networking
Date: Wed, 23 Mar 2016 18:33:27 +1030
Message-Id: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Wed, 23 Mar 2016 08:03:49 -0000
X-List-Received-Date: Wed, 23 Mar 2016 08:03:49 -0000

Hi all,

The patches modelling a bare-bones AST2400 in QEMU have been merged into
master for the upcoming 2.6 release. Attached is an attempt at integrating the
necessary bits into openbmc so we can `bitbake obmc-phosphor-image` then
`runqemu palmetto` to boot the BMC kernel and some representation of the
userspace.

This revision includes support for slirp and tun/tap networking: The machine
will come up at either 10.0.2.15 or 192.168.7.2 respectively. Note that the
network controller modelled is a Cadence GEM and not the ftgmac device, which
is a little inaccurate but means we can have networking sooner rather than
later.

The patches are also available on Github:

  https://github.com/amboar/openbmc/commits/runqemu-palmetto

I'd appreciate some testing and comments. I'm not sure about the approach of
baking in the Cadence driver for both environments (hardware, qemu) for
instance. Maybe we should use a different bitbake target altogether?

Cheers,

Andrew

Andrew Jeffery (8):
  meta-openbmc-bsp: Add qemu git recipe
  runqemu: Add palmetto target
  qemu_git.bb: Update to palmetto-bmc model with Cadence GEM
  linux-obmc: Allow processing of multiple device trees
  linux-obmc: Add a devicetree for QEMU palmetto-bmc machine
  palmetto: Configure macb driver into kernel
  palmetto: Build devicetrees for hardware and QEMU
  runqemu-internal: Configure tun/tap network for palmetto-bmc

 meta-openbmc-bsp/conf/layer.conf                   |   8 ++
 .../recipes-devtools/qemu/qemu-targets.inc         |  22 ++++
 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc    | 125 +++++++++++++++++++++
 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb |  21 ++++
 .../meta-palmetto/conf/bblayers.conf.sample        |   1 +
 .../meta-ibm/meta-palmetto/conf/conf-notes.txt     |   3 +
 .../meta-palmetto/conf/machine/palmetto.conf       |   1 +
 ...d-qemupalmetto-dts-with-Cadence-GEM-suppo.patch |  43 +++++++
 .../recipes-kernel/linux/linux-obmc/palmetto.cfg   |   2 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   1 +
 .../meta-barreleye/conf/bblayers.conf.sample       |   1 +
 .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |   2 +-
 yocto-poky/scripts/runqemu                         |   9 +-
 yocto-poky/scripts/runqemu-internal                |  16 +++
 14 files changed, 251 insertions(+), 4 deletions(-)
 create mode 100644 meta-openbmc-bsp/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch

-- 
2.5.0
