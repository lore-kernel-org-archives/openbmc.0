Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCc1xKDzDvjS
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VEPOiD1i"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id m75so2041119oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ttTtctxmLzFdBpr9YjGn8jIl2iPCmESIZ8126ClRVo4=;
 b=VEPOiD1iAbum7nI81JNVt/bT2zES9XfxQMyfNBIrt8zb1UR1aEl3nI06WpCUnR69YM
 qfA/6W989lgdmjLp5W1Yn0c5Gcm7jUc98oefw95p9bMIybgBwEcu3rhbAICf9O0lyrkm
 nk8ZS8JHu+UJoPUnvCbAzmAgk1dCN+SOC1ZLYtFK/fVauXaGUJkvmMYKW48rnz1exFUE
 HqQ8DgGqKOIqVjyPmLGMliDJRIQehPSYKQukn4Mz9HT11HVHq27slGkJcQ8IoRTKCcCv
 rcU6ZjHHu7aQdS8kr6sY3hqAF3jadpsNB/azqeV1sZCU7TEDvVfad846D/jTJ60UNmVU
 rW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ttTtctxmLzFdBpr9YjGn8jIl2iPCmESIZ8126ClRVo4=;
 b=agb7yipK5SSTehgCl8uGzlsepwDUx7OhRFLlg566PU7FKlW0yoeZf7YSgfgcd0HYV8
 yQWpG+PJLp2n4gFWIM8kxhQI36RTMCWpr5vnMpQ/aOBVWT+E3/8dC8ODRIZ0u+yn83Ai
 R2FIoTc04t/vSy6L+awPNl38rWDeUKjzejN2LsHIIEGLXVvyKZxlf0O6i/XI95yYttKJ
 bPNcrFYKb2X6W5BLMVRNxnGvoxJ99TciJzP1ks1rBYJ8lUCMbVnk9TanaBP02aravAEJ
 d2zOUD/IPSNP0ACwgplwLYdnFrEoMzeOaZckApl5kwbIOdvAYbLI6yKXiT0mvmQx4xZE
 DTQg==
X-Gm-Message-State: AKaTC02ayB+VDuEd2aSyUhozUaj3hT1iH6IGd0E7v23e4EOyWLOO636uryGUli+f9ewZUP4bSFzaL1S1SsOIMA==
X-Received: by 10.202.220.139 with SMTP id t133mr7697588oig.82.1479713226543; 
 Sun, 20 Nov 2016 23:27:06 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:46 -0800 (PST)
In-Reply-To: <1479478938-13267-18-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-18-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:46 +1030
X-Google-Sender-Auth: JQS9XmhV8Aefd-9L3DijsrrUIKY
Message-ID: <CACPK8XeH0GH3iy4P5McMit=ZRqFEXiW8Hw8Dso2PraPrUrhfjA@mail.gmail.com>
Subject: Re: [PATCH qemu 17/38] aspeed/smc: unfold the AspeedSMCController
 array
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
X-List-Received-Date: Mon, 21 Nov 2016 07:27:08 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> This is getting difficult to read. Also add a 'has_dma' field for each
> controller type.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewd-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c         | 91 ++++++++++++++++++++++++++++++++++++---=
------
>  include/hw/ssi/aspeed_smc.h |  1 +
>  2 files changed, 74 insertions(+), 18 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index eec087199a22..8e7e3bd9e335 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -184,24 +184,79 @@ static const AspeedSegments aspeed_segments_ast2500=
_spi2[] =3D {
>  };

> +        .name              =3D "aspeed.smc.spi",
> +        .r_conf            =3D R_SPI_CONF,
> +        .r_ce_ctrl         =3D 0xff,

What does 0xff mean in this context? Should we have a #define for this?

> +        .r_ctrl0           =3D R_SPI_CTRL0,
> +        .r_timings         =3D R_SPI_TIMINGS,
