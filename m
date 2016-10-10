Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x242.google.com (mail-vk0-x242.google.com
 [IPv6:2607:f8b0:400c:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqmh0wCTzDrbk
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bRfY+MQ7; 
 dkim-atps=neutral
Received: by mail-vk0-x242.google.com with SMTP id z126so3740473vkd.0
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xJ+iDJbO4H3i5i82YKrnZmMS371vJhVV7dhP3vI9QSg=;
 b=bRfY+MQ7bYXzwpOrqGNDxFgP+oi2qREx3Wsb7PU9wMHAwGKersl7tYmdl9P61J53lu
 9e/w1iTMud+722kLcqQnr5Mca4fGyq8yOEO7VOGB93x17VMWzQpjHNuXBFdbAyMLlSbu
 akWFgN6s/HhoL3uIZ6eYBt/oTwq3LjaFxvYAGblAhkHoQJx7hnBUQO1zMnbTo30AMxfV
 JnXestBMfA2qaPSzt4nlzW725n0ADKcuhBIm+GMse7vi1Eel4KuUmFSXe4fE8EIrDhbB
 KV75KLA5Du8ixQwaqqagLbhGBumRaivxg4Y+rSgpA7sfiqJRVuTvQG975aSsPzTivsMj
 qbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xJ+iDJbO4H3i5i82YKrnZmMS371vJhVV7dhP3vI9QSg=;
 b=dWK1VcK62mmBZ19rGmXd2TMbOHR0I7CEaHUOUqY+JXRln/iEeVDm2Ha6nDS0bvFtfh
 jDlZQhP+eTSeUDmTReXWmSwRUoVAV20pWoZqdPNfMgkbj3cpot6toVmqi/Awa0PvXTCB
 zA3MlWnVU9H/n0F/aA/jng8Ndx6KrVkx/XV+8+/joY4tHyydKlhHWKKoNZ2iirFyvjWU
 UIeJDkLuA0qqdlDNZuqUSOppglnGky8V1kVIgzshJjGlxczaPrAO90tnYlsn79KA7FS9
 r60KwvSyAYsQJr9dSiRFOPR4xAmqV/r3Pth1FuIu0dE0JekogLmAZSyzA2Xr/qaQDJTZ
 YSrw==
X-Gm-Message-State: AA6/9RnMGpP/17LQk3Y6pxDB5YPBaVRbh+Pw5GKNaTrCPNt5JVBd3oVCc345etECidXPTHbnoeD+YRlWidVcDw==
X-Received: by 10.31.102.6 with SMTP id a6mr6418434vkc.151.1476080562242; Sun,
 09 Oct 2016 23:22:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:22:21 -0700 (PDT)
In-Reply-To: <1475789205-19618-4-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-4-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:22:21 +1100
X-Google-Sender-Auth: z1m_3ZXKu4kI-gmVDbvDXiFITI8
Message-ID: <CACPK8Xc+h5JrPJ-2NEYhX-Vk5PAxcBTrd7Y4MaR64WcKo43f2Q@mail.gmail.com>
Subject: Re: [PATCH u-boot 03/12] aspeed: use CONFIG_TARGET_AST_G{4,5}
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
X-List-Received-Date: Mon, 10 Oct 2016 06:22:44 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The generated config with the SoC definitions is included in each file
> at compile time. So we can remove the AST_SOC_G* define which are
> redundant.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/include/asm/arch-aspeed/aspeed.h    | 29 --------------
>  arch/arm/include/asm/arch-aspeed/ast-ahbc.h  |  2 +-
>  arch/arm/include/asm/arch-aspeed/platform.h  | 10 +----
>  arch/arm/include/asm/arch-aspeed/regs-ahbc.h |  4 +-
>  arch/arm/include/asm/arch-aspeed/regs-scu.h  | 56 ++++++++++++++--------=
------
>  arch/arm/mach-aspeed/Makefile                |  4 +-
>  arch/arm/mach-aspeed/ast-ahbc.c              |  5 +--
>  arch/arm/mach-aspeed/ast-scu.c               | 19 ++++++----
>  arch/arm/mach-aspeed/cpuinfo.c               |  5 +--
>  arch/arm/mach-aspeed/flash.c                 |  3 +-
>  board/aspeed/ast-g4/ast-g4.c                 |  1 -
>  drivers/net/ftgmac100.c                      |  1 -
>  include/configs/ast-common.h                 |  2 -
>  include/configs/ast-g4-ncsi.h                |  2 +-
>  include/configs/ast-g4-phy.h                 |  2 +-
>  include/configs/ast-g5-ncsi.h                |  2 +-
>  include/configs/ast-g5-phy.h                 |  2 +-
>  17 files changed, 53 insertions(+), 96 deletions(-)
>  delete mode 100644 arch/arm/include/asm/arch-aspeed/aspeed.h
