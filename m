Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDdbc3g7CzDrjC
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 15:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=IT+EqsCW; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id d97so8148617uad.1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7RZJxX/eF8qQOaTvBza3fPw9r/IHpB3vURK5LOK0TXU=;
 b=IT+EqsCWFtPYD1DKubvGcoouyDSwEX+sB7UepAFlWvAvSSVugPzUa+X/DloTCz44ei
 C1Eng0sRmzL+rVFb64qyhn+8eqPUKWTG331Akk3IoX/9tcwL4qPcvU7ZoHDCQ/CDee3M
 mxT1D8SDbtofsgjtAjpF/gvSBo7lDNnXGZhmWjcnCrhmBkQJh0FIc2I/j4GPtH+HjS5u
 GPbEzungDkftV3HJHq0+CjY65hrJrKKDDp2CmKKGFOoO+jqwvcuSvzCApd3twX/7A+Gv
 +zLwt9sSfq1xSHpl6C2+/KTS3OTQBFUDsC9olzRG0BPuGVdat+3ywHVJ7xBpchH/DoOS
 EnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7RZJxX/eF8qQOaTvBza3fPw9r/IHpB3vURK5LOK0TXU=;
 b=RaktazbRxmDCMIBenesdZ5R8NNhIH71VANffYuRtycI7hla59Fjrasfrx+6xBU+uu5
 JGLLVi2H19YyeG4ZJVDcMldsEYTvqHoyAvNJm1clY4DQFaNL8cvwawSl1kp8GX+hFVgV
 4htvbelsX2AUtxC3yxRGuHO8xIUCaFtY6nIqqUmwid3oG5ehGoLMvanWoMdlDMxC7ByH
 YiGe7NsKgsprAgqS4A5HUCCAhZk+SMcFVyGz2lOfK5d7PtC9u0HSg6DRXnOQDYj1j5ZX
 mg0xIPq32cPkO8UiT/OZuccmEdN8zGIoWegJ+ifah+JccPShy4P+L8OetxAfBLtT6ZM4
 0plQ==
X-Gm-Message-State: AEkoouvd7LQqakhOgCw8gHB1YHScqFGCnzv6G+0Zmx2wodHpro2kjCJTa/JUI3RZkMKK70+3Ch2JzXyVnzSj9Q==
X-Received: by 10.176.0.115 with SMTP id 106mr18846171uai.43.1471412986462;
 Tue, 16 Aug 2016 22:49:46 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 16 Aug 2016 22:49:26 -0700 (PDT)
In-Reply-To: <AM5PR0501MB2097FD63488A7D938298B753A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1470812613-51011-1-git-send-email-vadimp@mellanox.com>
 <CACPK8XeYAMWCZpQ+TrZuwxuxfCzzCCkoq5wCdk8HuPyhFVzBBw@mail.gmail.com>
 <AM5PR0501MB2097FD63488A7D938298B753A2140@AM5PR0501MB2097.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 17 Aug 2016 15:19:26 +0930
X-Google-Sender-Auth: JHSPPU2VOEG5HhlqHFfZm_ZTmNw
Message-ID: <CACPK8XfWdp=8tGE9UFJTR_6aWK=tUonpZtNtwVhBhH6L-FSgBw@mail.gmail.com>
Subject: Re: [dev-4.7 patch 5/5] arch/arm: introduce support for Mallanox evb
 aspeed 2500 config and dts flavors
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jiri Pirko <jiri@mellanox.com>,
 Michael Shych <michaelsh@mellanox.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2016 05:49:49 -0000

On Wed, Aug 17, 2016 at 3:01 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:
>> > diff --git a/arch/arm/boot/dts/aspeed-g5-mlx.dtsi
>> > b/arch/arm/boot/dts/aspeed-g5-mlx.dtsi
>> > new file mode 100644
>> > index 0000000..0f4cce9
>> > --- /dev/null
>> > +++ b/arch/arm/boot/dts/aspeed-g5-mlx.dtsi
>> > @@ -0,0 +1,429 @@
>> > +#include "skeleton.dtsi"
>> > +
>> > +/ {
>> > +       model = "Aspeed BMC";
>> > +       compatible = "aspeed,ast2500";
>> > +       #address-cells = <1>;
>> > +       #size-cells = <1>;
>> > +       interrupt-parent = <&vic>;
>> > +
>>
>> This looks to be a copy of the existing aspeed-g5.dtsi. You should include that in
>> your .dts file instead of duplicating it.
>
> We have in this file peci, jtag, pwm and we are adding now usb.

You can add these devices to the aspeed-g5.dtsi and set them to
disabled so the other systems ignore the extra devices.

You can then set them to enabled with status = "okay" in your .dts as
you have done with i2c, etc.

> We also wanted to change interrupt level sensitivity to LEVEL_HIGH.
> Currently, using aspeed-g5 we are getting all interrupts  as edge. According to datasheet most should be level. Possibly this is a reason of I2C failure (which we experienced also with 4.7).

IIRC the irq driver doesn't have support for specifying the interrupt
as edge or level. This is an enhancement that needs to be made to the
driver before you can specify it in the device tree.

>> > diff --git a/arch/arm/configs/mlx_bmc_defconfig
>> > b/arch/arm/configs/mlx_bmc_defconfig
>> > new file mode 100644
>> > index 0000000..b381dc5
>> > --- /dev/null
>> > +++ b/arch/arm/configs/mlx_bmc_defconfig
>>
>> Upstream do not like adding many defconfigs. We have one for the
>> ast2500 and one for the ast2400 series. I suggest adding options to the
>> aspeed_g5_defconfig.
>
> We have a big gap between aspeed_g5_defconfig and our flavor of that (LED, SWITCHDEV). Also we would like to get rid of using JFFS2 and move to UBI.
> Would it be possible to add all that to aspeed_g5_defconfig?

There are two ways you can configure the kernel. One is to have the
defconfig in the kernel tree that is a superset of the requirements
for all systems.

The other is to have a kernel configuration specific to your board in
the yocto tree. This option allows everyone to build a smaller kernel
that meets the needs of their BMC. This is the option that the
existing boards currently support.

No matter which option you chose, I suggest sending a patch to
aspeed_g5_defconfig that enables all of the the functionality you use.
This way I can test that it builds correctly when modifying the
kernel.

> By the way, I see that in 4.7 upstream you already added some minimal stuff for Aspeed SoC.
> Do you have some plan regarding upstream other stuff to kernel?

Yes. I intend to merge all of the drivers upstream.

> When you think it could happen?

We have watchdog and irq controller in 4.8.

4.9 will have clocksource, gpio and pinmux.

Brendan is working on i2c which I hope will be ready in time for
inclusion in 4.9.

We also have bt, clock, mtd and vuart drivers that need review and
submission. I hope to get as many as possible into 4.9.

> And are you going to submit upstream all Aspeed files together or you are planning to do it in some particular order?

As each of the drivers are going to different maintainers, they do not
have any dependency on each other. They can go up when they are ready.

Cheers,

Joel
