Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66386606A31B
	for <openbmc@archiver.kernel.org>; Thu,  5 Nov 2026 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jLHNr2jqPz2ygg;
	Fri, 06 Nov 2026 09:41:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793885291;
	cv=none; b=TjmywzImbcOOx/f1WVJ0KBNbrJvsjwegwr58yAaGWoqb20vYRQWVJgDTsB7bnRDQKuuheHYdE1FctRIrcY1LTGr3mg7RFrA+tu570wzx8UCGbudssqnlOscBTwvAnUzX2EC4r3nPRrZdjGg/+aZKrbmw6ltcCUMnT8PgTkM79zTU/yfl9TkYGFAWRcGWbasbAbciGLapdIUheiDgXvKcbP6ELLedJncyniAgAY8YdMhnOxzPHBp/7qgJ7w/xnUdp9wlHTqXsqVxPRZ60mLVc91PucSwTNik3j24HEpt1g+M+5VbTr4QOZbnVPyuokV416q24uayB3xl+kWNQ5tDJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793885291; c=relaxed/relaxed;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovL+T+KjBrYf3YYn8Ti3keAFnH/E0O9rp0PtRABzF4OVzUI2CF+Ji1sdzh5ensEZrvNBn0HRNpvbcFqdqfD9IwsQh1W63EwcZ6jLc4m4HdQ8iT+ehmZu3QFXxgWLcU2R+sxBowg70+s+PUB61Le72M9EE2efep0AGZEuIdXPXGLw4WoLMsYR/Msp0w4CUYAgyn8WXTz3PdE8BhFb90hXaS1AoMWmWTa/RrEEAtnLVSH71/KyYskR+bDOvyMGkFqTdd3jDg3J5P0Ce9F56baLH+rWZn6gH2m7O+Ib08TW7Qaz74NMBD5iv1xaBWmHpTj1ppKB/r2yWpq1+1I8knDTAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XPZFFODh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jL3625Wjgz2xSV
	for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2026 00:28:10 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E2D642E41
	for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DFF1F00A1A
	for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885287;
	bh=8ru4HSnwu1oQ4oTSKgIFmon8BQMS/0IiXPCyBWh94vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XPZFFODhwzMFOPYnFOG/f2gIhmZlzFGR3VM9E9oC8a4Qge/gN/2bdc8JVTBaYSriD
	 dnajOTcdBBJpTxMHp+10l0Hww4xnVZ0fetIDHktnLlpt41TdKtG0jLRinIADCl4h2G
	 H9jkaltZce3g4ycvP2X5mPYMBA1gfAjsP5sGOg2OuR4EM5LCfO+vp/8U7tRacofM34
	 iDJ28HZWn6GSeK6C8KNWCQLlFKH/3v5rxnq3Z53fw/SOOGmAcXpl7LJJaarkym/vD8
	 qRWNwk970yF+LqVNBMWI1q5U5bK09AqlTE7+DQDj2FA3l1W0Orkngo/IVOfFfSff0z
	 AmmNONwv4RLBA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc346401aso1397930e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 05:28:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByUIDqjDk8TpBdf4YKYgPt5vSfr+Ow7Cf3lgpPa+qRicXjz01yq2wtdGcsOc25HzXkAp893aYhZ@lists.ozlabs.org
X-Gm-Message-State: APuU4Z9UioU0lPbzEWYSqPIIaxkrksduiXlvYIP3/ef6NQeI08go3BwD
	L1Cc2cwk22AinW9MPzwvm1sEUiyUviS5XuyK8N+txf+NNCVLNgdum7wvayZtenpftm2NONAnUEk
	WYJ1RHrPfIwnuHrbtI6bI1qinNHG4SEQ=
X-Received: by 2002:a05:6512:68a:b0:5bf:ec95:41f5 with SMTP id
 2adb3069b0e04-5bfec954634mr3564188e87.36.1793885285940; Thu, 05 Nov 2026
 05:28:05 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
 <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com> <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
In-Reply-To: <CAMFFDGhD4K6PN8G+c-hQAL6RG9sVkjo6SXHB5===bYswHh0aTQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 14:27:52 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
X-Gm-Features: AclHuK8sEV6qv2B1_vrP6a-7LhjJiL37qYSrwskqM676CSWb53N83wbpRw8_kUI
Message-ID: <CAD++jLkRNSXt+Er3tnnucpAAj=wPa5JFMsdLLixT=8MnGYJoMw@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au, brgl@kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 5, 2026 at 4:36=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:

> I will verify the requested base, rebase the October 22 version
> and resend it as RFC v3 for renewed review.

Do you have to still keep it RFC? I normally do not apply
"RFC" patches. Consider dropping the prefix.

Yours,
Linus Walleij

