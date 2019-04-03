Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Z9Xt1wpCzDqGn
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 02:51:10 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x33FjD2S109855
 for <openbmc@lists.ozlabs.org>; Wed, 3 Apr 2019 11:51:08 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rmyht10p1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 11:51:07 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 3 Apr 2019 16:51:06 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Apr 2019 16:51:05 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x33Fp49523462108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Apr 2019 15:51:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82147AE05C;
 Wed,  3 Apr 2019 15:51:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAC17AE06A;
 Wed,  3 Apr 2019 15:51:03 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  3 Apr 2019 15:51:03 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 03 Apr 2019 10:51:48 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
In-Reply-To: <cd769312-732d-fb7a-ca50-e5b29eac235b@linux.ibm.com>
References: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
 <CACPK8Xer53amWbQ-6dvEaXfHu=grk3ZWsH9NKCa_Xi_JKUnCMg@mail.gmail.com>
 <cd769312-732d-fb7a-ca50-e5b29eac235b@linux.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19040315-0068-0000-0000-000003AFFE38
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010867; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01183789; UDB=6.00619782; IPR=6.00964540; 
 MB=3.00026279; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-03 15:51:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040315-0069-0000-0000-00004807BB3D
Message-Id: <962b866599ac4dfd866d7433b7ddb276@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-03_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904030106
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 15:51:11 -0000

On 2019-03-27 10:10, Eddie James wrote:
> On 3/27/19 1:20 AM, Joel Stanley wrote:
>> On Tue, 12 Mar 2019 at 16:50, Adriana Kobylak <anoo@linux.ibm.com> 
>> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>> 
>>> Add simplified partitions for BMC and alternate flash. Include these 
>>> by
>>> default in Witherspoon.
>>> 
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>>   .../boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi  | 18 
>>> ++++++++++++++++++
>>>   arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi | 18 
>>> ++++++++++++++++++
>>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts       |  3 ++-
>>>   3 files changed, 38 insertions(+), 1 deletion(-)
>>>   create mode 100644 
>>> arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>>>   create mode 100644 
>>> arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>>> 
>>> diff --git 
>>> a/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi 
>>> b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>>> new file mode 100644
>>> index 0000000..9277599
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>> As there are no other machines that use this layout, I think you
>> should have the layout in the dts file.
> 
> I think the idea was we might have more machines that use this layout
> in the future...
> 
Yeah that was the idea. Although since Witherspoon is the only machine
using this layout I can move it to its dts file, and the layout can be
moved out if/when another machine needs it. Will re-submit a v2.
>> 
>>> @@ -0,0 +1,18 @@
>>> +               label = "alt-bmc";
>>> +               partitions {
>>> +                               #address-cells = < 1 >;
>>> +                               #size-cells = < 1 >;
>>> +                               compatible = "fixed-partitions";
>>> +                               u-boot@0 {
>>> +                                       reg = < 0 0x60000 >;
>>> +                                       label = "alt-u-boot";
>>> +                               };
>>> +                               u-boot-env@60000 {
>>> +                                       reg = < 0x60000 0x20000 >;
>>> +                                       label = "alt-u-boot-env";
>>> +                               };
>>> +                               obmc-ubi@80000 {
>>> +                                       reg = < 0x80000 0x1F80000 >;
>>> +                                       label = "alt-obmc-ubi";
>>> +                               };
>>> +               };
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi 
>>> b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>>> new file mode 100644
>>> index 0000000..0059ad1
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>>> @@ -0,0 +1,18 @@
>>> +               label = "bmc";
>>> +               partitions {
>>> +                               #address-cells = < 1 >;
>>> +                               #size-cells = < 1 >;
>>> +                               compatible = "fixed-partitions";
>>> +                               u-boot@0 {
>>> +                                       reg = < 0 0x60000 >;
>>> +                                       label = "u-boot";
>>> +                               };
>>> +                               u-boot-env@60000 {
>>> +                                       reg = < 0x60000 0x20000 >;
>>> +                                       label = "u-boot-env";
>>> +                               };
>>> +                               obmc-ubi@80000 {
>>> +                                       reg = < 0x80000 0x1F80000 >;
>>> +                                       label = "obmc-ubi";
>>> +                               };
>>> +               };
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts 
>>> b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> index c51e3e8..058b9b7 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>> @@ -191,7 +191,7 @@
>>>                  label = "bmc";
>>>                  m25p,fast-read;
>>>                  spi-max-frequency = <50000000>;
>>> -#include "openbmc-flash-layout.dtsi"
>>> +#include "aspeed-bmc-opp-flash-layout-ubi.dtsi"
>>>          };
>>> 
>>>          flash@1 {
>>> @@ -199,6 +199,7 @@
>>>                  label = "alt";
>>>                  m25p,fast-read;
>>>                  spi-max-frequency = <50000000>;
>>> +#include "aspeed-bmc-alt-opp-flash-layout-ubi.dtsi"
>>>          };
>>>   };
>>> 
>>> --
>>> 1.8.3.1
>>> 
