Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 150ED1A0342
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 21:10:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456999832804785.2974462839682;
 Thu, 3 Mar 2016 02:10:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux v2 0/2] hwmon: fix occ hwmon driver compile warning
 message and hide error message
Date: Thu,  3 Mar 2016 04:10:29 -0600
Message-Id: <1456999831-12589-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 10:10:37 -0000

Fixed warning message when compiling occ hwmon driver.
The issue is tracked by: https://github.com/openbmc/linux/issues/44

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/linux/pull/56

Yi Li (2):
  hwmon: fix occ hwmon driver compile warning message
  hwmon: Hide error message in OCC hwmon driver

 drivers/hwmon/power8_occ_i2c.c | 86 +++++++++++++++++++++++++++---------------
 1 file changed, 55 insertions(+), 31 deletions(-)

-- 
2.7.1
