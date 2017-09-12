Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b+U/SwlU"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xrxhs5jD0zDqyG
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 17:47:25 +1000 (AEST)
Received: by mail-lf0-x241.google.com with SMTP id h80so4966165lfe.1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Sep 2017 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=FzuCjnAFontul5iFpZ2Ws2SaO2HeT8f/UJNZyqSE7U8=;
 b=b+U/SwlU4qCd/HU4wO1Ka7eDWPTqy02fJwydV5fIqiut/1MJ0uiGu3+cnPVVG5Mu8b
 dRvl5+YQkornGS/RLz++40Cxz3wc53Wu+MvrvlmOgarkhA1hLJhTVqA+5QdLKB+d6/3D
 7JKV66wRlUgq5Z3TeDa5xVSsy9TyqFUNfnhuTWFzuaow+XhXxWyFIOADoklzF0muYfCk
 ifj9Nm67yP3kO+XfchwCH+j/3sUIo6Z+8x8aZ5VBJS0gV/tcIwYK9DClLQ/dX7ISrIl5
 DDLit+FKDy1WpatcmV/6SZ11I0gDuQvm8v5yoNSAjBDmgx5iVlt6b2FtACQGh8S+jn2B
 TdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=FzuCjnAFontul5iFpZ2Ws2SaO2HeT8f/UJNZyqSE7U8=;
 b=e33CwZZA5KJtv3XT1C33iU/o4ld3xM8nZnnbs/cuDKMdIi0fij1lQh7i28fxMkGNtt
 SsAO6dKH+Kxr8BkSoygBJpKnN8egKpySE6DhozumOY22YX+Hzo2FLd1ZGMZThxBH0DiA
 8mmj+VfvJmXAdfqbD+P6r7Rtnu/xurZL5b8d2XAN86WKt7rRW3l84e4n79UZ4wjvxRe8
 /tBoJTjPNrxegmeROpTdZvdAOUPpAVoklps0OT8WU1fVp/DgdtWyK5p51rddJx2LRICh
 6OAUz/3SdNQNiin2pQV42HDDMMEYx43RXTudUZhcETs7CEJh7Ho+sQogSZhFPi2HbtJV
 54iQ==
X-Gm-Message-State: AHPjjUgHGJnztbv8RYjFeR/G0Hd2yleJmIt4x8eb4yunCdoV986iyX/L
 ALn7kK03mj2C1V4J6Q8QIJaHLZLVVg==
X-Google-Smtp-Source: AOwi7QBDI/r1Iovg5WK90UsKEmdM8xL7MfNDoBkoJ+2//Z2ax/C17t1/ia0yKe/AV5RQTOiLiBi8B0R0fu7jBZG4YFE=
X-Received: by 10.25.15.158 with SMTP id 30mr5191553lfp.123.1505202441637;
 Tue, 12 Sep 2017 00:47:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 12 Sep 2017 00:47:01 -0700 (PDT)
In-Reply-To: <20170908215728.115818-2-xow@google.com>
References: <20170908215728.115818-2-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Sep 2017 17:47:01 +1000
X-Google-Sender-Auth: 1RWD9C5EtAiygHUVzIa3kgELvqU
Message-ID: <CACPK8XfDQuabtVxjh7BoiE-1xSCAG1C8ZUcNho=VVEbepMKwZw@mail.gmail.com>
Subject: Re: [linux,
 1/5] ARM: dts: aspeed: zaius: Use LM5066I driver for hotswap
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 12 Sep 2017 07:47:26 -0000

Hi Xo,

On Sat, Sep 9, 2017 at 7:57 AM, Xo Wang <xow@google.com> wrote:
> Not removing the "ti,lm5066" line because the LM5066I support is only in
> yet-to-be-released 4.13-rc4.

This commit message is a bit out of date. I dropped the
yet-to-be-released bit and applied it.

 > Not removing the "ti,lm5066" line because the LM5066I support is not
 > present in pre 4.13-rc4 kernels.

I figured there's no harm in keeping the backwards compatible string
there for now; if you want to drop it please send a follow up patch.

I cherry picked in the upstream driver changes to dev-4.10 too:

 5783ec2e5c10 hwmon: (pmbus/lm25066) Add support for TI LM5066I
 ee983171d49b hwmon: (pmbus/lm25066) Offset coefficient depends on CL

Cheers,

Joel



>
> Signed-off-by: Xo Wang <xow@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e4e9519cd087..1c39452ffebd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -282,7 +282,10 @@
>                         #size-cells = <0>;
>
>                         hotswap@10 {
> -                               compatible = "ti,lm5066";
> +                               /* Device is LM5066I so prefer that driver
> +                                * support if available
> +                                */
> +                               compatible = "ti,lm5066i", "ti,lm5066";
>                                 reg = <0x10>;
>                         };
>                 };
