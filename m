Return-Path: <joel.stan@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdPh32GKfzDq5f
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 20:05:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Pf2Y/KSk; 
 dkim-atps=neutral
Received: by mail-qt0-x244.google.com with SMTP id f89so3066505qtd.0
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2016 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=xgr/cztf4afYYCMFu9oFBfL0ZnSMpqlpw4iGJ62dAmU=;
 b=Pf2Y/KSkvQW8nlXDRnWM2mzbc5KkI4X4uJbVj0MTppiiyJGkj96q+pdRpLholBJ+6e
 2q2txZEEokRKuNqfgRrqwOlZ23STmK8oGx4zOcxGaKytnvLOFpL7NFIkPbjUTDL2f1fZ
 Y85Ty4CXFdM+hch+lqp0DcdYXOerF/FKxhDBb4a2C0rOf8rqsidQba1DwRy5zvw7+myp
 Uyu7yAtP2Oudb39VbP9gb+IQpynqmMU/yfxE2lcz5LhJNimfL+brw21cdf5cMnEjF4nu
 jtbf1lrq9zMygzREuz8lzIVG+JpZprw59NcXxw9KP0bbydCjidz8GxuVZy7n8lMJc6+r
 BUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=xgr/cztf4afYYCMFu9oFBfL0ZnSMpqlpw4iGJ62dAmU=;
 b=V6tzK9/lAk5Wc8cJT/x+tRSSRFsS3F16bXjoojuvgZvvOaBAWzvs7uQQd4vOglAUCR
 yUClYQ0D7q2OR8ZqVv2+0a6mhxacvNZcVtMaj+6QXcee9hp3DRtKQQro8FxBVoyalscW
 /7oPAmm9sp0jZ7WgjXBfxXsBMASHipWYg0lqYZ/C6VczwCsJrkZ9DddMFPAAJBPHmkmY
 2V5J+IhKgt8XfgTzYd3+f5tAlLI5kkqow2DRpCIKrRRGMDeOXun+nrlPDsvdXAAbov3h
 L948CEM8kmrMJD7nEQrCVlFF0AgaASibiFIUjjrbcnG6qomkNFAhZdrrDZ4Hcl29P0re
 fplw==
X-Gm-Message-State: ALyK8tIlb2sA3fpUKNbVZYTlzgTC7ntTF/JYXv03VIj1QQPGDRKxOa2VJJKC99F5iqra8X/7IhJi2ZvTylVP+A==
X-Received: by 10.237.37.8 with SMTP id v8mr21880042qtc.28.1467021920791; Mon,
 27 Jun 2016 03:05:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Mon, 27 Jun 2016 03:05:01 -0700 (PDT)
In-Reply-To: <1467017008-18792-1-git-send-email-clg@kaod.org>
References: <1467017008-18792-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 27 Jun 2016 19:35:01 +0930
X-Google-Sender-Auth: vXQFYA_YTnOI6o633PgPoS-6wwo
Message-ID: <CACPK8XejZmKUXpb0PO6xS6y-0rqUmkDVsBXh15=x3u1nsaqVYA@mail.gmail.com>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc/v2016.05-ast2500] aspeed:
 fix compile warning in memmove_dma()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 27 Jun 2016 10:05:24 -0000

On Mon, Jun 27, 2016 at 6:13 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> arch/arm/mach-aspeed/flash.c: In function 'memmove_dma':
> arch/arm/mach-aspeed/flash.c:1390:55: warning: assignment makes integer f=
rom pointer without a cast [enabled by default]
>   *(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_FLASH_BASE) =3D (ulong *) (src=
);
>                                                        ^
> arch/arm/mach-aspeed/flash.c:1391:54: warning: assignment makes integer f=
rom pointer without a cast [enabled by default]
>   *(ulong *) (AST_FMC_BASE + REG_FLASH_DMA_DRAM_BASE) =3D (ulong *) (dest=
);
>                                                       ^
> There is no need to cast with a pointer type. memmove_dma() is not used
> today but let's keep it as this is a supported feature we could use.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks! Now we build warning free.

Applied at https://github.com/openbmc/u-boot/commit/69e4384a0973fb7895fdc61=
76605fa7431fec5bb

Cheers,

Joel
