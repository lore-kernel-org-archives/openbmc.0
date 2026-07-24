Return-Path: <openbmc+bounces-2314-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE7BC531C9
	for <openbmc@archiver.kernel.org>; Fri, 24 Jul 2026 21:46:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4h6M5F0Wx4z2yYf;
	Sat, 25 Jul 2026 07:46:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1784928832;
	cv=none; b=m5ritb6NOpzAJXI5xjAJ9QhXVwiIAylD/9uVzGOQU3aNrEqOHglpxY9y+4k45pl+KTE6XFIwIXB4NbJ58crrhYcUl2/I/aIaeuAIi9WzfcgQUQvok7DR8tJA0Hvpj8AkC5vrMxExi6+/YypOrTa9wCCyiO9Cavm3Tes0zIFBJ6NqyIVVJaXvhwuSHgYNV7dG3khKsQpuEZmaBKfgnJbSFB7ErjbeIfojmAIAdGrR+gU+lyjavb/txyKBrm680c4E/bRtyYZ/CijCcFRmU8P7FfPYYmQxLQKGxNqxikdQcY+g2szv+lp0a5FWjmjLsYynVT3AYlR+W3MGDDuTw2VFow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1784928832; c=relaxed/relaxed;
	bh=yHFCHv1SQW+IjFPxEkHkiDP5RWfvxON6aFiwmXE/HIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIM00QJ7mrwpEfSY6NFvxpkvTTBV2KHGf2PwE1dMIjg0pkMsVpnbK2G3TzdJZsObyULNyhcL5f0sPmE9xk38r+yYcKOiSTcuB3t+v82G1XFaQPjyEMK9QWat6Fmb0NlCwt/KstIXbgFVT5VHY9CDk6AxxNJ5O+yB1ybnyHZfhFQGm2n31m7R/M12mV/Yqm7iY7u7kdvTe+tHRatk469JmVXGmY0usy75nDsdkzR90cajXhJQhicXnSH5xrnKclpd4NqNpL+L37EknYjkcLlyWxwZ3bRIvEQ3TS872/3Ut+qsH9bzTzRMH0qt/hFTs/PicfG6Eq5J4/k1TUlmIkDcSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5Ar/gw6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R5Ar/gw6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4h6LpQ5RQfz2xRs
	for <openbmc@lists.ozlabs.org>; Sat, 25 Jul 2026 07:33:50 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFFE760A84
	for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2026 21:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874351F00ACF
	for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2026 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784928827;
	bh=yHFCHv1SQW+IjFPxEkHkiDP5RWfvxON6aFiwmXE/HIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=R5Ar/gw6gIgxdzP9lo0Kzmf3s1KtXe2ELNiAXq6JrRmVTErUR3d7t/0QYrE9JlXKl
	 ZNGzmwtfoc7V94Pw9xL5a1Uz+v1qlHkjuTvIxcNWzu6AZOxYU8PC6fCk2jpEy4LAsU
	 u1Q4xp4GA7yIykJmbcQ3PISNwiXYf9G6aUnaF8kreKt7cClnq6YgSnpJIKw7uFQYoV
	 UlS3xGDwxIkLBq9vxAhOpoCzmb/3YJqoBOidk/3Ij9q25ePy1ptgEyvMSlrsEews6I
	 krJsX6RQZucdOwNzqPNxLb9ooOryKNTdxBYPylyCjGAxPIwa+AQ2JexqkKqlLZCIrd
	 qQU7nTSjnf/Bg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aea0fff535so1021107e87.3
        for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2026 14:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQ5UL3LVb4FV/lr0fk7+kaqToEZELh5U45Lm50Cnqw/16bXhaauWGik6tNcsc4bFReOAZfFBn2@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1sdcnpLRZxR+wcJfiCQCZwUzBbjszXWSM0ZgguCf1pHD3xhIG
	8DN/wC1EeXL2mrX6J2ekBdNeYw/NOJxGlPHkrXjKT4pERv/czpzfYTBk/W4JqbRkfNcnJjxkdOk
	Pbjk9v5uA7Rqp3TlaqOQivZH6B4c+GDg=
X-Received: by 2002:a05:6512:65d2:10b0:5ae:c745:f39 with SMTP id
 2adb3069b0e04-5b2b2f6f194mr1567318e87.44.1784928826320; Fri, 24 Jul 2026
 14:33:46 -0700 (PDT)
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
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:33:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSS+pgSkDWKrC5jfxmSgBNqFPOo_zgCmHCzNeNX5pF9A@mail.gmail.com>
X-Gm-Features: AUfX_mx98nMos0Kx5oubZwpKrlQlM33i_C7MOroNH_eLPRXK_I_VYrccjf3ZYI8
Message-ID: <CAD++jLnSS+pgSkDWKrC5jfxmSgBNqFPOo_zgCmHCzNeNX5pF9A@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] pinctrl: npcm8xx: fix pinmuxing and configuration handling
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, brgl@kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 2:29=E2=80=AFPM Tomer Maimon <tmaimon77@gmail.com> =
wrote:

> This series cleans up several NPCM8xx pinctrl issues found while
> comparing the upstream driver with the newer Nuvoton tree. It trims the
> bmcuart1 group, enables RMII outputs from the mandatory RMII mux path,
> fixes the RG2 drive-strength encoding, and corrects a few GPIO and
> pinconf details.

No comments so patches applied.

Yours,
Linus Walleij

