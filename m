Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCDN970RlzDq5b
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 05:50:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Ftn7kcax"; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id f76so74709223qke.2
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=REFXv86hfe39dMRLcUyG4bzw8ifuq+60AvMJSSpiYHg=;
 b=Ftn7kcaxPkgD4ooSOEcfrlDQPjc15/YdpDtBBxp1nN60ewqGG43iewEy5HWyByMCZy
 KVL5CL7niSTqJ7O3afCqvRum0sDmQv0na8n6259VLGiy1Dr2BKetbG8kZo7w8SDAPpfs
 FjxxlguSoiuM7famsXfqz+78A3A3SBdo/KP2t4uzZpE1LWmvtVBhYlK2Lc7zf67k/r9L
 EwOe36A6cZ6JM/hwOSMV0bys0tAet288slDn1nvLzMTxyE0uK8EDqlUoIUOaLDbD5S+4
 7ro6N4Qi57/yl7PQGSXSVB42w9Nl0zWZizhBayAUIo8TsaKh9QR+RNOFaK6cTrYKGiQ1
 fFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=REFXv86hfe39dMRLcUyG4bzw8ifuq+60AvMJSSpiYHg=;
 b=U+N2HOW2sM7ZzXqAGjffE/A0V/E4hMISmpoUDIp7WoKRSTWV1KzMD20+Og4CSvnvgF
 ZUlPU6BBV6EU0/gPwARv8+4eh882dNu496w8uqTnUzZVboLu+rq89D7n5c7bspg9LKha
 KonSHKBSEme4PK1M23J+5TpwyuLy2AJNYO55GpmSD/+PsCv6ng8YpvDsit7C5WjDsHCI
 5Ra7hbiznpLIor4WhNXoSR68Kaq1mmBEJoNjR/pPMOLyxiK/o0+xZlOB0qQ68NTZsakn
 Io1ZZcCHLPfYCYlJi+Sz+z219D368LF9TeSA7pDtqEIPoVqjhWtX6GwARemm/2hiwu/a
 l1rQ==
X-Gm-Message-State: AN3rC/5l5YZcYkrjFvkHQ00+iyiB96G8YC/gEiEbna79f/3ew/yfZ7rL
 xaWSPECRTnFk4qcquklt99xRZjZnjbzX
X-Received: by 10.55.88.4 with SMTP id m4mr29249229qkb.84.1493149846601; Tue,
 25 Apr 2017 12:50:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.162.69 with HTTP; Tue, 25 Apr 2017 12:50:45 -0700 (PDT)
In-Reply-To: <e90ff5914518400ea6902ca40406eb0f@TWMBX01.aspeed.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-5-brendanhiggins@google.com>
 <1490945610.3177.229.camel@kernel.crashing.org>
 <CAFd5g45DQZz99y59AY-4465qnM+tRv6+bDdGQqS6VYHEfRfjDg@mail.gmail.com>
 <1493086747.25766.264.camel@kernel.crashing.org>
 <CAFd5g44ioW0PdFVOhY-ep8TXBNg6qC7E5yjOVf3MEdY9bPgEDA@mail.gmail.com>
 <7d991733d3ea4591b74baf93300f0224@TWMBX01.aspeed.com>
 <1493112875.25766.268.camel@kernel.crashing.org>
 <e90ff5914518400ea6902ca40406eb0f@TWMBX01.aspeed.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Apr 2017 12:50:45 -0700
Message-ID: <CAFd5g45htFgr5oHbB9W_nyyMfm5J7BCKUuP73RxKhNW3LkWtyw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@the-dreams.de>, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 25 Apr 2017 19:50:50 -0000

On Tue, Apr 25, 2017 at 2:47 AM, Ryan Chen <ryan_chen@aspeedtech.com> wrote=
:
> Thanks Ryan. Can you shed some light on the meaning of the high-speed bit=
 as well please ?
>
> About ASPEED_I2CD_M_HIGH_SPEED_EN, it is support for I2C specification "H=
igh speed transfer". And also device need support it.
> If you just speed up the I2C bus clock, you don=E2=80=99t have to enable =
ASPEED_I2CD_M_HIGH_SPEED_EN, just change the clock is ok.
>

Interesting, I thought that ASPEED_I2CD_M_SDA_DRIVE_1T_EN and its
counterpart would be used for fast mode or fast mode plus and
ASPEED_I2CD_M_HIGH_SPEED_EN would be used for fast mode plus or high
speed mode and that they work by driving the SDA and SCL signals to
improve rise times. It made sense to me because the lowest SCL you can
get with base clock set to zero is about ~1.5MHz which is in between
fast mode plus (1MHz) and high speed mode (3.4MHz).

But from what you are saying, ASPEED_I2CD_M_SDA_DRIVE_1T_EN and its
counterpart are totally orthogonal to the selected speed and
ASPEED_I2CD_M_HIGH_SPEED_EN exists as a matter of convenience to set
all of the divider registers to their smallest possible values. Is my
understanding correct?

>
> -----Original Message-----
> From: Benjamin Herrenschmidt [mailto:benh@kernel.crashing.org]
> Sent: Tuesday, April 25, 2017 5:35 PM
> To: Ryan Chen <ryan_chen@aspeedtech.com>; Brendan Higgins <brendanhiggins=
@google.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>; Rob Herring <robh+dt@kernel.org>; M=
ark Rutland <mark.rutland@arm.com>; Thomas Gleixner <tglx@linutronix.de>; J=
ason Cooper <jason@lakedaemon.net>; Marc Zyngier <marc.zyngier@arm.com>; Jo=
el Stanley <joel@jms.id.au>; Vladimir Zapolskiy <vz@mleia.com>; Kachalov An=
ton <mouse@mayc.ru>; C=C3=A9dric Le Goater <clg@kaod.org>; linux-i2c@vger.k=
ernel.org; devicetree@vger.kernel.org; Linux Kernel Mailing List <linux-ker=
nel@vger.kernel.org>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
>
> On Tue, 2017-04-25 at 08:50 +0000, Ryan Chen wrote:
>> Hello All,
>>               ASPEED_I2CD_M_SDA_DRIVE_1T_EN,
>> ASPEED_I2CD_SDA_DRIVE_1T_EN is specific for some case usage.
>>               For example, if i2c bus is use on "high speed" and "single=
 slave and
>> master" and i2c bus is too long. It need drive SDA or SCL less lunacy.
>> It would enable it.
>>               Otherwise, don=E2=80=99t enable it. especially in multi-ma=
ster.
>> It can=E2=80=99t be enable.
>
> That smells like a specific enough use case that we should probably cover=
 with a device-tree property, something like an empty "sda-extra-drive" pro=
perty (empty properties are typically used for booleans, their presence mea=
ns "true").
>
> Thanks Ryan. Can you shed some light on the meaning of the high-speed bit=
 as well please ? Does it force to a specific speed (ignoring the
> divisor) or we can still play with the clock high/low counts ?
>
...
>> > Your latest patch still does that. It will do things like start a
>> > STOP command *then* ack the status bits. I'm pretty sure that's
>> > bogus.
>> >
>> > That way it's a lot simpler to simply move the
>> >
>> >         writel(irq_status, bus->base + ASPEED_I2C_INTR_STS_REG);
>> >
>> > To either right after the readl of the status reg at the beginning
>> > of aspeed_i2c_master_irq().
>> >
>> > I would be very surprised if that didn't work properly and wasn't
>> > much safer than what you are currently doing.
>>
>> I think I tried your way and it worked. In anycase, Ryan will be able
>> to clarify for us.

After thinking about this more, I think Ben is right. It would be
unusual for such a common convention to be broken and even if it is, I
do not see how a command could take effect until it is actually
issued. Nevertheless, it would make me feel better if you, Ryan, could
comment on this.

>>
>> >
>> > > Let me know if you still think we need a "RECOVERY" state.
>> >
...
I feel pretty good about this; it does not look like there will be a
lot of changes going into v8; hopefully, that version will be good
enough to get merged.
