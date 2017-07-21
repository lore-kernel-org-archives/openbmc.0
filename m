Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDXvL428zzDqv7
 for <openbmc@lists.ozlabs.org>; Sat, 22 Jul 2017 00:19:09 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6LEJ0ND174514
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 10:19:06 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bugn6fbs2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 10:19:05 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 21 Jul 2017 10:18:40 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 21 Jul 2017 10:18:38 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6LEIbhu25231534; Fri, 21 Jul 2017 14:18:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F3ABAE04E;
 Fri, 21 Jul 2017 10:18:48 -0400 (EDT)
Received: from [9.10.99.182] (unknown [9.10.99.182])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP id E2730AE03B;
 Fri, 21 Jul 2017 10:18:47 -0400 (EDT)
Subject: Re: DPS310 sampling
To: Joel Stanley <joel@jms.id.au>
References: <efef70a7-4c02-e459-c21f-9862ae6f0156@linux.vnet.ibm.com>
 <CACPK8XejX5hFeOMkRUDqvPP-V2XWz9PBtG2PO0vEuQO=A0erQQ@mail.gmail.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 21 Jul 2017 09:18:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XejX5hFeOMkRUDqvPP-V2XWz9PBtG2PO0vEuQO=A0erQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17072114-2213-0000-0000-000001FDD6CB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007399; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00890794; UDB=6.00445089; IPR=6.00670961; 
 BA=6.00005482; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016314; XFM=3.00000015;
 UTC=2017-07-21 14:18:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17072114-2214-0000-0000-000056F3808B
Message-Id: <7219c569-4c02-bf48-6e98-6d0f7083745e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-21_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707210224
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
X-List-Received-Date: Fri, 21 Jul 2017 14:19:11 -0000



On 7/21/2017 12:17 AM, Joel Stanley wrote:
> On Fri, Jul 21, 2017 at 2:22 AM, Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>> Hi Joel,
>>
>> Now that phosphor-hwmon-readd tries to read the DPS310 temp, we keep hitting
>> EAGAINs from the driver.
> Can you elaborate here. What happens when it hits EAGAIN?

The phosphor-hwmon app creates an error log and crashes, and it all goes 
downhill from there.

>
>> It turns out that the delay call within
>> phosphor-hwmon doesn't always wait a full second because it pops out of the
>> delay if there is some dbus work to handle.  It would take a nontrivial
>> refactoring to fix that properly, and I think even if we did we'd just
>> barely be avoiding a race between that being done and the temp being
>> available every 1s.
>>
>> What do you think of changing the rate to be faster than 1 measurement per
>> second?  Is that a device tree binding?  In combination with that change and
>> phosphor-hwmon doing retries, we should be able to get things to work.
> This is not configurable with the current implementation, so changing
> the sample rate would require reworking the driver. It's unfortunate
> we didn't bring up this requirement before the driver was developed.
>
> There are a set of parameters that need to be set to configure the
> device's sampling rate, and the wrong combination results in invalid
> readings. It took me a few days to get this right, but it might be
> easier now that we have a working driver.

Alternatively, what about just putting it into 'command mode'  to do an 
on-demand read?

>
> I'd be happy to take a patch to change this.

I plan on calling into (my time's) Sunday night meeting where we can 
discuss the options.

> Cheers,
>
> Joel
>
>> Alternatively I could just add in up to a second of retries from within
>> phosphor-hwmon, but that would slow down users that request data from it on
>> dbus.
>>
