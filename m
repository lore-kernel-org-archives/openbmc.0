Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t6l020tStzDvNY
 for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2016 17:32:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wWzlmsho; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id v84so4008819oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 30 Oct 2016 23:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=12Y0ZFmlORJKku3p2bYCopGoPpKrQAec7m2BuB0LoHI=;
 b=wWzlmshoEVrmJ/h+MIVP63LB7BGwl+xrFXT8MmP+GDBuyJ7hc2skuYgOjPDMxwT2lY
 EZPXBUM6hHEd5RZtTQrt4k7EhiKRXyTKAZbuRUN5IT9uit9uRqgdktukFhrS+EjXtDk1
 erDflZT+zozGGY2w3IYfkLuaO9TVUPYhv5nn7qSKKYeKRwT7GlDu3pAE3sdTf1fnwNAN
 zL6u2SDr+z3rwaK1asWCm73azVqwcoe4miMbkPLsg5ML+UFQbbPAbpOgzYfS/4Ay/c3A
 h87FjFQ8H7Lfl1rwGuYZfVY7zId0StJrKAGZ/drZ6aTqZPXE7Js+BECVDgbDLcTF8adz
 E9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=12Y0ZFmlORJKku3p2bYCopGoPpKrQAec7m2BuB0LoHI=;
 b=NC80qeRjoptZSP3yCW0r3/zTPrn41D1d4jWK1Abx+2wnXDhoH+eBmCM1c2584bwuhS
 j6vvn42WZmvnEvV2qFt0uFZFelcc7cE+PBN3uqcw8lCjpLDdA57ekzDD4Q5c0wNTUY+6
 ovYhb9v3WCPPfO9w4M6ywNTBwM+4KPGuJQ1DBXOLLb4kuZJVbtyRLVqkFD1YEgQLqCgm
 mfWql0cvEdoUwebYxIyPSDJ8Bxf/nAISpFt5T6HC9QefHqaDrHCxN6XcT5D04D3verzk
 Kni77B0EkQ9sYvFjcy4Ik75Zj+BbiUmSxecZa7nvyuq3yhmx6Wnr/EVpvmiHfXP9eF3y
 BSOA==
X-Gm-Message-State: ABUngveE88Qey+NjYmo0MXbQTfv5Juy4b7bUSTFVXlExQuImKS7aIoA9l6i3g6ohjRY8GQ5kjf/RP/INb5c/sw==
X-Received: by 10.202.106.198 with SMTP id f189mr25677970oic.109.1477895536306; 
 Sun, 30 Oct 2016 23:32:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Sun, 30 Oct 2016 23:31:55 -0700 (PDT)
In-Reply-To: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
References: <1477894297-12249-1-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Oct 2016 17:01:55 +1030
X-Google-Sender-Auth: Rm6OsPJN54dzao-ECr2tr8KBpYA
Message-ID: <CACPK8XeqaxnSfeyYXy1YC03Yej+2dvPzoSqaaNd=-66n9ZEWcw@mail.gmail.com>
Subject: Re: [PATCH linux] pinctrl-aspeed-g5: Never set SCU90[6]
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 31 Oct 2016 06:32:18 -0000

Hi Andrew,

Thanks for finding a fix so quickly.

On Mon, Oct 31, 2016 at 4:41 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The description of SCU90[6] from the datasheet: 'Reserved, must keep at
> value =E2=80=9D0=E2=80=9D'.
>
> Switch from the bit-flipping macro to explicitly configuring
> .enable =3D .disable =3D 0.
>
> If a pin depending on SCU90[6] is requested for GPIO, the export will
> succeed but changes to the GPIO's value fail to stick. With the fix the
> value can be toggled as expected. The patch has been tested on an
> AST2500 EVB.

I couldn't follow what the issue was and how you fixed it, so I've
rewritten it in laymans terms. Let me know what you think:

If a pin depending on bit 6 in SCU90 is requested for GPIO, the export
will succeed but changes to the GPIO's value will not be accepted by
the hardware. This is because pinmux has misconfigured the SCU by
writing 1 to the reserved bit.

The description of SCU90[6] from the datasheet is 'Reserved, must keep
at value =E2=80=9D0=E2=80=9D'. The fix is to switch pinmux from the bit-fli=
pping macro
to explicitly configuring the .enable and .disable values to zero.

The patch has been tested on an AST2500 EVB.

Cheers,

Joel

>
> Reported-by: Uma Yadlapati <yadlapat@us.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl=
/aspeed/pinctrl-aspeed-g5.c
> index 481e836d12e5..9a3139c13ffc 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
> @@ -26,7 +26,7 @@
>
>  #define ASPEED_G5_NR_PINS 232
>
> -#define COND1          SIG_DESC_BIT(SCU90, 6, 0)
> +#define COND1          { SCU90, BIT(6), 0, 0 }
>  #define COND2          { SCU94, GENMASK(1, 0), 0, 0 }
>
>  #define LHCR0          SIG_DESC_TO_REG(ASPEED_IP_LPC, 0xA0)
> --
> 2.7.4
>
