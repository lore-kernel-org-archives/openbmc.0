Return-Path: <xiaoting.liu@hxt-semitech.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hxt-semitech.com
 (client-ip=223.203.96.18; helo=barracuda02.hxt-semitech.com;
 envelope-from=xiaoting.liu@hxt-semitech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hxt-semitech.com
Received: from barracuda02.hxt-semitech.com (unknown [223.203.96.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YC6G1YRvzDqDy
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 21:57:53 +1100 (AEDT)
X-ASG-Debug-ID: 1546858667-107606139f139e60001-mgJK9t
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([10.128.0.15]) by
 barracuda02.hxt-semitech.com with ESMTP id rBwp6DpdWE2escEX (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 07 Jan 2019 18:57:47 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from openbmc001.localdomain (10.5.21.169) by
 HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 7 Jan 2019 18:57:41 +0800
From: Xiaoting Liu <xiaoting.liu@hxt-semitech.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>
CC: <openbmc@lists.ozlabs.org>, <linux-hwmon@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <shunyong.yang@hxt-semitech.com>,
 <dongsheng.wang@hxt-semitech.com>, Xiaoting Liu
 <xiaoting.liu@hxt-semitech.com>
Subject: [PATCH v2 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
Date: Mon, 7 Jan 2019 18:57:42 +0800
X-ASG-Orig-Subj: [PATCH v2 1/4] pmbus: associate PMBUS_SKIP_STATUS_CHECK with
 driver_data
Message-ID: <b336867f159242e141f21e2bef7182adbc624fbd.1546851856.git.xiaoting.liu@hxt-semitech.com>
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
X-Barracuda-Start-Time: 1546858667
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.102:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 5038
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5000 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65266
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
X-List-Received-Date: Mon, 07 Jan 2019 10:57:59 -0000

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
v2:
  Move struct pmbus_device_info definition location from pmbus.h to pmbus.c=
.
  Change struct name from default_pmbus_info to pmbus_info_one.
  Change struct name from pmbus_info to pmbus_info_zero.
  Replace struct name dps460_pmbus_info and sgd009_pmbus_info with
  pmbus_info_one_skip.
---
 drivers/hwmon/pmbus/pmbus.c | 55 +++++++++++++++++++++++++++--------------=
----
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7688dab32f6e..e38dd97cc49a 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -28,6 +28,11 @@
 #include <linux/pmbus.h>
 #include "pmbus.h"

+struct pmbus_device_info {
+       int pages;
+       u32 flags;
+};
+
 /*
  * Find sensor groups and status registers on each page.
  */
@@ -172,13 +177,15 @@ static int pmbus_probe(struct i2c_client *client,
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
@@ -187,36 +194,40 @@ static int pmbus_probe(struct i2c_client *client,
                pdata->flags =3D PMBUS_SKIP_STATUS_CHECK;
        }

-       info->pages =3D id->driver_data;
+       info->pages =3D device_info->pages;
        info->identify =3D pmbus_identify;
        dev->platform_data =3D pdata;

        return pmbus_do_probe(client, id, info);
 }

+static const struct pmbus_device_info pmbus_info_one =3D {1, 0};
+static const struct pmbus_device_info pmbus_info_zero =3D {0, 0};
+static const struct pmbus_device_info pmbus_info_one_skip =3D {
+                               1, PMBUS_SKIP_STATUS_CHECK};
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
+       {"adp4000", (kernel_ulong_t)&pmbus_info_one},
+       {"bmr453", (kernel_ulong_t)&pmbus_info_one},
+       {"bmr454", (kernel_ulong_t)&pmbus_info_one},
+       {"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
+       {"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
+       {"mdt040", (kernel_ulong_t)&pmbus_info_one},
+       {"ncp4200", (kernel_ulong_t)&pmbus_info_one},
+       {"ncp4208", (kernel_ulong_t)&pmbus_info_one},
+       {"pdt003", (kernel_ulong_t)&pmbus_info_one},
+       {"pdt006", (kernel_ulong_t)&pmbus_info_one},
+       {"pdt012", (kernel_ulong_t)&pmbus_info_one},
+       {"pmbus", (kernel_ulong_t)&pmbus_info_zero},
+       {"sgd009", (kernel_ulong_t)&pmbus_info_one_skip},
+       {"tps40400", (kernel_ulong_t)&pmbus_info_one},
+       {"tps544b20", (kernel_ulong_t)&pmbus_info_one},
+       {"tps544b25", (kernel_ulong_t)&pmbus_info_one},
+       {"tps544c20", (kernel_ulong_t)&pmbus_info_one},
+       {"tps544c25", (kernel_ulong_t)&pmbus_info_one},
+       {"udt020", (kernel_ulong_t)&pmbus_info_one},
        {}
 };

--
1.8.3.1




This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights to retain, copy, or distribute this emai=
l or its contents, and should promptly delete the email and all electronic =
copies in your system; do not retain copies in any media. If you have recei=
ved this email in error, please notify the sender promptly. Thank you.
