Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46E251A03D6
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:05 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469922337256.2581414421171;
 Mon, 2 Nov 2015 05:12:02 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/4] Out of (kernel) tree device trees
Date: Mon,  2 Nov 2015 07:11:57 -0600
Message-Id: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Mon, 02 Nov 2015 13:12:05 -0000

Add plumbing and initial device trees for Palmetto/Barreleye.
Bump kernel version.

https://github.com/openbmc/openbmc/pull/62

Brad Bishop (4):
  Copy device tree into unpacked kernel source
  Use out of (kernel) tree device tree (Palmetto)
  Use out of (kernel) tree device tree (Barreleye)
  Bump kernel version to openbmc-20151102-1

 .../meta-ibm/meta-palmetto/conf/layer.conf         |   4 +
 .../meta-palmetto/conf/machine/palmetto.conf       |   2 +-
 .../recipes-kernel/linux/linux-obmc/palmetto.dts   | 325 ++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../meta-ibm/meta-palmetto/recipes.txt             |   1 +
 .../meta-barreleye/conf/machine/barreleye.conf     |   2 +-
 .../recipes-kernel/linux/linux-obmc/barreleye.dts  | 333 +++++++++++++++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
 .../meta-rackspace/meta-barreleye/recipes.txt      |   1 +
 .../common/recipes-kernel/linux/linux-obmc_4.2.bb  |  12 +-
 10 files changed, 681 insertions(+), 3 deletions(-)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/palmetto.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc_%.bbappend
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes.txt
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

-- 
2.6.0
