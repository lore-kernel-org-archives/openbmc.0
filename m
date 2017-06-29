Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wz14Y14Q0zDrC8
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 23:40:12 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5TDdCwD122582
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 09:40:11 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bcyq0r05g-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 09:40:10 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 29 Jun 2017 07:40:10 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 29 Jun 2017 07:40:06 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5TDe6JW26149066; Thu, 29 Jun 2017 06:40:06 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E13EE136051;
 Thu, 29 Jun 2017 07:40:05 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.6.33])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id BE48513603C;
 Thu, 29 Jun 2017 07:40:01 -0600 (MDT)
Subject: Re: [PATCH v3 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
To: Guenter Roeck <linux@roeck-us.net>, wim@iguana.be, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
 <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
 <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 29 Jun 2017 08:39:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17062913-0008-0000-0000-00000820716B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007293; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00880402; UDB=6.00438889; IPR=6.00660553; 
 BA=6.00005447; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016005; XFM=3.00000015;
 UTC=2017-06-29 13:40:08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17062913-0009-0000-0000-000042D9DBFF
Message-Id: <21f28ed9-b73a-5c21-5557-bec1fef0d874@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-29_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706290224
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
X-List-Received-Date: Thu, 29 Jun 2017 13:40:13 -0000



On 6/28/17 10:33 PM, Guenter Roeck wrote:
> On 06/28/2017 05:28 PM, Christopher Bostic wrote:
>> Describe device tree optional properties:
>>
>>    * aspeed,arm-reet - ARM CPU reset on signal
>>    * aspeed,no-soc-reset - SOC reset on signal
>>    * aspeed,no-sys-reset - System reset on signal
>>    * aspeed,interrupt - Interrupt CPU on signal
>>    * aspeed,external-signal - Generate external signal (WDT1 and WDT2 
>> only)
>>    * aspeed,alt-boot - Boot from alternate block on signal
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> ---
>> v3 - Invert soc and sys reset to 'no' to preserve backwards
>>       compatibility.  SOC and SYS reset will be set by default
>>       without any optional parameters set
>> v2 - Add 'aspeed,' prefix to all optional properties
>>     - Add arm-reset, soc-reset, interrupt, alt-boot properties
>> ---
>>   .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24 
>> ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt 
>> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> index c5e74d7..6f18005 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> @@ -8,9 +8,33 @@ Required properties:
>>    - reg: physical base address of the controller and length of 
>> memory mapped
>>      region
>>   +Optional properties:
>> +   Signal behavior - Whenever a timeout occurs the watchdog can be 
>> programmed
>> +   to generate/not generate 6 types of signals:
>> +
>> + - aspeed,arm-reset:    If property is present then reset ARM CPU only.
>> +            If not specified no ARM CPU reset is done.
>> +
>> + - aspeed,no-soc-reset: If property is present then do not reset SOC.
>> +            If not specified then SOC reset is done.
>> +
>> + - aspeed,no-sys-reset: If property is present then do not reset 
>> system.
>> +            Typcally used in tandem with 'aspeed-external-signal'
>
> Is this correct ? As I understand the datasheet, it could also used in 
> tandem with
> aspeed,interrupt.
True, that should be documented.  Will add that.
>
>> +            If not specified then system reset is done.
>> +
>
> I'll leave it up to Rob to decide, but for my part I don't understand 
> no-soc-reset.
As the aspeed watchdog driver exists prior to this change an SOC reset 
is done by
default.   In order to preserve backwards compatibility a missing 
optional property
should result in default behavior.  I however need to be able to specify 
that SOC
reset be disabled in some way.  This goes back to our discussion about 
why we'd
ever want to disable SYSTEM reset in the first place.  Same reasoning 
applies for
SOC reset.

> I would instead use four properties.
>
>     aspeed,arm-reset
>     aspeed,soc-reset
Per my response above I think it should remain as aspeed,no-soc-reset due to
backwards compatibility requirements.
>     aspeed,sys-reset (which is the default)
Again as per our discussion yesterday I need some way to specify how system
reset is to  be done.  For backwards compatibility, a lack of parameter 
here would
result in a system reset being configured.  Only way to indicate to the 
driver
that no system reset is to be done is to indicate 'no' system reset in 
the optional
parameter.
>     aspeed,no-reset
This parameter seems ambiguous as we could be doing a 'no system reset'
or a 'no SOC reset' in theory.
>
> There should also be a note explaining that the above are mutually 
> exclusive.
>
OK, will add that.

>> + - aspeed,interrupt:    If property is present then interrupt CPU.
>> +            If not specified then don't interrupt CPU.
>> +
>> + - aspeed,external-signal: If property is present then signal is 
>> sent to
>> +            external reset counter (only WDT1 and WDT2). If not
>> +            specified no external signal is sent.
>
> For consistency, either add an empty line here or remove the empty 
> lines above

Will fix.

Thanks,
Chris
>
>> + - aspeed,alt-boot:    If property is present then boot from 
>> alternate block.
>> +
>>   Example:
>>         wdt1: watchdog@1e785000 {
>>           compatible = "aspeed,ast2400-wdt";
>>           reg = <0x1e785000 0x1c>;
>> +        aspeed,no-sys-reset;
>> +        aspeed,external-signal;
>>       };
>>
>
