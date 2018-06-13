Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SdUvj0ma"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="N1UHXFQT"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415VLS0xzHzF0f5
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 01:00:47 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id y31-v6so2629795qty.9
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ggPsWCgBGNP7sQazIyQtB4wt7nRMtd+mYba2iWsOVWk=;
 b=SdUvj0ma8lzkc/eKxAIgpSwaM+qWYXdUwR0eFC58vdHPMGQ95DTy9j1JUrJ/o3d4Wg
 8WrH5HmRjm9iYpHyr6KCYYVyyKsLNT5zpRWUsGr6/17kNZurjS0vSsw9nHvkq67TlgMW
 50Ty+7VsF1ZvzbU6M0pvzv+yw4Hu924sTvZhYKF9bKt2aexs2AugAM1TNsjU94L9DwkV
 8w77mMPKg05Q4VHHrov31rjJV/v8z/mSCoxM2GbfgeaIhQKXm/4am1oNJwS9RPW1gR2C
 KuTYrVmZ2sQYPHjCXSnU/E8FFL/iVKhonjz77XyXoYw7cQiTfGVnz88OnxLjbLUuIji4
 nZjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ggPsWCgBGNP7sQazIyQtB4wt7nRMtd+mYba2iWsOVWk=;
 b=N1UHXFQTHdUnXf0Vjo+Owv0pUsGsL9/QcVztGQeKyLIBGboA+wK1rLipMv91QPpBem
 BQfwHXkbb2jPoO+Er+wfYxi/LcMi2q5Bp6tDjlrjhBXgYErflrOiuR3jyTYgmx15O4ji
 9M2TttgSbpVL2OkX/D7VblQ9PaQ5MMnxs1PTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ggPsWCgBGNP7sQazIyQtB4wt7nRMtd+mYba2iWsOVWk=;
 b=jQOKqmSHGZADWy3ugL1mPpQZNl+d3EP8YV5TklRFJj9FXJhIvenWByRXKN8Ljgfalg
 0C32bEN8NomWonGLSZLcwju0k0P/V7aRsKZagrQVfyD1GnmyDVRnXnA6HDLOZrfHUGqZ
 c5QzfD7f2T/cmlLBB4D/xe1YJUoUqc+kUZAsvh1zL4bFAJ3qa/BRMtZdjN7M3C+QdrVD
 Y0fe3tG9oVTZOzeGST5ReoutEvZjSXYwBF6EP7+vTDB9goIFQrXsXkRd1NVpmIndgoAg
 vOW4Zl43JLqRB64Bmp66zbpIpXwVVMtSTkAwXPMgJKDWNBHg0YhLzfn1TC7pv8m5lGAz
 78sQ==
X-Gm-Message-State: APt69E2n5OPwo0UTq2Xk2VYfC0zxoVmKCWmiVDzC3FpiXrdMqWHib1Xi
 p6NPJrJmQZSfbo43bwssnOBGKeCKULNkCnpcNQnBDA==
X-Google-Smtp-Source: ADUXVKKGJ7YwEqz0GoRFzGGe//kj6fYiPNnsPXUoDrc/8Y7jkXavoW7jUp4Q+fO6uhz/jB0gmAlmG2uBgNibNL8WP+A=
X-Received: by 2002:ac8:65d1:: with SMTP id
 t17-v6mr4991056qto.347.1528902045362; 
 Wed, 13 Jun 2018 08:00:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 08:00:24
 -0700 (PDT)
In-Reply-To: <20180608130000.22627-1-clg@kaod.org>
References: <20180608130000.22627-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Jun 2018 00:30:24 +0930
X-Google-Sender-Auth: Xq8JZ0Tk5LfC72IHTjWX6S47ZCg
Message-ID: <CACPK8XfM3B6FbukwTMtbi4FVU8SGxpFF-ox3MiDkMS8f3CASQQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: aspeed: introduce a "spi-max-frequency"
 property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 13 Jun 2018 15:00:50 -0000

Hi Cedric,

On 8 June 2018 at 22:29, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The property protects some optimistic settings of optimize read algo
> on certain chips (old ones). It also makes the read access to the
> alternate FMC chip 3 times faster.

The changes look okay to me. Do you plan to submit them for upstream inclus=
ion?

I'd feel happier if we had some review on them before merging device
tree changes.

Cheers,

Joel

>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (2):
>   ARM: dts: aspeed: Add "spi-max-frequency" property
>   mtd: spi-nor: aspeed: limit the maximum SPI frequency
>
>  drivers/mtd/spi-nor/aspeed-smc.c                 | 18 ++++++++++++++----
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts         |  2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    |  2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     |  2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts |  3 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       |  2 ++
>  arch/arm/boot/dts/aspeed-g4.dtsi                 |  2 ++
>  arch/arm/boot/dts/aspeed-g5.dtsi                 |  7 +++++++
>  8 files changed, 34 insertions(+), 4 deletions(-)
>
> --
> 2.13.6
>
