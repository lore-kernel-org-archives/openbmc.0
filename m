Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jMARU0/d"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="J3lI3dVM"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400gdg4smtzDrSy
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 14:41:59 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id d206so13936137qkb.3
 for <openbmc@lists.ozlabs.org>; Mon, 12 Mar 2018 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WhqHJrtAph3uJZHjR7V9T4Qx9vLoabUFulq8Ck09FcY=;
 b=jMARU0/dMeEWebnXY7jw1zWRNW/2D4V3kJVD9iWgv5VzSr4DTU4MybMTGcDQghEcMm
 INjpD7faNUByaKxE40H8pUwIAYYtDdiJfB45qXwICLPC0UNKTGDEiT74YWK3TINdt3EF
 GfnEMooAS2JY4U7S6BxciV9sGA1b56DsgjrQy3Ag0nDqbXdkSPnQYfpfVVKM4igebaYX
 N7igDyf6Jv3MhjCL54OQJBUVyfVyUPaiNVnEFiUOV3OUhsymGhAlsW7jTfHh8l6DPwU8
 TSZz7km3sIPQNoMrFRKWuW0VFxVY8J4O4LVPHX/t+k6kkTNlwE+h7U50FAGHw3FTEI3g
 2LPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WhqHJrtAph3uJZHjR7V9T4Qx9vLoabUFulq8Ck09FcY=;
 b=J3lI3dVMgBm8FmIe5ZLoNbTYoQEL7ekWmHXRBr7D4/TeclJZredlj79MfsJl8OR08l
 Dr60JIj8qxkk0an/q7E9bg8StDKbGxbSd+3D+E1GtbVSbb56b2/EQnn/toHQOpO1sjaw
 m0C7fekQ43mImFHMZDMCmycPHbZ0DYo98OGsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WhqHJrtAph3uJZHjR7V9T4Qx9vLoabUFulq8Ck09FcY=;
 b=H5yqhJ0IEiYJo0tuLaxPxGUXAF1E1IM08ZVu/AVHFm4b16b4fWfmaJVHHN9S/xdbnP
 EbP6E4Y3cSHf/qyjV7Ik5piuCKfPho5++nuRA+Wg1VyzbSp9NsUv5htgX3OLOgP12D6n
 kp1Dx0wKg+YbUvvlwx/V6L2GpdByS1WkBzonyulj2i/aSm3Kb1YlIEk0tsoExZX2ynB2
 g/+SkCRN/EMeHP4pATefmawNqbBIwnTVlflxGyB+dNbg4nnBKywI/++wJWYcG7S8Msmg
 SWkOH+QAB61gTdL20/wp+TX8hCiXqghcIZv5n2Iy92DptwLfOeUiy+yW/y/YqnHrEMJW
 to0w==
X-Gm-Message-State: AElRT7G2R8TDbeAQXBzz9f4uowk4L9W+2/U26AMGVt197M6yBzAYV/pN
 uu+b5/wYYp0zVURpEebr4qIZ4kaCCWnRBYyUWnZW/w==
X-Google-Smtp-Source: AG47ELtZy95m0yyJSMRIa0fFeIbicpwRRSYmWeuBruQcuq31hm00YTdLun5br1/Hm+MkC4B4ZriRqGxf7oBNQcXYb0I=
X-Received: by 10.55.76.206 with SMTP id z197mr14304130qka.143.1520912516660; 
 Mon, 12 Mar 2018 20:41:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 12 Mar 2018 20:41:36 -0700 (PDT)
In-Reply-To: <1520632980-26812-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1520632980-26812-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1520632980-26812-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Mar 2018 14:11:36 +1030
X-Google-Sender-Auth: 4n4nLP4BBFw8cKvVpM-jCtYGv00
Message-ID: <CACPK8XdeXw=TS5UYtYRFbhRbkOb5eXegDO+Mts0mHuyd9-mHrg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 3/3] ARM: dts: aspeed: witherspoon: set
 alternate boot
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2018 03:42:00 -0000

On Sat, Mar 10, 2018 at 8:33 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> Set watchdog 2 to boot from the alternate flash chip when the watchdog
> timer expires and the system is reset. This enables "brick protection."
>
> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 5f8dbffa..e8e4d30 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -633,6 +633,10 @@
>         pinctrl-0 = <&pinctrl_wdtrst1_default>;
>  };
>
> +&wdt2 {
> +       aspeed,alt-boot;

When you enable this, how does the machine tell the difference between
a normal reboot (which uses the watchdog) and a real expired watchdog?

Cheers,

Joel
