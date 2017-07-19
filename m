Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCM6w1Lj8zDrWQ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 01:55:03 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6JFrW1Z096173
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 11:55:00 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bt75m2hdn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 11:55:00 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 19 Jul 2017 09:54:59 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 19 Jul 2017 09:54:58 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6JFsvTn64422026; Wed, 19 Jul 2017 08:54:57 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDEFE6E03A;
 Wed, 19 Jul 2017 09:54:57 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 93F9A6E03D;
 Wed, 19 Jul 2017 09:54:57 -0600 (MDT)
Subject: Re: [PATCH v2 1/2] ARM: dts: aspeed: Add gpio-keys-polled for fan
 presence
To: Joel Stanley <joel@jms.id.au>
References: <20170718204324.32945-1-cbostic@linux.vnet.ibm.com>
 <20170718204324.32945-2-cbostic@linux.vnet.ibm.com>
 <CACPK8XcGBH8NOu0BvpmWarJKaD5nG+jUhVz7fFpamx-oX_fBHA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 19 Jul 2017 10:54:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcGBH8NOu0BvpmWarJKaD5nG+jUhVz7fFpamx-oX_fBHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17071915-0024-0000-0000-000016E35163
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007387; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889865; UDB=6.00444533; IPR=6.00670037; 
 BA=6.00005479; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016277; XFM=3.00000015;
 UTC=2017-07-19 15:54:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071915-0025-0000-0000-00004BE95007
Message-Id: <c1102639-5e4c-fd43-f941-e676560a2590@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-19_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707190262
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
X-List-Received-Date: Wed, 19 Jul 2017 15:55:05 -0000



On 7/19/17 4:28 AM, Joel Stanley wrote:
> On Wed, Jul 19, 2017 at 6:13 AM, Christopher Bostic
> <cbostic@linux.vnet.ibm.com> wrote:
>> +       gpio-keys-polled {
>> +               compatible = "gpio-keys-polled";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               #poll-interval = <100>;
> Are you sure that this needs to be polled this often?
>
> We should consider how much traffic this generates on the bus (how
> often it is contended), and how that fits in with other devices on
> that master. If you've done these calculations then please amend your
> commit message with that information.
Discussed with Brad Bishop and Matt Spinler - agreed to increase period 
to 1 second.

>
>> +               autorepeat;
> None of the other gpio-keys nodes have this set. Can you expand your
> commit message to explain why you set this please.

This isn't necessary.  Will remove.

>> @@ -224,6 +256,8 @@
>>                  reg = <0x60>;
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;

Will remove.

Thanks,
Chris
> This appears to be an unrelated change?
>
> Cheers,
>
> Joel
>
