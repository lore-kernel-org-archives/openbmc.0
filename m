Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Trzw0BSwzDqCq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 02:11:07 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2RF3G46126543
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 11:11:04 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rgav02g4d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 11:11:04 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 27 Mar 2019 15:11:03 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Mar 2019 15:11:02 -0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2RFB19v13434986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Mar 2019 15:11:01 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21205136060;
 Wed, 27 Mar 2019 15:11:01 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DC55136068;
 Wed, 27 Mar 2019 15:11:00 +0000 (GMT)
Received: from [9.85.177.180] (unknown [9.85.177.180])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Mar 2019 15:11:00 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: Aspeed: Witherspoon: Update BMC partitioning
To: Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@linux.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
References: <1552409402-15881-1-git-send-email-anoo@linux.ibm.com>
 <CACPK8Xer53amWbQ-6dvEaXfHu=grk3ZWsH9NKCa_Xi_JKUnCMg@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 27 Mar 2019 10:10:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xer53amWbQ-6dvEaXfHu=grk3ZWsH9NKCa_Xi_JKUnCMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19032715-8235-0000-0000-00000E73E16D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010823; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000282; SDB=6.01180450; UDB=6.00617763; IPR=6.00961167; 
 MB=3.00026180; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-27 15:11:03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032715-8236-0000-0000-000044ED7D15
Message-Id: <cd769312-732d-fb7a-ca50-e5b29eac235b@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-27_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903270106
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
X-List-Received-Date: Wed, 27 Mar 2019 15:11:08 -0000


On 3/27/19 1:20 AM, Joel Stanley wrote:
> On Tue, 12 Mar 2019 at 16:50, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Add simplified partitions for BMC and alternate flash. Include these by
>> default in Witherspoon.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>   .../boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi  | 18 ++++++++++++++++++
>>   arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi | 18 ++++++++++++++++++
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts       |  3 ++-
>>   3 files changed, 38 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
>> new file mode 100644
>> index 0000000..9277599
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-alt-opp-flash-layout-ubi.dtsi
> As there are no other machines that use this layout, I think you
> should have the layout in the dts file.

I think the idea was we might have more machines that use this layout in 
the future...

>
>> @@ -0,0 +1,18 @@
>> +               label = "alt-bmc";
>> +               partitions {
>> +                               #address-cells = < 1 >;
>> +                               #size-cells = < 1 >;
>> +                               compatible = "fixed-partitions";
>> +                               u-boot@0 {
>> +                                       reg = < 0 0x60000 >;
>> +                                       label = "alt-u-boot";
>> +                               };
>> +                               u-boot-env@60000 {
>> +                                       reg = < 0x60000 0x20000 >;
>> +                                       label = "alt-u-boot-env";
>> +                               };
>> +                               obmc-ubi@80000 {
>> +                                       reg = < 0x80000 0x1F80000 >;
>> +                                       label = "alt-obmc-ubi";
>> +                               };
>> +               };
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>> new file mode 100644
>> index 0000000..0059ad1
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-flash-layout-ubi.dtsi
>> @@ -0,0 +1,18 @@
>> +               label = "bmc";
>> +               partitions {
>> +                               #address-cells = < 1 >;
>> +                               #size-cells = < 1 >;
>> +                               compatible = "fixed-partitions";
>> +                               u-boot@0 {
>> +                                       reg = < 0 0x60000 >;
>> +                                       label = "u-boot";
>> +                               };
>> +                               u-boot-env@60000 {
>> +                                       reg = < 0x60000 0x20000 >;
>> +                                       label = "u-boot-env";
>> +                               };
>> +                               obmc-ubi@80000 {
>> +                                       reg = < 0x80000 0x1F80000 >;
>> +                                       label = "obmc-ubi";
>> +                               };
>> +               };
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index c51e3e8..058b9b7 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -191,7 +191,7 @@
>>                  label = "bmc";
>>                  m25p,fast-read;
>>                  spi-max-frequency = <50000000>;
>> -#include "openbmc-flash-layout.dtsi"
>> +#include "aspeed-bmc-opp-flash-layout-ubi.dtsi"
>>          };
>>
>>          flash@1 {
>> @@ -199,6 +199,7 @@
>>                  label = "alt";
>>                  m25p,fast-read;
>>                  spi-max-frequency = <50000000>;
>> +#include "aspeed-bmc-alt-opp-flash-layout-ubi.dtsi"
>>          };
>>   };
>>
>> --
>> 1.8.3.1
>>
