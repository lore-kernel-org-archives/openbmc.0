Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r88ZW2x97zDq9y
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 17:48:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=AzW2/i0R; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=jinBVHRQ; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id n62so637119qkc.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 00:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QOIj+fxZ9TU4ch9T7nT8qNRTQnuFtBR2/uI9bW94Qv4=;
 b=AzW2/i0RwZ+8b1CXYAzLmP4x68Tr4GAvkW20/C0EaRNVFahNxhvW5fWfBH9KaMjBa8
 5vDzOcVDRDmEvB6cEv1zHdFzRaNs5QMfMLiX0CRQwJgNpVf/ZcgJweDut0ig9Ux9Yd9o
 C6RyiuXB2EocTNG5J82OXWELWZG+LWua0UQa+eRDzNmkbgmMNFyW5aLyHd+EH0fj+7mr
 urcQkJiKN7x17pf5S8Uj0Hluul20ty1Dz9AnKwBdalSFfFBnnJJcBOiCQr8L0FIopJua
 8fkFVgnCKM4h4X0T8Yqpa3OYST9+gwaTFFduIo/6haLVv2490W+3yIhg6FGWu+5Wv7Rs
 1d1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=QOIj+fxZ9TU4ch9T7nT8qNRTQnuFtBR2/uI9bW94Qv4=;
 b=jinBVHRQGvY70c5en0nURsTk3Xk+xbB6tksCnwx55UnnLJF7DVH7tYGGd79X6o7unq
 co78ih3w5rpK/Gz1bZPMfgEBOaDW7So92G+uEB7vD26PXb6R1/Za/doZeVoTIFfhpBC2
 aTZP+XQp4XeuVgx/hifrWadWJ3DOphTWpevHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=QOIj+fxZ9TU4ch9T7nT8qNRTQnuFtBR2/uI9bW94Qv4=;
 b=GgZzeGNUUDjWHzR8A3z0iqKJTBCjFoJpJ/L+Pm2ZTWrB4ySZ4FXd8a22VuYR2eCpk1
 gTV+xCEp+PZluabZp+5Ys1IaJF6H8NPUlM9rPObBKtOv+XLIz9x5SPobM/waI4mXKYBi
 EcCeRXvedPnLAKVl9SLSUweUIhA34GNKEOGY9kVJVBgFJ9Imiix99a8+EeDixPR0r9p8
 1xQpZNEQDKrMbLUPbwUTAgYhNkKAn9kUtpZlEeBiwGwOytIogiZA4LlL7ysXAeBz/Jor
 2mub3pR9jEY53ZMf9Zdu0N2iUphW4lmKSzN0bxDxBP9uSI7+noD9uSj4jLB71SFzxmAt
 m29w==
X-Gm-Message-State: AOPr4FXyiE10Ex+u9LfyptmWBcfrjzgblWeLH8kJVPrsJMW4EP2LiYBhQgruPVxSOno+gC+8zcMQ1lcKepQSvA==
X-Received: by 10.55.203.132 with SMTP id u4mr16481737qkl.12.1463471281153;
 Tue, 17 May 2016 00:48:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.51.135 with HTTP; Tue, 17 May 2016 00:47:41 -0700 (PDT)
In-Reply-To: <OF8EBADC46.E67D7226-ON48257FB6.0014DBA9@foxconn.com>
References: <OF8EBADC46.E67D7226-ON48257FB6.0014DBA9@foxconn.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2016 17:17:41 +0930
X-Google-Sender-Auth: IbvkOXi1cy3_0KI2H4lul_V7mLg
Message-ID: <CACPK8XfTjdJaBt9dHLc4J2V-xU=_Ef+xnTWNwwpYMcGmP=iabQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E4=BF=A1=3ARe=3A_=5BPATCH_linux=5D_Add_debounce_for_power_?=
 =?UTF-8?Q?button=2C_pull_down_gpioQ7_to_unlock_identify_LED?=
To: ken.th.liu@foxconn.com
Cc: anoo@us.ibm.com, OpenBMC Patches <openbmc-patches@stwcx.xyz>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, sam.wc.su@foxconn.com,
 arvin.yh.yen@foxconn.com, 
 ken.sk.lai@foxconn.com, andrew.cl.lin@foxconn.com, john.hc.wang@foxconn.com
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
X-List-Received-Date: Tue, 17 May 2016 07:48:06 -0000

Hello Ken and Adriana,

It seems you both missed the email sent by Andrew on Friday:

 https://lists.ozlabs.org/pipermail/openbmc/2016-May/003078.html

He also had some feedback for your patch.

I have some suggestions below that you can follow to help us proceed.

>> > > +       writel(0x00001080, AST_IO(AST_BASE_GPIO | 0x84));
>> > We have a GPIO driver that handles setting this register.
>
> Agreed - superficially it looks like we should be doing this in e.g.
> bin/Barreleye.py in the skeleton repo.
>
> So looking there, R4 was previously described:
>
>     GPIO_CONFIG['HEART_BEAT']       = { 'gpio_pin': 'R4', 'direction':
> 'out' }
>
> But was removed by Adriana in skeleton's "9c75104b Implement new LED
> driver" commit. Presumably this should've taken care of the
> configuration of R4.
>

Are you aware that the identify LED is controlled by the gpio-leds
driver in the kernel? Was this working?
.
You can see the configuration of this in the device tree
arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts:

        leds {
                compatible = "gpio-leds";

                heartbeat {
                        # GPIO R4, BMC_HEARTBRAT_LED_N
                        gpios = <&gpio 140 GPIO_ACTIVE_HIGH>;
                };
                identify {
                        # GPIO H2, BMC_SYS_PWROK_IDLED_N
                        gpios = <&gpio 58 GPIO_ACTIVE_LOW>;
                };
                beep {
                        # GPIO N7, BMC_BEEP
                        gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
                };
        };


> The register write is also configuring GPIOQ7 as output, but I can't
> find mention of it in the skeleton history.

>> > > -       writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
>> > > +       writel(0x0031FF2F, AST_IO(AST_BASE_GPIO | 0x80));
>
> So here we're bringing Q7 low. Can we deal with it as mentioned above?

As Andrew observed you are setting Q7 as an otuput and bringing it
low. It is BMC_READY_N, which makes sense.

However, this can be and should be done in skeleton/bin/Barreleye.py.

Norm, as a policy, should we do this when the BMC userspace is up and ready?

>> > > +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
>> > > +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
>> > > +       writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
>
> Right, so these registers configure debounce. I'm not sure why we
> chose timer 3, but regardless, my understanding is that debounce cannot
> be configured from userspace via sysfs.

Andrew points out that we need to do denounce configuration where you
have, for now.

Please re-submit this part of the patch with a commit message about
what GPIOs are being configured and why.

You could write something like:

"This configures GPIOE0, which is BMC_PWBTN_IN_N, to be debounced. It
uses timer 3 for 480000 cycles, which with a pclk of 24MHz is 20
milliseconds."

Cheers,

Joel

On Tue, May 17, 2016 at 12:35 PM, <ken.th.liu@foxconn.com> wrote:
>
> Hi Adri
>
> Response as below.
> Hi Ken,
>
> Could you reply to Joel if you have any questions about his comments or make a new pull request so that the change can be merged? Specifically is provide more info regarding the changes, I'm copying the comments here. Thanks.
>
>
> >> From: Ken <ken.sk.lai@mail.foxconn.com>
> > We need to include a description of why this change is being made.
> > What does it fix? Why does the previous behaviour need to be modified?
>
> It's fix when power on, the identify led can not be controlled.
>
> And power button issue.
>
>
>
> >> +       writel(0x00001080, AST_IO(AST_BASE_GPIO | 0x84));
> > We have a GPIO driver that handles setting this register.
>
> OK. We can move the code to skeleton.
>
>
>
> The GPIO is for unlock Identify LED by GPIOQ7 when power on.
>
>
> >> +       writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));
> > Can you explain each of these you're setting each of these bits?
>
> It's a long story, please check the attachment mail history.
>
>
>
> To conclude, to avoid the debounce pulse for power button interrupt.
>
>
>
>
>
> From:        Joel Stanley <joel@jms.id.au>
> To:        OpenBMC Patches <openbmc-patches@stwcx.xyz>, ken.th.liu@foxconn.com
> Cc:        OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Date:        05/12/2016 02:11 AM
> Subject:        Re: [PATCH linux] Add debounce for power button, pull down gpioQ7 to unlock identify LED
> Sent by:        "openbmc" <openbmc-bounces+anoo=us.ibm.com@lists.ozlabs.org>
> ________________________________
>
>
>
> ping
>
> On Mon, May 2, 2016 at 11:12 AM, Joel Stanley <joel@jms.id.au> wrote:
> > On Fri, Apr 29, 2016 at 3:10 PM, OpenBMC Patches
> > <openbmc-patches@stwcx.xyz> wrote:
> >> From: Ken <ken.sk.lai@mail.foxconn.com>
> >>
> >
> > We need to include a description of why this change is being made.
> > What does it fix? Why does the previous behaviour need to be modified?
> >
> >> ---
> >>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>  mode change 100644 => 100755 arch/arm/mach-aspeed/aspeed.c
> >>
> >> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> >> old mode 100644
> >> new mode 100755
> >> index 594a781..fa5d467
> >> --- a/arch/arm/mach-aspeed/aspeed.c
> >> +++ b/arch/arm/mach-aspeed/aspeed.c
> >> @@ -138,9 +138,10 @@ static void __init do_barreleye_setup(void)
> >>         /* GPIO setup */
> >>         writel(0x9E82FCE7, AST_IO(AST_BASE_GPIO | 0x00));
> >>         writel(0x0370E677, AST_IO(AST_BASE_GPIO | 0x04));
> >> -
> >> +       writel(0x00001080, AST_IO(AST_BASE_GPIO | 0x84));
> >
> > We have a GPIO driver that handles setting this register.
> >
> >>         /* SCU setup */
> >>         writel(0x01C00000, AST_IO(AST_BASE_SCU | 0x88));
> >> +       writel(0x010FFFFF, AST_IO(AST_BASE_SCU | 0xA8));
> >
> > Can you explain each of these you're setting each of these bits?
> >
> >>         /*
> >>          * Do read/modify/write on power gpio to prevent resetting power on
> >> @@ -150,7 +151,10 @@ static void __init do_barreleye_setup(void)
> >>         reg |= 0xCFC8F7FD;
> >>         writel(reg, AST_IO(AST_BASE_GPIO | 0x20));
> >>         writel(0xC738F20A, AST_IO(AST_BASE_GPIO | 0x24));
> >> -       writel(0x0031FFAF, AST_IO(AST_BASE_GPIO | 0x80));
> >> +       writel(0x0031FF2F, AST_IO(AST_BASE_GPIO | 0x80));
> >> +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
> >> +       writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
> >> +       writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
> >
> > As above; we have a GPIO driver that handles setting this register.
> > Changing these states needs to be done from userspace. See
> > https://github.com/openbmc/skeleton/blob/master/bin/Barreleye.py#L531
