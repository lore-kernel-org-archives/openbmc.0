Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTmcb3M8WzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 19:50:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458636635656815.8348324471949;
 Tue, 22 Mar 2016 01:50:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?q?=5BPATCH=20linux=20v2=5D=20hwmon=3A=20power8=5Focc=5Fi2c=3A=20Add=20more=20hwmon=20sysfs=20attribute=20definition=20to=20s=E2=80=A6?=
Date: Tue, 22 Mar 2016 03:50:28 -0500
Message-Id: <1458636629-23994-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 22 Mar 2016 08:50:40 -0000

…upport more sensors

This patch fixes issue: https://github.com/openbmc/skeleton/issues/58

The hwmon sys attributes are created using statically defined arrays.
Some POWER CPU has 10-core, while some POWER CPU has 12-core.
The more cores, the more OCC sensors. E.g, for 12-core CPU,
there will be 28 temperature sensors. The statically defined
array will overflow in this case.

This is a temporary fix. Will need to generate the hwmon sysfs attributes
dynamically based on sensor number.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/linux/65)
<!-- Reviewable:end -->


https://github.com/openbmc/linux/pull/65

Yi Li (1):
  hwmon: power8_occ_i2c: Add more hwmon sysfs attribute definition to
    support more sensors

 drivers/hwmon/power8_occ_i2c.c | 52 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

-- 
2.7.1
