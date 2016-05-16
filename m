Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7kF65SKJzDq68
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 01:01:30 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1463410879247922.6430962359716;
 Mon, 16 May 2016 08:01:19 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] hwmon: power8_occ_i2c: Add more hwmon sysfs attribute
 definition
Date: Mon, 16 May 2016 10:01:16 -0500
Message-Id: <1463410877-31099-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 16 May 2016 15:01:31 -0000

This patch is a linux-4.4 port of previous patch:
https://github.com/openbmc/linux/pull/65/commits/f8087dfe91e6f82b634c99b3a48a147eaf59ca72

It is created as the backup workaround in order to catch 5/19 release,
for the blocking occ issue: https://github.com/openbmc/skeleton/issues/58

I am working on a new fix to dynamically create those sysfs attributes.
If the new fix cannot catch 5/19 release, we can use this patch temporarily.
When the new fix get merged, this patch can be replaced.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/linux/pull/81

Yi Li (1):
  hwmon: power8_occ_i2c: Add more hwmon sysfs attribute definition

 drivers/hwmon/power8_occ_i2c.c | 52 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

-- 
2.8.2
