Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCp2nxZzDvjC
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KuuWskMG"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id m75so2041544oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=4AUwIN4N8A6HZWNPncD43+jlDdPtcbHukFzwMxF2Qv0=;
 b=KuuWskMGthQws0nzgz7YNAnFunOe/7/6HhZq1rl5tIjojCD4brmHL0IoWfc1cwsZoK
 hmijxUjze7AgCgIVWHXOZ/buN+dRKOh0v4fvdhQbUfGLqxvZTi50yVeHyBjFhMK27hWv
 kMGLY0HZx5Uqgpg4PKporg4RuQDvK8Bj5vFmHJjXBRXaBxrXsUmzQinM6fChBZYBvY+z
 adGWlLMRJe4JqkCXlSto0RyY5FtP9PHkxnYLfRyRX90tJxadWpsDl9uB1YK2Xhp0fcdq
 Ygv49C5WsOAb0QPCgeGYVlBh0sehI9w2zkDIVeUdxEx43HU5ajb9tz/HJ1GSoURXIjSK
 yXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=4AUwIN4N8A6HZWNPncD43+jlDdPtcbHukFzwMxF2Qv0=;
 b=f2sGAVFMfaJafJCY6x1CPwNtZQqfll27KNlVi1lI0vQ3n4YvqrqvF516X56HwqZRE9
 +VzCJPV5sR1bmGshoXp1Ezi5lii6Mew4XfViioZzEcA3HlZU0tqQkMh9MoCxQ59g+XVF
 f2DwIYyDoqthwp9LkKK9u/qdTppHgx4UYD9MS2FzHQ5d0xbzirmrRt2gS3drAu2OJm+M
 VM8KHxWIEwBUNG1yhA/QFJcT8GwrJTh9HojJ+ROeosHjXoGh2YGioLcp+MAdNCUEZ1Jr
 p6+iGiFvHv495sc6SxBuTeCkrS/ZP6OUimQmMcTroc1Yxr3f+woLKpDdDs2apP1p+mCA
 rouw==
X-Gm-Message-State: AKaTC03LMleyQfAWtIigRixAiJvdg3akoUt7cvsvDgja+AGPv4+rZrfkBWPKaBHMgTmAfiVO9e+CXlJmejuRdA==
X-Received: by 10.157.63.199 with SMTP id i7mr8532950ote.63.1479713236660;
 Sun, 20 Nov 2016 23:27:16 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:56 -0800 (PST)
In-Reply-To: <1479478938-13267-10-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-10-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:56 +1030
X-Google-Sender-Auth: RIWbRaXNk2pK_e18WN0-01ky19M
Message-ID: <CACPK8XcGXnHy5jj4JUN_XKDALYX0U4vzrffE20nKGduTJ7dZTQ@mail.gmail.com>
Subject: Re: [PATCH qemu 09/38] aspeed/scu: fix SCU region size
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:18 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/misc/aspeed_scu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 34e86385d837..95022d3607ad 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -86,7 +86,7 @@
>  #define BMC_DEV_ID           TO_REG(0x1A4)
>
>  #define PROT_KEY_UNLOCK 0x1688A8A8
> -#define SCU_IO_REGION_SIZE 0x20000
> +#define SCU_IO_REGION_SIZE 0x1000
>

The last register is at 0x1A4. Do we want to use that as the size?

>  static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] =3D {
>       [SYS_RST_CTRL]    =3D 0xFFCFFEDCU,
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
