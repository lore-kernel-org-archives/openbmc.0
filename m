Return-Path: <clg@kaod.org>
X-Greylist: delayed 92168 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Aug 2017 18:57:28 AEST
Received: from 1.mo178.mail-out.ovh.net (1.mo178.mail-out.ovh.net
 [178.33.251.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMnBc0tyYzDqpS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 18:57:28 +1000 (AEST)
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id DFA5D4B2B5
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 10:20:27 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id A3F001C0074;
 Wed,  2 Aug 2017 10:20:24 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10 v6 1/2] ARM: dts: aspeed: Witherspoon add
 gpio-keys-polled for fan presence
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-2-cbostic@linux.vnet.ibm.com>
 <fda3e51f-6c91-dddb-2999-657efdcae829@kaod.org>
 <b687fd39-2fb4-5533-0a11-271e1bca68cd@linux.vnet.ibm.com>
 <277552bc-20bc-9bd2-07d1-65153d73139a@kaod.org>
Cc: openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0f8cbd95-db70-4ba4-3c4b-7d6b091e7778@kaod.org>
Date: Wed, 2 Aug 2017 10:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <277552bc-20bc-9bd2-07d1-65153d73139a@kaod.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10037116198588418818
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrjedugddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 02 Aug 2017 08:57:28 -0000

On 08/02/2017 09:10 AM, Cédric Le Goater wrote:
> On 08/02/2017 04:33 AM, Christopher Bostic wrote:
>>
>>
>> On 7/31/17 2:48 AM, Cédric Le Goater wrote:
>>> On 07/29/2017 08:36 PM, Christopher Bostic wrote:
>>>> Add gpio-keys-polled  node for pca955x fan presence lines.
>>>> Add GPIO details to pca955x for the presence lines as well.
>>>>
>>>> Polling period of 1 second determined to be the max acceptable
>>>> value based on discussions with Brad Bishop and Matt Spinler.
>>>> Tested with gpiomon program - verified.
>>>>
>>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>>> ---
>>>> v6 - Add gpio pin details for fan presence to pca955x node
>>>> v5 - Fix gpio-keys-polled driver probe errors.  Missing pca955x
>>>>       gpio cells property and wrong format for poll-interval.
>>>> v4 - Add details regarding polling period to commit message.
>>>> v3 - Remove 'autorepeat'
>>>>     - Increase polling period to 1 second.
>>>>     - Remove GPIO specifiers from pca955x in dev tree
>>>> v2 - Change 'linux,code' from a unique global value to a local one
>>>>       for all the gpio-keys-polled devices.
>>>> ---
>>>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 52 ++++++++++++++++++++++++
>>>>   1 file changed, 52 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>> index 5afc03a..70328668 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>>> @@ -56,6 +56,37 @@
>>>>           };
>>>>       };
>>>>   +    gpio-keys-polled {
>>>> +        compatible = "gpio-keys-polled";
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +        poll-interval = <1000>;
>>>> +
>>>> +        fan0-presence {
>>>> +            label = "fan0-presence";
>>>> +            gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
>>>> +            linux,code = <4>;
>>>> +        };
>>>> +
>>>> +        fan1-presence {
>>>> +            label = "fan1-presence";
>>>> +            gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
>>>> +            linux,code = <5>;
>>>> +        };
>>>> +
>>>> +        fan2-presence {
>>>> +            label = "fan2-presence";
>>>> +            gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
>>>> +            linux,code = <6>;
>>>> +        };
>>>> +
>>>> +        fan3-presence {
>>>> +            label = "fan3-presence";
>>>> +            gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
>>>> +            linux,code = <7>;
>>>> +        };
>>>> +    };
>>>> +
>>>>       leds {
>>>>           compatible = "gpio-leds";
>>>>   @@ -277,6 +308,7 @@
>>>>           reg = <0x60>;
>>>>           #address-cells = <1>;
>>>>           #size-cells = <0>;
>>>> +        #gpio-cells = <2>;
>>> you should also add a :
>>>
>>>         gpio-controller;
>>>
>>> if you want to use the lines as GPIOs
>>>
>>> C.
>> Hi Cedric,
>>
>> If I add 'gpio-controller' here are you indicating that would not 
>> require any modifications I made to the leds-pca955x.c file?  
> 
> yes.
> 
>> I've tried that and found I still need that leds-pca955x.c change 
>> even if I add 'gpio-controller' attribute to get gpio-keys-polled 
>>  device driver to properly probe the pca955x lines.
> 
> OK. I will give it a try on a QEMU. Maybe there are some incompatibilities 
> with the gpio-keys driver bindings

It fails indeed, but the fix you are proposing does not look right
either.

Maybe we should fully define the pca9552 as a gpio controller and
then define a gpio-leds and a gpio-keys-polled on top of it ?

Thanks,

C.  


> 
> C.
> 
>> Thanks
>> Chris
>>
>>>>             fan0: led@0 {
>>>>               label = "fan0";
>>>> @@ -302,6 +334,26 @@
>>>>               reg = <3>;
>>>>               type = <PCA955X_TYPE_LED>;
>>>>           };
>>>> +        fan0_pres_gpio: gpio@4 {
>>>> +            label = "fan0_presence";
>>>> +            reg = <4>;
>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>> +        };
>>>> +        fan1_pres_gpio: gpio@5 {
>>>> +            label = "fan1_presence";
>>>> +            reg = <5>;
>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>> +        };
>>>> +        fan2_pres_gpio: gpio@6 {
>>>> +            label = "fan2_presence";
>>>> +            reg = <6>;
>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>> +        };
>>>> +        fan3_pres_gpio: gpio@7 {
>>>> +            label = "fan3_presence";
>>>> +            reg = <7>;
>>>> +            type = <PCA955X_TYPE_GPIO>;
>>>> +        };
>>>>           front_fault: led@13 {
>>>>               label = "front-fault";
>>>>               default-state = "keep";
>>>>
>>
> 
