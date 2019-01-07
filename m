Return-Path: <xiaoting.liu@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.7; helo=barracuda.hxt-semitech.com;
 envelope-from=xiaoting.liu@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda.hxt-semitech.com (mx01.hxt-semitech.com
 [223.203.96.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YCJj6FfpzDqDy
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 22:07:01 +1100 (AEDT)
X-ASG-Debug-ID: 1546859211-093b7e2d8852690001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda.hxt-semitech.com with ESMTP id SPds79qtF1AhgCfZ (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 07 Jan 2019 19:06:51 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from openbmc001.localdomain (10.5.21.169) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 7 Jan 2019 19:06:45 +0800
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>
CC: <openbmc@lists.ozlabs.org>, <linux-hwmon@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <shunyong.yang@hxt-semitech.com>,
 <dongsheng.wang@hxt-semitech.com>, Xiaoting Liu
 <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v2 4/4] hwmon: (pmbus) add support for DPS-650AB
Date: Mon, 7 Jan 2019 19:06:46 +0800
X-ASG-Orig-Subj: [PATCH v2 4/4] hwmon: (pmbus) add support for DPS-650AB
Message-ID: <2e94eb44c0acf6b90c1d9bbffd1c5c5cc2af59be.1546851856.git.xiaoting.liu@hxt-semitech.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546851856.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.5.21.169]
X-ClientProxiedBy: HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) To
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15)
Content-Transfer-Encoding: quoted-printable
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1546859211
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5000 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65265
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2019 11:07:02 -0000

Provide support for PSU DPS-650AB from Delta Electronics, INC.

Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
v2:
  Change the patch subject and commit message.
  Drop dps650ab.c file.
  Replace struct name dps650ab_pmbus_info with pmbus_info_one_skip.
---
 drivers/hwmon/pmbus/pmbus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index e38dd97cc49a..f6b35f858db8 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -213,6 +213,7 @@ static int pmbus_probe(struct i2c_client *client,
        {"bmr453", (kernel_ulong_t)&pmbus_info_one},
        {"bmr454", (kernel_ulong_t)&pmbus_info_one},
        {"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
+       {"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
        {"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
        {"mdt040", (kernel_ulong_t)&pmbus_info_one},
        {"ncp4200", (kernel_ulong_t)&pmbus_info_one},
--
1.8.3.1




This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights to retain, copy, or distribute this emai=
l or its contents, and should promptly delete the email and all electronic =
copies in your system; do not retain copies in any media. If you have recei=
ved this email in error, please notify the sender promptly. Thank you.
