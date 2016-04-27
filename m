Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qw4DX3ngkzDqB2
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2016 01:50:36 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461772231087789.5988626756822;
 Wed, 27 Apr 2016 08:50:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Basic support for Firestone and Garrison systems
Date: Wed, 27 Apr 2016 10:50:29 -0500
Message-Id: <1461772230-19428-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Wed, 27 Apr 2016 15:50:37 -0000

Firestone and Garrison are IBM branded OpenPOWER systems.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/245)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/245

Brad Bishop (1):
  Basic support for Firestone and Garrison systems

 .../meta-firestone/conf/bblayers.conf.sample       |  27 +++
 .../meta-ibm/meta-firestone/conf/conf-notes.txt    |   2 +
 .../meta-ibm/meta-firestone/conf/layer.conf        |   9 +
 .../meta-ibm/meta-firestone/conf/local.conf.sample | 234 +++++++++++++++++++++
 .../meta-firestone/conf/machine/firestone.conf     |  12 ++
 .../recipes-kernel/linux/linux-obmc/firestone.cfg  |   4 +
 .../recipes-kernel/linux/linux-obmc/firestone.dts  |   1 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   4 +
 .../skeleton/skeleton/firestone.patch              |  11 +
 .../skeleton/skeleton/occ-path.patch               |   1 +
 .../skeleton/skeleton/poweron.patch                |   1 +
 .../meta-ibm/meta-firestone/recipes.txt            |   2 +
 .../meta-garrison/conf/bblayers.conf.sample        |  27 +++
 .../meta-ibm/meta-garrison/conf/conf-notes.txt     |   2 +
 .../meta-ibm/meta-garrison/conf/layer.conf         |   9 +
 .../meta-ibm/meta-garrison/conf/local.conf.sample  | 234 +++++++++++++++++++++
 .../meta-garrison/conf/machine/garrison.conf       |  12 ++
 .../recipes-kernel/linux/linux-obmc/garrison.cfg   |   4 +
 .../recipes-kernel/linux/linux-obmc/garrison.dts   |   1 +
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../recipes-phosphor/skeleton/skeleton.bbappend    |   4 +
 .../skeleton/skeleton/garrison.patch               |  11 +
 .../skeleton/skeleton/occ-path.patch               |  20 ++
 .../skeleton/skeleton/poweron.patch                | 113 ++++++++++
 .../meta-ibm/meta-garrison/recipes.txt             |   2 +
 26 files changed, 751 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/conf/machine/firestone.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc/firestone.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/firestone.patch
 create mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/occ-path.patch
 create mode 120000 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes-phosphor/skeleton/skeleton/poweron.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-firestone/recipes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/bblayers.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/conf-notes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/layer.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/local.conf.sample
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/conf/machine/garrison.conf
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.cfg
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc/garrison.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/garrison.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/occ-path.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes-phosphor/skeleton/skeleton/poweron.patch
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-garrison/recipes.txt

-- 
2.8.1
