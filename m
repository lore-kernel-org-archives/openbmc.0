Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r9yVv6pg6zDqCF
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 16:21:09 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463725265535229.10727226369636;
 Thu, 19 May 2016 23:21:05 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] hwmon: power8_occ_i2c: create hwmon sysfs attributes
 dynamically
Date: Fri, 20 May 2016 01:21:03 -0500
Message-Id: <1463725264-8594-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 20 May 2016 06:21:12 -0000

This patch fixes issue: https://github.com/openbmc/skeleton/issues/58.

OCC sensor number varies for different platforms.
The patch creates hwmon sysfs attributes dynamically, using sensor information
get from OCC. Previously the sysfs attributes are created using statically
defined data structures.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/linux/pull/84

Yi Li (1):
  hwmon: power8_occ_i2c: create hwmon sysfs attributes dynamically

 drivers/hwmon/power8_occ_i2c.c | 858 ++++++++++++++++-------------------------
 1 file changed, 328 insertions(+), 530 deletions(-)

-- 
2.8.2
