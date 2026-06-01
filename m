Return-Path: <openbmc+bounces-2017-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE98CD5BD1
	for <openbmc@archiver.kernel.org>; Mon,  1 Jun 2026 13:22:46 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTZQ70cHmz2ydQ;
	Mon, 01 Jun 2026 23:22:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780320158;
	cv=pass; b=kikE/Qv1qsXuOSZh4Mmf1KvFXRkcGgHV8twEHxoEBxvLFFHoC+nUXZlj74jYECgLPYafwfG0v089DKb7wfHD3Ahi4CPzPs6wf01I5MAiTutHuUyzlELxThURUgBGaJhb6iywZXJnRo+baKFzJNbtIoWSfKvb0J30F3ost9NsTwyB8NbIWWE/aslpc4D4wgqwCzoxefnWpfYFuImssSLfRwe2VGb96ssRMEaIHpvGJGxQsAmuR9Oz1Ps9ADre+b3z5MCP9MxA/n31rreBBThJNRC88OSP7g4orJt2hcuG+5LlTh0CGHVqHIMfZ0ZVjWxUoNNUs86rDjZAoL8gdr5w9g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780320158; c=relaxed/relaxed;
	bh=ensB8WwJ/ys0oHt1QsFAe0Cq3NEYS1CrUQtbKtKRyeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MM6kDjh4U8W1qTV2HpaoCsfp08eO9cISVt1BhbUfSGq4DM3S5csfMuzdHzqfRo+/Dn6f4EjlcPL7xhMIAWZHz+4Y0bv/vWzeAAb4hKppHQpCLQpb//wn8Cvt6X4Rto8cgRt1j4KQIQG75fX7lr/zkY8ueAwHLwYwiC+LXoJ1lOlFMqU8Pc09zmvLQ7w9pCw/3o9oKXjBmpj+Zn19LfRZ/BznVU/wK8BqH4pqP41v+mZ1rw1kQEcS9kzk3k76ixzS+aLGy0DrtD5QGGcT+TYFzspr9r+vQ2SMRMvgoPshiLvmt/J22xY76kk3usdVwFweiugLY9rAW7INHy6Hg1L1fw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oT+7USPG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oT+7USPG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com [IPv6:2607:f8b0:4864:20::122c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTZQ55538z2xdh
	for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 23:22:36 +1000 (AEST)
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-137d452574cso2973328c88.0
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 06:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780320155; cv=none;
        d=google.com; s=arc-20240605;
        b=bd6bEonRqcdgkpfj6B6jkssu6d+iEMAa02nTVRvITxZMezDjiYRwzAgglqGPhd41Bb
         4MiOlL7roLxezrnPIw7pdjIod8giqICSAgClXnvBIIIIvPoZypKfWEC4FI0dtSyqcJS3
         GjIsAmAG+5AFWtjaOF6PgRB2eAW5h5NTbsuK0drU0mkb2pMk//MxTwPRThBSQDcDWQ5V
         UDTvQH/4PNKCHxg2DPPVs5U1AfVIkwza51/Za2E81hkqXOjGu6SCK940DOPrW3AwPBjT
         Ut1fMGkVgGnFuxhbDduu7u9DbtfvUsbkA6455pD6+GuK2e+Z488mTM/A/NXkXcG+hk9P
         C3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ensB8WwJ/ys0oHt1QsFAe0Cq3NEYS1CrUQtbKtKRyeU=;
        fh=e7mDUB2AgO1d6xakQ48h/cC+Gmx78eaPAODi24w+KVY=;
        b=XFEUx3VScHciNyoHV10FabF5Tl7vPOiZCQd+lQgEtzi8rrMjtx89LoUk1oHlDKHMr8
         dpW3RtcqP6IjzTkKnyvXbwKMTMpkY5IYJ3b9xin0orhFSNAEXjNxpvFWvaDu/E/IcGCK
         YUO5epDBPIm18G1QmD6fmUYWPLLJNHC4Ce3VWGEqXbN1D4RDgfe1JbKvzmxOoDbVZT19
         bYuUMeru4MsARKsg4WcDotw93qM+3iOKEdRIiNMBM7SCdf/jnnigW0LVJ04wGiSS/qwC
         FqjVFN/pi5sviTuUp35/W67l53GAB3yB7A4y5duZNh11wNZAoabPX8WjXdOaIcTrpYIf
         EgCw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320155; x=1780924955; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ensB8WwJ/ys0oHt1QsFAe0Cq3NEYS1CrUQtbKtKRyeU=;
        b=oT+7USPG7JWLu1bREk9PcmS6O0l06eRnsEyWKuzjP/HCkezzJs7nO73for2PaU4eIO
         2pBu/wLldyB59dCYJzwLoYfVNRXwth+gHxiRvvP/rRgidfZh4rez1EzL98Yf1dmf2lVy
         xL9g8Wppo6du0IGM2ZKrvhC5Hpe4W8/u3lLMG1pXuONcbEmpHEDYfwxomDU/EAFAyI2L
         n4G63c57bhoZE6q6lCAihwi3dlLrXIy95kNxUEQZxtMhZ5z+Mq20urXIOZvdPUqv6dOj
         IsksMEAwrnQSx/6BWtylvYaneb59Kh7imiDpeXijqqBn8grPntJqMcLow9kTHRL/Srb2
         P69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320155; x=1780924955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ensB8WwJ/ys0oHt1QsFAe0Cq3NEYS1CrUQtbKtKRyeU=;
        b=ldwAc9uPU3mciAfxaEslNd9nTIssU9R11VdW/AJG0ZECaGr9BfuUGNoDd9c7lzU/Qj
         Yhchz0A5NlZntc0/+jV4GmSuZCYmK0cxZs73DnkhcfCInoDXF9JVP4LfHfRHCTRASCgo
         VkBKmUwYJNPPZRoxMaGOPFbvucCqvO+Hg5L0WNIdQUYU7jMi5NTMo8O09nHJ+1Y9Rx4+
         jYwzg33ZIXU3qM3xhYAcdz47ZYWWqQu2aU93CwtwWIQETgvNqTWPXzx0/v52ua25Xz85
         ZLo7I7V4FZF779U2/RKnXoDtoSe5ASgqb/kiKF5DmM6pDVQpXlN9jbeLBQMn70/pGtl4
         CLSA==
X-Forwarded-Encrypted: i=1; AFNElJ/EapfcgHht6CLnkApPyuYnXyugDJVO7DECrpC49blApBU6zWifcJTt0Qxq2iJT23YBLaf/1+aZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzYyiLpFeqtrsE3JLYVFr9hewXrQomLGa3/R16HkkdwbP2mvbHW
	VGOdVEpwnuu0mTShQswXkQFqa8JifkCFUoAIdVkg1cGlrwOcHs/0fcLOwg/0p2EkH9viQhCeqVH
	C69+2tlRAMZsy0koZ7LVSOPjrChCcw2Q=
X-Gm-Gg: Acq92OH4gdqJrXVC0peb8bu3nUUWkdCAuANtAGVo+Ph5prB2g5o3AJZ69VvUEAg8iwr
	uODgRRcHNqdK3TNU1n6rAlOPn5Q8WI7lE+wcC024U71shlBy0ebrSvsaiG+tNMqxeATEk5wRNYs
	z38FXr7KhXjG72NQM8EJ3VWJaUX34il1GPGW2fgT6EadAju8ExjC6PE187lqQ3EQ50NDGqtRsGO
	AAWMS9MWxsoxkbyiZoPR95I1fOSw2LGbgGsYcrgLEN17NxtmBJsUg4AtyOwHtmFxeo2wkcuwvLt
	lvEqqGnFysE0rwDJHJJ1GqoGNaHkksq4fh8punPMDecGikTiJFE=
X-Received: by 2002:a05:7022:2202:b0:12d:b7e5:a67b with SMTP id
 a92af1059eb24-137d413e04bmr5437692c88.14.1780320154713; Mon, 01 Jun 2026
 06:22:34 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260525-asus-kommando-v3-0-e6a0ca1b4a3e@gmail.com>
 <20260525-asus-kommando-v3-2-e6a0ca1b4a3e@gmail.com> <0a27f1ad-d5a2-49b2-a79a-c2134ad7b2d2@9elements.com>
In-Reply-To: <0a27f1ad-d5a2-49b2-a79a-c2134ad7b2d2@9elements.com>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 1 Jun 2026 08:22:23 -0500
X-Gm-Features: AVHnY4L_UrgI1DFytJXlnX-3LlkHTucen35M72NwW1-K8_jbEeMf0dThfn4xA0E
Message-ID: <CAJ13v3TYLDswJROz=540J+XuyEmYMXEsaO3PgQhvFueSpsqpGg@mail.gmail.com>
Subject: Re: [PATCH u-boot v3 2/2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, 
	Ender Hsieh <andhsieh@nvidia.com>, Marc Olberding <molberding@nvidia.com>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

On Mon, Jun 1, 2026 at 4:26=E2=80=AFAM Tan Siewert <tan.siewert@9elements.c=
om> wrote:
>
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> > +
> > +     flash@0 {
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
>
> Out of curiosity: which revision of the Kommando IPMI card do you have?
> Asking because I have two R1.04s and both fail after a power cycle, but
> only if the SPI was probed by U-Boot before.

My card also says R1.04 on it. My flash chip is a Winbound 25Q512JVFQ.

Are you observing this after a graceful reboot from inside an OS, or
when you unplug/replug the USB power cable? If you're doing the
latter, I've observed that the card doesn't come back up properly when
the UART ground is connected, even with the stock fw. I need to unplug
power, unplug the UART ground cable and then replug both back in. I
see some garbage output on the UART at boot if I don't do this.

>
> I'm still debugging the issue on my side, but based on what I saw with
> my logic analyser it appears that the FMC is in a wrong addressing mode.
> When it reads U-Boot, it's misaligned by 1-byte.
> Blipping the /RESET line makes the card work again.
>
>         Tan
>
> > +};

--=20
Regards
Anirudh Srinivasan

