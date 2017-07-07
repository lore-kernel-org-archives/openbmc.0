Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x47NQ5ZLvzDr8l
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jul 2017 07:41:42 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v67LcuaB119438
 for <openbmc@lists.ozlabs.org>; Fri, 7 Jul 2017 17:41:40 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bjj6j8aj3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 07 Jul 2017 17:41:40 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 7 Jul 2017 15:41:39 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 7 Jul 2017 15:41:37 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v67LfaGm8388982; Fri, 7 Jul 2017 14:41:36 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DB32BE03A;
 Fri,  7 Jul 2017 15:41:36 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.85.179.192])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id DA52ABE039;
 Fri,  7 Jul 2017 15:41:35 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v3 0/3] Add I2C busses to P9 device tree
To: Joel Stanley <joel@jms.id.au>
Cc: "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeYkeJUXh5cee9D_jij3iVMYMWupEbNTXr5gzLUdmcO9g@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2017 16:41:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeYkeJUXh5cee9D_jij3iVMYMWupEbNTXr5gzLUdmcO9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070721-0012-0000-0000-0000149ED00B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007338; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00884324; UDB=6.00441251; IPR=6.00664511; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016133; XFM=3.00000015;
 UTC=2017-07-07 21:41:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070721-0013-0000-0000-00004E7E15F1
Message-Id: <ca56f2c9-c604-5a50-c49a-debb55f02a77@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707070361
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
X-List-Received-Date: Fri, 07 Jul 2017 21:41:43 -0000



On 07/07/2017 01:39 AM, Joel Stanley wrote:
> On Fri, Jul 7, 2017 at 7:14 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> This series adds FSI-attached I2C controller and associated busses to the P9
>> FSI cfam device tree node. It also enables the devices in the P9 machine-
>> specific files, and adds aliases to preserve the expected /dev/ entries.
>> Also does a couple of dt parsing fixes in the driver.
> The code changes conflict with the fixes I posted. Please review the
> fixes I posted, and rebase your patches on them.

OK, I had thought yours were based on my v2 changes... I'll have to send 
up your patches I'm basing my v4 on.

Thanks,
Eddie

>
> Cheers,
>
> Joel
>
>> Changes since v2:
>>   - Split adding and enabling busses into two patches.
>>   - Add aliases.
>>   - Add the device node to the I2C adapter dev (needed for alias).
>>
>> Edward A. James (3):
>>    arm/dts: Add I2C master and ports to FSI cfams
>>    arm/dts: Enable FSI I2C busses for P9
>>    drivers/i2c: Fix devicetree parsing in FSI-attached I2C master algo
>>
>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 150 +++++++++++++++++++++
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 150 +++++++++++++++++++++
>>   arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
>>   drivers/i2c/busses/i2c-fsi.c                     |  12 +-
>>   4 files changed, 471 insertions(+), 5 deletions(-)
>>
>> --
>> 1.8.3.1
>>
