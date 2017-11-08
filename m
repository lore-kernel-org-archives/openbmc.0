Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yXJDb0Y3fzDrCr
 for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2017 07:43:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA8Khf2t092976
 for <openbmc@lists.ozlabs.org>; Wed, 8 Nov 2017 15:43:56 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e48e82cem-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Nov 2017 15:43:56 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 8 Nov 2017 15:43:55 -0500
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Nov 2017 15:43:53 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vA8Khrp239387146; Wed, 8 Nov 2017 20:43:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB506112034;
 Wed,  8 Nov 2017 15:43:19 -0500 (EST)
Received: from [9.10.99.145] (unknown [9.10.99.145])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 6EC54112040;
 Wed,  8 Nov 2017 15:43:19 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 2/2] hwmon: (pmbus): cffps: Add
 input_history debugfs file
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
References: <1509656381-22755-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1509656381-22755-3-git-send-email-eajames@linux.vnet.ibm.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Wed, 8 Nov 2017 14:44:05 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509656381-22755-3-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------55268DA0A743589D591C4820"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17110820-0052-0000-0000-0000027EBBB3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008033; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00943057; UDB=6.00475771; IPR=6.00723344; 
 BA=6.00005679; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017915; XFM=3.00000015;
 UTC=2017-11-08 20:43:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17110820-0053-0000-0000-00005290E34F
Message-Id: <8fd4aecb-0306-11b0-906b-a6d89b4c4c40@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-08_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1711080272
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Nov 2017 20:43:59 -0000

This is a multi-part message in MIME format.
--------------55268DA0A743589D591C4820
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 11/2/2017 3:59 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Provide binary data of the powers supply input history to debugfs.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/hwmon/pmbus/ibm-cffps.c | 97 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 1a6294c..0570c12 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -7,13 +7,19 @@
>    * (at your option) any later version.
>    */
>
> +#include <linux/debugfs.h>
>   #include <linux/device.h>
> +#include <linux/fs.h>
>   #include <linux/i2c.h>
>   #include <linux/jiffies.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
>
>   #include "pmbus.h"
>
> +#define CFFPS_INPUT_HISTORY_CMD			0xD6
> +#define CFFPS_INPUT_HISTORY_SIZE		100
> +
>   /* STATUS_MFR_SPECIFIC bits */
>   #define CFFPS_MFR_FAN_FAULT			BIT(0)
>   #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
> @@ -24,6 +30,70 @@
>   #define CFFPS_MFR_VAUX_FAULT			BIT(6)
>   #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
>
> +struct ibm_cffps {
> +	struct i2c_client *client;
> +
> +	struct mutex update_lock;
> +	unsigned long last_updated;
> +
> +	u8 byte_count;
> +	u8 input_history[CFFPS_INPUT_HISTORY_SIZE];
> +};
> +
> +static ssize_t ibm_cffps_read_input_history(struct file *file,
> +					    char __user *buf, size_t count,
> +					    loff_t *ppos)
> +{
> +	int rc;
> +	struct ibm_cffps *psu = file->private_data;
> +	u8 msgbuf0[1] = { CFFPS_INPUT_HISTORY_CMD };
> +	u8 msgbuf1[CFFPS_INPUT_HISTORY_SIZE + 1] = { 0 };
> +	struct i2c_msg msg[2] = {
> +		{
> +			.addr = psu->client->addr,
> +			.flags = psu->client->flags,
> +			.len = 1,
> +			.buf = msgbuf0,
> +		}, {
> +			.addr = psu->client->addr,
> +			.flags = psu->client->flags | I2C_M_RD,
> +			.len = CFFPS_INPUT_HISTORY_SIZE + 1,
> +			.buf = msgbuf1,
> +		},
> +	};
> +
> +	if (!*ppos) {
> +		mutex_lock(&psu->update_lock);
> +		if (time_after(jiffies, psu->last_updated + HZ)) {
> +			/*
> +			 * Use a raw i2c transfer, since we need more bytes
> +			 * than Linux I2C supports through smbus xfr (only 32).
> +			 */
> +			rc = i2c_transfer(psu->client->adapter, msg, 2);
> +			if (rc < 0) {
> +				mutex_unlock(&psu->update_lock);
> +				return rc;
> +			}
> +
> +			psu->byte_count = msgbuf1[0];
> +			memcpy(psu->input_history, &msgbuf1[1],
> +			       CFFPS_INPUT_HISTORY_SIZE);
> +			psu->last_updated = jiffies;
> +		}
> +
> +		mutex_unlock(&psu->update_lock);
> +	}
> +
> +	return simple_read_from_buffer(buf, count, ppos, psu->input_history,
> +				       psu->byte_count);
> +}
> +
> +static const struct file_operations ibm_cffps_fops = {
> +	.llseek = noop_llseek,
> +	.read = ibm_cffps_read_input_history,
> +	.open = simple_open,
> +};
> +
>   static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
>   				    int reg)
>   {
> @@ -119,7 +189,32 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
>   static int ibm_cffps_probe(struct i2c_client *client,
>   			   const struct i2c_device_id *id)
>   {
> -	return pmbus_do_probe(client, id, &ibm_cffps_info);
> +	int rc;
> +	struct dentry *debugfs;
> +	struct ibm_cffps *psu;
> +
> +	rc = pmbus_do_probe(client, id, &ibm_cffps_info);
> +	if (rc)
> +		return rc;
> +
> +	/* Don't fail the probe if we can't create debugfs */
> +	psu = devm_kzalloc(&client->dev, sizeof(*psu), GFP_KERNEL);
> +	if (!psu)
> +		return 0;
> +
> +	psu->client = client;
> +	mutex_init(&psu->update_lock);
> +	if (jiffies > HZ)
> +		psu->last_updated = jiffies - HZ;
> +
> +	debugfs = pmbus_get_debugfs_dir(client);
> +	if (!debugfs)
> +		return 0;
> +
> +	debugfs_create_file("ibm_cffps_input_history", 0444, debugfs, psu,
> +			    &ibm_cffps_fops);
> +
> +	return 0;
>   }
>
>   static const struct i2c_device_id ibm_cffps_id[] = {


--------------55268DA0A743589D591C4820
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Reviewed-by: Matt Spinler <a class="moz-txt-link-abbreviated"
        href="mailto:mspinler@linux.vnet.ibm.com">mspinler@linux.vnet.ibm.com</a></p>
    <br>
    <div class="moz-cite-prefix">On 11/2/2017 3:59 PM, Eddie James
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1509656381-22755-3-git-send-email-eajames@linux.vnet.ibm.com">
      <pre wrap="">From: "Edward A. James" <a class="moz-txt-link-rfc2396E" href="mailto:eajames@us.ibm.com">&lt;eajames@us.ibm.com&gt;</a>

Provide binary data of the powers supply input history to debugfs.

Signed-off-by: Edward A. James <a class="moz-txt-link-rfc2396E" href="mailto:eajames@us.ibm.com">&lt;eajames@us.ibm.com&gt;</a>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 97 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 1a6294c..0570c12 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -7,13 +7,19 @@
  * (at your option) any later version.
  */

+#include &lt;linux/debugfs.h&gt;
 #include &lt;linux/device.h&gt;
+#include &lt;linux/fs.h&gt;
 #include &lt;linux/i2c.h&gt;
 #include &lt;linux/jiffies.h&gt;
 #include &lt;linux/module.h&gt;
+#include &lt;linux/mutex.h&gt;

 #include "pmbus.h"

+#define CFFPS_INPUT_HISTORY_CMD			0xD6
+#define CFFPS_INPUT_HISTORY_SIZE		100
+
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
 #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
@@ -24,6 +30,70 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)

+struct ibm_cffps {
+	struct i2c_client *client;
+
+	struct mutex update_lock;
+	unsigned long last_updated;
+
+	u8 byte_count;
+	u8 input_history[CFFPS_INPUT_HISTORY_SIZE];
+};
+
+static ssize_t ibm_cffps_read_input_history(struct file *file,
+					    char __user *buf, size_t count,
+					    loff_t *ppos)
+{
+	int rc;
+	struct ibm_cffps *psu = file-&gt;private_data;
+	u8 msgbuf0[1] = { CFFPS_INPUT_HISTORY_CMD };
+	u8 msgbuf1[CFFPS_INPUT_HISTORY_SIZE + 1] = { 0 };
+	struct i2c_msg msg[2] = {
+		{
+			.addr = psu-&gt;client-&gt;addr,
+			.flags = psu-&gt;client-&gt;flags,
+			.len = 1,
+			.buf = msgbuf0,
+		}, {
+			.addr = psu-&gt;client-&gt;addr,
+			.flags = psu-&gt;client-&gt;flags | I2C_M_RD,
+			.len = CFFPS_INPUT_HISTORY_SIZE + 1,
+			.buf = msgbuf1,
+		},
+	};
+
+	if (!*ppos) {
+		mutex_lock(&amp;psu-&gt;update_lock);
+		if (time_after(jiffies, psu-&gt;last_updated + HZ)) {
+			/*
+			 * Use a raw i2c transfer, since we need more bytes
+			 * than Linux I2C supports through smbus xfr (only 32).
+			 */
+			rc = i2c_transfer(psu-&gt;client-&gt;adapter, msg, 2);
+			if (rc &lt; 0) {
+				mutex_unlock(&amp;psu-&gt;update_lock);
+				return rc;
+			}
+
+			psu-&gt;byte_count = msgbuf1[0];
+			memcpy(psu-&gt;input_history, &amp;msgbuf1[1],
+			       CFFPS_INPUT_HISTORY_SIZE);
+			psu-&gt;last_updated = jiffies;
+		}
+
+		mutex_unlock(&amp;psu-&gt;update_lock);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, psu-&gt;input_history,
+				       psu-&gt;byte_count);
+}
+
+static const struct file_operations ibm_cffps_fops = {
+	.llseek = noop_llseek,
+	.read = ibm_cffps_read_input_history,
+	.open = simple_open,
+};
+
 static int ibm_cffps_read_byte_data(struct i2c_client *client, int page,
 				    int reg)
 {
@@ -119,7 +189,32 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
-	return pmbus_do_probe(client, id, &amp;ibm_cffps_info);
+	int rc;
+	struct dentry *debugfs;
+	struct ibm_cffps *psu;
+
+	rc = pmbus_do_probe(client, id, &amp;ibm_cffps_info);
+	if (rc)
+		return rc;
+
+	/* Don't fail the probe if we can't create debugfs */
+	psu = devm_kzalloc(&amp;client-&gt;dev, sizeof(*psu), GFP_KERNEL);
+	if (!psu)
+		return 0;
+
+	psu-&gt;client = client;
+	mutex_init(&amp;psu-&gt;update_lock);
+	if (jiffies &gt; HZ)
+		psu-&gt;last_updated = jiffies - HZ;
+
+	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return 0;
+
+	debugfs_create_file("ibm_cffps_input_history", 0444, debugfs, psu,
+			    &amp;ibm_cffps_fops);
+
+	return 0;
 }

 static const struct i2c_device_id ibm_cffps_id[] = {
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------55268DA0A743589D591C4820--
