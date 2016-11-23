Return-Path: <sjg@google.com>
Received: from mail-oi0-x22b.google.com (mail-oi0-x22b.google.com
 [IPv6:2607:f8b0:4003:c06::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tP72l0SFgzDwDb
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 03:24:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="F7Cx81IP"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="dd1QnEIP";
 dkim-atps=neutral
Received: by mail-oi0-x22b.google.com with SMTP id w63so20688676oiw.0
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u2G4f41D8YYs8UYs2VEYIQn5ZMOcI11FJZ/fDTXM3YU=;
 b=F7Cx81IPGcVsOnnbVV8/rwGQM5/d3Wpy9PgbIcDVR3LW/cnJ9o7qelB6T3tyhVuwhQ
 Y15Uanm0Drz0jhBkCRf3pw+O6o6e/So/y6oDCAG6Iv9w801vPP7Qn1PYrQa+9D2Zv+Rm
 p2ZqELwjl/T3h/gXLDWRUeLsWpD47BifkwkKOisyS8BB0+I3d29po85PIgfxFsZi/10n
 z/Vh8svXjCUCK/dG8OY0n9G+yb7E6Gs4FAt3uqlyA0Gpx8OAAx4uwF2RTB4GQjCpVuvu
 zbrMLNPQwb6LSGNDui5435PH7K9tkEB2d83Cg/IexiSeGzo4/Pf9zkWNVitTHhGprhYM
 6+JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=u2G4f41D8YYs8UYs2VEYIQn5ZMOcI11FJZ/fDTXM3YU=;
 b=dd1QnEIPdnaXjX/YrqmgBaCv/YdE2ZrYOHRPWeIMhDnBPJFSiqaBGHZVqFUMValx+6
 Kn1olp/JyevF1xoJDvlSWh0FGyfhQZhjKjKZDtzMrZ3XQLR+eA/yBII3dG7DTbzCXYyC
 hvJ51nscfad5LikTAX6PRLzza1bs6/TL5rey4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=u2G4f41D8YYs8UYs2VEYIQn5ZMOcI11FJZ/fDTXM3YU=;
 b=I9vxUVPQ/oeXYdMmLUe6Uwg646ETrzqYgd1a53Dl3X9fjs7WROxnEaXeIekdlxopQq
 HlxYuS11FlioDv3vgygfuqDF/6IJywy8ZltWOPiiHNuEYZi8PrOl3nRUwPZEgaJsSX8x
 Qu8hnGmBk35ux/MW3LyKOYzph0VbtS6Aty87U5FnqsC8H+otmI1/Pm855HKtU2uYN9xO
 4tv1V4Q82p2twHxmwagXlkRipD1fMCC2dBhjpf6YS7rNk7rLxechEsGY2sIWOGzwwwpm
 FqdiNzZs2y43r7aPLge1rZ8jh6+Gbe6WLrJsf9VAwCyA3Jjmudz4YYupXyAC3ZYHdJZA
 Rk3g==
X-Gm-Message-State: AKaTC0300yx9F7wsuBUWnupvlF6YscQszSBbzCzODwqnh51TPehbaEStuBd3gsBcvMWCQcYh9xRVzXh+SD6ZiMt7
X-Received: by 10.202.104.80 with SMTP id d77mr1907034oic.107.1479918269077;
 Wed, 23 Nov 2016 08:24:29 -0800 (PST)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.182.78.1 with HTTP; Wed, 23 Nov 2016 08:24:08 -0800 (PST)
In-Reply-To: <CAPnjgZ1zD58OkusQjFCgJJDu5Ge1JNfrrS+-axYJmjijnUkxBw@mail.gmail.com>
References: <1479858976-139210-1-git-send-email-maxims@google.com>
 <1479858976-139210-5-git-send-email-maxims@google.com>
 <CAPnjgZ1zD58OkusQjFCgJJDu5Ge1JNfrrS+-axYJmjijnUkxBw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 23 Nov 2016 09:24:08 -0700
X-Google-Sender-Auth: x1UCbL2bPZh9IRVHNuUacLuHzOs
Message-ID: <CAPnjgZ3bcJmNNAWSkgkOgQtLNMm-H1QQSqMK6_dcNdiqSgqj=w@mail.gmail.com>
Subject: Re: [PATCH u-boot 4/5] aspeed: Added function to configure pins for
 I2C devices.
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, openbmc@lists.ozlabs.org
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
X-List-Received-Date: Wed, 23 Nov 2016 16:24:31 -0000

[resend from correct address]

On 23 November 2016 at 09:13, Simon Glass <sjg@google.com> wrote:
> Hi Maxim,
>
> On 22 November 2016 at 16:56,  <maxims@google.com> wrote:
>> From: Maxim Sloyko <maxims@google.com>
>>
>> In the absence of pinmux driver, I2C driver will be
>> configuring pins directly.
>
> Commit subject s/Added/Add/
>
> and please remove the '.' at the end.
>
>>
>> Signed-off-by: Maxim Sloyko <maxims@google.com>
>> ---
>>  arch/arm/include/asm/arch-aspeed/ast_scu.h |  5 +++++
>>  arch/arm/mach-aspeed/ast-scu.c             | 28 ++++++++++++++++++++++++++++
>>  2 files changed, 33 insertions(+)
>>
>> diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
>> index eb5aaa2..80ebd6f 100644
>> --- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
>> +++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
>> @@ -46,4 +46,9 @@ extern void ast_scu_init_eth(u8 num);
>>  extern void ast_scu_multi_func_eth(u8 num);
>>  extern void ast_scu_multi_func_romcs(u8 num);
>>
>> +/* Enable I2C controller and pins for a particular device.
>> + * Device numbering starts at 1
>> + */
>> +extern void ast_scu_enable_i2c(u8 num);
>
> I suspect this should be done as a pinctrl driver. See for
> drivers/pinctrl for examples.
>
>> +
>>  #endif
>> diff --git a/arch/arm/mach-aspeed/ast-scu.c b/arch/arm/mach-aspeed/ast-scu.c
>> index e00dbe2..b5aa8bf 100644
>> --- a/arch/arm/mach-aspeed/ast-scu.c
>> +++ b/arch/arm/mach-aspeed/ast-scu.c
>> @@ -507,3 +507,31 @@ void ast_scu_get_who_init_dram(void)
>>                 break;
>>         }
>>  }
>> +
>> +void ast_scu_enable_i2c(u8 bus_num)
>> +{
>> +       if (bus_num > SCU_I2C_MAX_BUS_NUM) {
>> +               debug("%s: bus_num is out of range, must be [%d - %d]\n",
>> +                     __func__, SCU_I2C_MIN_BUS_NUM, SCU_I2C_MAX_BUS_NUM);
>> +               return;
>> +       }
>> +
>> +       if (bus_num == 0) {
>> +               /* Enable I2C Controllers */
>> +               clrbits_le32(AST_SCU_BASE + AST_SCU_RESET, SCU_RESET_I2C);
>> +       } else if (bus_num >= 3) {
>> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL5,
>> +                            SCU_FUN_PIN_I2C(bus_num));
>> +       /* In earlier versions of the SoC these pins are always assigned to
>> +        * respective I2C buses and require no configuration.
>> +        */
>> +#ifdef AST_SOC_G5
>> +       } else if (bus_num == 1) {
>> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
>> +                            SCU_FUN_PIN_SDA1 | SCU_FUN_PIN_SCL1);
>> +       } else if (bus_num == 2) {
>> +               setbits_le32(AST_SCU_BASE + AST_SCU_FUN_PIN_CTRL8,
>> +                            SCU_FUN_PIN_SDA2 | SCU_FUN_PIN_SCL2);
>> +#endif
>> +       }
>> +}
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>
> Regards,
> Simon
