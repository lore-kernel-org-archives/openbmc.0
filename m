Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtY7f2SWrzDqJL
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 03:27:09 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2TGNYIQ035762
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 12:26:58 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29gfrhj5bn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 12:26:57 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 29 Mar 2017 10:26:54 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 29 Mar 2017 10:26:53 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2TGQr6u10420732
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 09:26:53 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0331B136043
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 10:26:53 -0600 (MDT)
Received: from d50lp31.co.us.ibm.com (unknown [9.17.249.32])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS id E1CB013603A
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 10:26:52 -0600 (MDT)
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 29 Mar 2017 10:26:52 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 29 Mar 2017 10:26:50 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 29 Mar 2017 16:26:49 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 29 Mar 2017 16:26:46 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2017032916264520-436091 ;
 Wed, 29 Mar 2017 16:26:45 +0000 
In-Reply-To: <CACPK8XfwZ_1pYEbEmNkE-e2AENUTM4kHoaObf2MFtMWV02BhAg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Add Langyang BMC device
 tree
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Lei YU <mine260309@gmail.com>, Ken Chen <chen.kenyy@inventec.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 29 Mar 2017 16:26:45 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XfwZ_1pYEbEmNkE-e2AENUTM4kHoaObf2MFtMWV02BhAg@mail.gmail.com>,
 <20170329044953.25308-1-joel@jms.id.au>
 <CAARXrtmHQUQPLfQKXZLvh+hmnf8YJsx+7u2DvHczzL1dZnFYsQ@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 927.1) | IBM Domino Build
 SCN_20170313T2028_FP2 March 16, 2017 at 14:28
X-LLNOutbound: False
X-Disclaimed: 46727
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17032916-0004-0000-0000-000011DE0E56
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.001651
X-IBM-SpamModules-Versions: BY=3.00006872; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00840386; UDB=6.00413621; IPR=6.00618380; 
 BA=6.00005248; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014854; XFM=3.00000013;
 UTC=2017-03-29 16:26:47
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-03-29 12:04:32 - 6.00006516
x-cbparentid: 17032916-7094-0000-0000-000004469FAC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006872; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000206; SDB=6.00840386; UDB=6.00413621; IPR=6.00618380; 
 BA=6.00005248; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014854; XFM=3.00000013;
 UTC=2017-03-29 16:26:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF335A2B9B.4D6D21D6-ON002580F2.005A0F2E-002580F2.005A570E@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703290139
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
X-List-Received-Date: Wed, 29 Mar 2017 16:27:10 -0000

Joel Stanley wrote:

>Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: Add Langyang BMC
>device tree
>
>On Wed, Mar 29, 2017 at 4:32 PM, Lei YU <mine260309@gmail.com> wrote:
>> Reviewed-by: Lei YU <mine260309@gmail.com>
>>
>> On Wed, Mar 29, 2017 at 12:49 PM, Joel Stanley <joel@jms.id.au>
>wrote:
>>> From: Ken Chen <chen.kenyy@inventec.com>
>>>
>>> Langyang is an OpenPower Power9 system made by Inventec.


The subject and change log say Langyang (with 2 'g's).

>>>
>>> Signed-off-by: Ken Chen <chen.kenyy@inventec.com>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
>Merged in to dev-4.7.
>
>Cheers,
>
>Joel
>
>>> ---
>>>  arch/arm/boot/dts/Makefile                   |   1 +
>>>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 319
>+++++++++++++++++++++++++++
>>>  2 files changed, 320 insertions(+)
>>>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile
>b/arch/arm/boot/dts/Makefile
>>> index ff647a08fe41..ba0e018e3275 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -897,6 +897,7 @@ dtb-$(CONFIG=5FARCH=5FASPEED) +=3D
>aspeed-bmc-opp-palmetto.dtb \
>>>         aspeed-bmc-opp-witherspoon.dtb \
>>>         aspeed-bmc-opp-zaius.dtb \
>>>         aspeed-bmc-opp-romulus.dtb \
>>> +       aspeed-bmc-opp-lanyang.dtb \
>>>         aspeed-bmc-facebook-cmm.dtb \
>>>         aspeed-ast2500-evb.dtb
>>>  endif
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>>> new file mode 100644
>>> index 000000000000..176e4b449339
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
>>> @@ -0,0 +1,319 @@
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-g5.dtsi"
>>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>> +
>>> +/ {
>>> +       model =3D "Lanyang BMC";
>>> +       compatible =3D "inventec,lanyang-bmc", "aspeed,ast2500";
>>> +

The file name, compatible, and model say Lanyang (with 1 'g').

I realize it has been merged into openbmc, but maybe we can catch
the upstream changelog.  Unless the files are wrong.

milton
