Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qT16l5bpCzDq7K
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2016 14:10:39 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458529834968922.6647275747576;
 Sun, 20 Mar 2016 20:10:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Move to openbmc-20160321-1
Date: Sun, 20 Mar 2016 22:10:28 -0500
Message-Id: <1458529829-26078-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 21 Mar 2016 03:10:40 -0000

We are now on a 4.4 based kernel

 - Fix i2c_smbus_read_block_data error in our i2c bus driver
 - Includes many JFFS2 fixes identified by Milton:
    * Fix directory hardlinks from deleted directories
    * Revert "jffs2: Fix lock acquisition order bug in jffs2_write_begin"
    * jffs2: Fix page lock / f->sem deadlock
    * jffs2: reduce the breakage on recovery from halfway failed rename()
 - Remove our in-tree adm1275 driver in favour of the upstream one,
   which was cherry picked from 4.6-rc1
 - Squishes down most of the fixes that were found in the 4.3
   development effort into the commit that added the driver. This is
   part of the work in preparing for upstreaming Aspeed kernel support.

Signed-off-by: Joel Stanley <joel@jms.id.au>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/212)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/212

Joel Stanley (1):
  meta-phosphor: Move to openbmc-20160321-1

 .../recipes-kernel/linux/linux-obmc/barreleye.cfg  |   3 -
 .../linux/linux-obmc/hwmon_adm1278.patch           | 165 ---------------------
 .../linux/linux-obmc/readme_adm1278.txt            |  78 ----------
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   3 -
 .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |  30 ----
 .../common/recipes-kernel/linux/linux-obmc_4.4.bb  |  20 +++
 6 files changed, 20 insertions(+), 279 deletions(-)
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/barreleye.cfg
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/hwmon_adm1278.patch
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc/readme_adm1278.txt
 delete mode 100644 meta-openbmc-machines/meta-openpower/meta-rackspace/meta-barreleye/recipes-kernel/linux/linux-obmc_%.bbappend
 delete mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb

-- 
2.7.1
