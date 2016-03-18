Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRCj32lL1zDqWX
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 16:00:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458277236725415.4422544151886;
 Thu, 17 Mar 2016 22:00:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/2] Add palmetto target to runqemu
Date: Fri, 18 Mar 2016 00:00:33 -0500
Message-Id: <1458277235-5775-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 05:00:40 -0000

The patches modelling a bare-bones AST2400 in QEMU have been merged into
master for the upcoming 2.6 release. Attached is an attempt at integrating the
necessary bits into openbmc so we can `bitbake obmc-phosphor-image` then
`runqemu palmetto` to boot the BMC kernel and some representation of the
userspace.

There's no networking, but I'll be taking a look at how difficult adding some
support might be. I've also asked in #yocto about if there's a better way to
add the palmetto support to runqemu but haven't had a reply. I'll ask on the
mailing list if that query goes unanswered, but from the way the scripts are
written it doesn't look like there is much alternative.

Cheers,

Andrew

PS: qemu doesn't terminate if you `poweroff`. To kill it, issue 'Ctrl-A c' to
switch to the monitor, then 'quit'.

Since the initial RFC:

  * Split the patch in two: add qemu_git.bb, then modify runqemu
  * Don't supplant yocto-poky qemu_2.4.0.bb
  * Change qemu_git.bb's fetch URL to avoid failures and add flexibility
  * Add a note about invoking `runqemu palmetto` on oe-init-build-env

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/210)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/210

Andrew Jeffery (2):
  meta-openbmc-bsp: Add qemu git recipe
  runqemu: Add palmetto target

 meta-openbmc-bsp/conf/layer.conf                   |   8 ++
 .../recipes-devtools/qemu/qemu-targets.inc         |  22 ++++
 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc    | 125 +++++++++++++++++++++
 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb |  21 ++++
 .../meta-palmetto/conf/bblayers.conf.sample        |   1 +
 .../meta-ibm/meta-palmetto/conf/conf-notes.txt     |   3 +
 .../meta-barreleye/conf/bblayers.conf.sample       |   1 +
 yocto-poky/scripts/runqemu                         |   9 +-
 yocto-poky/scripts/runqemu-internal                |  12 ++
 9 files changed, 199 insertions(+), 3 deletions(-)
 create mode 100644 meta-openbmc-bsp/conf/layer.conf
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
 create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb

-- 
2.7.1
