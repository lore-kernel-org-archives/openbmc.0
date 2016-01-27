Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id F16191A02DE
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2016 18:30:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453879823404827.8163225145995;
 Tue, 26 Jan 2016 23:30:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Update kernel to openbmc-20160127-1
Date: Wed, 27 Jan 2016 01:30:21 -0600
Message-Id: <1453879822-25045-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
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
X-List-Received-Date: Wed, 27 Jan 2016 07:30:29 -0000

This includes a prototype of the mtd and occ hwmon drivers. They are not
ready for upstream, but are able to be tested.

Signed-off-by: Joel Stanley <joel@jms.id.au>

https://github.com/openbmc/openbmc/pull/148

Joel Stanley (1):
  Update kernel to openbmc-20160127-1

 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |    1 -
 .../recipes-kernel/linux/linux-obmc/barreleye.dts  |    1 -
 .../linux/linux-obmc/occ_hwmon.patch               | 1565 --------------------
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |    3 -
 .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |    2 +-
 5 files changed, 1 insertion(+), 1571 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.dts
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/occ_hwmon.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend

-- 
2.6.4
