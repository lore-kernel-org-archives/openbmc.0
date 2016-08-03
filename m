Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s43Px22sszDqQt
 for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2016 16:41:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=C3RmQ1H7; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id m60so8587118uam.3
 for <openbmc@lists.ozlabs.org>; Tue, 02 Aug 2016 23:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=e/vWVCoRkug+K5irQgK5d7Ca7ea+NGHfPfQYahZjtVQ=;
 b=C3RmQ1H7kfORyxGyCNm+fu/moh2GOWHd9tGPyv4ZtswZTdGo9eozlCES6u01Lm99Qs
 ch/X6UrnpdpZbHB31BU7bJ0jpNGaHpvGuaktab1jyfSLBqhH4n89cgzr3ZzUhRyBB2fz
 NIB0RZ/x1KqgQb79Mn2HuSvaIN3MIyxNp6QlNlHksC3UQJaXIRvCHL2R+pdI4r682wbC
 Ffes8X3lmSPt3cJPQrYvZ/6azWVKVH2zaOg6LSWand9EbzPXOi/dUPWOBchdYCS96BwH
 v/VdbZBkgr3imBYOA0hTGL6cwIK16kUhCA5OXRd/LcESFNmlwOESOKzomnS00sWp2mge
 111w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=e/vWVCoRkug+K5irQgK5d7Ca7ea+NGHfPfQYahZjtVQ=;
 b=k/04SzIipd9gWKZMGCtPobfPJP7cQum/8rHgwurGqStZGOXympxycfC2mRrPwdTm12
 hA7j66Ba7Mq8Q5nfs17AEOEAfAXr7ZS4u7SIAPoHvu7XX4S/e1ltnQNjkzE68a3vGhke
 lMmOE+jthxYcjeny6pHWuvXB8ZH85pwJoXOQihsaVXPQO+2WJUrILu0CpfmhUZ5qVIjs
 njOBR4zUOVQRbDqm1/lCMbkib2Z22jIumRpS85KO7/cCqY9W52DOYcG+QYgWnr0A3TIO
 4sc+6Ih9ZhMsT+gVg8P3rg3poifc6Pf+pfjSlPJG2GfTgYqMppQZNT3GwMciSWDn/fsd
 7sVw==
X-Gm-Message-State: AEkoousDvnY1wHHecIyqs9pF3gWGFFmhbxshO9352F8AtxsD+aeh4pCIOkFl83rDel2tJvMVIqG0FjrcWCNqlg==
X-Received: by 10.159.35.130 with SMTP id 2mr33554139uao.44.1470206498925;
 Tue, 02 Aug 2016 23:41:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 2 Aug 2016 23:41:18 -0700 (PDT)
In-Reply-To: <1470094270-37885-1-git-send-email-xow@google.com>
References: <1470094270-37885-1-git-send-email-xow@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Aug 2016 16:11:18 +0930
X-Google-Sender-Auth: U6rE9myg8hUbHwIOP4SDdUebpZk
Message-ID: <CACPK8Xe=9VXs6awQsmUSireEk4ZJu8XbrMAGDJKfJhG3VsY0GA@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: Add EEPROM
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 03 Aug 2016 06:41:41 -0000

On Tue, Aug 2, 2016 at 9:01 AM, Xo Wang <xow@google.com> wrote:
> Uncomment existing EEPROM device (U24 on EVB), move to correct bus, set
> right-aligned 7-bit slave address, and add write buffer size.
>
> Tested: hexdump -C /sys/bus/i2c/devices/3-0050/eeprom
> 00000000  aa aa aa aa aa aa aa aa  aa aa aa aa aa aa aa aa  |................|
> *
> 00000200
> (CONFIG_EEPROM_AT24=y)
>
> Change-Id: I1e9df8e3aee5f0257c90e045b35e19b615615447
> Signed-off-by: Xo Wang <xow@google.com>

Thanks Xo for the patch.

I will push out a dev-4.7 tree real soon with this change.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> index 79d2005..795dcb7 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -57,6 +57,12 @@
>
>  &i2c3 {
>         status = "okay";
> +
> +       eeprom@50 {
> +               compatible = "atmel,24c04";
> +               reg = <0x50>;
> +               pagesize = <16>;
> +       };
>  };
>
>  &i2c4 {
> @@ -65,11 +71,6 @@
>
>  &i2c5 {
>         status = "okay";
> -
> -//     eeprom@50 {
> -//             compatible = "atmel,24c08";
> -//             reg = <0xa0>;
> -//     };
>  };
>
>  &i2c6 {
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
