Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNDVR65FdzDq7d
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 12:27:43 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v732NccU006660
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 22:27:42 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3mxwq1bu-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 22:27:41 -0400
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 2 Aug 2017 22:27:40 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 2 Aug 2017 22:27:37 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v732RaN133357948; Thu, 3 Aug 2017 02:27:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3FBCAC040;
 Wed,  2 Aug 2017 22:27:51 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.83.5.232])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 31EB5AC03A;
 Wed,  2 Aug 2017 22:27:48 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v6 1/2] ARM: dts: aspeed: Witherspoon add
 gpio-keys-polled for fan presence
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, joel@jms.id.au
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
 <fda3e51f-6c91-dddb-2999-657efdcae829@kaod.org>
 <b687fd39-2fb4-5533-0a11-271e1bca68cd@linux.vnet.ibm.com>
 <277552bc-20bc-9bd2-07d1-65153d73139a@kaod.org>
 <0f8cbd95-db70-4ba4-3c4b-7d6b091e7778@kaod.org>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 2 Aug 2017 21:27:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <0f8cbd95-db70-4ba4-3c4b-7d6b091e7778@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 17080302-0044-0000-0000-000003776032
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007474; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000216; SDB=6.00896752; UDB=6.00448635; IPR=6.00676940; 
 BA=6.00005506; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016507; XFM=3.00000015;
 UTC=2017-08-03 02:27:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080302-0045-0000-0000-000007A572CA
Message-Id: <51a7aefd-3e95-6dbc-c19b-b0fdac9aa74f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030035
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
X-List-Received-Date: Thu, 03 Aug 2017 02:27:44 -0000



On 8/2/17 3:20 AM, Cédric Le Goater wrote:
> On 08/02/2017 09:10 AM, Cédric Le Goater wrote:
>> On 08/02/2017 04:33 AM, Christopher Bostic wrote:
>>>
>>> On 7/31/17 2:48 AM, Cédric Le Goater wrote:
>>>> On 07/29/2017 08:36 PM, Christopher Bostic wrote:
>>>>> Add gpio-keys-polled  node for pca955x fan presence lines.
>>>>> Add GPIO details to pca955x for the presence lines as well.
>>>>>
>>>>> Polling period of 1 second determined to be the max acceptable
>>>>> value based on discussions with Brad Bishop and Matt Spinler.
>>>>> Tested with gpiomon program - verified.
>>>>>
>>>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>>>> ---
>>>>> v6 - Add gpio pin details for fan presence to pca955x node
>>>>> v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
>>>>>        gpio cells property and wrong format for poll-interval.
>>>>> v4 - Add details regarding polling period to commit message.
>>>>> v3 - Remove 'autorepeat'
>>>>>      - Increase polling period to 1 second.
>>>>>      - Remove GPIO specifiers from pca955x in dev tree
>>>>> v2 - Change 'linux,code' from a unique global value to a local one
>>>>>        for all the gpio-keys-polled devices.
>>>>> ---
>>>>>    arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 52 ++++++++++++++++++++++++
>>>>>    1 file changed, 52 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>>> index 5afc03a..70328668 100644
>>>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>>> @@ -56,6 +56,37 @@
>>>>>            };
>>>>>        };
>>>>>    +    gpio-keys-polled {
>>>>> +        compatible = "gpio-keys-polled";
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +        poll-interval = <1000>;
>>>>> +
>>>>> +        fan0-presence {
>>>>> +            label = "fan0-presence";
>>>>> +            gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
>>>>> +            linux,code = <4>;
>>>>> +        };
>>>>> +
>>>>> +        fan1-presence {
>>>>> +            label = "fan1-presence";
>>>>> +            gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
>>>>> +            linux,code = <5>;
>>>>> +        };
>>>>> +
>>>>> +        fan2-presence {
>>>>> +            label = "fan2-presence";
>>>>> +            gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
>>>>> +            linux,code = <6>;
>>>>> +        };
>>>>> +
>>>>> +        fan3-presence {
>>>>> +            label = "fan3-presence";
>>>>> +            gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
>>>>> +            linux,code = <7>;
>>>>> +        };
>>>>> +    };
>>>>> +
>>>>>        leds {
>>>>>            compatible = "gpio-leds";
>>>>>    @@ -277,6 +308,7 @@
>>>>>            reg = <0x60>;
>>>>>            #address-cells = <1>;
>>>>>            #size-cells = <0>;
>>>>> +        #gpio-cells = <2>;
>>>> you should also add a :
>>>>
>>>>          gpio-controller;
>>>>
>>>> if you want to use the lines as GPIOs
>>>>
>>>> C.
>>> Hi Cedric,
>>>
>>> If I add 'gpio-controller' here are you indicating that would not
>>> require any modifications I made to the leds-pca955x.c file?
>> yes.
>>
>>> I've tried that and found I still need that leds-pca955x.c change
>>> even if I add 'gpio-controller' attribute to get gpio-keys-polled
>>>   device driver to properly probe the pca955x lines.
>> OK. I will give it a try on a QEMU. Maybe there are some incompatibilities
>> with the gpio-keys driver bindings
> It fails indeed, but the fix you are proposing does not look right
> either.
>
> Maybe we should fully define the pca9552 as a gpio controller and
> then define a gpio-leds and a gpio-keys-polled on top of it ?
Hi Cedric,

What would be entailed in fully defining the pca9552 as a gpio 
controller?   Any other driver examples would help if you know of any.

Currently I see that it has a struct gpio_chip embedded in its 955x chip 
structure and that it defines its various properties, .direction_input, 
.direction_output, etc...   The struct gpio_chip ngpio field is set to a 
subset of pins that are not labeled as LEDS.  Hence my added change to 
count LEDS towards total ngpio's. Given that the pins I'm interested in 
are 4-7 this falls outside the bounds of what the gpio chip considers 
total gpio count.   As a result gpio-keys-polled driver probe fails.

Maybe a quick conference call might be useful?

Thanks,
Chris


> Thanks,
>
> C.
>
>
>> C.
>>
>>> Thanks
>>> Chris
>>>
>>>>>              fan0: led@0 {
>>>>>                label = "fan0";
>>>>> @@ -302,6 +334,26 @@
>>>>>                reg = <3>;
>>>>>                type = <PCA955X_TYPE_LED>;
>>>>>            };
>>>>> +        fan0_pres_gpio: gpio@4 {
>>>>> +            label = "fan0_presence";
>>>>> +            reg = <4>;
>>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>>> +        };
>>>>> +        fan1_pres_gpio: gpio@5 {
>>>>> +            label = "fan1_presence";
>>>>> +            reg = <5>;
>>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>>> +        };
>>>>> +        fan2_pres_gpio: gpio@6 {
>>>>> +            label = "fan2_presence";
>>>>> +            reg = <6>;
>>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>>> +        };
>>>>> +        fan3_pres_gpio: gpio@7 {
>>>>> +            label = "fan3_presence";
>>>>> +            reg = <7>;
>>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>>> +        };
>>>>>            front_fault: led@13 {
>>>>>                label = "front-fault";
>>>>>                default-state = "keep";
>>>>>
