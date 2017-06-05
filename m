Return-Path: <rlippert@google.com>
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whQGq1N6CzDqGr
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 05:43:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vSIzGs1J"; 
 dkim-atps=neutral
Received: by mail-qt0-x22f.google.com with SMTP id w1so101166909qtg.2
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 12:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+C30FLAsp7R17vg6CwAn7jj/DqnDELuPHuWT2Xe+RCc=;
 b=vSIzGs1J9V65qz/9pHfaf3TLeKnpRBVrETb5aQ93tegcyh0N0VdpcKQONO2bKZHLjj
 NcG2jKUg8R2VkhqtO8FfzSZC3MxnJa7lP6kuHb0ve6VVJzNXRZRzBhwPDqj83lJvNmuA
 BA0J7C9/yyhNSGWs4fqmxbCZgDs1pkrRPgyHu7/IaSGFAYGgTbMal8ZV9AHkbVFhA2T+
 QmMoqFnlMW8C804heHAAGAwM7hp1is1O4+AaeGCdeOtE1uAqay2hxqnDOu5VQVkn/l6j
 VDp3ZMzA1VOt5Xqi69XtJUS5qmbP9vvxSAkfjb9NfG944rluuzKv7dfwg0EhVBE6Dn4m
 SK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+C30FLAsp7R17vg6CwAn7jj/DqnDELuPHuWT2Xe+RCc=;
 b=Kvo//+5FWmQThshBOqkYqumbyMy1LSeV3VdQEWOAMNL9Gnni8v7BjbRCibh7PiepSw
 A1okSxRY49wrUiaSHak6vozlGtfTpUXcTMqgMZ7inqOxc8NPf4HhLO/W86HTgWGLe6Ss
 65mR8MODGoHoce5qEjwJ/JOZKmi1izxk34K/dujKQqYsrjofBkzNvovysnjGBeIBehG8
 sGHpeUQ/TWBB4UNyqKaza37jYzKjIUF+cSUdgddQwZ6S+QvQLbdg1y2eCC1+7c2Wddjp
 E2dyCWWv+0f85PAWNsfgxSrqF5omO/0NauBNgA/7R/ZxbAABtiaah5gMKyy14VGgyQef
 2SUw==
X-Gm-Message-State: AKS2vOwKmTY3+5ryDWerAjZ58+WVWFjaQIqBqPzZmzCqP6a63yLvtz8O
 07PkhnRUNj0hYcGYk5LgymqVHjH0Dn9j
X-Received: by 10.200.46.205 with SMTP id i13mr3878664qta.89.1496691806623;
 Mon, 05 Jun 2017 12:43:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.56.108 with HTTP; Mon, 5 Jun 2017 12:43:06 -0700 (PDT)
In-Reply-To: <CACPK8XdmjihLOZseWtGq+9QKQ+mDVNujP_csW8fhUTzPFoTMaQ@mail.gmail.com>
References: <20170602194612.11866-1-rlippert@google.com>
 <CACPK8XdmjihLOZseWtGq+9QKQ+mDVNujP_csW8fhUTzPFoTMaQ@mail.gmail.com>
From: Rob Lippert <rlippert@google.com>
Date: Mon, 5 Jun 2017 12:43:06 -0700
Message-ID: <CAFRv3wzAfdwRreYMGMa4ZMiKuSu7fB4Sd9a8Jt3_Fah9L97R9g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: aspeed: zaius: Support new board FSI
 gpio pin mapping
To: Joel Stanley <joel@jms.id.au>
Cc: Robert Lippert <roblip@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 05 Jun 2017 19:43:32 -0000

On Sun, Jun 4, 2017 at 9:46 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Jun 3, 2017 at 5:16 AM, Robert Lippert <roblip@gmail.com> wrote:
>> FSI routing was broken on EVT boards and all boards were reworked
>> to use the nearest available GPIO pins.  Future boards have
>> fixed the issue so need to use the original planned GPIOG ports.
>
> How long will we need to carry support for the EVT boards?

EVT boards should be scrapped within a few months (by end of year at
the latest) at which point we can remove this code hack and uncomment
the properties in the .dts file.

>
> We had proposed using u-boot to fix up the device tree for these kind
> of changes. If you want to support the EVT long term, we should look
> in to implementing those changes in u-boot.

I looked at that briefly but it was significantly more complicated :)

>
> I have applied this to dev-4.10 so we can support your boards for the
> time being.

Thanks!

-Rob

>
> Cheers,
>
> Joel
>
>> Signed-off-by: Robert Lippert <rlippert@google.com>
>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts |  8 ++++++--
>>  arch/arm/mach-aspeed/aspeed.c              | 30 ++++++++++++++++++++++++++++++
>>  2 files changed, 36 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index b5c4c0fb2986..68baf3288263 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -80,8 +80,12 @@
>>
>>                 status = "okay";
>>
>> -               clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
>> -               data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
>> +               /*
>> +                * These 2 GPIOs are set per board revision in aspeed.c.
>> +                * These are the DVT and beyond values:
>> +                * clock-gpios = <&gpio ASPEED_GPIO(G, 0) GPIO_ACTIVE_HIGH>;
>> +                * data-gpios = <&gpio ASPEED_GPIO(G, 1) GPIO_ACTIVE_HIGH>;
>> +                */
>>                 trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
>>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>>                 mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 5c88286c96fd..1e080d8909f4 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -8,6 +8,8 @@
>>   */
>>
>>  #include <linux/init.h>
>> +#include <linux/gpio/machine.h>
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>  #include <linux/of_irq.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/io.h>
>> @@ -141,6 +143,34 @@ static void __init do_zaius_setup(void)
>>         /* Read BOARD_REV[4:0] fuses from GPIOM[7:3] */
>>         reg = readl(AST_IO(AST_BASE_GPIO | 0x78));
>>         board_rev = (reg >> 3) & 0x1F;
>> +       printk(KERN_INFO "Zaius platform board revision: 0x%02x\n", board_rev);
>> +
>> +       /* EVT boards have different FSI pin mappings */
>> +       if (board_rev < 0x08) {
>> +               static struct gpiod_lookup_table fsi_evt_gpio_lookup = {
>> +                       .dev_id = "fsi-master",
>> +                       .table = {
>> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 3),
>> +                                           "clock", GPIO_ACTIVE_HIGH),
>> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(C, 2),
>> +                                           "data", GPIO_ACTIVE_HIGH),
>> +                               { },
>> +                       },
>> +               };
>> +               gpiod_add_lookup_table(&fsi_evt_gpio_lookup);
>> +       } else {
>> +               static struct gpiod_lookup_table fsi_gpio_lookup = {
>> +                       .dev_id = "fsi-master",
>> +                       .table = {
>> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 0),
>> +                                           "clock", GPIO_ACTIVE_HIGH),
>> +                               GPIO_LOOKUP("1e780000.gpio", ASPEED_GPIO(G, 1),
>> +                                           "data", GPIO_ACTIVE_HIGH),
>> +                               { },
>> +                       },
>> +               };
>> +               gpiod_add_lookup_table(&fsi_gpio_lookup);
>> +       }
>>
>>         /* Assert MAC2 PHY hardware reset */
>>         /* Set pin low */
>> --
>> 2.13.0.506.g27d5fe0cd-goog
>>
