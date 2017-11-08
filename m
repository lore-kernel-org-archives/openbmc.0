Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yXJDW3VrBzDrCr
 for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2017 07:43:54 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA8Khhas087689
 for <openbmc@lists.ozlabs.org>; Wed, 8 Nov 2017 15:43:52 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e462xj3ek-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Nov 2017 15:43:51 -0500
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 8 Nov 2017 15:43:50 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 8 Nov 2017 15:43:48 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vA8Khm8j45613080; Wed, 8 Nov 2017 20:43:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C690A112034;
 Wed,  8 Nov 2017 15:43:14 -0500 (EST)
Received: from [9.10.99.145] (unknown [9.10.99.145])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 83240112047;
 Wed,  8 Nov 2017 15:43:14 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 1/2] hwmon: (pmbus): Export pmbus device
 debugfs directory entry
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: andrew@aj.id.au, "Edward A. James" <eajames@us.ibm.com>
References: <1509656381-22755-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1509656381-22755-2-git-send-email-eajames@linux.vnet.ibm.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Wed, 8 Nov 2017 14:43:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509656381-22755-2-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------7A4A8B8FBC73927DF45C9746"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17110820-0052-0000-0000-0000027EBBB2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008033; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00943057; UDB=6.00475771; IPR=6.00723344; 
 BA=6.00005679; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017915; XFM=3.00000015;
 UTC=2017-11-08 20:43:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17110820-0053-0000-0000-00005290E345
Message-Id: <6f641ee4-78bb-2fad-a881-c7999bb45362@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-11-08_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
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
X-List-Received-Date: Wed, 08 Nov 2017 20:43:56 -0000

This is a multi-part message in MIME format.
--------------7A4A8B8FBC73927DF45C9746
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 11/2/2017 3:59 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Pmbus client drivers, if they want to use debugfs, should use the same
> root directory as the pmbus debugfs entries are using. Therefore, export
> the device dentry for the pmbus client.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/hwmon/pmbus/pmbus.h      | 1 +
>   drivers/hwmon/pmbus/pmbus_core.c | 7 +++++++
>   2 files changed, 8 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index fd422cd..153d3f6 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -452,5 +452,6 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>   int pmbus_do_remove(struct i2c_client *client);
>   const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
>   						      *client);
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
>
>   #endif /* PMBUS_H */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index c4b551b..b943f99 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2371,6 +2371,13 @@ int pmbus_do_remove(struct i2c_client *client)
>   }
>   EXPORT_SYMBOL_GPL(pmbus_do_remove);
>
> +struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
> +{
> +	struct pmbus_data *data = i2c_get_clientdata(client);
> +
> +	return data->debugfs;
> +}
> +
>   static int __init pmbus_core_init(void)
>   {
>   	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);


--------------7A4A8B8FBC73927DF45C9746
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
      cite="mid:1509656381-22755-2-git-send-email-eajames@linux.vnet.ibm.com">
      <pre wrap="">From: "Edward A. James" <a class="moz-txt-link-rfc2396E" href="mailto:eajames@us.ibm.com">&lt;eajames@us.ibm.com&gt;</a>

Pmbus client drivers, if they want to use debugfs, should use the same
root directory as the pmbus debugfs entries are using. Therefore, export
the device dentry for the pmbus client.

Signed-off-by: Edward A. James <a class="moz-txt-link-rfc2396E" href="mailto:eajames@us.ibm.com">&lt;eajames@us.ibm.com&gt;</a>
---
 drivers/hwmon/pmbus/pmbus.h      | 1 +
 drivers/hwmon/pmbus/pmbus_core.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index fd422cd..153d3f6 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -452,5 +452,6 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 int pmbus_do_remove(struct i2c_client *client);
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
 						      *client);
+struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);

 #endif /* PMBUS_H */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index c4b551b..b943f99 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2371,6 +2371,13 @@ int pmbus_do_remove(struct i2c_client *client)
 }
 EXPORT_SYMBOL_GPL(pmbus_do_remove);

+struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+
+	return data-&gt;debugfs;
+}
+
 static int __init pmbus_core_init(void)
 {
 	pmbus_debugfs_dir = debugfs_create_dir("pmbus", NULL);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------7A4A8B8FBC73927DF45C9746--
