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
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Y54P4RsWzDqFG
 for <openbmc@lists.ozlabs.org>; Mon,  7 Jan 2019 17:25:52 +1100 (AEDT)
X-ASG-Debug-ID: 1546842338-093b7e2d884cc90001-mgJK9t
Received: from HXTBJIDCEMVIW01.hxtcorp.net ([10.128.0.14]) by
 barracuda.hxt-semitech.com with ESMTP id kHpGbrsrzbB6TOXD (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Mon, 07 Jan 2019 14:25:38 +0800 (CST)
X-Barracuda-Envelope-From: xiaoting.liu@hxt-semitech.com
Received: from HXTBJIDCEMVIW02.hxtcorp.net (10.128.0.15) by
 HXTBJIDCEMVIW01.hxtcorp.net (10.128.0.14) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 7 Jan 2019 14:25:33 +0800
Received: from HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6]) by
 HXTBJIDCEMVIW02.hxtcorp.net ([fe80::3e:f4ff:7927:a6f6%12]) with mapi id
 15.00.1395.000; Mon, 7 Jan 2019 14:25:33 +0800
From: "Liu, Xiaoting" <xiaoting.liu@hxt-semitech.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "jdelvare@suse.com" <jdelvare@suse.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org"
 <linux-hwmon@vger.kernel.org>, "Yang, Shunyong"
 <shunyong.yang@hxt-semitech.com>, "Wang, Dongsheng"
 <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH 4/4] pmbus (dps650ab): add power supply driver
Thread-Topic: [PATCH 4/4] pmbus (dps650ab): add power supply driver
X-ASG-Orig-Subj: Re: [PATCH 4/4] pmbus (dps650ab): add power supply driver
Thread-Index: AQHUpAyjuZUtnFKIRUmA7tFmFsqKeg==
Date: Mon, 7 Jan 2019 06:25:33 +0000
Message-ID: <a494c032f6344528a89bf9b9aa81a3d7@HXTBJIDCEMVIW02.hxtcorp.net>
References: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <e0ad8b6bb620f9fc2f818cbda66825c297f73d67.1546591275.git.xiaoting.liu@hxt-semitech.com>
 <20190105170847.GA14962@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.64.1.98]
Content-Type: multipart/alternative;
 boundary="_000_a494c032f6344528a89bf9b9aa81a3d7HXTBJIDCEMVIW02hxtcorpn_"
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.128.0.14]
X-Barracuda-Start-Time: 1546842338
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://192.168.50.101:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at hxt-semitech.com
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.4901 1.0000 0.0000
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.65257
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.00 HTML_MESSAGE           BODY: HTML included in message
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
X-List-Received-Date: Mon, 07 Jan 2019 06:25:59 -0000

--_000_a494c032f6344528a89bf9b9aa81a3d7HXTBJIDCEMVIW02hxtcorpn_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Guenter Roeck,

Thanks for your apply, we will drop this patch and add the struct pmbus_dev=
ice_info in PMBus.c.

Thanks,
Xiaoting.

On 2019/1/6 1:08, Guenter Roeck wrote:

On Fri, Jan 04, 2019 at 05:05:27PM +0800, Xiaoting Liu wrote:


The Delta dps650ab provides main power and standby power to server.
dps650ab can be detected by MFR_ID and MFR_MODEL referring to
manufacturer's feedback. This patch adds driver to moniter power
supply status.




Another comment: The subject should be something like
        hwmon: (pmbus) Add driver for DPS650AB power supply

Additional comments inline below.

Thanks,
Guenter


Signed-off-by: Xiaoting Liu <xiaoting.liu@hxt-semitech.com><mailto:xiaoting=
.liu@hxt-semitech.com>
---
 drivers/hwmon/pmbus/Kconfig    |  10 +++++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/dps650ab.c | 100 +++++++++++++++++++++++++++++++++++++=
++++
 drivers/hwmon/pmbus/pmbus.c    |   3 ++
 4 files changed, 114 insertions(+)

--
1.8.3.1


diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 629cb45f8557..de4638396592 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -184,4 +184,14 @@ config SENSORS_ZL6100
          This driver can also be built as a module. If so, the module will
          be called zl6100.

+config SENSORS_DPS650AB
+       tristate "Delta DPS650AB"
+       default n
+       help
+         If you say yes here you get hardware monitoring support for the
+         Delta DPS650AB controller.
+
+         This driver can also be built as a module. If so, the module will
+         be called dps650ab.
+


Ahplabetic order, please.



 endif # PMBUS
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index ea0e39518c21..414818230a26 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_SENSORS_TPS53679)        +=3D tps53679.o
 obj-$(CONFIG_SENSORS_UCD9000)  +=3D ucd9000.o
 obj-$(CONFIG_SENSORS_UCD9200)  +=3D ucd9200.o
 obj-$(CONFIG_SENSORS_ZL6100)   +=3D zl6100.o
+obj-$(CONFIG_SENSORS_DPS650AB) +=3D dps650ab.o



Alphabetic order, please.



diff --git a/drivers/hwmon/pmbus/dps650ab.c b/drivers/hwmon/pmbus/dps650ab.=
c
new file mode 100644
index 000000000000..3c300e621f5a
--- /dev/null
+++ b/drivers/hwmon/pmbus/dps650ab.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring driver for DELTA DPS650AB
+ *
+ * Copyright (c) 2018 Huaxintong Semiconductor Technology Co., Ltd.
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include "pmbus.h"
+
+#define DPS650AB_MFR_ID                        "DELTA"
+#define DPS650AB_MFR_MODEL             "DPS-650AB-16 A"
+
+static int dps650ab_probe(struct i2c_client *client,
+                        const struct i2c_device_id *id)
+{
+       struct pmbus_driver_info *info;
+       u8 buf[I2C_SMBUS_BLOCK_MAX];
+       int ret;
+
+       memset(buf, 0, I2C_SMBUS_BLOCK_MAX);
+
+       if (!i2c_check_functionality(client->adapter,
+                                    I2C_FUNC_SMBUS_READ_BYTE_DATA
+                               | I2C_FUNC_SMBUS_READ_WORD_DATA
+                               | I2C_FUNC_SMBUS_READ_BLOCK_DATA))
+               return -ENODEV;
+
+       ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+       if (ret < 0) {
+               dev_err(&client->dev, "Failed to read PMBUS_MFR_ID\n");
+               return ret;
+       }
+
+       if (strncmp(buf, DPS650AB_MFR_ID, strlen(DPS650AB_MFR_ID))) {
+               dev_err(&client->dev, "DPS650AB_MFR_ID unrecognised\n");
+               return -ENODEV;
+       }
+
+       ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+       if (ret < 0) {
+               dev_err(&client->dev, "Failed to read PMBUS_MFR_MODEL\n");
+               return ret;
+       }
+
+       if (strncmp(buf, DPS650AB_MFR_MODEL, strlen(DPS650AB_MFR_MODEL))) {
+               dev_err(&client->dev, "DPS650AB_MFR_MODEL unrecognised\n");
+               return -ENODEV;
+       }
+
+       info =3D devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
+       if (!info)
+               return -ENOMEM;
+
+       info->pages =3D 1;
+       info->format[PSC_VOLTAGE_IN] =3D linear;
+       info->format[PSC_VOLTAGE_OUT] =3D linear;
+       info->format[PSC_CURRENT_IN] =3D linear;
+       info->format[PSC_CURRENT_OUT] =3D linear;
+       info->format[PSC_POWER] =3D linear;
+       info->format[PSC_TEMPERATURE] =3D linear;
+
+       info->func[0] =3D PMBUS_HAVE_VIN
+               | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
+               | PMBUS_HAVE_STATUS_INPUT
+               | PMBUS_HAVE_POUT | PMBUS_HAVE_FAN12
+               | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
+               | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
+               | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+               | PMBUS_HAVE_STATUS_TEMP;
+       info->func[1] =3D info->func[0];
+
+       return pmbus_do_probe(client, id, info);
+}
+
+static const struct i2c_device_id dps650ab_id[] =3D {
+       {"dps650ab", 1},
+       {}
+};
+
+MODULE_DEVICE_TABLE(i2c, dps650ab_id);
+
+static struct i2c_driver dps650ab_driver =3D {
+       .driver =3D {
+               .name   =3D "dps650ab",
+       },
+       .probe          =3D dps650ab_probe,
+       .remove         =3D pmbus_do_remove,
+       .id_table       =3D dps650ab_id,
+};
+
+module_i2c_driver(dps650ab_driver);
+
+MODULE_AUTHOR("Liuxiaoting <xiaoting.liu@hxt-semitech.com<mailto:xiaoting.=
liu@hxt-semitech.com>");
+MODULE_DESCRIPTION("PMBus driver for DPS650AB");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index aa4cf9636e99..930e8a3e2366 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -204,6 +204,8 @@ static int pmbus_probe(struct i2c_client *client,
 static const struct pmbus_device_info sgd009_pmbus_info =3D {
                                1, PMBUS_SKIP_STATUS_CHECK};
 static const struct pmbus_device_info pmbus_info =3D {0, 0};
+static const struct pmbus_device_info dps650ab_pmbus_info =3D {
+                               1, PMBUS_SKIP_STATUS_CHECK};
 /*
  * Use driver_data to set the number of pages supported by the chip.
  */
@@ -227,6 +229,7 @@ static int pmbus_probe(struct i2c_client *client,
        {"tps544c20", (kernel_ulong_t)&default_pmbus_info},
        {"tps544c25", (kernel_ulong_t)&default_pmbus_info},
        {"udt020", (kernel_ulong_t)&default_pmbus_info},
+       {"dps650ab", (kernel_ulong_t)&dps650ab_pmbus_info},
        {}
 };









This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights to retain, copy, or distribute this emai=
l or its contents, and should promptly delete the email and all electronic =
copies in your system; do not retain copies in any media. If you have recei=
ved this email in error, please notify the sender promptly. Thank you.



--_000_a494c032f6344528a89bf9b9aa81a3d7HXTBJIDCEMVIW02hxtcorpn_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<div class=3D"moz-cite-prefix">Hi Guenter Roeck,</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">Thanks for your apply, we will drop this pat=
ch and add the struct<span style=3D"font-size:10.5pt;mso-bidi-font-size:=0A=
11.0pt;font-family:DengXian;mso-ascii-theme-font:minor-latin;mso-fareast-th=
eme-font:=0A=
minor-fareast;mso-hansi-font-family:DengXian;mso-hansi-theme-font:minor-lat=
in;=0A=
        mso-bidi-font-family:&quot;Times New=0A=
        Roman&quot;;mso-bidi-theme-font:minor-bidi;=0A=
mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA"=
 lang=3D"EN-US"></span>
 pmbus_device_info in PMBus.c.</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">Thanks,<br>
</div>
<div class=3D"moz-cite-prefix">Xiaoting.<br>
</div>
<div class=3D"moz-cite-prefix"><br>
</div>
<div class=3D"moz-cite-prefix">On 2019/1/6 1:08, Guenter Roeck wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:20190105170847.GA14962@roeck-us.net">
<pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Jan 04, 2019 at 05:05:27PM &=
#43;0800, Xiaoting Liu wrote:=0A=
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">The Delta dps650ab provides main pow=
er and standby power to server.=0A=
dps650ab can be detected by MFR_ID and MFR_MODEL referring to=0A=
manufacturer's feedback. This patch adds driver to moniter power=0A=
supply status.=0A=
=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">=0A=
Another comment: The subject should be something like=0A=
	hwmon: (pmbus) Add driver for DPS650AB power supply=0A=
=0A=
Additional comments inline below.=0A=
=0A=
Thanks,=0A=
Guenter=0A=
</pre>
</blockquote>
<blockquote type=3D"cite" cite=3D"mid:20190105170847.GA14962@roeck-us.net">
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Xiaoting Liu <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiaoting.liu@hxt-semitech.com">&l=
t;xiaoting.liu@hxt-semitech.com&gt;</a>=0A=
---=0A=
 drivers/hwmon/pmbus/Kconfig    |  10 &#43;&#43;&#43;&#43;&#43;=0A=
 drivers/hwmon/pmbus/Makefile   |   1 &#43;=0A=
 drivers/hwmon/pmbus/dps650ab.c | 100 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;=0A=
 drivers/hwmon/pmbus/pmbus.c    |   3 &#43;&#43;=0A=
 4 files changed, 114 insertions(&#43;)=0A=
=0A=
--=0A=
1.8.3.1=0A=
=0A=
=0A=
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig=0A=
index 629cb45f8557..de4638396592 100644=0A=
--- a/drivers/hwmon/pmbus/Kconfig=0A=
&#43;&#43;&#43; b/drivers/hwmon/pmbus/Kconfig=0A=
@@ -184,4 &#43;184,14 @@ config SENSORS_ZL6100=0A=
          This driver can also be built as a module. If so, the module will=
=0A=
          be called zl6100.=0A=
=0A=
&#43;config SENSORS_DPS650AB=0A=
&#43;       tristate &quot;Delta DPS650AB&quot;=0A=
&#43;       default n=0A=
&#43;       help=0A=
&#43;         If you say yes here you get hardware monitoring support for t=
he=0A=
&#43;         Delta DPS650AB controller.=0A=
&#43;=0A=
&#43;         This driver can also be built as a module. If so, the module =
will=0A=
&#43;         be called dps650ab.=0A=
&#43;=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">Ahplabetic order, please.=0A=
=0A=
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D""> endif # PMBUS=0A=
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile=0A=
index ea0e39518c21..414818230a26 100644=0A=
--- a/drivers/hwmon/pmbus/Makefile=0A=
&#43;&#43;&#43; b/drivers/hwmon/pmbus/Makefile=0A=
@@ -21,3 &#43;21,4 @@ obj-$(CONFIG_SENSORS_TPS53679)        &#43;=3D tps536=
79.o=0A=
 obj-$(CONFIG_SENSORS_UCD9000)  &#43;=3D ucd9000.o=0A=
 obj-$(CONFIG_SENSORS_UCD9200)  &#43;=3D ucd9200.o=0A=
 obj-$(CONFIG_SENSORS_ZL6100)   &#43;=3D zl6100.o=0A=
&#43;obj-$(CONFIG_SENSORS_DPS650AB) &#43;=3D dps650ab.o=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">=0A=
Alphabetic order, please.=0A=
=0A=
</pre>
<blockquote type=3D"cite">
<pre class=3D"moz-quote-pre" wrap=3D"">diff --git a/drivers/hwmon/pmbus/dps=
650ab.c b/drivers/hwmon/pmbus/dps650ab.c=0A=
new file mode 100644=0A=
index 000000000000..3c300e621f5a=0A=
--- /dev/null=0A=
&#43;&#43;&#43; b/drivers/hwmon/pmbus/dps650ab.c=0A=
@@ -0,0 &#43;1,100 @@=0A=
&#43;// SPDX-License-Identifier: GPL-2.0=0A=
&#43;/*=0A=
&#43; * Hardware monitoring driver for DELTA DPS650AB=0A=
&#43; *=0A=
&#43; * Copyright (c) 2018 Huaxintong Semiconductor Technology Co., Ltd.=0A=
&#43; */=0A=
&#43;=0A=
&#43;#include &lt;linux/err.h&gt;=0A=
&#43;#include &lt;linux/i2c.h&gt;=0A=
&#43;#include &lt;linux/init.h&gt;=0A=
&#43;#include &lt;linux/kernel.h&gt;=0A=
&#43;#include &lt;linux/module.h&gt;=0A=
&#43;#include &quot;pmbus.h&quot;=0A=
&#43;=0A=
&#43;#define DPS650AB_MFR_ID                        &quot;DELTA&quot;=0A=
&#43;#define DPS650AB_MFR_MODEL             &quot;DPS-650AB-16 A&quot;=0A=
&#43;=0A=
&#43;static int dps650ab_probe(struct i2c_client *client,=0A=
&#43;                        const struct i2c_device_id *id)=0A=
&#43;{=0A=
&#43;       struct pmbus_driver_info *info;=0A=
&#43;       u8 buf[I2C_SMBUS_BLOCK_MAX];=0A=
&#43;       int ret;=0A=
&#43;=0A=
&#43;       memset(buf, 0, I2C_SMBUS_BLOCK_MAX);=0A=
&#43;=0A=
&#43;       if (!i2c_check_functionality(client-&gt;adapter,=0A=
&#43;                                    I2C_FUNC_SMBUS_READ_BYTE_DATA=0A=
&#43;                               | I2C_FUNC_SMBUS_READ_WORD_DATA=0A=
&#43;                               | I2C_FUNC_SMBUS_READ_BLOCK_DATA))=0A=
&#43;               return -ENODEV;=0A=
&#43;=0A=
&#43;       ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);=
=0A=
&#43;       if (ret &lt; 0) {=0A=
&#43;               dev_err(&amp;client-&gt;dev, &quot;Failed to read PMBUS=
_MFR_ID\n&quot;);=0A=
&#43;               return ret;=0A=
&#43;       }=0A=
&#43;=0A=
&#43;       if (strncmp(buf, DPS650AB_MFR_ID, strlen(DPS650AB_MFR_ID))) {=
=0A=
&#43;               dev_err(&amp;client-&gt;dev, &quot;DPS650AB_MFR_ID unre=
cognised\n&quot;);=0A=
&#43;               return -ENODEV;=0A=
&#43;       }=0A=
&#43;=0A=
&#43;       ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf)=
;=0A=
&#43;       if (ret &lt; 0) {=0A=
&#43;               dev_err(&amp;client-&gt;dev, &quot;Failed to read PMBUS=
_MFR_MODEL\n&quot;);=0A=
&#43;               return ret;=0A=
&#43;       }=0A=
&#43;=0A=
&#43;       if (strncmp(buf, DPS650AB_MFR_MODEL, strlen(DPS650AB_MFR_MODEL)=
)) {=0A=
&#43;               dev_err(&amp;client-&gt;dev, &quot;DPS650AB_MFR_MODEL u=
nrecognised\n&quot;);=0A=
&#43;               return -ENODEV;=0A=
&#43;       }=0A=
&#43;=0A=
&#43;       info =3D devm_kzalloc(&amp;client-&gt;dev, sizeof(*info), GFP_K=
ERNEL);=0A=
&#43;       if (!info)=0A=
&#43;               return -ENOMEM;=0A=
&#43;=0A=
&#43;       info-&gt;pages =3D 1;=0A=
&#43;       info-&gt;format[PSC_VOLTAGE_IN] =3D linear;=0A=
&#43;       info-&gt;format[PSC_VOLTAGE_OUT] =3D linear;=0A=
&#43;       info-&gt;format[PSC_CURRENT_IN] =3D linear;=0A=
&#43;       info-&gt;format[PSC_CURRENT_OUT] =3D linear;=0A=
&#43;       info-&gt;format[PSC_POWER] =3D linear;=0A=
&#43;       info-&gt;format[PSC_TEMPERATURE] =3D linear;=0A=
&#43;=0A=
&#43;       info-&gt;func[0] =3D PMBUS_HAVE_VIN=0A=
&#43;               | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN=0A=
&#43;               | PMBUS_HAVE_STATUS_INPUT=0A=
&#43;               | PMBUS_HAVE_POUT | PMBUS_HAVE_FAN12=0A=
&#43;               | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT=0A=
&#43;               | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT=0A=
&#43;               | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2=0A=
&#43;               | PMBUS_HAVE_STATUS_TEMP;=0A=
&#43;       info-&gt;func[1] =3D info-&gt;func[0];=0A=
&#43;=0A=
&#43;       return pmbus_do_probe(client, id, info);=0A=
&#43;}=0A=
&#43;=0A=
&#43;static const struct i2c_device_id dps650ab_id[] =3D {=0A=
&#43;       {&quot;dps650ab&quot;, 1},=0A=
&#43;       {}=0A=
&#43;};=0A=
&#43;=0A=
&#43;MODULE_DEVICE_TABLE(i2c, dps650ab_id);=0A=
&#43;=0A=
&#43;static struct i2c_driver dps650ab_driver =3D {=0A=
&#43;       .driver =3D {=0A=
&#43;               .name   =3D &quot;dps650ab&quot;,=0A=
&#43;       },=0A=
&#43;       .probe          =3D dps650ab_probe,=0A=
&#43;       .remove         =3D pmbus_do_remove,=0A=
&#43;       .id_table       =3D dps650ab_id,=0A=
&#43;};=0A=
&#43;=0A=
&#43;module_i2c_driver(dps650ab_driver);=0A=
&#43;=0A=
&#43;MODULE_AUTHOR(&quot;Liuxiaoting &lt;<a class=3D"moz-txt-link-abbreviat=
ed" href=3D"mailto:xiaoting.liu@hxt-semitech.com">xiaoting.liu@hxt-semitech=
.com</a>&quot;);=0A=
&#43;MODULE_DESCRIPTION(&quot;PMBus driver for DPS650AB&quot;);=0A=
&#43;MODULE_LICENSE(&quot;GPL v2&quot;);=0A=
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c=0A=
index aa4cf9636e99..930e8a3e2366 100644=0A=
--- a/drivers/hwmon/pmbus/pmbus.c=0A=
&#43;&#43;&#43; b/drivers/hwmon/pmbus/pmbus.c=0A=
@@ -204,6 &#43;204,8 @@ static int pmbus_probe(struct i2c_client *client,=
=0A=
 static const struct pmbus_device_info sgd009_pmbus_info =3D {=0A=
                                1, PMBUS_SKIP_STATUS_CHECK};=0A=
 static const struct pmbus_device_info pmbus_info =3D {0, 0};=0A=
&#43;static const struct pmbus_device_info dps650ab_pmbus_info =3D {=0A=
&#43;                               1, PMBUS_SKIP_STATUS_CHECK};=0A=
 /*=0A=
  * Use driver_data to set the number of pages supported by the chip.=0A=
  */=0A=
@@ -227,6 &#43;229,7 @@ static int pmbus_probe(struct i2c_client *client,=
=0A=
        {&quot;tps544c20&quot;, (kernel_ulong_t)&amp;default_pmbus_info},=
=0A=
        {&quot;tps544c25&quot;, (kernel_ulong_t)&amp;default_pmbus_info},=
=0A=
        {&quot;udt020&quot;, (kernel_ulong_t)&amp;default_pmbus_info},=0A=
&#43;       {&quot;dps650ab&quot;, (kernel_ulong_t)&amp;dps650ab_pmbus_info=
},=0A=
        {}=0A=
 };=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">=0A=
</pre>
</blockquote>
<p><br>
</p>
<br>
<br>
<br>
<p style=3D"font-size:8pt; line-height:10pt; font-family: 'Cambria','times =
roman',serif;">
This email is intended only for the named addressee. It may contain informa=
tion that is confidential/private, legally privileged, or copyright-protect=
ed, and you should handle it accordingly. If you are not the intended recip=
ient, you do not have legal rights
 to retain, copy, or distribute this email or its contents, and should prom=
ptly delete the email and all electronic copies in your system; do not reta=
in copies in any media. If you have received this email in error, please no=
tify the sender promptly. Thank
 you. </p>
<span style=3D"padding-top:10px; font-weight:bold; color:#CC0000; font-size=
:10pt; font-family: 'Calibri',Arial,sans-serif; "></span><br>
<br>
</body>
</html>

--_000_a494c032f6344528a89bf9b9aa81a3d7HXTBJIDCEMVIW02hxtcorpn_--
