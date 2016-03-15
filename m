Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPcjv4rgKzDqyC
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 01:40:50 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14580528411491023.3070285070479;
 Tue, 15 Mar 2016 07:40:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] hwmon-adm1278: Add adm1278 to Barreleye device tree
Date: Tue, 15 Mar 2016 09:40:39 -0500
Message-Id: <1458052840-6561-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 14:40:52 -0000

This patch enables adm1278 (and other compatible devices) to be instantiated from
device tree. So we don't need to explicitly call:

echo adm1278 0x10 > /sys/bus/i2c/devices/i2c-4/new_device

Tested on Barreleye.

Signed-off-by: Yi Li <adamliyi@msn.com>

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/208)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/208

Yi Li (1):
  hwmon-adm1278: Add adm1278 to Barreleye device tree

 .../linux/linux-obmc/hwmon_adm1278.patch           | 92 ++++++++++++++++++----
 .../linux/linux-obmc/readme_adm1278.txt            |  7 +-
 2 files changed, 83 insertions(+), 16 deletions(-)

-- 
2.7.1
