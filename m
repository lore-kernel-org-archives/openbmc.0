Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rwKK3369RzDqVc
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jul 2016 02:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=jnP1Wyva; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id q11so4006830qtb.2
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2016 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Uf6FSgmM8N+Lr3RzrVuC0m87WFY53jg7h/vb4ua23nA=;
 b=jnP1WyvaToXkYwAyhqJk7GXqFrw2xUvb7uHfNWRDOlzYIIrkPykMKQO75He3+c0Cwa
 zsTrooOseP9DdSfO+sEltd5lSVYoAgF6KowWfZPD2Dhl5XBSF1vCnol7CK0ES/vmUMyW
 fSMjzFa6wzP4XHZC1O8P47kyshZt0DjC4dO8fv5qjWoWIIqwcn+0PtRWi0sZkMjPbO/+
 +2FmqEy1ibdqHMfO7XJMBYxjVKTwkRsUAHjCWa4KvkJ80zI+I2jNq6c4Blq1TOrFqJP0
 22MQUJydZAzqKj2sVY4ZJHPSsrCicW8acisecoLc/k8GK8yEqcryHQOoeycLqB1RNvet
 +Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Uf6FSgmM8N+Lr3RzrVuC0m87WFY53jg7h/vb4ua23nA=;
 b=YncqxDsRsx8Sv7dOF/J7cPlG3GwtCcNVkNy/qKPic1vUtSbsaoFvSvWlsi9rSqa5Y9
 i0kOzfGIGgnrXxiOAovNYhL1494xxnCD+XocryMyNToBc/1lSb1AR+zF7+5qvVD8UchY
 buH1XP9KmII+q/V30V/IWWiYhuAwkYLG/zMlOqloI1SOm758QcErp3L+c0CXXmBcd+id
 qxKs6GMMwwDpQ45WI+peF0Kmk40hBez3O5AVNUrlJMfKUI6lk0VZzlSqr3fCbyjnzsBl
 IjkHADIoEoJlD+ZzL8srTz7Rt6Zjgp6waQ4E8ajpVVVPZDM3ZkHnFCT642uN5fTgoXc0
 gsNQ==
X-Gm-Message-State: ALyK8tI+HYnAO0+bgoAVMPPLd+9eK/l5U/9RVe41dB4TDc2etK6NeHoTHY7BqUU2CX1ZUucGi/lIJK5F5VamFQ==
X-Received: by 10.200.48.42 with SMTP id f39mr66799309qte.81.1469119236963;
 Thu, 21 Jul 2016 09:40:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.141 with HTTP; Thu, 21 Jul 2016 09:40:17 -0700 (PDT)
In-Reply-To: <20160721110110.6902-2-openbmc-patches@stwcx.xyz>
References: <20160721110110.6902-1-openbmc-patches@stwcx.xyz>
 <20160721110110.6902-2-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Jul 2016 02:10:17 +0930
X-Google-Sender-Auth: 0xTuUMiHSIPDLGFKaBB36l-vNSk
Message-ID: <CACPK8XfP-VJi_xbnrJ8urCC-C67aOkzWOUKQd5kO43GQrCgQuA@mail.gmail.com>
Subject: Re: [PATCH linux] Fix the incorrect debounce setting on power button
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Thu, 21 Jul 2016 16:40:39 -0000

Hello,

On Thu, Jul 21, 2016 at 8:31 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: johnhcwang <hsienchiang@gmail.com>
>
> PCLK divider selection is decided by SCU08[25:23] and the value is 011b
> on Barreleye.
> That means PCLK should be H-PLL/8=384MHz/8=48MHz, but the current
> debounce timer value was computed by 24MHz.
> So the correct value should be 20ms*48000000/1000=EA600h

Thanks for the patch. I noticed this is against our dev-4.4 tree,
which is no longer maintained.

Given you're looking at barreleye, I assume you are using the v1.0
release of OpenBMC?

Patrick, if I do a new dev-4.4 tag with this fix, would it be queued
up for a v1.0.x release?

Cheers,

Joel

> Signed-off-by: johnhcwang <hsienchiang@gmail.com>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 11d8a61..fadbbb6 100755
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -159,9 +159,9 @@ static void __init do_barreleye_setup(void)
>         writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x48));
>         writel(0x00000001, AST_IO(AST_BASE_GPIO | 0x4C));
>
> -       /* Set debounce timer to 480000 cycles, with a pclk of 24MHz,
> +       /* Set debounce timer to 480000 cycles, with a pclk of 48MHz,
>          * corresponds to 20 ms. This time was found by experimentation */
> -       writel(0x00075300, AST_IO(AST_BASE_GPIO | 0x58));
> +       writel(0x000EA600, AST_IO(AST_BASE_GPIO | 0x58));
>  }
>
>  static void __init do_palmetto_setup(void)
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
