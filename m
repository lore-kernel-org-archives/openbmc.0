Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyPnW0w6rzDr3l
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 00:10:06 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5SE9DRK040232
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 10:10:05 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bc8p8y803-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 10:10:04 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 28 Jun 2017 10:10:03 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 28 Jun 2017 10:10:00 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5SEA0d162783570; Wed, 28 Jun 2017 14:10:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 355F2124044;
 Wed, 28 Jun 2017 10:07:30 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id BE93F124037;
 Wed, 28 Jun 2017 10:07:29 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] arm/dts: Add I2C master and ports to FSI
 cfam
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
References: <1498505585-1820-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XeOHwzMjMm7N4GU159QckNV=WvX=5C5RLWOr7DQ5yFF=g@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 28 Jun 2017 09:09:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeOHwzMjMm7N4GU159QckNV=WvX=5C5RLWOr7DQ5yFF=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17062814-0044-0000-0000-0000035E89B6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007290; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00879931; UDB=6.00438607; IPR=6.00660086; 
 BA=6.00005445; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015991; XFM=3.00000015;
 UTC=2017-06-28 14:10:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062814-0045-0000-0000-0000078C92D2
Message-Id: <6058006f-ad66-d053-550f-6962725b55e9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706280230
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
X-List-Received-Date: Wed, 28 Jun 2017 14:10:07 -0000



On 06/27/2017 11:57 PM, Joel Stanley wrote:
> On Tue, Jun 27, 2017 at 5:03 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> FSI I2C master algorithm probes port devices based on dts.
> Do you need all 28 ports enabled?

I think so. All of those are valid I2C busses on P9. I'm not sure who 
uses them all.

Thanks,
Eddie

>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   arch/arm/boot/dts/ibm-power9-cfam.dtsi | 134 +++++++++++++++++++++++++++++++++
>>   1 file changed, 134 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/ibm-power9-cfam.dtsi b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>> index f29c6e3..a0b5c97 100644
>> --- a/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>> +++ b/arch/arm/boot/dts/ibm-power9-cfam.dtsi
>> @@ -4,6 +4,73 @@
>>                  #address-cells = <1>;
>>                  #size-cells = <1>;
>>
>> +               i2cm@1800 {
>> +                       compatible = "ibm,fsi-i2c-master";
>> +                       reg = <0x1800 0x400>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       port@0 {
>> +                               port = <0>;
>> +                       };
>> +
>> +                       port@1 {
>> +                               port = <1>;
>> +                       };
>> +
>> +                       port@2 {
>> +                               port = <2>;
>> +                       };
>> +
>> +                       port@3 {
>> +                               port = <3>;
>> +                       };
>> +
>> +                       port@4 {
>> +                               port = <4>;
>> +                       };
>> +
>> +                       port@5 {
>> +                               port = <5>;
>> +                       };
>> +
>> +                       port@6 {
>> +                               port = <6>;
>> +                       };
>> +
>> +                       port@7 {
>> +                               port = <7>;
>> +                       };
>> +
>> +                       port@8 {
>> +                               port = <8>;
>> +                       };
>> +
>> +                       port@9 {
>> +                               port = <9>;
>> +                       };
>> +
>> +                       port@10 {
>> +                               port = <10>;
>> +                       };
>> +
>> +                       port@11 {
>> +                               port = <11>;
>> +                       };
>> +
>> +                       port@12 {
>> +                               port = <12>;
>> +                       };
>> +
>> +                       port@13 {
>> +                               port = <13>;
>> +                       };
>> +
>> +                       port@14 {
>> +                               port = <14>;
>> +                       };
>> +               };
>> +
>>                  sbefifo@2400 {
>>                          compatible = "ibm,p9-sbefifo";
>>                          reg = <0x2400 0x400>;
>> @@ -31,6 +98,73 @@
>>                                  #address-cells = <1>;
>>                                  #size-cells = <1>;
>>
>> +                               i2cm@1800 {
>> +                                       compatible = "ibm,fsi-i2c-master";
>> +                                       reg = <0x1800 0x400>;
>> +                                       #address-cells = <1>;
>> +                                       #size-cells = <0>;
>> +
>> +                                       port@0 {
>> +                                               port = <0>;
>> +                                       };
>> +
>> +                                       port@1 {
>> +                                               port = <1>;
>> +                                       };
>> +
>> +                                       port@2 {
>> +                                               port = <2>;
>> +                                       };
>> +
>> +                                       port@3 {
>> +                                               port = <3>;
>> +                                       };
>> +
>> +                                       port@4 {
>> +                                               port = <4>;
>> +                                       };
>> +
>> +                                       port@5 {
>> +                                               port = <5>;
>> +                                       };
>> +
>> +                                       port@6 {
>> +                                               port = <6>;
>> +                                       };
>> +
>> +                                       port@7 {
>> +                                               port = <7>;
>> +                                       };
>> +
>> +                                       port@8 {
>> +                                               port = <8>;
>> +                                       };
>> +
>> +                                       port@9 {
>> +                                               port = <9>;
>> +                                       };
>> +
>> +                                       port@10 {
>> +                                               port = <10>;
>> +                                       };
>> +
>> +                                       port@11 {
>> +                                               port = <11>;
>> +                                       };
>> +
>> +                                       port@12 {
>> +                                               port = <12>;
>> +                                       };
>> +
>> +                                       port@13 {
>> +                                               port = <13>;
>> +                                       };
>> +
>> +                                       port@14 {
>> +                                               port = <14>;
>> +                                       };
>> +                               };
>> +
>>                                  sbefifo@2400 {
>>                                          compatible = "ibm,p9-sbefifo";
>>                                          reg = <0x2400 0x400>;
>> --
>> 1.8.3.1
>>
