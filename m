Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3Yty5PkFzDq66
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 09:32:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v66NSkvr096558
 for <openbmc@lists.ozlabs.org>; Thu, 6 Jul 2017 19:32:37 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bhqu9rcwn-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 19:32:37 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Thu, 6 Jul 2017 17:32:37 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Jul 2017 17:32:33 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v66NWWiL61210800; Thu, 6 Jul 2017 16:32:32 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEF7D6A03C;
 Thu,  6 Jul 2017 17:32:32 -0600 (MDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.0.237])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id E16516A03D;
 Thu,  6 Jul 2017 17:32:28 -0600 (MDT)
Subject: Re: [PATCH v3 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
To: Guenter Roeck <linux@roeck-us.net>
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
 <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
 <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
 <21f28ed9-b73a-5c21-5557-bec1fef0d874@linux.vnet.ibm.com>
 <20170629150417.GA10226@roeck-us.net>
 <20170706143512.bmjv2gnoqp5ew4py@rob-hp-laptop>
 <e36ab090-865c-f4d4-6173-1485f77c5d31@linux.vnet.ibm.com>
 <20170706204850.GA20079@roeck-us.net>
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wim@iguana.be
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 6 Jul 2017 18:32:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170706204850.GA20079@roeck-us.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17070623-0004-0000-0000-00001286FC5D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007332; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00883881; UDB=6.00440985; IPR=6.00664068; 
 BA=6.00005455; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016119; XFM=3.00000015;
 UTC=2017-07-06 23:32:35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070623-0005-0000-0000-0000801C18EB
Message-Id: <e90bdd25-4213-70f6-b72f-b3f75d46a4df@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-06_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707060398
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
X-List-Received-Date: Thu, 06 Jul 2017 23:32:43 -0000



On 7/6/17 3:48 PM, Guenter Roeck wrote:
> On Thu, Jul 06, 2017 at 02:27:18PM -0500, Christopher Bostic wrote:
>>
>> On 7/6/17 9:35 AM, Rob Herring wrote:
>>> On Thu, Jun 29, 2017 at 08:04:17AM -0700, Guenter Roeck wrote:
>>>> On Thu, Jun 29, 2017 at 08:39:59AM -0500, Christopher Bostic wrote:
>>>>> On 6/28/17 10:33 PM, Guenter Roeck wrote:
>>>>>> On 06/28/2017 05:28 PM, Christopher Bostic wrote:
>>>>>>> Describe device tree optional properties:
>>>>>>>
>>>>>>>    * aspeed,arm-reet - ARM CPU reset on signal
>>>>>>>    * aspeed,no-soc-reset - SOC reset on signal
>>>>>>>    * aspeed,no-sys-reset - System reset on signal
>>>>>>>    * aspeed,interrupt - Interrupt CPU on signal
>>>>>>>    * aspeed,external-signal - Generate external signal (WDT1 and WDT2
>>>>>>> only)
>>>>>>>    * aspeed,alt-boot - Boot from alternate block on signal
>>>>>>>
>>>>>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>>>>>> ---
>>>>>>> v3 - Invert soc and sys reset to 'no' to preserve backwards
>>>>>>>       compatibility.  SOC and SYS reset will be set by default
>>>>>>>       without any optional parameters set
>>>>>>> v2 - Add 'aspeed,' prefix to all optional properties
>>>>>>>     - Add arm-reset, soc-reset, interrupt, alt-boot properties
>>>>>>> ---
>>>>>>>   .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24
>>>>>>> ++++++++++++++++++++++
>>>>>>>   1 file changed, 24 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>>>>>>> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>>>>>>> index c5e74d7..6f18005 100644
>>>>>>> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>>>>>>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>>>>>>> @@ -8,9 +8,33 @@ Required properties:
>>>>>>>    - reg: physical base address of the controller and length of memory
>>>>>>> mapped
>>>>>>>      region
>>>>>>>   +Optional properties:
>>>>>>> +   Signal behavior - Whenever a timeout occurs the watchdog can be
>>>>>>> programmed
>>>>>>> +   to generate/not generate 6 types of signals:
>>>>>>> +
>>>>>>> + - aspeed,arm-reset:    If property is present then reset ARM CPU only.
>>>>>>> +            If not specified no ARM CPU reset is done.
>>>>>>> +
>>>>>>> + - aspeed,no-soc-reset: If property is present then do not reset SOC.
>>>>>>> +            If not specified then SOC reset is done.
>>>>>>> +
>>>>>>> + - aspeed,no-sys-reset: If property is present then do not reset
>>>>>>> system.
>>>>>>> +            Typcally used in tandem with 'aspeed-external-signal'
>>>>>> Is this correct ? As I understand the datasheet, it could also used in
>>>>>> tandem with
>>>>>> aspeed,interrupt.
>>>>> True, that should be documented.  Will add that.
>>>>>>> +            If not specified then system reset is done.
>>>>>>> +
>>>>>> I'll leave it up to Rob to decide, but for my part I don't understand
>>>>>> no-soc-reset.
>>>>> As the aspeed watchdog driver exists prior to this change an SOC reset is
>>>>> done by
>>>>> default.   In order to preserve backwards compatibility a missing optional
>>>>> property
>>>>> should result in default behavior.  I however need to be able to specify
>>>>> that SOC
>>>>> reset be disabled in some way.  This goes back to our discussion about why
>>>>> we'd
>>>>> ever want to disable SYSTEM reset in the first place.  Same reasoning
>>>>> applies for
>>>>> SOC reset.
>>>>>
>>>>>> I would instead use four properties.
>>>>>>
>>>>>>     aspeed,arm-reset
>>>>>>     aspeed,soc-reset
>>>>> Per my response above I think it should remain as aspeed,no-soc-reset due to
>>>>> backwards compatibility requirements.
>>>> The same can be accomplished with "aspeed,no-reset", which would avoid the, in
>>>> my opinion, awkward "no-{sys,soc}-reset" poperties.
>>>>
>>>>>>     aspeed,sys-reset (which is the default)
>>>>> Again as per our discussion yesterday I need some way to specify how system
>>>>> reset is to  be done.  For backwards compatibility, a lack of parameter here
>>>>> would
>>>>> result in a system reset being configured.  Only way to indicate to the
>>>>> driver
>>>>> that no system reset is to be done is to indicate 'no' system reset in the
>>>>> optional
>>>>> parameter.
>>>> Or "aspeed,no-reset".
>>>>
>>>>>>     aspeed,no-reset
>>>>> This parameter seems ambiguous as we could be doing a 'no system reset'
>>>>> or a 'no SOC reset' in theory.
>>>> {arm,soc,sys}-reset are mutually exclusive per datasheet, and there is a
>>>> separate configuration bit which enables the reset in the first place.
>>>> I don't see how that is ambiguous.
>>>>
>>>> Anyway, I don't think we are making any progress here. Let's wait for
>>>> guidance from Rob.
>>> I tend to agree with Guenter.
>>>
>>> Maybe using the form 'aspeed,reset-type = "cpu|soc|system"' would be
>>> more aligned to the type of reset being mutually exclusive.
>> OK I'll update to this method.
>>
> Maybe add 'aspeed,reset-type = "none"' ? The default (no property) would
> then be "system".

That's what I was thinking -will do that.

Thanks,
Chris
>
> Thanks,
> Guenter
>
