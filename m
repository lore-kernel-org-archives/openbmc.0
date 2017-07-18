Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xBlvM3s49zDrH2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:27:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6IGOJdO005509
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 12:27:56 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bskfafqjn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 12:27:56 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 18 Jul 2017 10:27:55 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 18 Jul 2017 10:27:54 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6IGRsOO9175444
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 09:27:54 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1907C604A
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 10:27:53 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.36])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id D5FFEC6043
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2017 10:27:53 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: Add gpio-keys-polled
 for fan presence
To: openbmc@lists.ozlabs.org
References: <20170717212732.8629-1-cbostic@linux.vnet.ibm.com>
 <20170717212732.8629-2-cbostic@linux.vnet.ibm.com>
 <1500342546.500.3.camel@aj.id.au>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 18 Jul 2017 11:27:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1500342546.500.3.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17071816-0028-0000-0000-0000080B852C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007381; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00889401; UDB=6.00444256; IPR=6.00669574; 
 BA=6.00005479; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016262; XFM=3.00000015;
 UTC=2017-07-18 16:27:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071816-0029-0000-0000-000036BCAFF7
Message-Id: <fa67a14c-8994-8ca9-7ab4-610c852dac54@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-18_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1707180258
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
X-List-Received-Date: Tue, 18 Jul 2017 16:27:59 -0000



On 7/17/17 8:49 PM, Andrew Jeffery wrote:
> On Mon, 2017-07-17 at 16:27 -0500, Christopher Bostic wrote:
>> Define gpio-keys-polled.  Add pca-955x chip IO as GPIO source.
>>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 34 ++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 34c5dfc..d60a1db 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -62,6 +62,38 @@
>>>   		};
>>>   	};
>>   
>>> +	gpio-keys-polled {
>>> +		compatible = "gpio-keys-polled";
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		#poll-interval = <100>;
>>> +		autorepeat;
>> +
>>> +		fan0-presence {
>>> +			label = "fan0-presence";
>>> +			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
>> +			linux,code = <232>;
> I think I replied about your choice of codes in the previous series.
> The thought that I eventually came to (after replying IIRC) was what
> has sort-of happened naturally here by way of the PCA card being unable
> to provide interrupts, forcing you to define a separate node using
> gpio-keys-polled.
>
> Anyway, the thought was to have one gpio-keys{,-polled} node per
> gpiochip device. That gives us the namespacing that the gpiochip
> phandle provides - i.e. all keys in a node must use the same gpiochip
> phandle. This isolates the keys behind separate input devices, and thus
> their codes don't need to be globally unique.
>
> So in this case I'm suggesting:
>
>      fan0-presence {
>          label = "fan0-presence";
>          gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
>          linux,code = <4>;
>      }
>
> And likewise for the nodes below.

Hi Andrew,

I'll update per your suggestion.

Thanks for the input,
Chris

>
> Cheers,
>
> Andrew
>
>> +		};
>> +
>>> +		fan1-presence {
>>> +			label = "fan1-presence";
>>> +			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
>>> +			linux,code = <233>;
>>> +		};
>> +
>>> +		fan2-presence {
>>> +			label = "fan2-presence";
>>> +			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
>>> +			linux,code = <234>;
>>> +		};
>> +
>>> +		fan3-presence {
>>> +			label = "fan3-presence";
>>> +			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
>>> +			linux,code = <235>;
>>> +		};
>>> +	};
>> +
>>>   	leds {
>>>   		compatible = "gpio-leds";
>>   
>> @@ -224,6 +256,8 @@
>>>   		reg = <0x60>;
>>>   		#address-cells = <1>;
>>>   		#size-cells = <0>;
>>> +		gpio-controller;
>>> +		#gpio-cells = <2>;
>>   
>>>>   		fan0: led@0 {
>>>   			label = "fan0";
