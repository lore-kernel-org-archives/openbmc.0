Return-Path: <openbmc+bounces-2726-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40D1CA5FF0
	for <openbmc@archiver.kernel.org>; Mon,  5 Oct 2026 14:49:19 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hz2Mn3D34z2yjN;
	Tue, 06 Oct 2026 01:49:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::b135" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791211749;
	cv=pass; b=j1KtgvjjZFHc/sqM0Lb38BsrbbNldcWHm8LhKbh7PmqOlNczMCh6MJ6lIPCOylm0EQIR2GKICFSDMxWbdtBpacqTRBZZIMRT0tyeq5LKdcPja51yMx1XcHIYe9Z3Bzotz5WArsD3tx/3AG2RJgeKtewdIs86jlBRmET+HEL1jIvcUHxnynzpIvxS2nLVpq6ODEHzWk6y79B1dyeOqjNsxFJqvk//emrcKeDlz4xzq1dOtZjRvOwIE/pbxHJd52qILs8V6ASODpOgwa2gthVnfQ/jzWKRwyYM1VieyCHWytDpHR2vA2byr37SEyiUx5SrHLcU8xhB9OF1Mgz+nasvpw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791211749; c=relaxed/relaxed;
	bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOy7cj5uAqu6mZk853likalrc8XQTFAVxduJsG7IZXT5bJ1NPMnMXKkNjaL111Aq4Bd5cMG2Kt2HNCLrlQGqfh8NYe79HLMUIni6iQFxReDGMPLDRkilgM0VExovtx0X9iqvjwvTUv92O67voufHZzlhMkcwe0TI8/cocdZx+Je93UZ4+PKbMHn9mhgmnFwixks2Bkms1OSZcNM7tpIfDni1hUxaRdkOboaDlM1DN7EIpOxQKk+r+77/lwjprTxY1QqfwdScU+Qr7FCSIhAkrnxR/FdEcqI5uQQlujBtrdENGZABV2Ep49201yhoif03vQZO2gYGGf5yD6aSrcR0Ow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQ1SDXcV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b135; helo=mail-yx1-xb135.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQ1SDXcV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b135; helo=mail-yx1-xb135.google.com; envelope-from=prasanth.padarthi10@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb135.google.com (mail-yx1-xb135.google.com [IPv6:2607:f8b0:4864:20::b135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hz2Ml2Bqcz2xwd
	for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 01:49:05 +1100 (AEDT)
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66fca0709caso1334420d50.1
        for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791211742; cv=none;
        d=google.com; s=arc-20260327;
        b=q7W5TRV6XtU5dpC+mHTgoZKFf+rjhjrLKDQBqM0oj2kofDEFgleiqM8qCBYIyWQluw
         l6Ko/tnVPoaDT152ayJCUS5+Q7xeOlB4L/qEhr/92jrAkjyQRLgnm6bY8R5iFjdqk8z+
         RfJQUIxgUtKTHG/pAiT9e5Lp/leXMSvbMLEkb8dQyYRf6iBy9b+66c5N9QBurvGERuIF
         vfHkr+eRj5WhPSUnsb//WujBsH8Nmcceh95G9omgw+0sg9yaN7Le32fpXM8igpVSFpU5
         pk/tLoBWGnt1PtoVogUOpMaCijVgFWhmVWjaiAkbJhB/qcIi1eIkxZFq8x9YnT6swKTm
         +/Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
        fh=Mx343j5SPZxQEAB/dI6pSkMKVTkc4PIblPdfPHewYzg=;
        b=kfG92GhwCgA1S1QEEfh2HeKEDUnSB1eqo6DNjjr2Fg/tc6kbpxLoTOcxQwpwsG8e9c
         kVS9WVKlvA9OYY+0dYN8fs7k/WuAhXZ0NOQRJ69xP0cu09ytWIiO9+OpnXnel2Zy0CV8
         NUl6UfcLokQn15KpFecIP5bEbgXMEGOp1c5jm5pFHwV069Of1GruoZiB+LTtcacqTe0c
         YyOheMCuHs4ZIGE0ZnWZkE/Ao+/f7BiCAO69aG1azwAoXWhBZsKW3jltPkuPvs2LbjBo
         JwXrSKGQII0pKuXL/MXm6gQLed9gdufkWjILfnYn/XtC3/nKcEYItEIyQUFYpapJzayR
         W/yA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791211742; x=1791816542; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
        b=CQ1SDXcVdGxtlfZ8KphlCN/cK+bJFk3I33vmkdpEuUZYZKdpPf8XMkJd2gNyNE+aIK
         5PpMXTUcC6nEJfWBAB6jJK4oSrvOY6AIDdKEux3Gc5Zc7gVwLAqrK54KTOY2ylFL+j82
         /Kpi7llzmUe5HvFay0NUfABIz7je0NxnJWOLSSzvzggDrrBrQXBhd2XhuaVbkCJtCbmH
         O5qAslpr7BxnaU43gF0YbHPfyx+w8p0mke3EgcDxYXnXiz09WLrxwfCNxpOkYaflxgIT
         xymiFhkx671NzFBtfkJH1C9oLrKAFURp06g4wPOH5Hesnbj4lPCSCkiAjtDJHioKahrp
         RYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791211742; x=1791816542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fB2EelR9jUud/JtAYG8OEIPQSZV00QMO8xof8XIZq/s=;
        b=I1PExEyCv3G7uyVg98DR0yPH945D3fFDFbkO4fpc/Y626aA4L908D7hP9rVb6BqU1c
         4DlBvmMKz1j6Am8Ds57Hlpq0QXf37nKia7gCqs9hHZQfgmkrqt0R4LhV1c2/Ck07GqQu
         YpThULTgZv2yIbFnEvxiF3XvyiiniWMqcrCcA2pyOAMWyesazS6bCCKOCEi99Dw/7GgX
         ofbwaT/nQYu4rcukN/aSn0k04RU8Kxsq6XVrGtiL7d5CxcayGfIrlDugsoBVnTYDTa7J
         8OediUaaaQShD1rFuIGCNY+G+BhnsG+djy/m+hMrl38Pn2C5W7sDac8Ec9MG0YU7RcQI
         OVbQ==
X-Forwarded-Encrypted: i=1; AKwUvByxmFMqOxCDq96g8knnGJLTTtaVO0RXZndIsyyKjJyDBLBiLhh+zJQYJiUeWC2E/5ECQ0Z8n9S2@lists.ozlabs.org
X-Gm-Message-State: AFuF++mYBotqGxH2o1hLTKM5wDXwrlbArfBOSI8UOWdGmexEsE7JKGfv
	UZ4c1QHmE5UpTiz0rYPHH1NNZkDvvBijOIuE0CaCKiGqwwn6Ij2BHcegE9Jr5r7ur/HfcHplsxK
	yybMrw2kn7icJkATJe+ysqBlqiIPU9YI=
X-Gm-Gg: AYBFou0Bvu93FWUmEXYSPGml32icTM/DPPLuNLYDqlG7hZvLxwY4xL3CMqVpC2TIlZ7
	0y4Xd+6Naiy75O8tKm7xW7UDJPdWms+aPH6cP8ZLpjeStTm4YbByGwaqAcshMwrVUq9kt0oY7YE
	ZfbvZbtOFvNSd26fVYwjBxkAxI4dRErEkMmyxOou6OCZgYgUA6kjPFG22NJ2iYeX5P9nSjuO6Co
	uk+EWGFC1v2KyIAzz1NlSxg60tsUNZNptxT6/kV+YK7yDUZqteJ0lxtp6gQYlEzCCnnbJwyiJIO
	oPxuWLfkFpqHJqrwoDgBDm2Fpp7LBC1DuMo7nC/FrvWe94W+n1EGBKV2WMCLQxSWYiAM
X-Received: by 2002:a05:690e:480c:b0:677:b1be:b19e with SMTP id
 956f58d0204a3-677bd373b92mr1921206d50.42.1791211742356; Mon, 05 Oct 2026
 07:49:02 -0700 (PDT)
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
References: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
 <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 5 Oct 2026 20:18:51 +0530
X-Gm-Features: AclHuK8FXl1Xi-TJ1LO2CDPJEBnrHjPYEMHi6FAYBhWO1gMQvCkpvwAC2mRCkhQ
Message-ID: <CAMFFDGjK8xg=S+f3MyaV+6hQ+6x=g-NQhEAzKMu+X=vdkauq6A@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Billy,
Thank you, that explains the behavior we observed.
The use case is that GPIOP2 is the physical power-button input and
GPIOP3 is the host power-control output. The board normally keeps
THRU1 enabled so the physical button is passed through from P2 to P3.
For a BMC-initiated power operation, the vendor temporarily disables
THRU1, configures GPIOP3 as a normal output, generates the short
active-low pulse, and then restores THRU1. Our OpenBMC tests reproduce
the SCU4BC transition and GPIO123 logical pulse, but the host
power-good signal still does not assert.
Since THRU1 and GPIO123 are mutually exclusive, this cannot be
represented as simultaneous gpiolib ownership. Would the appropriate
upstream model be a dedicated power-sequencing consumer that
temporarily switches the pinmux/routing around the GPIO pulse, while
the GPIO lines remain owned by that consumer?
Regards,
Prasanth

On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> Hi Prasanth,
>
> On the AST2600, the THRU1 pass-through and the GPIO123 output share
> the same path and are mutually exclusive, they cannot be active at
> the same time, so having the pass-through pair also controllable
> through gpiolib isn't achievable in hardware. This matches both your
> observations.
>
> Could you help us understand the use case? If the pass-through
> already handles the host power path, why is switching to GPIO control
> needed at all =E2=80=94 rather than simply keeping THRU1 enabled througho=
ut?
>
> Thanks

