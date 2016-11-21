Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBC3KMbzDvWg
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="0KtVJOoR"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id f201so17131395oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=cNPcPXJv0Mbo7izydTQzOUG02UR7f15eyh3IWmVXpYc=;
 b=0KtVJOoRChWCXtQ2JshTe4tgBh9KtpIIevpcZQ+IusOjX2KcfJue1anOS903CuryBA
 LJoTivVyLGoAKhIpWnnfvvNfaT244tjxRsc9uAjoU5EtaWHnRxOSkw8YfJlBDJJ6k/oF
 0Ut9Ffjcd50kbSYHX3EaaVcs/3AjsAGIOSpEYW8J7rVlhWwM6Y5PgeBDBxT5C0fIG3Yv
 L1fno1GgO857gAawLWw0mDYfYNwanhWEXZ8FFGanTlIlu+az5Rn/ljtyuK1xXoNVh36H
 Sc5Hl+d5XxzvJ+Ib3V1Y+MPtFuN6gl2RB7p3gA3jEhA5Tdva3FWe0xUX4n0JpFvhiEgd
 my0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=cNPcPXJv0Mbo7izydTQzOUG02UR7f15eyh3IWmVXpYc=;
 b=Ghq+Z5ZxyBcqfwDKB1ZraOIB41prpwxvT+ANgSTo/XZYx85cDBawkr0hm4KKBTX1Ce
 3Qvu0sIkvOHctuJL4iTYLdq0j47gfwCFZSiAp3YwiZWv6XYbEx2CkOb5Kkeck2k9FTjJ
 aGK+samGYVGQQsixTn2nf15LkgDdLyoirLgNQpnV+GGXKPGAnTsFQlKLKBNlgF9qfW4p
 QGVARLvdysDW3EJnytyYn1SnWRuofuy368qgo/op7cUsjuAS0HoO79Vw8ln7X6Fng7xH
 8ogMuRFM2F3/pcHKSNDkFmhpHTp8GLFXHdVVBa5R8MFzBQLADPPkaS5ltnzrgbRbNsfF
 W+yw==
X-Gm-Message-State: AKaTC00saU8QSATixpZiia096Enw9fZMShvmE8JPCFQ8ksG2o3fnxXFIkIpJhSLLhWDxrLHG1oEmxqT6Jco5UA==
X-Received: by 10.202.0.205 with SMTP id 196mr7832122oia.44.1479713153706;
 Sun, 20 Nov 2016 23:25:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:33 -0800 (PST)
In-Reply-To: <1479478938-13267-16-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-16-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:33 +1030
X-Google-Sender-Auth: NrrMLHUK47JkiRv6l94F9rMXUyY
Message-ID: <CACPK8Xf-4nacH9LFwGUw=ChB0Vht2HEHFAaNYq3UvuJQ6cmTrg@mail.gmail.com>
Subject: Re: [PATCH qemu 15/38] aspeed/smc: handle SPI flash Command mode
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
X-List-Received-Date: Mon, 21 Nov 2016 07:25:56 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> The Aspeed SMC controllers have a mode (Command mode) in which
> accesses to the flash content are no different than doing MMIOs. The
> controller generates all the necessary commands to load (or store)
> data in memory.
>
> However, accesses are restricted to the segment window assigned the
> the flash module by the controller. This window is defined by the
> Segment Address Register.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 174 ++++++++++++++++++++++++++++++++++++++++++++++=
++----
>  1 file changed, 162 insertions(+), 12 deletions(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 72a44150b0a1..eec087199a22 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c

> @@ -357,6 +368,98 @@ static inline bool aspeed_smc_is_writable(const Aspe=
edSMCFlash *fl)
>      return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + fl->id));
>  }
>
> +static inline int aspeed_smc_flash_cmd(const AspeedSMCFlash *fl)
> +{
> +    AspeedSMCState *s =3D fl->controller;
> +    int cmd =3D (s->regs[s->r_ctrl0 + fl->id] >> CTRL_CMD_SHIFT) & CTRL_=
CMD_MASK;

I would expect mask to be 0x00FF0000 and you to mask and then shift.
You appear to have the mask shifted down already, so the code is
correct, but it's unexpected.

> +
> +    /* This is the default value for read mode. In other modes, the
> +     * command should be defined */
> +    if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_READMODE) {
> +        cmd =3D SPI_OP_READ;
> +    }
