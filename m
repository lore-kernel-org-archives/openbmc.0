Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vk4rw6zmrzDqYG
 for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2017 08:45:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2FLi2j0030867
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 17:44:56 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2978fhetvd-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 17:44:55 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 15 Mar 2017 17:44:54 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 15 Mar 2017 17:44:51 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2FLiqkO38666336; Wed, 15 Mar 2017 21:44:52 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A369124037;
 Wed, 15 Mar 2017 17:44:47 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id D1E15124035;
 Wed, 15 Mar 2017 17:44:46 -0400 (EDT)
Subject: Re: [RFC linux dev-4.7 0/4] drivers: i2c: FSI-attached I2C master
 algorithm
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <1489182506-20505-1-git-send-email-eajames@linux.vnet.ibm.com>
 <57A4FEEE-E09F-443A-B7AB-226457C39D25@fuzziesquirrel.com>
Cc: "Edward A. James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org,
 cbostic@linux.vnet.ibm.com
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 15 Mar 2017 16:44:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <57A4FEEE-E09F-443A-B7AB-226457C39D25@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17031521-0052-0000-0000-000001A7AD36
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006788; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00834343; UDB=6.00409727; IPR=6.00611999; 
 BA=6.00005214; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014664; XFM=3.00000013;
 UTC=2017-03-15 21:44:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17031521-0053-0000-0000-00004F2A7ED7
Message-Id: <c3ddbdde-02ba-425d-a75a-bec7dce2b714@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-15_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703150165
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
X-List-Received-Date: Wed, 15 Mar 2017 21:45:05 -0000



On 03/10/2017 08:16 PM, Brad Bishop wrote:
>> On Mar 10, 2017, at 4:48 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> This patch series adds an I2C bus algorithm to drive the I2C master located on
>> POWER CPUs. The master is accessed over FSI bus from the service processor.
>>
>> The driver is functional for some basic read/write ops. There are a couple of
>> details regarding the device tree and chardev entries that need working out.
>>
>> Mainly, do we want a char device for each port?  There are 15 ports off one P9
>> master, so that'll be a lot of /dev/i2c-<x> entries.
> IMHO I don’t see this being a problem.
>
>> One issue is that
>> i2c_add_adapter always names it's device i2c-%d, regardless of adapter name.
> One can always add udev rules to get alternate naming schemes.
>
>> Furthermore, you can specify the number to label it with
>> i2c_add_numbered_adapter, but how to prevent collisions with regular i2c
>> devices?
> I think this is also probably solvable with udev.
>
>> The driver will currently set up one chardev for each master (each proc).
>> The port is then specified by hacking the addr field of i2c_msg. It works,
>> but not a clean solution.
> I’d say we just go with one chardev per port, unless others have experience
> that recommends otherwise.

Thought of a potential issue with this approach. This will require some 
custom bus locking solution, as we need to prevent multiple transfers 
from setting the master regs at the same time. Obviously the kernel i2c 
driver handles locking on each chardev to prevent simultaneous access, 
but since we will have multiple chardevs that have to lock each other 
out, we need to do it ourselves.

I think having our own locking is pretty do-able, I just wonder if the 
kernel guys will not be happy with it?

Eddie
>
>> FSI clocking details are not defined in the device tree, so FSI clock is
>> hardcoded for now.
>>
>> Edward A. James (4):
>>   drivers: fsi: Add function to get FSI clock rate
>>   drivers: i2c: Add FSI-attached I2C master algorithm
>>   drivers: i2c: Add transfer implementation for FSI algorithm
>>   drivers: i2c: Add bus recovery for FSI algorithm
>>
>> drivers/Makefile             |   2 +-
>> drivers/fsi/fsi-core.c       |   7 +
>> drivers/i2c/busses/Kconfig   |  11 +
>> drivers/i2c/busses/Makefile  |   1 +
>> drivers/i2c/busses/i2c-fsi.c | 608 +++++++++++++++++++++++++++++++++++++++++++
>> include/linux/fsi.h          |   1 +
>> 6 files changed, 629 insertions(+), 1 deletion(-)
>> create mode 100644 drivers/i2c/busses/i2c-fsi.c
>>
>> -- 
>> 1.8.3.1
