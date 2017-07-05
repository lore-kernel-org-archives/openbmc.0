Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x2pnM3trDzDr1p
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jul 2017 04:10:14 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v65I99t4091710
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jul 2017 14:10:11 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bh38kdb8n-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jul 2017 14:10:11 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 5 Jul 2017 14:10:10 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 5 Jul 2017 14:10:09 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v65IA8kX62390430; Wed, 5 Jul 2017 18:10:08 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CE22AC046;
 Wed,  5 Jul 2017 14:10:13 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 15AC9AC041;
 Wed,  5 Jul 2017 14:10:13 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v2 1/2] arm/dts: Add I2C master and ports
 to FSI cfam
To: Joel Stanley <joel@jms.id.au>
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1498754556-21020-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1498754556-21020-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XfAaTkp-dOf01q+=rW1=5ip-ndmnVSoO2Jh7EiAiQPTcw@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 5 Jul 2017 13:10:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfAaTkp-dOf01q+=rW1=5ip-ndmnVSoO2Jh7EiAiQPTcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17070518-0056-0000-0000-0000039E83DC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007325; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883293; UDB=6.00440632; IPR=6.00663485; 
 BA=6.00005454; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016095; XFM=3.00000015;
 UTC=2017-07-05 18:10:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070518-0057-0000-0000-000007D489CA
Message-Id: <1f42a4c7-0cac-9651-6d3e-60786bcb07ba@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-05_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707050305
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
X-List-Received-Date: Wed, 05 Jul 2017 18:10:18 -0000



On 07/03/2017 03:38 AM, Joel Stanley wrote:
> On Fri, Jun 30, 2017 at 2:12 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> FSI I2C master algorithm probes port devices based on dts.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 120 +++++++++++++++++
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 120 +++++++++++++++++
>>   arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
>>   3 files changed, 404 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index d53dc59..4a1a390 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -72,6 +72,126 @@
>>
>>   #include "ibm-power9-cfam.dtsi"
>>
>> +&cfam0_i2c0 {
>> +       status = "okay";
>> +};
> The point of separating out the description and enabling of these i2c
> nodes was so we could selectively enable the ones that are in use by
> OpenBMC kernel drivers and userspace applications.
>
> With this change we enable 30 i2c character devices, and consume the
> associated kernel memory.
>
> Did you make any progress with discovering the devices that are required?
>
> I can see from a bug report that the SBE EEPROM is one use case:
>
>   errorMessage  : ServerI2CInstruction::iic_open invalid device open
> attempt /dev/i2c-100
>
> Could we enable just that one on each processor to unblock people
> using it for this use case while you investigate other uses?

I heard back from Cronus team, they said they want all the ports 
(/dev/i2c-100 - 114 and 200 - 214). Manufacturing guys deferred to 
Cronus team, so I think that's the best source for which ports we need 
for now.

Thanks,
Eddie

>
> Cheers,
>
> Joel
>> +
>> +&cfam0_i2c1 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c2 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c4 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c5 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c6 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c7 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c8 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c9 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c10 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c11 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c12 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c13 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c14 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c1 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c2 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c4 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c5 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c6 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c7 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c8 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c9 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c10 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c11 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c12 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c13 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c14 {
>> +       status = "okay";
>> +};
>> +
>>   &fmc {
>>          status = "okay";
>>          flash@0 {
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 31315d0..4cc99e2 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -84,6 +84,126 @@
>>
>>   #include "ibm-power9-cfam.dtsi"
>>
>> +&cfam0_i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c1 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c2 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c4 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c5 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c6 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c7 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c8 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c9 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c10 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c11 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c12 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c13 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam0_i2c14 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c0 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c1 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c2 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c3 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c4 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c5 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c6 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c7 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c8 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c9 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c10 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c11 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c12 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c13 {
>> +       status = "okay";
>> +};
>> +
>> +&cfam1_i2c14 {
>> +       status = "okay";
>> +};
>> +
>>   &fmc {
>>          status = "okay";
>>          flash@0 {
>> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>> index f29c6e3..ede778d 100644
>> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>> @@ -4,6 +4,88 @@
>>                  #address-cells = <1>;
>>                  #size-cells = <1>;
>>
>> +               i2c@1800 {
>> +                       compatible = "ibm,fsi-i2c-master";
>> +                       reg = <0x1800 0x400>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       cfam0_i2c0: i2c-bus@0 {
>> +                               status = "disabled";
>> +                               reg = <0>;
>> +                       };
>> +
>> +                       cfam0_i2c1: i2c-bus@1 {
>> +                               status = "disabled";
>> +                               reg = <1>;
>> +                       };
>> +
>> +                       cfam0_i2c2: i2c-bus@2 {
>> +                               status = "disabled";
>> +                               reg = <2>;
>> +                       };
>> +
>> +                       cfam0_i2c3: i2c-bus@3 {
>> +                               status = "disabled";
>> +                               reg = <3>;
>> +                       };
>> +
>> +                       cfam0_i2c4: i2c-bus@4 {
>> +                               status = "disabled";
>> +                               reg = <4>;
>> +                       };
>> +
>> +                       cfam0_i2c5: i2c-bus@5 {
>> +                               status = "disabled";
>> +                               reg = <5>;
>> +                       };
>> +
>> +                       cfam0_i2c6: i2c-bus@6 {
>> +                               status = "disabled";
>> +                               reg = <6>;
>> +                       };
>> +
>> +                       cfam0_i2c7: i2c-bus@7 {
>> +                               status = "disabled";
>> +                               reg = <7>;
>> +                       };
>> +
>> +                       cfam0_i2c8: i2c-bus@8 {
>> +                               status = "disabled";
>> +                               reg = <8>;
>> +                       };
>> +
>> +                       cfam0_i2c9: i2c-bus@9 {
>> +                               status = "disabled";
>> +                               reg = <9>;
>> +                       };
>> +
>> +                       cfam0_i2c10: i2c-bus@10 {
>> +                               status = "disabled";
>> +                               reg = <10>;
>> +                       };
>> +
>> +                       cfam0_i2c11: i2c-bus@11 {
>> +                               status = "disabled";
>> +                               reg = <11>;
>> +                       };
>> +
>> +                       cfam0_i2c12: i2c-bus@12 {
>> +                               status = "disabled";
>> +                               reg = <12>;
>> +                       };
>> +
>> +                       cfam0_i2c13: i2c-bus@13 {
>> +                               status = "disabled";
>> +                               reg = <13>;
>> +                       };
>> +
>> +                       cfam0_i2c14: i2c-bus@14 {
>> +                               status = "disabled";
>> +                               reg = <14>;
>> +                       };
>> +               };
>> +
>>                  sbefifo@2400 {
>>                          compatible = "ibm,p9-sbefifo";
>>                          reg = <0x2400 0x400>;
>> @@ -31,6 +113,88 @@
>>                                  #address-cells = <1>;
>>                                  #size-cells = <1>;
>>
>> +                               i2c@1800 {
>> +                                       compatible = "ibm,fsi-i2c-master";
>> +                                       reg = <0x1800 0x400>;
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +
>> +                                       cfam1_i2c0: i2c-bus@0 {
>> +                                               status = "disabled";
>> +                                               reg = <0>;
>> +                                       };
>> +
>> +                                       cfam1_i2c1: i2c-bus@1 {
>> +                                               status = "disabled";
>> +                                               reg = <1>;
>> +                                       };
>> +
>> +                                       cfam1_i2c2: i2c-bus@2 {
>> +                                               status = "disabled";
>> +                                               reg = <2>;
>> +                                       };
>> +
>> +                                       cfam1_i2c3: i2c-bus@3 {
>> +                                               status = "disabled";
>> +                                               reg = <3>;
>> +                                       };
>> +
>> +                                       cfam1_i2c4: i2c-bus@4 {
>> +                                               status = "disabled";
>> +                                               reg = <4>;
>> +                                       };
>> +
>> +                                       cfam1_i2c5: i2c-bus@5 {
>> +                                               status = "disabled";
>> +                                               reg = <5>;
>> +                                       };
>> +
>> +                                       cfam1_i2c6: i2c-bus@6 {
>> +                                               status = "disabled";
>> +                                               reg = <6>;
>> +                                       };
>> +
>> +                                       cfam1_i2c7: i2c-bus@7 {
>> +                                               status = "disabled";
>> +                                               reg = <7>;
>> +                                       };
>> +
>> +                                       cfam1_i2c8: i2c-bus@8 {
>> +                                               status = "disabled";
>> +                                               reg = <8>;
>> +                                       };
>> +
>> +                                       cfam1_i2c9: i2c-bus@9 {
>> +                                               status = "disabled";
>> +                                               reg = <9>;
>> +                                       };
>> +
>> +                                       cfam1_i2c10: i2c-bus@10 {
>> +                                               status = "disabled";
>> +                                               reg = <10>;
>> +                                       };
>> +
>> +                                       cfam1_i2c11: i2c-bus@11 {
>> +                                               status = "disabled";
>> +                                               reg = <11>;
>> +                                       };
>> +
>> +                                       cfam1_i2c12: i2c-bus@12 {
>> +                                               status = "disabled";
>> +                                               reg = <12>;
>> +                                       };
>> +
>> +                                       cfam1_i2c13: i2c-bus@13 {
>> +                                               status = "disabled";
>> +                                               reg = <13>;
>> +                                       };
>> +
>> +                                       cfam1_i2c14: i2c-bus@14 {
>> +                                               status = "disabled";
>> +                                               reg = <14>;
>> +                                       };
>> +                               };
>> +
>>                                  sbefifo@2400 {
>>                                          compatible = "ibm,p9-sbefifo";
>>                                          reg = <0x2400 0x400>;
>> --
>> 1.8.3.1
>>
