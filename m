Return-Path: <xow@google.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7qFM4g9jzDvLj
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 11:47:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=F/CyqwqR; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id o68so681281qkf.3
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/cV/vIQHEzYc7dWfNlKAhk6HL9VlSD2prEhX2ytfW54=;
 b=F/CyqwqRLkaPDSV0UMNGGSNQ0k7G356LlrJ3ZLbr5LX4w3wsSZffxerX+h/UM0UuNY
 aT6Bgd8qpdXXOcXqB0mgGMaK1PQLJAv1NFN6hiF9FWn5Tnhv58WfZ05X9dVaOJPR/Nit
 DqKlh21oTidTUy00yUjUg1QZEP7E/fcy1mTYmJlc1UHtJ5+dqvPYxN4Q0mSwozVOS/An
 USdeVqXvKacVu4vOrhMiceC2AdQBj5vMXX3/dnfOI/tBnfL3SrxNQv9NhTwpLcGx3RgZ
 SDxIFeb/aE9Gx0FPB/2lTEfLkL2dSbKMbhRzRSI6XhJ9dymfNq4aaFJ0r0sjU7veVFrf
 YdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/cV/vIQHEzYc7dWfNlKAhk6HL9VlSD2prEhX2ytfW54=;
 b=OkdCsQ0oGtkxkiKH8RxGdBk1QLDm0owPEIFhIpcOCVNbpDzolg4le3V5vH32YLYVEO
 gnRUu/+Rb7XIj6V7LlcruHR+Xy20X2PpCZD5p8YmXgYYioPdalF0qCKMcqVonaHlaCzq
 rM22J/TF3wg0yXpLPd7Zo4EI1SDikACUnGXuUbflZikXOs9hcPSk5PbTp4yT+CzQOg4m
 LMpyVaMsHzG5aRhNBOA5mjD5KQObeXVwafNmqyUmfrh0OJeW9gdDGX5y5rDToygHTaB3
 sNecE+PZrohzDVvwfCYkJN0hb18oShCXl48N7wXgZxs8Vjcvf07D5XrZa9Tz7Xin8th3
 UbGg==
X-Gm-Message-State: ABUngvcxKhuub4QSHKrED+QyOkWY0ZKyZmLZPhNiCkGRABiI8t9Qz2yaUiaN9WcikzspRtkp0m7vU8D4uF7O0r19
X-Received: by 10.55.10.7 with SMTP id 7mr818120qkk.162.1478047652966; Tue, 01
 Nov 2016 17:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Tue, 1 Nov 2016 17:47:32 -0700 (PDT)
In-Reply-To: <1478044732.27396.3.camel@aj.id.au>
References: <1478043025-78465-1-git-send-email-xow@google.com>
 <CACPK8XfEt+8rdkffHTtfoh13akffxDhrTe0WXZA0-oGbt4FuXg@mail.gmail.com>
 <1478044732.27396.3.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Tue, 1 Nov 2016 17:47:32 -0700
Message-ID: <CAPH-5w6dkJeNBDrGy=FiCiwJar1E-7kGHBy5X1fGAn2Jg0L94Q@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed-g5: Update zaius with new spi-nor
 binding
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 02 Nov 2016 00:47:36 -0000

Hi Joel, Andrew,

On Tue, Nov 1, 2016 at 4:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2016-11-02 at 10:15 +1030, Joel Stanley wrote:
>> Hey Xo,
>>
>> On Wed, Nov 2, 2016 at 10:00 AM, Xo Wang <xow@google.com> wrote:
>>
>> >
>> > +&spi1 {
>> > +       status = "okay";
>> > +       pinctrl-names = "default";
>> > +       pinctrl-0 = <&pinctrl_spi1_default>;
>> > +
>> > +       flash@0 {
>> > +               status = "okay";
>> > +               label = "pnor";
>> > +       };
>> > +};
>> > +
>> > +&spi2 {
>> > +       status = "okay";
>> I think we want to request the pins here. Something like this:
>>
>> +
>> +         pinctrl-names = "default";
>> +         pinctrl-0 = <&pinctrl_spi2ck_default
>> +                         &pinctrl_spi2cs0_default
>> +                         &pinctrl_spi2cs1_default
>> +                         &pinctrl_spi2miso_default
>> +                         &pinctrl_spi2mosi_default>;
>
> Yes, we need this, though maybe the chip selects should be pushed out
> to the board dts?
>
> Andrew
>
>> +
>>
>> Can you try that and do a test boot on your hardware?

Good catch! I hadn't picked up that the SPI2 flash wasn't being
probed. Now it's showing up:

platform 1e620000.flash-controller:flash@0: mx66l51235l (65536 Kbytes)
6 ofpart partitions found on MTD device bmc
Creating 6 MTD partitions on "bmc":
0x000000000000-0x000000060000 : "u-boot"
0x000000060000-0x000000080000 : "u-boot-env"
0x000000080000-0x000000300000 : "kernel"
0x000000300000-0x0000004c0000 : "initramfs"
0x0000004c0000-0x000001c00000 : "rofs"
0x000001c00000-0x000002000000 : "rwfs"
aspeed-smc 1e630000.flash-controller: no DMA support.
platform 1e630000.flash-controller:flash@0: mx66l51235l (65536 Kbytes)
aspeed-smc 1e631000.flash-controller: no DMA support.
platform 1e631000.flash-controller:flash@0: mx25l6405d (8192 Kbytes)

cheers
xo

>>
>> Cheers,
>>
>> Joel
>>
>> >
>> > +       flash@0 {
>> > +               status = "okay";
>> > +       };
>> > +};
>> > +
