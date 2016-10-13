Return-Path: <clg@kaod.org>
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
 [178.33.253.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svrt731MhzDt0J
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 00:19:26 +1100 (AEDT)
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 753AC14505
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 15:10:53 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 0E7A52A0088;
 Thu, 13 Oct 2016 15:10:48 +0200 (CEST)
Subject: Re: [PATCH u-boot] aspeed/g5: Device Tree for ast2500
To: Joel Stanley <joel@jms.id.au>, Maxim Sloyko <maxims@google.com>
References: <1476117535-48144-1-git-send-email-maxims@google.com>
 <CACPK8Xdief-K9XMX1NkjZEs8v616vbN9yECBjwq_9DqL-2bx_Q@mail.gmail.com>
 <5c3a669e-471c-3457-9bae-066e31e9d98d@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ccfcf0f5-459a-b6e6-f485-ddaba7ba6d70@kaod.org>
Date: Thu, 13 Oct 2016 15:10:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <5c3a669e-471c-3457-9bae-066e31e9d98d@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9789699691510270722
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrgeeggdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Thu, 13 Oct 2016 13:19:28 -0000

Hello Maxim,

On 10/13/2016 09:12 AM, Cédric Le Goater wrote:
> On 10/13/2016 07:24 AM, Joel Stanley wrote:
>> On Tue, Oct 11, 2016 at 3:38 AM,  <maxims@google.com> wrote:
>>> From: Maxim Sloyko <maxims@google.com>
>>>
>>> Device Tree for ast2500, copied from openbmc/linux (include file), plus
>>> minimal device tree configuration for ast2500 eval board.
>>>
>>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>>> ---
>>>  arch/arm/dts/Makefile          |   2 +
>>>  arch/arm/dts/aspeed-g5-evb.dts |  28 +++
>>>  arch/arm/dts/aspeed-g5.dtsi    | 541 +++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 571 insertions(+)
>>>  create mode 100644 arch/arm/dts/aspeed-g5-evb.dts
>>
>> Use the same name as the kernel device tree.
>>
>>>  create mode 100644 arch/arm/dts/aspeed-g5.dtsi
>>>
>>> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
>>> index d1f8e22..09efa0a 100644
>>> --- a/arch/arm/dts/Makefile
>>> +++ b/arch/arm/dts/Makefile
>>> @@ -233,6 +233,8 @@ dtb-$(CONFIG_SOC_KEYSTONE) += k2hk-evm.dtb \
>>>         k2e-evm.dtb \
>>>         k2g-evm.dtb
>>>
>>> +dtb-$(CONFIG_TARGET_AST_G5) += aspeed-g5-evb.dtb
>>> +
>>>  targets += $(dtb-y)
>>>
>>>  # Add any required device tree compiler flags here
>>> diff --git a/arch/arm/dts/aspeed-g5-evb.dts b/arch/arm/dts/aspeed-g5-evb.dts
>>> new file mode 100644
>>> index 0000000..95dc77a
>>> --- /dev/null
>>> +++ b/arch/arm/dts/aspeed-g5-evb.dts
>>
>> This doesn't include the rest of the devices present in the kernel
>> device tree. Is there a reason why you didn't include them?
>>
>>> @@ -0,0 +1,28 @@
>>> +/dts-v1/;
>>> +
>>> +#include "aspeed-g5.dtsi"
>>> +
>>> +/ {
>>> +       memory {
>>> +               device_type = "memory";
>>> +               reg = <0x80000000 0x20000000>;
>>> +       };
>>> +
>>> +       aliases {
>>> +               i2c1 = &i2c0;
>>> +               i2c4 = &i2c3;
>>> +               i2c8 = &i2c7;
>>
>> Why are you doing this?
>>
>>> +       };
>>> +};
>>> +
>>> +&i2c0 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&i2c3 {
>>> +       status = "okay";
>>> +};
>>> +
>>> +&i2c7 {
>>> +       status = "okay";
>>> +};
>>> diff --git a/arch/arm/dts/aspeed-g5.dtsi b/arch/arm/dts/aspeed-g5.dtsi
>>> new file mode 100644
>>> index 0000000..eb81a2e
>>> --- /dev/null
>>> +++ b/arch/arm/dts/aspeed-g5.dtsi
>>> @@ -0,0 +1,541 @@
>>> +/* The device tree is copied from
>>> + * https://github.com/openbmc/linux/blob/9ec9d09/arch/arm/boot/dts/aspeed-g5.dtsi
>>
>> Please update this with the latest from the dev-4.7 tree.
> 
> May be we should include the flash controllers first in the kernel,
> we will need that in u-boot as well for a spi-nor driver.

Here is my updated tree with a lot of cleanups and various 
small fixes :

	https://github.com/legoater/u-boot/commits/v2016.11-aspeed-openbmc

These are required before sending mainline, last remaining 
hack being : 

	https://github.com/legoater/u-boot/commit/50812645a37b067a7346a924da3e9e0bc1d29eb9

The network driver are not strictly needed for mainline but 
we need to do something for the flash driver soon. This is 
very very custom today. So I added the Linux dts as we could 
use them for a spi-nor driver in U-boot. 

The dtb just needs to be in the flash image. For that you can 
use the linux compiled one and dd it at the end of the u-boot 
partition at 0x20050000 and start hacking.

Cheers,

C. 
