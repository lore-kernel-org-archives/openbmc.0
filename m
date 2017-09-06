Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnZnG6sh3zDrSV
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 06:24:33 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v86KNpnX014835
 for <openbmc@lists.ozlabs.org>; Wed, 6 Sep 2017 16:24:31 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ctq574v1p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 16:24:31 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 6 Sep 2017 16:24:30 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 6 Sep 2017 16:24:28 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v86KORMD23724126; Wed, 6 Sep 2017 20:24:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5626EB2056;
 Wed,  6 Sep 2017 16:21:50 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id F38F4B204E;
 Wed,  6 Sep 2017 16:21:49 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v6 0/3] Add user space accessibility for
 ucd9000 stats
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170830214953.73327-1-cbostic@linux.vnet.ibm.com>
 <1504227536.5933.34.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 6 Sep 2017 15:24:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1504227536.5933.34.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17090620-0044-0000-0000-0000038A1191
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007679; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00913226; UDB=6.00458324; IPR=6.00693488; 
 BA=6.00005574; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017039; XFM=3.00000015;
 UTC=2017-09-06 20:24:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17090620-0045-0000-0000-000007B91187
Message-Id: <7b4467f2-c405-709e-d2b8-c4f53f28c4a7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709060292
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
X-List-Received-Date: Wed, 06 Sep 2017 20:24:35 -0000



On 8/31/17 7:58 PM, Andrew Jeffery wrote:
> On Wed, 2017-08-30 at 16:49 -0500, Christopher Bostic wrote:
>> This set provides means to allow user space to access various properties of the
>> ucd9000 type chips.
>>
>> Patch 0001 Adds a user space means of clearing logged faults.  This ability is
>> useful in cases where one wants to start with a clean slate during each system
>> power on.
>>
>> patch 0002 Adds gpio_chip interface for user to access various GPIO pin states
>> via the /sys/class/gpio interface.
>>
>> Patch 0003 adds a debugfs for mfr_status information so user space can gain
>> visibility of gpi type faults. Note that there are limitations on type of devices
>> that debugfs supports.  Presently only ucd90160 is supported.  Any assumptions made
>> as to formatting of data is commented inline in the code.  Any expansion to other
>> ucd9000 types will need to take this into consideration.
>>
>> Note also that no pinmux support is provided at this point.  The ucd9000 devs do
>> have mux capability so this should be added.
>>
>> Patch 0003 (was patch v5-0002... previously) has been reviewed by Andrew Jeffery,
>> I did, however, add some small updates to this one:
>>
>> * Remove ida in bad and unbind paths.
>> * Remove type ucd90160 check when adding debugfs. Add for all ucd9000 devs.
>>    Results in cleaner ida code in the remove path.
> Thanks for the summary and for splitting out the patch introducing the
> new ABI.
>
> Unfortunately upstream NACKed what you've put as the first patch in
> your series. In the future, it's best to order controversial patches
> later, that way we can apply the uncontroversial patches without fuzz
> or failures from context/content dependencies.
>
> So given I can't apply the first patch as we know it won't go upstream,
> I can't apply the rest either due to hunks failing or fuzzing. Can you
> please respin, and given you need to do that, take into account
> Guenter's feedback?

Hi Andrew,

Yes will do that.

Thanks,
Chris

> Cheers,
>
> Andrew
>
>> Christopher Bostic (3):
>>    hwmon: (ucd9000) Add interface to clear logged faults.
>>    hwmon: (ucd9000) Add gpio chip interface
>>    hwmon: (ucd9000) Add debugfs to list mfr_status info
>>
>>   drivers/hwmon/pmbus/ucd9000.c | 415 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 413 insertions(+), 2 deletions(-)
