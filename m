Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQfRp570bzDrcc
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 03:04:06 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9UG28QQ109817
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 12:04:04 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dx6t89hry-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 12:04:03 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 30 Oct 2017 12:04:01 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Oct 2017 12:03:59 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9UG3w7O37617878; Mon, 30 Oct 2017 16:03:58 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 519DEAC041;
 Mon, 30 Oct 2017 12:04:45 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id CC572AC03F;
 Mon, 30 Oct 2017 12:04:44 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2] drivers (fsi): sbefifo: Add timeout for
 waiting for data
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bradleyb@fuzziesquirrel.com
References: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1509341171.13477.24.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 30 Oct 2017 11:03:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509341171.13477.24.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17103016-2213-0000-0000-000002339A1D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007981; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00938689; UDB=6.00473183; IPR=6.00718951; 
 BA=6.00005663; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017791; XFM=3.00000015;
 UTC=2017-10-30 16:04:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17103016-2214-0000-0000-00005802ECED
Message-Id: <ea7f26bd-5bf1-4a36-e91f-c60570531f34@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-30_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710300213
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
X-List-Received-Date: Mon, 30 Oct 2017 16:04:07 -0000



On 10/30/2017 12:26 AM, Andrew Jeffery wrote:
> On Thu, 2017-10-26 at 17:34 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> During a transfer, in the event that the SBE isn't running, the driver
>> will wait for data to appear in the FIFO forever. This doesn't work at
>> BMC boot time if any transfers are attempted (by OCC driver probing, for
>> example), as it will just hang the boot. So add a simple timeout
>> mechanism when the driver reschdules waiting for data to show up in the
>> FIFO.
>>   
>> Tested on witherspoon by rebooting the BMC successfully with chassis
>> power on.
> So the thing is the BMC *does* successfully boot *without* this patch. It just
> takes an *insanely* long time at around 870 seconds before we hand over to
> init.
>
> So it seems there's an existing timeout mechanism in place, but this patch adds
> a new one on top. Your commit message implies to me that the BMC should never
> complete the boot process under these conditions, but given it does, can you
> outline (in an reply and in the commit message) why this new timeout is the
> right solution?

There is no existing timeout. The BMC continued booting because the FSI 
operation actually failed around that time. I don't know why that 
happened, but SBEFIFO driver fails out immediately upon an FSI failure, 
so the occ-hwmon probe finally fails, so the boot can continue. If the 
FSI operation never fails, the BMC will never boot.

I just tested this again, and have gone 30 minutes hanging now. I know 
we saw ~800 seconds a couple of times, but I guess it's a coincidence.

Thanks,
Eddie

>
> I tried to understand the behaviour myself but did not find an obvious
> justification for 870 seconds.
>
> Cheers,
>
> Andrew
>
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>> Changes since v1:
>>   * Reset the wait_data_timeout field if we get data. If we get data, the SBE
>>     is running and we really shouldn't timeout.
>>   
>>   drivers/fsi/fsi-sbefifo.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   
>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>> index f756822..41b838e 100644
>> --- a/drivers/fsi/fsi-sbefifo.c
>> +++ b/drivers/fsi/fsi-sbefifo.c
>> @@ -54,6 +54,7 @@
>>   #define SBEFIFO_EOT_ACK		0x14
>>   
>>   #define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
>> +#define SBEFIFO_MAX_RESCHDULE	msecs_to_jiffies(5000)
>>   
>>   struct sbefifo {
>>   	struct timer_list poll_timer;
>> @@ -77,6 +78,7 @@ struct sbefifo_buf {
>>   };
>>   
>>   struct sbefifo_xfr {
>> +	unsigned long wait_data_timeout;
>>   	struct sbefifo_buf *rbuf;
>>   	struct sbefifo_buf *wbuf;
>>   	struct list_head client;
>> @@ -450,11 +452,27 @@ static void sbefifo_poll_timer(unsigned long data)
>>   
>>   		devn = sbefifo_dev_nwreadable(sts);
>>   		if (devn == 0) {
>> +			/*
>> +			 * Limit the maximum waiting period for data in the
>> +			 * FIFO. If the SBE isn't running, we will wait
>> +			 * forever.
>> +			 */
>> +			if (!xfr->wait_data_timeout) {
>> +				xfr->wait_data_timeout =
>> +					jiffies + SBEFIFO_MAX_RESCHDULE;
>> +			} else if (time_after(jiffies,
>> +					      xfr->wait_data_timeout)) {
>> +				ret = -ETIME;
>> +				goto out;
>> +			}
>> +
>>   			/* No data yet.  Reschedule. */
>>   			sbefifo->poll_timer.expires = jiffies +
>>   				SBEFIFO_RESCHEDULE;
>>   			add_timer(&sbefifo->poll_timer);
>>   			goto out_unlock;
>> +		} else {
>> +			xfr->wait_data_timeout = 0;
>>   		}
>>   
>>   		/* Fill.  The EOT word is discarded.  */
