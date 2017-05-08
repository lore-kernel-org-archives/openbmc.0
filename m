Return-Path: <clg@kaod.org>
X-Greylist: delayed 492 seconds by postgrey-1.36 at bilbo;
 Tue, 09 May 2017 05:35:07 AEST
Received: from 11.mo1.mail-out.ovh.net (11.mo1.mail-out.ovh.net
 [188.165.48.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wMCQ34XN3zDqJ9
 for <openbmc@lists.ozlabs.org>; Tue,  9 May 2017 05:35:07 +1000 (AEST)
Received: from player756.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id A900270894
 for <openbmc@lists.ozlabs.org>; Mon,  8 May 2017 21:26:50 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id 993CD42007B;
 Mon,  8 May 2017 21:26:47 +0200 (CEST)
Subject: Re: [RFC PATCH linux dev-4.10] leds: pca955x: add GPIO support
To: Joel Stanley <joel@jms.id.au>
References: <1493989667-29466-1-git-send-email-clg@kaod.org>
 <CACPK8XdLXdDos4MeNB2WWwsTXCHfets9FdumzvsqMJjOgdBLvA@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <98575112-697c-69f8-38f3-80d99801ed56@kaod.org>
Date: Mon, 8 May 2017 21:26:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdLXdDos4MeNB2WWwsTXCHfets9FdumzvsqMJjOgdBLvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14301462093433834242
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeliedrjedtgddufeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Mon, 08 May 2017 19:35:08 -0000

On 05/08/2017 06:58 AM, Joel Stanley wrote:
> On Fri, May 5, 2017 at 10:37 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>
>> The following adds support for device tree and Open Firmware to be
>> able do define different operation modes for each pin. See bindings
>> documentation for more details. The pca955x driver is then extended
>> with a gpio_chip when pins are operating in GPIO mode.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  I made some experiments on a witherspoon with this tree :
>>
>>    https://github.com/legoater/linux/commits/openbmc-4.10
>>
>>  Looks OK but I don't know what is happening behind the chip.
>>
>>  Please take a look at the DT bindings.
>>
>>  Thanks,
>>
>>  C.
>>
>>  .../devicetree/bindings/leds/leds-pca955x.txt      | 103 ++++++++
>>  drivers/leds/Kconfig                               |  11 +
>>  drivers/leds/leds-pca955x.c                        | 290 ++++++++++++++++++---
>>  3 files changed, 374 insertions(+), 30 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>> new file mode 100644
>> index 000000000000..98d1053dd1b0
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>> @@ -0,0 +1,103 @@
>> +LEDs connected to pca9550, pca9551, pca9552, pca9553,
>> +
>> +Required properties:
>> +- compatible : should be one of :
>> +       "nxp,pca9550"
>> +       "nxp,pca9551"
>> +       "nxp,pca9552"
>> +       "nxp,pca9553"
>> +- #address-cells: must be 1
>> +- #size-cells: must be 0
>> +- reg: I2C slave address. depends on the model.
>> +
>> +Optional properties:
>> +- gpio-controller: allows pins to be used as GPIOs.
>> +- #gpio-cells: if present, must not be 0.
>> +- gpio-base : base number of the pins used as GPIOs. If there are more
>> +              than one, they should be contiguous. See 'type' property
>> +              below.
>> +
>> +LED sub-node properties:
>> +- reg   : number of LED line.
>> +               from 0 to  1 in pca9550
>> +               from 0 to  7 in pca9551
>> +               from 0 to 15 in pca9552
>> +               from 0 to  3 in pca9553
>> +- compatible: either "none", "led" (default) or "gpio".
>> +- label : (optional)
>> +          see Documentation/devicetree/bindings/leds/common.txt
>> +- linux,default-trigger : (optional)
>> +          see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Examples:
>> +
>> +pca9552: pca9552@60 {
>> +       compatible = "nxp,pca9552";
>> +       #address-cells = <1>;
>> +        #size-cells = <0>;
>> +       reg = <0x60>;
>> +
>> +       gpio-controller;
>> +       #gpio-cells = <2>;
>> +       gpio-base = <12>;
>> +
>> +       gpio@12 {
>> +               label = "GPIO12";
>> +               reg = <12>;
>> +               compatible = "gpio";
>> +       };
>> +       gpio@13 {
>> +               label = "GPIO13";
>> +               reg = <13>;
>> +               compatible = "gpio";
>> +       };
>> +       gpio@14 {
>> +               label = "GPIO14";
>> +               reg = <14>;
>> +               compatible = "gpio";
>> +       };
>> +       gpio@15 {
>> +               label = "GPIO15";
>> +               reg = <15>;
>> +               compatible = "gpio";
>> +       };
> 
> This is a bit unusual as normally GPIOs aren't described until they're
> being used.

that is to distinguish the LED pins from the GPIO pins.

> In that sense, we should have a GPIO controller that covers all of the
> pins in the device. When requested as LEDs the driver should return
> EBUSY to things that are asking for LEDs.

Well, this is how it works when a LED pin is requested as a GPIO :
EBUSY is returned.


> Perhaps you should just send your RFC upstream and see what they have 
> to say?

Yes. I will in the morning.

Cheers,

C.
