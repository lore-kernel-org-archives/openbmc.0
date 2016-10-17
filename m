Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy5Xp4ytXzDsxn
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 15:57:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mbhjnjSs; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 2so7330173vkb.1
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 21:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Feh8s6zWoMgoXjgBEjLmhCOhuu7H8ya2dUAr1Q7etWU=;
 b=mbhjnjSsTr8+3revUl5WlDpG9VQ14k8Jer5rpDBqQZtKaLKypUin6Ue63KOrSrSIDi
 CyBZuqOfuaO+ufgyoGZQ0Iwp08vs/vDyCJjCgCUAr0zYocDhaVZv2dDGN0CY9a+FmLsq
 P5x8KtJL2+IRgt+C9qE5A9VufV1qcWHeSl9RIY3BEa0LmEkTA9DkB6/+J49O9m7XT8S3
 3Ey16fJ3/nWV4C8qM3f/TJwN3fNgGCL8wwADvv2A36rxdO1a+71bz2+aXFqNlkF0srmc
 QkL8QE+o4YdkvqKKJHUwLXms64T4pKpkrUIteM5mlYfluk37E1O3avSYghSMRJkJvP0g
 lXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Feh8s6zWoMgoXjgBEjLmhCOhuu7H8ya2dUAr1Q7etWU=;
 b=P5QxCnd1mC0HlYvVogZL6Yx5Uix4wkIfvB19eX1ivq+YXdWlUt4/rLeRVaWbEuXEDY
 HAJsrwGm/uwL/solyUKOZlfhy/xO7NmNivo1W0DuDe9ZAUpeyAKnfRGXqSi7WXE45TPj
 Ec+LLlfm3/r3rIXhl3MAf4Kwxhh57ORmhmjJN2CYiwY4aW9NipEL0MT2tgRWZC6uZ9lq
 Vhi2x1dmR24FYolRDK2VdW+tt3u8MkVDSdelHR8Eqq/bac0V+w3yge5w/NX/wv63OH9Q
 oIZ2FU51BK2r9amGzeYM2VPhTzd+AHnfJ1CQoYX1XvFR65u/kmGfsv0t8hIEuxVTHKwT
 RFnw==
X-Gm-Message-State: AA6/9Rn8mAJ8ZJ0po6FhlIVd818KOcrPGPAl9XHQlNlEXCMgpGsERUhN+/lX5cq5Xz4Rtg1/Xeh1gsKa4Te3uA==
X-Received: by 10.31.140.147 with SMTP id o141mr13613775vkd.149.1476680232273; 
 Sun, 16 Oct 2016 21:57:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 16 Oct 2016 21:56:51 -0700 (PDT)
In-Reply-To: <1476452899-25924-1-git-send-email-clg@kaod.org>
References: <1476452899-25924-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Oct 2016 15:26:51 +1030
X-Google-Sender-Auth: fJCwuQF-tYoq0bQfm1Nzh-FIos0
Message-ID: <CACPK8XfdtuWcsQgsq_ECbynk98ADxzgY9zUYTg64gfMX5kYm8g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm/aspeed: Enable SPI Master on ast2500evb
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
X-List-Received-Date: Mon, 17 Oct 2016 04:57:15 -0000

On Sat, Oct 15, 2016 at 12:18 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The default is OFF.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will apply this one now to dev-4.7.

> ---
>  arch/arm/mach-aspeed/aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.=
c
> index 12a63db27a21..96713ecd8501 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -159,9 +159,12 @@ static void __init do_ast2500evb_setup(void)
>
>         do_ast2500_common_setup();
>
> -       /* Set strap to RGMII for dedicated PHY networking */
>         reg =3D readl(AST_IO(AST_BASE_SCU | 0x70));
> +
> +       /* Set strap to RGMII for dedicated PHY networking */
>         reg |=3D BIT(6) | BIT(7);
> +       /* Enable SPI Master and SPI Slave to AHB Bridge */
> +       reg |=3D BIT(13);
>         writel(reg, AST_IO(AST_BASE_SCU | 0x70));
>  }
>
> --
> 2.7.4
>
