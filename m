Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xD40X2mRpzDrHB
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 05:37:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6KJTqTL088408
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 15:36:58 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bu1meb8wy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 15:36:57 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 20 Jul 2017 13:36:56 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 20 Jul 2017 13:36:55 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6KJas4e27590904; Thu, 20 Jul 2017 12:36:54 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89EFA136049;
 Thu, 20 Jul 2017 13:36:54 -0600 (MDT)
Received: from [9.10.99.182] (unknown [9.10.99.182])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 50145136048;
 Thu, 20 Jul 2017 13:36:54 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add gpio keys for power
 supply presence, ucd alert
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XfbX3VqQcvtMpmiDeJhyPBx5rqh3L5grep5gL+SmS+PDQ@mail.gmail.com>
 <1500516109.500.13.camel@aj.id.au>
 <CACPK8XfnqqrzxSs8Nzr9yiytg_nK1bZ39HAAE3hwdmGA8SbQ7w@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 20 Jul 2017 14:36:58 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfnqqrzxSs8Nzr9yiytg_nK1bZ39HAAE3hwdmGA8SbQ7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072019-0008-0000-0000-000008451CEA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007394; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00890420; UDB=6.00444865; IPR=6.00670587; 
 BA=6.00005482; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016302; XFM=3.00000015;
 UTC=2017-07-20 19:36:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072019-0009-0000-0000-0000432DA6AD
Message-Id: <625bc46f-e07c-bc59-6b0b-a669bd9e4a59@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-20_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707200300
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
X-List-Received-Date: Thu, 20 Jul 2017 19:37:00 -0000



On 7/19/2017 10:45 PM, Joel Stanley wrote:
> On Thu, Jul 20, 2017 at 11:31 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>>> +
>>>> +               ucd-alert {
>>>> +                       label = "ucd-alert";
>>>> +                       gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_LOW>;
>>>> +                       linux,code = <ASPEED_GPIO(I, 2)>;
>>>> +               };
>>> Andrew, are we sure this should be exposed to userspace? Is it
>>> something that should be hooked up to the SMBus driver instead?
>> I've looked at the relevant schematics and datasheets, and the GPIO of
>> interest (I2) appears to be correct for the UCD alert. However, GPIOI2
>> is *not* capable of being muxed as an SMBus Alert (SALT) line and
>> therefore the alert will not be propagated to the I2C master. It
>> appears we must handle it in userspace. Configuring it as GPIO key will
>> give us an interrupt.
> We discussed this today, and decided that we would look in to hooking
> the GPIO up to the ucd driver. From there it will initiate the reading
> of the fault registers, and allow the implementation of a poll()
> response on the fault files in sysfs.
How does this affect the userspace side of things?  I am planning on 
giving up support of
doing UCD fault analysis based on interrupts because there are 6 GPUs 
wired to a single STATUS_WORD
bit, so after one faults we'd just keep getting called back again since 
there's no way to mask at the GPU level,
assuming we can even get the interrupt to retrigger again at all.



> Cheers,
>
> Joel
>
