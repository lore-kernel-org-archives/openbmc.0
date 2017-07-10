Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x5pVc41F6zDqBr
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 01:07:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6AF4cRw108784
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 11:07:50 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bmb55jc7h-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jul 2017 11:07:50 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Mon, 10 Jul 2017 09:07:49 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 10 Jul 2017 09:07:47 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6AF7kEJ8389056; Mon, 10 Jul 2017 08:07:46 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB3E46A03D;
 Mon, 10 Jul 2017 09:07:46 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.210.46])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 050B46A03F;
 Mon, 10 Jul 2017 09:07:42 -0600 (MDT)
Subject: Re: [v4, 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
To: Guenter Roeck <linux@roeck-us.net>
References: <20170707004901.26780-2-cbostic@linux.vnet.ibm.com>
 <20170708145907.GA19078@roeck-us.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, wim@iguana.be, robh+dt@kernel.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Mon, 10 Jul 2017 10:07:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170708145907.GA19078@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17071015-0016-0000-0000-000007246530
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007343; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00885582; UDB=6.00441967; IPR=6.00665731; 
 BA=6.00005464; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016160; XFM=3.00000015;
 UTC=2017-07-10 15:07:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17071015-0017-0000-0000-00003A82B34E
Message-Id: <61225254-6b6c-672f-23f8-b7c9f24aa46e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707100269
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
X-List-Received-Date: Mon, 10 Jul 2017 15:07:53 -0000



On 7/8/17 9:59 AM, Guenter Roeck wrote:
> On Thu, Jul 06, 2017 at 07:48:59PM -0500, Christopher Bostic wrote:
>> Describe device tree optional properties:
>>
>>    * aspeed,reset-type = "cpu|soc|system|none"
>>       One of three different, mutually exclusive, values
>>
>> 	"cpu" : ARM CPU reset on signal
>> 	"soc" : 'System on chip' reset
>> 	"system" : Full system reset
>>
>>       The value can also be set to "none" which indicates that no
>>       reset of any kind is to be done via this watchdog.  This assumes
>>       another watchdog on the chip is to take care of resets.
>>
>>    * aspeed,interrupt - Interrupt CPU on signal
> After thinking about that, I wonder if this is necessary. It could be
> implied by providing an interrupt to the driver. The driver could then
> set the interrupt configuration bit automatically.
>
> [ And the bit by itself doesn't really make sense if the driver doesn't
>    also register an interrupt handler ]

The 'aspeed,interrupt' property was added for the sake of documenting 
all potential hardware configurations.  There is no plan as of now to 
enable this so I'm inclined to just remove this part from the 
documentation.  When and if this function is ever used the optional 
property can be documented at that time.

Thanks,
Chris

>>    * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>>    * aspeed,alt-boot - Boot from alternate block on signal
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>> v4 - Add aspeed-reset-type and assign one of four values,
>>       cpu, soc, system, none.
>> v3 - Invert soc and sys reset to 'no' to preserve backwards
>>       compatibility.  SOC and SYS reset will be set by default
>>       without any optional parameters set
>> v2 - Add 'aspeed,' prefix to all optional properties
>>     - Add arm-reset, soc-reset, interrupt, alt-boot properties
>> ---
>>   .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 35 ++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> index c5e74d7..f526b00 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> @@ -8,9 +8,44 @@ Required properties:
>>    - reg: physical base address of the controller and length of memory mapped
>>      region
>>   
>> +Optional properties:
>> +
>> + - aspeed,reset-type = "cpu|soc|system|none"
>> +
>> +   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
>> +   to generate one of three different, mutually exclusive, types of resets.
>> +
>> +   Type "none" can be specified to indicate that no resets are to be done.
>> +   This is useful in situations where another watchdog engine on chip is
>> +   to perform the reset.
>> +
>> +   If 'aspeed,reset-type=' is not specfied the default is to enable system
>> +   reset.
>> +
>> +   Reset types:
>> +
>> +        - cpu: Reset CPU on watchdog timeout
>> +
>> +        - soc: Reset 'System on Chip' on watchdog timeout
>> +
>> +        - system: Reset system on watchdog timeout
>> +
>> +        - none: No reset is performed on timeout. Assumes another watchdog
>> +                engine is responsible for this.
>> +
>> + - aspeed,interrupt:	If property is present then interrupt CPU.
>> +			If not specified then don't interrupt CPU.
>> +
>> + - aspeed,external-signal: If property is present then signal is sent to
>> +			external reset counter (only WDT1 and WDT2). If not
>> +			specified no external signal is sent.
>> + - aspeed,alt-boot:    If property is present then boot from alternate block.
>> +
>>   Example:
>>   
>>   	wdt1: watchdog@1e785000 {
>>   		compatible = "aspeed,ast2400-wdt";
>>   		reg = <0x1e785000 0x1c>;
>> +		aspeed,reset-type = "system";
>> +		aspeed,external-signal;
>>   	};
