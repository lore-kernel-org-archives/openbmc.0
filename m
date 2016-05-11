Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4N2y19sdzDqCm
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 14:11:05 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462939861481113.72390008532045;
 Tue, 10 May 2016 21:11:01 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux] [hwmon pmbus]: Enable adm1278 VOUT sampling
Date: Tue, 10 May 2016 23:10:59 -0500
Message-Id: <1462939860-27192-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
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
X-List-Received-Date: Wed, 11 May 2016 04:11:06 -0000

The reset value of ADM1278 PMON_CONFIG register does not enable VOUT sampling.
This patch enables VOUT sampling in ADM1278 PMON_CONFIG register.

The patch fixes issue: https://github.com/openbmc/linux/issues/71.

Signed-off-by: Yi Li <adamliyi@msn.com>

https://github.com/openbmc/linux/pull/80

Yi Li (1):
  [hwmon pmbus]: Enable adm1278 VOUT sampling

 drivers/hwmon/pmbus/adm1275.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.8.1
