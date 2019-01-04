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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WJpV5BvtzDqLr
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 20:07:45 +1100 (AEDT)
X-ASG-Debug-ID: 1546592159-093b7e2d8806ba0001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda.hxt-semitech.com with ESMTP id 898rFEhDEaL4TxcG (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Fri, 04 Jan 2019 16:55:59 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from openbmc001.localdomain (10.5.21.169) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 4 Jan 2019 16:55:55 +0800
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>
CC: <openbmc@lists.ozlabs.org>, <linux-hwmon@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Xiaoting Liu <xiaoting.liu@hxt-semitech.com>, 
 Shunyong Yang <shunyong.yang@hxt-semitech.com>
Subject: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with driver_data
Date: Fri, 4 Jan 2019 16:55:51 +0800
X-ASG-Orig-Subj: [PATCH 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
Message-ID: <680b4d5659971cc4f6e1a6878837c2ce49962a7c.1546591275.git.xiaoting.liu@hxt-semitech.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.5.21.169]
X-ClientProxiedBy: HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) To
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15)
Content-Transfer-Encoding: quoted-printable
X-Barracuda-Connect: UNKNOWN[10.128.0.15]
X-Barracuda-Start-Time: 1546592159
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4997 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65068
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Approved-At: Tue, 08 Jan 2019 15:50:01 +1100
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
X-List-Received-Date: Fri, 04 Jan 2019 09:07:49 -0000

Current code compares device name with name in i2c_device_id to decide
whether PMBUS_SKIP_STATUS_CHECK should be set in pmbus_platform_data,
which makes adding new devices with PMBUS_SKIP_STATUS_CHECK should also
modify code in pmbus_probe().

This patch adds pmbus_device_info to save pages and flags. Its pointer
is put in driver_data of i2c_device_id, which makes adding new device
more straightforward.

Signed-off-by: Shunyong Yang <shunyong.yang@hxt-semitech.com>
Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
---
 drivers/hwmon/pmbus/pmbus.c | 54 +++++++++++++++++++++++++++--------------=
----
 include/linux/pmbus.h       |  5 +++++
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7688dab32f6e..aa4cf9636e99 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -172,13 +172,15 @@ static int pmbus_probe(struct i2c_client *client,
        struct pmbus_driver_info *info;
        struct pmbus_platform_data *pdata =3D NULL;
        struct device *dev =3D &client->dev;
+       struct pmbus_device_info *device_info;

        info =3D devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KE=
RNEL);
        if (!info)
                return -ENOMEM;

-       if (!strcmp(id->name, "dps460") || !strcmp(id->name, "dps800") ||
-           !strcmp(id->name, "sgd009")) {
+       device_info =3D (struct pmbus_device_info *)id->driver_data;
+
+       if (device_info->flags & PMBUS_SKIP_STATUS_CHECK) {
                pdata =3D devm_kzalloc(dev, sizeof(struct pmbus_platform_da=
ta),
                                     GFP_KERNEL);
                if (!pdata)
@@ -187,36 +189,44 @@ static int pmbus_probe(struct i2c_client *client,
                pdata->flags =3D PMBUS_SKIP_STATUS_CHECK;
        }

-       info->pages =3D id->driver_data;
+       info->pages =3D device_info->pages;
        info->identify =3D pmbus_identify;
        dev->platform_data =3D pdata;

        return pmbus_do_probe(client, id, info);
 }

+static const struct pmbus_device_info default_pmbus_info =3D {1, 0};
+static const struct pmbus_device_info dps460_pmbus_info =3D {
+                               1, PMBUS_SKIP_STATUS_CHECK};
+static const struct pmbus_device_info dps800_pmbus_info =3D {
+                               1, PMBUS_SKIP_STATUS_CHECK};
+static const struct pmbus_device_info sgd009_pmbus_info =3D {
+                               1, PMBUS_SKIP_STATUS_CHECK};
+static const struct pmbus_device_info pmbus_info =3D {0, 0};
 /*
  * Use driver_data to set the number of pages supported by the chip.
  */
 static const struct i2c_device_id pmbus_id[] =3D {
-       {"adp4000", 1},
-       {"bmr453", 1},
-       {"bmr454", 1},
-       {"dps460", 1},
-       {"dps800", 1},
-       {"mdt040", 1},
-       {"ncp4200", 1},
-       {"ncp4208", 1},
-       {"pdt003", 1},
-       {"pdt006", 1},
-       {"pdt012", 1},
-       {"pmbus", 0},
-       {"sgd009", 1},
-       {"tps40400", 1},
-       {"tps544b20", 1},
-       {"tps544b25", 1},
-       {"tps544c20", 1},
-       {"tps544c25", 1},
-       {"udt020", 1},
+       {"adp4000", (kernel_ulong_t)&default_pmbus_info},
+       {"bmr453", (kernel_ulong_t)&default_pmbus_info},
+       {"bmr454", (kernel_ulong_t)&default_pmbus_info},
+       {"dps460", (kernel_ulong_t)&dps460_pmbus_info},
+       {"dps800", (kernel_ulong_t)&dps800_pmbus_info},
+       {"mdt040", (kernel_ulong_t)&default_pmbus_info},
+       {"ncp4200", (kernel_ulong_t)&default_pmbus_info},
+       {"ncp4208", (kernel_ulong_t)&default_pmbus_info},
+       {"pdt003", (kernel_ulong_t)&default_pmbus_info},
+       {"pdt006", (kernel_ulong_t)&default_pmbus_info},
+       {"pdt012", (kernel_ulong_t)&default_pmbus_info},
+       {"pmbus", (kernel_ulong_t)&pmbus_info},
+       {"sgd009", (kernel_ulong_t)&sgd009_pmbus_info},
+       {"tps40400", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544b20", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544b25", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
+       {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
+       {"udt020", (kernel_ulong_t)&default_pmbus_info},
        {}
 };

diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index ee3c2aba2a8e..3c05edad7666 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -46,4 +46,9 @@ struct pmbus_platform_data {
        struct regulator_init_data *reg_init_data;
 };

+struct pmbus_device_info {
+       int pages;
+       u32 flags;
+};
+
 #endif /* _PMBUS_H_ */
--
1.8.3.1




This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights to retain, copy, or distribute this emai=
l or its contents, and should promptly delete the email and all electronic =
copies in your system; do not retain copies in any media. If you have recei=
ved this email in error, please notify the sender promptly. Thank you.
