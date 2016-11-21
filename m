Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCg3l8pzDvj4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c73IwSwu"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id m75so2041237oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=pS4k/ciRbnMObX21cJXgHGqxEcwszTgNEmUVn5FlRdo=;
 b=c73IwSwu3PPAesjdVlso+KGZHIQPjFafvcYxuCi+lurY6ejd/K+QGHPb06nGeZcgvp
 dDqHiFJRA5ZGa4Vwp8gVB08U/lMf+XZVaYfoy4iVVbru5OZWPIlq5IDd+T6Orosl+8j5
 K4W4FwS4sVZCOmE3nzzk9kvKgz6S6zmE5Fq4JHQHASVcLbFrY+kB7nJlwQVbcD0rkxOY
 IxGM1Y3pf5CryPjIH0ASzdJ3fafSxG7mswaDbTQk7EU040IR0JtSqqPNINAQNrOArazz
 BwRIyxcDpWDSTZ3gCJ8isw2oRPUeTCnJEzXcIX+QGQQomisHSQ6yA7Z8SOPvpSeaXgAG
 OF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=pS4k/ciRbnMObX21cJXgHGqxEcwszTgNEmUVn5FlRdo=;
 b=dajCvMCcZn1po9Xj+3TZC3VgmUg93NhzuQ6X8a885P0++NgsOblDmLAGodMRMAH5mZ
 il1N6QdudCJQ3kuWdUof7/yVpuiMEF7wJu9wpJYno/liQtjHl2W3Qas7m6wdXeVTRlxF
 oIPQFTTXJai8buJV1172D9MK5i1WHkHahux42QyHBiIBj2CP3MKqbVtkv5mhxwW6dTyu
 U4EyQVU1VmJbYk7Vtezc7DjsJFHkLbRnqt7VJlDbZKGSeM+QmOPSoVFScyUj2BC/p7fA
 dcPJlcso6lEIrQZxmBDxTZvHrpullCiSAbAebmsULzAIQt6ZfhM1+m3jH0s4dhDzxT1T
 q2sw==
X-Gm-Message-State: AKaTC01jOOOISc+Ka+YzIGMXvWKOAYtf5zQxUtXxNeMv88C80ViRw+Ludw9y9OSI1ICOD6dE8vWggYOEv78Tog==
X-Received: by 10.157.27.65 with SMTP id l59mr7449803otl.196.1479713229815;
 Sun, 20 Nov 2016 23:27:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:49 -0800 (PST)
In-Reply-To: <1479478938-13267-14-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-14-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:49 +1030
X-Google-Sender-Auth: wFFiS5WkfiGMmvEsbvwyW22OhBs
Message-ID: <CACPK8Xf8WHf37ZJoNeG_p8-H9BAf8KD6nYkt=S9158axxO-rHw@mail.gmail.com>
Subject: Re: [PATCH qemu 13/38] aspeed/smc: introduce a
 aspeed_smc_flash_update_cs() helper
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:12 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> aspeed_smc_update_cs() was uselessly looping on all CS to update their
> status.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 91cdc0bf1ac7..1c6c5089f265 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -408,14 +408,10 @@ static const MemoryRegionOps aspeed_smc_flash_ops =
=3D {
>      },
>  };
>
> -static void aspeed_smc_update_cs(const AspeedSMCState *s)
> +static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)

This hunk should have been in patch 12 I think.

>  {
> -    int i;
> -
> -    for (i =3D 0; i < s->num_cs; ++i) {
> -        qemu_set_irq(s->cs_lines[i],
> -                     aspeed_smc_is_ce_stop_active(&s->flashes[i]));
> -    }
> +    AspeedSMCState *s =3D fl->controller;
> +    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>  }
