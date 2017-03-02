Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ3MY26N3zDqC0
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 07:10:16 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v22K8fnI083752
 for <openbmc@lists.ozlabs.org>; Thu, 2 Mar 2017 15:10:14 -0500
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28xs8djdb2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 15:10:13 -0500
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 2 Mar 2017 13:10:12 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 2 Mar 2017 13:10:09 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 7664719D801C;
 Thu,  2 Mar 2017 13:09:19 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v22KA7sT6029814; Thu, 2 Mar 2017 13:10:08 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59D50136040;
 Thu,  2 Mar 2017 13:10:08 -0700 (MST)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.174.103])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 2E7E0136044;
 Thu,  2 Mar 2017 13:10:08 -0700 (MST)
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Change hub sysfs name
To: Joel Stanley <joel@jms.id.au>
References: <20170228180707.6720-1-cbostic@linux.vnet.ibm.com>
 <CACPK8Xetxm6ZnLzek5ERhA_5cZy8R51kLNtrHWNQmrKttqHP+g@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 2 Mar 2017 14:10:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xetxm6ZnLzek5ERhA_5cZy8R51kLNtrHWNQmrKttqHP+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17030220-0024-0000-0000-00001608FED8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006710; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00829182; UDB=6.00406482; IPR=6.00606680; 
 BA=6.00005186; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014502; XFM=3.00000012;
 UTC=2017-03-02 20:10:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17030220-0025-0000-0000-000049310CE2
Message-Id: <43fddd53-5d95-e0c9-c43b-fdd0b0a3120d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-02_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703020175
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
X-List-Received-Date: Thu, 02 Mar 2017 20:10:17 -0000



On 3/1/17 6:29 PM, Joel Stanley wrote:
> On Wed, Mar 1, 2017 at 4:37 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> Use the slave's master ID as the ID for the hub master.
> I don't know enough about how the driver works to know if this is the
> right thing to do. Is it fixing a bug? Why was the old value wrong?
>
Hi Joel,

Yes this is fixing a bug.  Before this fix both hub masters detected 
-one on first p9, other on second p9, are assigned the name "hub@00".  
The duplicate name causes a kernel warning to console. With this change 
each hub master is named uniquely by using the ID of its upstream fsi 
master.

Thanks,
Chris
> Cheers,
>
> Joel
>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 542544e..b9573c5 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -437,7 +437,7 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>>                                  return -ENOMEM;
>>
>>                          device_initialize(&hub->dev);
>> -                       dev_set_name(&hub->dev, "hub@%02x", hub->master.idx);
>> +                       dev_set_name(&hub->dev, "hub@%02x", slave->master->idx);
>>                          hub->dev.release = hub_master_release;
>>                          rc = device_add(&hub->dev);
>>                          if (rc)
>> --
>> 1.8.2.2
>>
