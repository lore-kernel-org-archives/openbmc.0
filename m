Return-Path: <openbmc+bounces-2020-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F8BCD5BD1
	for <openbmc@archiver.kernel.org>; Mon,  1 Jun 2026 20:22:22 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTlkH6ztwz2ytJ;
	Tue, 02 Jun 2026 06:22:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::122a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780345335;
	cv=pass; b=ICqZdUTtU6p65XZIuA7amRw7xGmSnBaaaWg+3E28rlFzuN/GpckfLK11+ar3rWMXa9QffnvEM7U4PmivdeD7td383XRlvuLEeJPfL1VMP9Oaw88g4oAEc2R5ZV9osflMhoEU244Lbh50J/H37Dgu83dbXhfDn7vBFcioksDlGRQuSpzcJlSdiwToSXK6P3K4XXqypGeQ+MGwVfWqcKJRgSLWMhu49xwJXmYUdiWHsz7lJkSDi2+XECZM7J8GABizTUR8C6xku8VV60vpjTqIN/QLquM9eqgwDIW5NDL9HAZ2B/LoP/dVSL5J7cnL9M6yZP2s4GKx2xw0UT1o/8OdJw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780345335; c=relaxed/relaxed;
	bh=qgE3hR8cJWkdfpmopy30y5OphY/th9eYGv/UcDqygII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WsckdBdCoq3seMrXwbeIcBOxvn5iFtKCknC+msfJO70tabPC6y3DfeU+Hb6LfrWmBPv86UwZ070P7n/Bm4/TK6yV6HA6W02uk9d7CbZHW/kD9WfhrGauUrfc6vDnobVO97lW7TNit+NzjuKSgcYFwSb5DVNDpbISFDMgx5rceoLHdFat8ks1PprRDbhHmb1PZDW1UjK4/kCPkqVqLrI9NynSh1zSz1U5VvVFnaX0UFGJw2mmK1hMLO8L/fe/vQYCTL/UCqWuzeqV3Y9sRP9UsYttQvOboRjk3B8CzYuW5QLWwB4ImZgbjkoJmarO7osCH7VB8M3SETTJieqZrhinzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cuuBU+Pu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cuuBU+Pu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122a; helo=mail-dl1-x122a.google.com; envelope-from=anirudhsriniv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122a.google.com (mail-dl1-x122a.google.com [IPv6:2607:f8b0:4864:20::122a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTlkG3HbBz2yT0
	for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2026 06:22:13 +1000 (AEST)
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-137dd523634so2690342c88.1
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jun 2026 13:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780345331; cv=none;
        d=google.com; s=arc-20240605;
        b=DXAqlRsJSKCFsNI8MKnJGsceNraZ4C1PpXXO6tM5elk5BZ21qm4L71+r30Zqygrbqn
         BU69XK6kZJeRdyGETHdrAiRuOJh8yWa/JbIwe5JUStNtH2Vs6DZ+oOuiHyql7F5LopCC
         mzEV0oXEWzTe2Z24S/pagrQ4D9Bq4xHjIyTK3h7jV/gjzPeqPgupZ7WevOHGoGv0pukm
         HvwNNnRGUAbUtzaPKcOVR8ejXbEyyMCx5YMRY8c0APSEr/0tKUkouQjLwr1sLtzW9Yvh
         pY6DEoSOyhS46Ua5ga6BbIyP9srExE+iUnASNgBV6N6JojSuuOMSbHdQvHFf2jqiMNDq
         uejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qgE3hR8cJWkdfpmopy30y5OphY/th9eYGv/UcDqygII=;
        fh=KAILb5B72kdbwHykfnZwevIiXW+C3tMxwbJZI+lXP9s=;
        b=DXfgirIKsyP4qX6yxrVWIc/Ql5Bwbip5d1KwH9H5wYfGeehvyPrko/Vf7btWESLvfE
         UAq6PgTytCVL4vLICJh063pynFKLnpXsh5Yc2Kuwc4Ou1QwLodQlffiqmlH2Tjhnrqg5
         jKv+rJK/Kh5bwPUY1XdbiAY1aYfXzEQOzJ+9ZzbgYY9Ss61usjFmscX73OVqSjgG99p2
         UQZCM7fZ35/SeoVZPehX2djExOgKacbz4sjI2FIar4T8AIVroB5xfDomp2iHvM5M1TuP
         ngTPIR967QE8j8bN7PDKPWEPGqIfl6RwVMpOnW1b2XlYiS27j961Sp6xGmI6xqf40loq
         i98A==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780345331; x=1780950131; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgE3hR8cJWkdfpmopy30y5OphY/th9eYGv/UcDqygII=;
        b=cuuBU+Puju9eOz5A6sXEef1Z0+KQRGjsd3bZcCzU0CC3MKEnB17RtXoAjOCOGarezW
         GO66X0IN9+dLL/yrQvxWphxikF6aHgu5Q70gGqGzaM6qQnnvc+19UTlotxgRJCo0tmXS
         /ZIlKOtxnNn284rzD5C2CaHBqyv1GNSkOYq8Sf+E/S/zVJd3qtKsQkvQX7Kf1C/IMLp3
         S+7HKBY6p/O4YuXeZhWrchfB3zlsSsVHRMgkVqjoPsXFW5QFBGvKyFiLCoCLxIRxkyf6
         J+MCH/XILU2gQ+ij0PX1DbaDsz8ly8AVRM/7BjaxxzWK+EcE0LmJZa1XgaIn+ej9iqwW
         91xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780345331; x=1780950131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgE3hR8cJWkdfpmopy30y5OphY/th9eYGv/UcDqygII=;
        b=pqWdsss+HLYuWvqU1iUacL5RWp6DqjwYTjgZooP304UCVnFp9lJXdpWzhwLlhT6Pej
         hNXJoBuJfqkzdI5u5HUvxv2sm7DqGy+2dfGngN1P6vEFFihhlOaYyzaIPL/H7bcCSrpy
         e9L+hUYmV4i/8HT84Ln+E55f3lnEqSenMJG+oKk+gDsGKbJ2tKSNcNpkbmVhRnyQInTg
         cYoPsXjmjhkzcVXSbIk34B+CWaeK+9v4wngrqW94YlPVYa6UCe5T+l2G1cVXEQwrNEh/
         EPCjw1ZFgJmtoWRSFAPFjJeUZ06HNAEDWnqJJtSTK0/Dw34o45c2d7FHp3v2aJjcvCVQ
         pGJA==
X-Forwarded-Encrypted: i=1; AFNElJ9YiSRZi/Y/v/t3WNvtj7kt9/E/RrxzX3aXwyah3bGKiUFzYepxLtelX/dOex1WpEy4rpNrxB8U@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUC9R9a3jyTnfBDo4wc3VTe9MVUGnD6ChVzoQ0Hi7mnq6xjUXe
	0jD8r6ZwcNCMjPKUMb2EZWe232A/CMbAkwNQHuIJrT8swq7WKJfqwJiE8g2ZdCK7r32712nBYMy
	u+egNP40uWwjfd2ujzgSIgumSTfGWosk=
X-Gm-Gg: Acq92OHOnLK8mMcaexhlk057wyUH1kp6EFKT/IkywgfoOfYutQYTxxqd+eY8ICuE4SB
	H3VR3a0btl25KHr3HEpCw3H6KOXFbdBRmOhl9cHHx3GbyaF8Mu1MXAqkyo9FSdzDz0izDBHEN/j
	A8YuMDKb00ttRKQILrqa9axGOZEdJ4+u7f1iYR3EYN9WJRwoG78aiKhEWJMQ2dVimOMctgQG7Qh
	QDeKexx1ZippMrJpxbWRb5N5+pfPzfZXTV6zkvZGvMeg0Tw7h+HvddAzgjOS/MmG4N/Ma15ptk5
	1IKygimnAU9oLDNrNVZJJWk4a05m94fzTgVRNgVbrOtgBQ2AjZ8=
X-Received: by 2002:a05:7022:69a4:b0:137:ed33:b08d with SMTP id
 a92af1059eb24-137ed33b149mr909990c88.38.1780345331175; Mon, 01 Jun 2026
 13:22:11 -0700 (PDT)
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
 <CAJ13v3TYLDswJROz=540J+XuyEmYMXEsaO3PgQhvFueSpsqpGg@mail.gmail.com> <27999869-0903-457a-952b-c77a61b61c1a@9elements.com>
In-Reply-To: <27999869-0903-457a-952b-c77a61b61c1a@9elements.com>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Mon, 1 Jun 2026 15:21:59 -0500
X-Gm-Features: AVHnY4KIbX2CRTOFv796iJh1hBm57KDyPyT68ysX3PWUgJ_wEn8kg0hcBGCQ31U
Message-ID: <CAJ13v3QrD5Q=oMn3bjBr7SdQNXj2zk+N+BmhqhiV8j-Wx0c6Vw@mail.gmail.com>
Subject: Re: [PATCH u-boot v3 2/2] ARM: dts: aspeed: Add dts for ASUS Kommando
 IPMI card
To: Tan Siewert <tan.siewert@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, openbmc@lists.ozlabs.org, 
	Ender Hsieh <andhsieh@nvidia.com>, Marc Olberding <molberding@nvidia.com>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 8:33=E2=80=AFAM Tan Siewert <tan.siewert@9elements.c=
om> wrote:
>
> On 6/1/26 3:22 PM, Anirudh Srinivasan wrote:
> > Hi Tan,
> >
> > On Mon, Jun 1, 2026 at 4:26=E2=80=AFAM Tan Siewert <tan.siewert@9elemen=
ts.com> wrote:
> >>
> >>> +
> >>> +&fmc {
> >>> +     status =3D "okay";
> >>> +
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> >>> +
> >>> +     flash@0 {
> >>> +             status =3D "okay";
> >>> +             spi-max-frequency =3D <50000000>;
> >>> +             spi-tx-bus-width =3D <4>;
> >>> +             spi-rx-bus-width =3D <4>;
> >>> +     };
> >>
> >> Out of curiosity: which revision of the Kommando IPMI card do you have=
?
> >> Asking because I have two R1.04s and both fail after a power cycle, bu=
t
> >> only if the SPI was probed by U-Boot before.
> >
> > My card also says R1.04 on it. My flash chip is a Winbound 25Q512JVFQ.
> >
> > Are you observing this after a graceful reboot from inside an OS, or
> > when you unplug/replug the USB power cable? If you're doing the
> > latter, I've observed that the card doesn't come back up properly when
> > the UART ground is connected, even with the stock fw. I need to unplug
> > power, unplug the UART ground cable and then replug both back in. I
> > see some garbage output on the UART at boot if I don't do this.
>
> I only observe this on re-plugging the USB power cable. Disconnecting
> UART and all other peripherals that have any ground pins makes the issue
> happen less times, but I am still able to trigger it if the power is
> falling at a bad timing (e.g. on init before systemd is starting.)

Given that this happens with the stock fw too, this seems to be a
quirk of the board design. It's likely missing a bleed resistor
somewhere. It doesn't affect the day to day functionality of the card,
only developmental flows where one is constantly reflashing/hard
rebooting the card.

> The R1.01 cards for example don't seem to have this issue at all, as I
> was told by a colleague.
>
>         Tan



--=20
Regards
Anirudh Srinivasan

