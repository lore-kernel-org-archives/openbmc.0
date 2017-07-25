Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xGhlY46mYzDrCn
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2017 12:19:53 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6P2JBbH069224
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 22:19:51 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bwqux3rhq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jul 2017 22:19:51 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 24 Jul 2017 22:19:50 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 24 Jul 2017 22:19:47 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6P2Jl9831391780; Tue, 25 Jul 2017 02:19:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5996E11204B;
 Mon, 24 Jul 2017 22:19:42 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.3.94])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 05642112040;
 Mon, 24 Jul 2017 22:19:40 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 2/2] drivers/iio: dps310 Use previous value
 if new reading not available yet
To: Joel Stanley <joel@jms.id.au>
References: <20170724212509.85197-1-cbostic@linux.vnet.ibm.com>
 <20170724212509.85197-3-cbostic@linux.vnet.ibm.com>
 <CACPK8XdK3D_QiEfvS_BsTbvaA_uqb6rYPU13urFn2f8yR8LFLA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 24 Jul 2017 21:19:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdK3D_QiEfvS_BsTbvaA_uqb6rYPU13urFn2f8yR8LFLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072502-0040-0000-0000-000003853B24
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007420; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00892464; UDB=6.00446077; IPR=6.00672628; 
 BA=6.00005489; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016360; XFM=3.00000015;
 UTC=2017-07-25 02:19:48
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072502-0041-0000-0000-00000779587B
Message-Id: <cb86874c-e81f-ae96-9e46-fc78bfbc59c0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707250036
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 02:19:54 -0000



On 7/24/17 8:31 PM, Joel Stanley wrote:
> On Tue, Jul 25, 2017 at 6:55 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> In cases where temperature is queried before the latest value is finished
>> reading then use the previously measured value instead of returning error.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/iio/pressure/dps310.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
>> index f351c26..c7ee99e 100644
>> --- a/drivers/iio/pressure/dps310.c
>> +++ b/drivers/iio/pressure/dps310.c
>> @@ -202,8 +202,8 @@ static int dps310_read_temp(struct dps310_data *data)
>>          if (r < 0)
>>                  return r;
>>          if (!(ready & DPS310_TMP_RDY)) {
>> -               dev_dbg(dev, "temperature not ready\n");
>> -               return -EAGAIN;
>> +               dev_dbg(dev, "temperature not ready, use last temp value\n");
>> +               return 0;
> We can't hide these errors in the kernel driver. The user of this API
> will have no way of knowing if it actually has a new value, or if the
> value is days old. In the extreme case, the driver may nave never
> received a value from the hardware, but we will happily report zero.
>
> If you want to go down the path of using old values, there's a defined
> iio API for doing triggered readings that put data into a timestamped
> buffer of values. This could be used by userspace when it needs a
> reading, regardless of it's age. I've not used this before so it would
> require further investigation to decide if it's useful.

I had thought there was consensus in the Sunday night (Central US time) 
meeting on using the old value in case where a new measurement wasn't 
ready.  I see your point that we'd not know if the last measurement was 
days old.   Maybe we can take some time in Tuesday night's meeting to 
discuss further.

Thanks,
Chris
>
> Alternatively, if the userspace application doesn't care about the
> latest value then it could cache the previously read value and use
> that.
>
> Cheers,
>
> Joel
>
