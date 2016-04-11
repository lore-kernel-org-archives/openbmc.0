Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qjr7J6cJbzDq6B
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2016 10:10:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1460333433126299.13418501922274;
 Sun, 10 Apr 2016 17:10:33 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/7] Add palmetto target to runqemu, with networking
Date: Sun, 10 Apr 2016 19:10:24 -0500
Message-Id: <1460333431-28399-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
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
X-List-Received-Date: Mon, 11 Apr 2016 00:10:37 -0000

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

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/230)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/230

Andrew Jeffery (7):
  meta-openbmc-bsp: Add qemu git recipe
  runqemu: Add palmetto target
  qemu_git.bb: Update to palmetto-bmc model with Cadence GEM
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
 yocto-poky/scripts/runqemu                         |   9 +-
 yocto-poky/scripts/runqemu-internal                |  16 +++
 13 files changed, 250 insertions(+), 3 deletions(-)
 create mode 100644 meta-openbmc-bsp/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch

-- 
2.7.1
