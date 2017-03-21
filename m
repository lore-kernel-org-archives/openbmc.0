Return-Path: <sjg@google.com>
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnpkR250fzDq7Z
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 10:22:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Pu2Gyolm"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="ej1Z7bmh";
 dkim-atps=neutral
Received: by mail-vk0-x22c.google.com with SMTP id d188so110264205vka.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 16:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=trYblXr3wLdREILcOOvIsUX61n4BwcPe9om1T25u2jM=;
 b=Pu2GyolmLTxnMn7Y2AGUKO11/9zkVERGIPVzDPIk/73uTuXmmC+Ick+OSrl8HHvRll
 yXf+b8O2RRuKsuhwP6GEPViVdemgyQjO0QIhywkkiy32o/hlWhqvmiiwMPusdh6UhQOc
 prkXd6Ah/T7xkGy5XLplNmRPZWFbRr/krIkddQIaLZhDJn2I5YRriIKGtQJ3ibSG6Zfi
 L2lPkmvdA2Z2KOSh2nVq5skXY02OW3cxB2ztlRY3yldEetHWraNTS2ge1/cvY4glBmlj
 FXm1Xr3fqEfVeIbYAZIx7+neILQo8j3x4vvgPoMtaGlHVMPTXPfZW8QJQbuGloTLx6NA
 eLGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=trYblXr3wLdREILcOOvIsUX61n4BwcPe9om1T25u2jM=;
 b=ej1Z7bmhCm4ayJrfat13HGakaWZY6zXifSasPS6yPuFuD3+EGCAXZ28uKqBhQX0/Uy
 B/tH5Se6yJDAyiLHG2Aj5s1HhoNPTT+buoX1iJcQZ65oWiwEkUptzXhSgwHXnb1gT075
 /axdP7hk4BmNHxf8QyO8q3BiPiqZoRsL4KBak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=trYblXr3wLdREILcOOvIsUX61n4BwcPe9om1T25u2jM=;
 b=GsbvyzsPR7xfiRTQd8uFxpxBtUmmGeA/dkN0UK5KZpRyI9nhmxkjUblZlWGkSCtaAS
 glwwdIFAacFcLbCttnduV3M+EURAmGOwiRvWkSvHH1rB6ZpmySk+JiCDEymV9HtomiK6
 IjHDbZhVyxrqzIc2wWvaojudM6adAdxsM4vT7Dms7uO7ROAHcfyNIz1T02Utnb637juJ
 TqJhG+cTnBoVdksD3l48+9OeyT1vm19uuKvj1npxVEnZctF492RZx0sDwK1WbQiZhIj/
 NZQC+8D7W84WnNQ92bdTWRQkm6h9ncU19jCnQPYeRD+fH7Qip3thlyd9cmlDKkPiUmpp
 2m8Q==
X-Gm-Message-State: AFeK/H0Keo5wSPYgeM60yMY6tvEb7z1yY3QkysMaHXHT/TeSeeFy0nXh+8Bs2+/YAlOU9Oq3R8F1tMCBCay5SvyI
X-Received: by 10.31.96.69 with SMTP id u66mr12801508vkb.80.1490138540471;
 Tue, 21 Mar 2017 16:22:20 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.159.35.108 with HTTP; Tue, 21 Mar 2017 16:21:59 -0700 (PDT)
In-Reply-To: <20170316213624.140344-2-maxims@google.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-2-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Mar 2017 17:21:59 -0600
X-Google-Sender-Auth: 0vauCUiq7veq4oMLYzfE7ajN47g
Message-ID: <CAPnjgZ1Skf61rwb93yKB7r3W93+MqqKQP=ukErAAwpATMStTiQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] aspeed: Update ast2500 Device Tree
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Albert Aribaud <albert.u.boot@aribaud.net>
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
X-List-Received-Date: Tue, 21 Mar 2017 23:22:24 -0000

Hi Maxim,

On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> Pull in the Device Tree for ast2500 from the mainline Linux kernel
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
>  arch/arm/dts/ast2500.dtsi | 881 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 880 insertions(+), 1 deletion(-)
>

Reviewed-by: Simon Glass <sjg@chromium.org>

It's not a bad idea to mention the Llinux version or commit your
pulled this from.

Regards,
Simon
