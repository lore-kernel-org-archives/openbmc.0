Return-Path: <maxims@google.com>
Received: from mail-io0-x22c.google.com (mail-io0-x22c.google.com
 [IPv6:2607:f8b0:4001:c06::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP9Jx71cXzDw4m
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 05:06:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VgPXS+sF"; 
 dkim-atps=neutral
Received: by mail-io0-x22c.google.com with SMTP id j65so37806183iof.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 10:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=LuRZlouhrq0WKBXlNZdhdph6PIP5OXkQ/blw/xorkc0=;
 b=VgPXS+sFKM0I9WhG+ew1DtQNyoYcRGPBT5CfgqSzyPEPuyFWSkvqQrcZuH+vqaCDOq
 uErHhP49ghqcoyblEAKZoeTIBXIuPqWRTMoSxxzLwOFjtkoZDOB5Skm6Kj6WmKxR+o9F
 BpbCz4GPRXe1qgdWI1VtpSTBYL8r2T8EdPJptQBf7N4Hci+B3d2xvZ91TyjuZFGR2TWv
 owxl9upM7+WpbHFgTw/JZiSfSlMARaqnLwKcgO6VqHrPRLThOEvVZ6cWtItp2cNbYoVV
 loNL1KNbVi6uLc0bDfqPjkQclekNiGBLhw2Rv7XrfbfWUeoASJRT5HiGGR41g1/R/q14
 wc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=LuRZlouhrq0WKBXlNZdhdph6PIP5OXkQ/blw/xorkc0=;
 b=EwMCdII3Bx520szGIWQ5Ol2sCHHHZPIRNCtYssJDgCXhf48PEITutzsAO5LZevtVno
 KUrjVlR/YKl/s8SNxli4xE1cHCMBg5yG7BQbww2oU4u/2gGDV2I7vWYRrnAQuVfMk0BB
 NmUBoCkzzR6UnZuVY+7c7KJZlV08P7a8BwVtDH/CXnQE32DLoZKiKOWBCVbEcaLpZXSv
 nuSxf00hu4BhMUx6tETahHVftbNQpVgp+O5rRxBdBXFsT2iLEaVBWmPmWfXi5y1fsc/w
 La+0k6llrv8f+UkQybHYJEGxMASFsE3SRpk8h2Re6RSd5CuMacEQmqtpEU0+8hMeMR4h
 TAsA==
X-Gm-Message-State: AKaTC03YkFtRr/CdMeqBAnIYR9QAtwYHldvi/vkanImQka/1aFhb9h7bWh8hBqL4q7gX2bZ6E32VjVBhB4laDWE/
X-Received: by 10.107.58.195 with SMTP id h186mr4438803ioa.117.1479924415614; 
 Wed, 23 Nov 2016 10:06:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.174.224 with HTTP; Wed, 23 Nov 2016 10:06:54 -0800 (PST)
In-Reply-To: <CAPnjgZ3bcJmNNAWSkgkOgQtLNMm-H1QQSqMK6_dcNdiqSgqj=w@mail.gmail.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479858976-139210-5-git-send-email-maxims@google.com>
 <CAPnjgZ1zD58OkusQjFCgJJDu5Ge1JNfrrS+-axYJmjijnUkxBw@mail.gmail.com>
 <CAPnjgZ3bcJmNNAWSkgkOgQtLNMm-H1QQSqMK6_dcNdiqSgqj=w@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 23 Nov 2016 10:06:54 -0800
Message-ID: <CAFR_W8o0sSKgtgZOwJF5b1cJSqqkRLPkNTTR9c=2G1CU8D1zfA@mail.gmail.com>
Subject: Re: [PATCH u-boot 4/5] aspeed: Added function to configure pins for
 I2C devices.
To: Simon Glass <sjg@chromium.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 23 Nov 2016 18:06:58 -0000

On Wed, Nov 23, 2016 at 8:24 AM, Simon Glass <sjg@chromium.org> wrote:
>
> [resend from correct address]
>
> On 23 November 2016 at 09:13, Simon Glass <sjg@google.com> wrote:
> > Hi Maxim,
> >
> > On 22 November 2016 at 16:56,  <maxims@google.com> wrote:
> >> From: Maxim Sloyko <maxims@google.com>
> >>
> >> In the absence of pinmux driver, I2C driver will be
> >> configuring pins directly.
> >
> > Commit subject s/Added/Add/
> >
> > and please remove the '.' at the end.
> >
> >>
> >> Signed-off-by: Maxim Sloyko <maxims@google.com>
> >> ---
> >>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  5 +++++
> >>  arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
> >>  2 files changed, 33 insertions(+)
> >>
> >> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> >> index eb5aaa2..80ebd6f 100644
> >> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
> >> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
> >> @@ -46,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
> >>  extern void ast_scu_multi_func_eth(u8 num);
> >>  extern void ast_scu_multi_func_romcs(u8 num);
> >>
> >> +/* Enable I2C controller and pins for a particular device.
> >> + * Device numbering starts at 1
> >> + */
> >> +extern void ast_scu_enable_i2c(u8 num);
> >
> > I suspect this should be done as a pinctrl driver. See for
> > drivers/pinctrl for examples.


Yes, in the future that is the plan. I think this is OK for now, given
that this file already has similar functions, see
ast_scu_multi_func_{eth, romcs} above.

>
> >
> >> +
> >>  #endif
> >> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
> >> index e00dbe2..b5aa8bf 100644
> >> --- a/arch/arm/mach-aspeed/ast-scu.c
> >> +++ b/arch/arm/mach-aspeed/ast-scu.c
> >> @@ -507,3 +507,31 @@ void ast_scu_get_who_init_dram(void)
> >>                 break;
> >>         }
> >>  }
> >> +
> >> +void ast_scu_enable_i2c(u8 bus_num)
> >> +{
> >> +       if (bus_num > SCU_I2C_MAX_BUS_NUM) {
> >> +               debug("%s: bus_num is out of range, must be [%d - %d]\n",
> >> +                     __func__, SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
> >> +               return;
> >> +       }
> >> +
> >> +       if (bus_num == 0) {
> >> +               /* Enable I2C Controllers */
> >> +               clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
> >> +       } else if (bus_num >= 3) {
> >> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
> >> +                            SCU_FUN_PIN_I2C(bus_num));
> >> +       /* In earlier versions of the SoC these pins are always assigned to
> >> +        * respective I2C buses and require no configuration.
> >> +        */
> >> +#ifdef AST_SOC_G5
> >> +       } else if (bus_num == 1) {
> >> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> >> +                            SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
> >> +       } else if (bus_num == 2) {
> >> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
> >> +                            SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
> >> +#endif
> >> +       }
> >> +}
> >> --
> >> 2.8.0.rc3.226.g39d4020
> >>
> >
> > Regards,
> > Simon




-- 
Maxim Sloyko
