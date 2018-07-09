Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lwrNxNJC"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41PRnC1PTdzDr02
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jul 2018 00:00:46 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id s7-v6so25481160itb.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jul 2018 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6Cm+qeD9lOdXQ4HQNSAz62eM0uanw5r54RJWGaaquHU=;
 b=lwrNxNJCgJoIz+ospKMomJmxC+y/5T7HkSCUxvU9thhaJbLBPPIbtiX3q5vDxsT7Cz
 wn2eTzBbpEjGyf1h7WbH21rhRaYp0KgZMaAadNQeC9rvvREE88qb+v7CIlyUt+TZwaM6
 APN9c8euPvf91zPSeXwLEZNHGT0awF9wd+BrPUdkKhpPutVscO0ZBO+75bAIUVPUktky
 Byvr9Lw5Q8QtLF6VvqgHDPewAvP+hjMibfCl5EtrvCFRTqsg7g5i/M4Bcfoyg5sKS67C
 CnA33FxFlNq91SOMMdhPc/cEtgQj5PD+O14xZjEju0PcxVHyzIdB5wzgDhRyCRqVO2jY
 lNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6Cm+qeD9lOdXQ4HQNSAz62eM0uanw5r54RJWGaaquHU=;
 b=I79fM0teh4YRJDVk/MoCQQ18FzgXO18L6KOipj1vq0InMW6gFjIfJF7OUwBit5kaHY
 D3pg3zlyhj4k5u/xjBLkdbPkv5U8XEfrVJSzod8qIeZ80VTb3KDTm4U8myzGTrmB+LGr
 iQXahcyK/4p6BjjktsXvoREAHx8dWuS5DXxUB4CwKLJ/PTkmYlhFeTP0GyynXryR/XZs
 r/rbkqtIXOWb5l3lLmXGicA47T6Hh6+hSyYhJNMF1uiWaVM27B36dWJlAvj7zzBouC0l
 h3fgNfrVI4R6bIC+V7YzP4N4ibKfZxEGgghub2gtjYfb5RS9vNSbeexxurUsaiXrldCC
 Fg9g==
X-Gm-Message-State: APt69E0WnBBCLmbFDZkVRYZ/ogysgl7I9jeG1HyIml4GD8B30l2bCTft
 FfaAr9EIkzb1H7GeHcvr+bQDvtCvDof/DqP+Y3E=
X-Google-Smtp-Source: AAOMgpeNOdBshjdDg/Wtc7upq0k53H/o7e6GRyI4iOdo4PUG+NZvLnjp8ybbelWKQ+CoV20KfNCukF76TUzI9dIm4Qs=
X-Received: by 2002:a02:4f1b:: with SMTP id
 c27-v6mr17337785jab.39.1531144844767; 
 Mon, 09 Jul 2018 07:00:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:854a:0:0:0:0:0 with HTTP;
 Mon, 9 Jul 2018 07:00:44 -0700 (PDT)
In-Reply-To: <20180708231507.GA26077@roeck-us.net>
References: <20180703232326.355718-3-tmaimon77@gmail.com>
 <20180708231507.GA26077@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 9 Jul 2018 17:00:44 +0300
Message-ID: <CAP6Zq1i8Owmp847HvgC5=WGHzSBOS7Ne2G2m8Gotmk8zHkJmKw@mail.gmail.com>
Subject: Re: [v8,2/2] hwmon: npcm750: add NPCM7xx PWM and Fan driver
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jean Delvare <jdelvare@suse.com>, Avi Fishman <avifishman70@gmail.com>, 
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, 
 Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000927786057091707b"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2018 14:00:48 -0000

--000000000000927786057091707b
Content-Type: text/plain; charset="UTF-8"

Great!

thanks a lot!

Tomer

On 9 July 2018 at 02:15, Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Jul 04, 2018 at 02:23:26AM +0300, Tomer Maimon wrote:
> > Add Nuvoton BMC NPCM750/730/715/705 Pulse Width Modulation (PWM)
> > and Fan tacho driver.
> >
> > The Nuvoton BMC NPCM750/730/715/705 supports 8 PWM controller outputs
> > and 16 Fan controller inputs.
> >
> > The driver provides a sysfs entries through which the user can
> > configure the duty-cycle value from 0(off) and 255(full speed)
> > and read the fan tacho rpm value.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter
>

--000000000000927786057091707b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great!=C2=A0<div><br></div><div>thanks a lot!</div><div><b=
r></div><div>Tomer</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 9 July 2018 at 02:15, Guenter Roeck <span dir=3D"ltr">&lt;<=
a href=3D"mailto:linux@roeck-us.net" target=3D"_blank">linux@roeck-us.net</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Wed, Jul 04, 2018 at 02:23:26AM +0300, Tomer Maimon wrote:<br>
&gt; Add Nuvoton BMC NPCM750/730/715/705 Pulse Width Modulation (PWM)<br>
&gt; and Fan tacho driver.<br>
&gt; <br>
&gt; The Nuvoton BMC NPCM750/730/715/705 supports 8 PWM controller outputs<=
br>
&gt; and 16 Fan controller inputs.<br>
&gt; <br>
&gt; The driver provides a sysfs entries through which the user can<br>
&gt; configure the duty-cycle value from 0(off) and 255(full speed)<br>
&gt; and read the fan tacho rpm value.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
>tmaimon77@gmail.com</a>&gt;<br>
<br>
</span>Applied to hwmon-next.<br>
<br>
Thanks,<br>
Guenter<br>
</blockquote></div><br></div>

--000000000000927786057091707b--
