Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq5XN3Xc2zDq8B
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 02:33:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5GGTHXV020199
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 12:33:22 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b4j2va3am-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 12:33:21 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Fri, 16 Jun 2017 12:33:20 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 16 Jun 2017 12:33:18 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5GGXI3n21626982; Fri, 16 Jun 2017 16:33:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66C7D2803A;
 Fri, 16 Jun 2017 12:33:12 -0400 (EDT)
Received: from [9.10.99.11] (unknown [9.10.99.11])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 368092803E;
 Fri, 16 Jun 2017 12:33:12 -0400 (EDT)
Subject: Re: [PATCH] ARM: dts: witherspoon: enable wdt2
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, openbmc@lists.ozlabs.org
References: <20170616161229.6639-1-mspinler@linux.vnet.ibm.com>
 <58d6b0bd-13cb-f161-661a-fbb8ab8e6f6b@kaod.org>
Cc: Matt Spinler <spinler@us.ibm.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Fri, 16 Jun 2017 11:33:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <58d6b0bd-13cb-f161-661a-fbb8ab8e6f6b@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17061616-2213-0000-0000-000001DF3771
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007243; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00875683; UDB=6.00436019; IPR=6.00655772; 
 BA=6.00005425; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015853; XFM=3.00000015;
 UTC=2017-06-16 16:33:19
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061616-2214-0000-0000-000056880218
Message-Id: <d5068871-ecc0-bba3-0519-c37b432e33af@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706160274
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
X-List-Received-Date: Fri, 16 Jun 2017 16:33:24 -0000



On 6/16/2017 11:27 AM, Cédric Le Goater wrote:
> On 06/16/2017 06:12 PM, Matt Spinler wrote:
>> From: Matt Spinler <spinler@us.ibm.com>
>>
>> WDT1 is used for a fan watchdog, so enable WDT2
>> for use by others.
>>
>> Signed-off-by: Matt Spinler <spinler@us.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 99003b9fb54b..1c99e22b256b 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -84,6 +84,10 @@
>>   
>>   #include "ibm-power9-cfam.dtsi"
>>   
>> +&wdt2 {
>> +    status = "okay";
>> +};
>> +
>>   &fmc {
>>   	status = "okay";
>>   	flash@0 {
>> @@ -367,7 +371,7 @@
>>   			type = <PCA955X_TYPE_GPIO>;
>>   		};
>>   		gpio@14 {
>> -			reg = <14>;
>> +			reg = <14>;./arch/arm/boot/dts/
> may be not ? :)
>
> C.
<sigh>
Thanks.
>>   			type = <PCA955X_TYPE_GPIO>;
>>   		};
>>   		gpio@15 {
>>
