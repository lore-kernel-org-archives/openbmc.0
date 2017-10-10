Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22d; helo=mail-lf0-x22d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XWFrvU63"; 
 dkim-atps=neutral
Received: from mail-lf0-x22d.google.com (mail-lf0-x22d.google.com
 [IPv6:2a00:1450:4010:c07::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yB26R1WFpzDr4W
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 14:05:18 +1100 (AEDT)
Received: by mail-lf0-x22d.google.com with SMTP id a16so11944245lfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 20:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=hB8iMmcE7TZpelHchkRs5HiEvLq9I7nfEjCc4CiQWug=;
 b=XWFrvU63VLDV7v1fFJIBUFxJ54mbREVJKYezVOcKGi/42dZ96Mg2fzBeLpkFfcFsYR
 K1RNrxBFdZZ4AzpImBZAGASnAQRTRftWzZgEMQB01jZTAmIdniehAu9/O98rB5+wCctj
 bLKhKDpDsv2d1f0NnTtGcwdC2sTmUQKfBrYxManL9py/A9uD4yjpkAoc2p5KgtQnKxVz
 UVGx5QktMHkiiaFuUVIjjYC8mPBsMAysB+7LdC5cBgA1wRNVHjDwDtDqvi34acuPj8FD
 Qfen7bAhkKkMNXEwf6h/FIv6nTAzccebD9M2wn2nMwPVcxeaVyH8uGGiZXfUB4opPZ7O
 7mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=hB8iMmcE7TZpelHchkRs5HiEvLq9I7nfEjCc4CiQWug=;
 b=ckr8YH9YB5PCH9Vjatja1JXNqasBe+L7Il3jOyFYP3R2HYwRDdB6iCFo2FD2t3gz6V
 N1j5DswcEfxkOPPUVyIcY6OeF6Mz+5lDDBNyi8OAPjdcOfsnD7m01NaY1BSz6K3hkzJZ
 zDI8nmACgmCouWlu78DzPAY/2ipm/y/8PAAr6DSguWHG7r67l8h3zPopnse/Lq1l2yo1
 nLqSECPoKsElxwljtp6gU892p72Bz5Z0acyQYlc6O5gw2Y2AOX0eAcTpwc7rpttnEKoB
 MkG1XegNLFdE7n9yLAumDPA3e10EOgucb25ec/02JpZnEtvUQVZRvUo7c5fiu51pNrdF
 i+Hg==
X-Gm-Message-State: AMCzsaXiEhUeB2IIbEkwai0M4xBEcsNGkJtMBfwzV6aopFwU54LL8GDD
 rFOPwIsa9kk4bKjcU3oXqsJkD6iZdVIsiljNQuU=
X-Google-Smtp-Source: AOwi7QBZ3CY5OAUFj24rsmgLg8zxp+aCCZ3yXAY1EQfpMeKeO8ldzqp1ryi18EmINEgE45WbYFtUy0vfCykQZwWt/qo=
X-Received: by 10.46.86.195 with SMTP id k64mr3694763lje.81.1507604714962;
 Mon, 09 Oct 2017 20:05:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Mon, 9 Oct 2017 20:04:54 -0700 (PDT)
In-Reply-To: <20171009134108.15860-1-clg@kaod.org>
References: <20171009134108.15860-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Oct 2017 12:34:54 +0930
X-Google-Sender-Auth: 9fh9sOf-ziUiq3toPGolz0wuq4A
Message-ID: <CACPK8Xe2XWpiZLA1atw9nKpy5BZSZG8VWU6xLmQTWB7sQm9xAg@mail.gmail.com>
Subject: Re: [linux dev-4.13 0/6] SMC driver updates
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 03:05:20 -0000

Hello Cedric,

On Mon, Oct 9, 2017 at 11:11 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Hello,
>
> Here is a series bringing the Aspeed SMC driver to the level of what
> we had in openbmc kernel 4.10. There are a couple of changes :
>
>  - the DMA support is gone. It is not used, it only works for
>    kmalloc'ed buffers and UBIFS uses vmalloc'ed buffers for instance.
>
>  - the driver was slightly adapted to take into account the new clk
>    driver.
>
> Tested on a palmetto and an ast2500 eval boards.

Thanks! I applied these to dev-4.13. They did not cleanly apply. Can
you double check that head of the remote you're using is
c0df354f409687d3565073e17fab75913755ed07?

I did them applied, but they appear to fail to probe on my evb:

[    1.901227] aspeed-smc 1e620000.flash-controller: mx25l25635e (32768 Kby=
tes)
[    1.908304] aspeed-smc 1e620000.flash-controller: CE0 window [
0x20000000 - 0x22000000 ] 32MB
[    1.916831] aspeed-smc 1e620000.flash-controller: CE1 window [
0x22000000 - 0x2a000000 ] 128MB
[    1.925540] aspeed-smc 1e620000.flash-controller: unsupported SPI read m=
ode
[    1.932516] aspeed-smc 1e620000.flash-controller: Aspeed SMC probe faile=
d -22
[    1.946376] aspeed-smc: probe of 1e620000.flash-controller failed
with error -22
[    1.955217] aspeed-smc 1e630000.flash-controller: w25q256 (32768 Kbytes)
[    1.961943] aspeed-smc 1e630000.flash-controller: CE0 window [
0x30000000 - 0x32000000 ] 32MB
[    1.970467] aspeed-smc 1e630000.flash-controller: CE1 window [
0x32000000 - 0x38000000 ] 96MB
[    1.978982] aspeed-smc 1e630000.flash-controller: unsupported SPI read m=
ode
[    1.985941] aspeed-smc 1e630000.flash-controller: Aspeed SMC probe faile=
d -22
[    1.995375] aspeed-smc: probe of 1e630000.flash-controller failed
with error -22
[    2.004072] aspeed-smc 1e631000.flash-controller: Aspeed SMC probe faile=
d -19

Cheers,

Joel
