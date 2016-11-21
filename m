Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCl4TT9zDvj4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CabuNIHj"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id m75so2041442oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=bt7Axj4OdcwbP2CJdU700tZEobrwgHFOi7qPraPTMAA=;
 b=CabuNIHjMEqrL+A7FID+Q62blilU82wTvqgHEP3n4ohkgi3TYD6+gZqrDkIaVl01lv
 wbZSw0fvUDf9BhuBEjoKRmB0viokXGJgdtvZPlIkdLgJ3dcUKgth6fCX024K57ij6BIm
 mwNW5s0eYaf1PQ+2xrjH5Rh4T9oYesZea5ElFn3FUcMV8gcKiuCMCpXFmECT1eIF1pI3
 nDfB5Jhcu940/ZMRFL2j7QltvuyWsQoUcGjg7wt9MxwbZgTBRP8EU/qXGR4a3FdeEYRp
 8FnedgSToWLMOrbdYYfOjxLz+LxE+pKbbU/kjE1UhPRA3AFA7B5+0hkzAr4nI14dT7tG
 Mmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=bt7Axj4OdcwbP2CJdU700tZEobrwgHFOi7qPraPTMAA=;
 b=CQIOhcbidlhkF/XdqHoqvdUqU2I5HyxdXS43Zy+x0svdyrmAF4x3jYs5dDjJAkWIc+
 UmVygrjcHw6Ywf3ExGedYDVtAV5QQjXDHLvsTpDckyiQp+km9sOeix3MfJrDwZiKZK4z
 fSmmWWhmuqMT5xfzX8jDOtn0kUkQSdaaf2XXK9pya5+z0zZ2Ogdmh3nJ5HmUZrAuLfNB
 P3Us9blku/po0hCFR93oE8pyJE4pW0VYLUF9cEUO2L0mTCzPH9T7v9mSNBOkoXEZ3c9x
 iXRQ9VYufsWhW3B647+XwB7guasre0PlOqgTphdpOGRS0A6Aog5IbnqmQiFy/dUulJvl
 Vxsw==
X-Gm-Message-State: AKaTC00BRaNBBSRgaI3uJ2ZZyVXxUURuNGsBVKudeI6vvDxVuH4SKJgtAKC5tXGyBRa14vt//0v3KqyexCSQwg==
X-Received: by 10.157.36.36 with SMTP id p33mr8487805ota.8.1479713233461; Sun,
 20 Nov 2016 23:27:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:52 -0800 (PST)
In-Reply-To: <1479478938-13267-19-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-19-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:52 +1030
X-Google-Sender-Auth: pruZ8HnN19YfUGw0NfGqFy5o6-c
Message-ID: <CACPK8XfdeaPjg7gB_fNdHHSVz1WkY16vcm=AcrBigL-RiE1-rA@mail.gmail.com>
Subject: Re: [PATCH qemu 18/38] aspeed/smc: add a 'sdram_base' property
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:16 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The setting of the DRAM address of the DMA transaction depends on the
> DRAM base address of the SoC, so we add a property to give this
> information to the model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c         | 7 +++++++
>  hw/ssi/aspeed_smc.c         | 1 +
>  include/hw/ssi/aspeed_smc.h | 3 +++
>  3 files changed, 11 insertions(+)
