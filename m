Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7H4c58pVzDr8J
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 02:39:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v95FchHU106078
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 11:39:09 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddmbkbcee-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 11:39:08 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 11:39:00 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 11:38:57 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v95FcuCF37945476; Thu, 5 Oct 2017 15:38:56 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96794AC040;
 Thu,  5 Oct 2017 11:39:33 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 1DC6DAC03F;
 Thu,  5 Oct 2017 11:39:33 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2 5/9] drivers: fsi: occ: Poll while
 receiving "command in progress"
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1506724868-13010-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506724868-13010-6-git-send-email-eajames@linux.vnet.ibm.com>
 <1507165276.5452.47.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2017 10:38:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507165276.5452.47.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100515-0036-0000-0000-000002764670
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00926863; UDB=6.00466318; IPR=6.00707104; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017408; XFM=3.00000015;
 UTC=2017-10-05 15:38:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100515-0037-0000-0000-000041FC05E4
Message-Id: <e86e3a2d-84dd-de2d-bc1f-7d5c8a243553@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710050217
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
X-List-Received-Date: Thu, 05 Oct 2017 15:39:13 -0000



On 10/04/2017 08:01 PM, Andrew Jeffery wrote:
> On Fri, 2017-09-29 at 17:41 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> This should only be done at this level,
> Bit of a nit with the grammar here: You're using 'this' in multiple contexts
> and I feel that explanation of the contexts is a bit lacking. Can you please
> expand this sentence to cover those points?
>
> The intent of the change seems reasonable though.
>
> Andrew
>
>> instead of clients repeating
>> the entire transfer when they receive "command in progress"
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/occ.c | 27 ++++++++++++++++++++++++---
>>   1 file changed, 24 insertions(+), 3 deletions(-)
>>   
>> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
>> index 3313e35..a554550 100644
>> --- a/drivers/fsi/occ.c
>> +++ b/drivers/fsi/occ.c
>> @@ -23,6 +23,7 @@
>>   #include <linux/of.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/sched.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/uaccess.h>
>> @@ -33,6 +34,9 @@
>>   #define OCC_CMD_DATA_BYTES	4090
>>   #define OCC_RESP_DATA_BYTES	4089
>>   
>> +#define OCC_TIMEOUT_MS		1000
> The SBEFIFO spec defines different timeout periods for different classes of
> command. One class uses a 1s timeout, whilst another uses 30s. Does the OCC
> only use commands from the former command class?

These are the long timeout, but I don't see that this value corresponds 
to the SBE timeout. If the SBE is timing out, we're done for anyway. 
This is to timeout if we see OCC "command in progress" response for too 
long.

>
>> +#define OCC_CMD_IN_PRG_WAIT_MS	50
> This is less than the 500ms reschedule period in the SBEFIFO. Does 50ms make
> sense here?

Well that reschedule in SBEFIFO is only if you have to wait for more 
data. A transfer doesn't necessarily have to wait that long. In this 
case I'd be hopeful that the op can go through all at once since it's 
just 8 bytes. Haven't done any benchmarking.

Thanks,
Eddie

>
>> +
>>   struct occ {
>>   	struct device *sbefifo;
>>   	char name[32];
>> @@ -565,6 +569,9 @@ static void occ_worker(struct work_struct *work)
>>   {
>>   	int rc = 0, empty, waiting, canceled;
>>   	u16 resp_data_length;
>> +	unsigned long start;
>> +	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
>> +	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
>>   	struct occ_xfr *xfr;
>>   	struct occ_response *resp;
>>   	struct occ_client *client;
>> @@ -586,6 +593,8 @@ static void occ_worker(struct work_struct *work)
>>   	spin_unlock_irq(&occ->list_lock);
>>   	mutex_lock(&occ->occ_lock);
>>   
>> +	start = jiffies;
>> +
>>   	/* write occ command */
>>   	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
>>   			 xfr->cmd_data_length);
>> @@ -597,9 +606,21 @@ static void occ_worker(struct work_struct *work)
>>   		goto done;
>>   
>>   	/* read occ response */
>> -	rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
>> -	if (rc)
>> -		goto done;
>> +	do {
>> +		rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
>> +		if (rc)
>> +			goto done;
>> +
>> +		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
>> +			rc = -EALREADY;
>> +
>> +			if (time_after(jiffies, start + timeout))
>> +				break;
>> +
>> +			set_current_state(TASK_INTERRUPTIBLE);
>> +			schedule_timeout(wait_time);
>> +		}
>> +	} while (rc);
>>   
>>   	resp_data_length = get_unaligned_be16(&resp->data_length);
>>   	if (resp_data_length > OCC_RESP_DATA_BYTES) {
