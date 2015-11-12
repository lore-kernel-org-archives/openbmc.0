Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C1E441A072B
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 23:10:49 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327220490215.58183287774727;
 Thu, 12 Nov 2015 03:20:20 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4 0/5] add i2c-occ to barreleye and palmetto device
 table
Date: Thu, 12 Nov 2015 06:20:14 -0500
Message-Id: <1447327219-20318-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
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
X-List-Received-Date: Thu, 12 Nov 2015 12:10:50 -0000

So i2c-occ driver can be initialized and read sensor data from OCC.

https://github.com/openbmc/openbmc/pull/73

adamliyi (5):
  add i2c-occ to barreleye device table
  add occ-i2c to palmetto device table
  initial check in for occ hwmon driver
  change i2c-occ path
  add occ hwmon into obmc build

 .../conf/machine/include/openpower.inc               |  2 ++
 .../recipes-kernel/linux/linux-obmc/palmetto.dts     |  4 ++++
 .../recipes-kernel/linux/linux-obmc/barreleye.dts    |  8 ++++++++
 .../recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb    | 20 ++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-kernel/i2c-occ-mod/i2c-occ-mod_0.1.bb

-- 
2.6.3
