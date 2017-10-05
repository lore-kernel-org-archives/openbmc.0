Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7JNs40VPzDr1s
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 03:38:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95GZDGI038088
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 12:38:18 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddn48un6r-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 12:38:18 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 12:38:17 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 12:38:15 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95GcEdK50266194; Thu, 5 Oct 2017 16:38:14 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EA94112057;
 Thu,  5 Oct 2017 12:37:50 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 09431112047;
 Thu,  5 Oct 2017 12:37:49 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2 9/9] drivers: hwmon: occ: Cancel occ
 operations in remove()
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-10-git-send-email-eajames@linux.vnet.ibm.com>
 <1507166457.5452.56.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2017 11:38:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507166457.5452.56.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100516-0056-0000-0000-000003D46287
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926879; UDB=6.00466330; IPR=6.00707124; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017408; XFM=3.00000015;
 UTC=2017-10-05 16:38:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100516-0057-0000-0000-0000080B731D
Message-Id: <392a15f9-13ad-8ec7-3cd4-1a7f9e12c785@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050229
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
X-List-Received-Date: Thu, 05 Oct 2017 16:38:22 -0000



On 10/04/2017 08:20 PM, Andrew Jeffery wrote:
> On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Prevent hanging forever waiting for OCC ops to complete.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/occ/p9_sbe.c | 33 ++++++++++++++++++++++++++-------
>>   1 file changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
>> index c7e0d9c..ffd6829 100644
>> --- a/drivers/hwmon/occ/p9_sbe.c
>> +++ b/drivers/hwmon/occ/p9_sbe.c
>> @@ -14,37 +14,53 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/occ.h>
>>   #include <linux/sched.h>
>> +#include <linux/spinlock.h>
>>   #include <linux/workqueue.h>
>>   
>>   struct p9_sbe_occ {
>>   	struct occ occ;
>>   	struct device *sbe;
>> +	struct occ_client *client;
>> +	spinlock_t lock;
>>   };
>>   
>>   #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ,
>> occ)
>>   
>> +static void p9_sbe_occ_close_client(struct p9_sbe_occ *occ)
>> +{
>> +	struct occ_client *tmp_client;
>> +
>> +	spin_lock_irq(&occ->lock);
>> +	tmp_client = occ->client;
>> +	occ->client = NULL;
>> +	occ_drv_release(tmp_client);
>> +	spin_unlock_irq(&occ->lock);
>> +}
>> +
>>   static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>>   {
>>   	int rc, error;
>> -	struct occ_client *client;
>>   	struct occ_response *resp = &occ->resp;
>>   	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
>>   
>> -	client = occ_drv_open(p9_sbe_occ->sbe, 0);
>> -	if (!client) {
>> +	spin_lock_irq(&p9_sbe_occ->lock);
> I think we should be using spin_lock_irqsave(), otherwise
> spin_unlock_irq() will unconditionally re-enable interrupts.

This is all over the sbefifo and occ drivers too... do we need to change 
those? No one has mentioned anything about it.

>
>> +	p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
>> +	if (!p9_sbe_occ->client) {
>>   		rc = -ENODEV;
>> +		spin_unlock_irq(&p9_sbe_occ->lock);
>>   		goto assign;
>>   	}
>> +	spin_unlock_irq(&p9_sbe_occ->lock);
> Rather than this dance with locking, you can do:
>
>      spin_lock_irqsave(&p9_sbe_occ->lock, flags);
>      p9_sbe_occ->client = occ_drv_open(p9_sbe_occ->sbe, 0);
> spin_unlock_irqrestore(&p9_sbe_occ->lock, flags);
> if (!p9_sbe_occ->client) {
>          ...
> }
>
> Please take a look at the rest of the code for this pattern as well.
>
>>   
>> -	rc = occ_drv_write(client, (const char *)&cmd[1], 7);
>> +	rc = occ_drv_write(p9_sbe_occ->client, (const char
>> *)&cmd[1], 7);
>>   	if (rc < 0)
>>   		goto err;
>>   
>> -	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
>> +	rc = occ_drv_read(p9_sbe_occ->client, (char *)resp,
>> sizeof(*resp));
>>   	if (rc < 0)
>>   		goto err;
>>   
>> -	occ_drv_release(client);
>> +	p9_sbe_occ_close_client(p9_sbe_occ);
>>   
>>   	switch (resp->return_status) {
>>   	case RESP_RETURN_CMD_IN_PRG:
>> @@ -72,7 +88,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8
>> *cmd)
>>   	goto done;
>>   
>>   err:
>> -	occ_drv_release(client);
>> +	p9_sbe_occ_close_client(p9_sbe_occ);
>>   	dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
>>   assign:
>>   	error = rc;
>> @@ -132,6 +148,7 @@ static int p9_sbe_occ_probe(struct
>> platform_device *pdev)
>>   	p9_sbe_occ->sbe = pdev->dev.parent;
>>   
>>   	occ = &p9_sbe_occ->occ;
>> +	spin_lock_init(&p9_sbe_occ->lock);
>>   	occ->bus_dev = &pdev->dev;
>>   	occ->groups[0] = &occ->group;
>>   	occ->poll_cmd_data = 0x20;
>> @@ -152,7 +169,9 @@ static int p9_sbe_occ_probe(struct
>> platform_device *pdev)
>>   static int p9_sbe_occ_remove(struct platform_device *pdev)
>>   {
>>   	struct occ *occ = platform_get_drvdata(pdev);
>> +	struct p9_sbe_occ *p9_sbe_occ = to_p9_sbe_occ(occ);
>>   
>> +	p9_sbe_occ_close_client(p9_sbe_occ);
>>   	occ_remove_status_attrs(occ);
> Shouldn't we be removing the status attributes before releasing the occ
> to prevent use-after-free or useless calls into read/write? This seems
> racy.

This is to prevent hanging. If we're stuck in a sysfs read(), I believe 
the remove will wait for the read to complete... can't happen if we 
don't close the client and cancel the op first. The 
p9_occ_sbe_send_command function is quite careful about not using the 
client after it's been released.

Besides, hwmon attributes are always removed after remove() is complete 
and the device is released.

It would be a good idea to set the p9_sbe_occ->sbe pointer to NULL so 
that we can't start any new operations during remove though.

Thanks,
Eddie

>
> Andrew
>
>>   
>>   	atomic_dec(&occ_num_occs);
