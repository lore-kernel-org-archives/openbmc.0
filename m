Return-Path: <openbmc+bounces-1857-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC222FF8860
	for <openbmc@archiver.kernel.org>; Mon, 27 Apr 2026 16:09:05 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g47mC2yn2z2yFl;
	Tue, 28 Apr 2026 02:08:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a2c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777306139;
	cv=pass; b=HZEeSLlZJ258O4o2wweiC4E63ztpKVf8azS7/euJX0aQzapEM0XRxuB2dpvTD1E+YylvH9ygebJobCYXnFnfNEJvk5I72v7aCp3KCAz3Tg3dy076wMkHFL2G98q2KiGv2OY1VUGsTj2Q6aXuD564W1Ow5E/aHF6lveBXCGyPJhmdR2vhTT9k1cwCGM+k/LWjpExZPiWMLjOkjufMJviK8iUREHcLN+G6/2H7anU2rp66NWAQLKUNDtHPh3j7ISRMCdbEUsoVRV/ZzjXtagVuhaQpvWoZjIYhWhn3eOIvB9/Re5ou5MOMLMvjSAlCuuCZ1rMEuifLoTQ6qVTeNltc7A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777306139; c=relaxed/relaxed;
	bh=eQLblr+BjjE/swYXu92lTRWtyaQojvYvLAoF9IscxeY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Tby7MNOoj+TA7nw/rqIf51T13s1PeASUw6y4kAOT9VWc/d7uoz/qn0P1kKK6clmze2ONy9zxPGz3QtdoBiR4pwVw1EYCUCs0VQn7gFPVGDjHFpXbyWIcTBwKDfzm3Q6ad632ioi/0PFt9rDBjZcD2U19gmcoJPWLEJVOnlfdjd4xi3l/ehMwoh5uBIUaIvpzE6V2tdUQGywV5vnIujK+9JWjiqRkQqvRQkq6fwLgeEYtJCwdRdE6EDo2epbSVO+taX7cCe2WMLjHNME3D+j8BJT97EL8YQvi84I5n8SDfGD4TBkn3V7deyb0G7e8hkQRL8xkmczGYpFD26EIXa/Wnw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LtM9XTkD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LtM9XTkD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g47m93yllz2xb3
	for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2026 02:08:57 +1000 (AEST)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5675d609621so8428548e0c.2
        for <openbmc@lists.ozlabs.org>; Mon, 27 Apr 2026 09:08:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777306134; cv=none;
        d=google.com; s=arc-20240605;
        b=ZPlHu2wWfhBNlOoFs1mnPILxJN9APKXzutFhQQ6Qokg+jHy3qLaQeirH9xiujuv+pe
         L1svJHqi0Aj/XQ3uLi9uLM9K/knsTRo49zJhp4dX+SFaQMWvBf5PzjctLGCaPbOo0bIn
         uhzB1FjSMeCOvm08GhYDTeS2PJN3en/dJ5TR4b5zIjudpXksBnHk1QJz8K/z+Z3MiTym
         OhhQJtWtxx7KcQAAk9YniCaae5HtIvBOE185nD7/bse+1vbRh6YHuA+G8ER6EtbyO36Y
         VtxzaKdhm8lEYIlPUenBeLtVTWz3iCBX0XwHxGW7P+Wr8QnB7SGOfg4pQMC35dLodzbJ
         XfJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eQLblr+BjjE/swYXu92lTRWtyaQojvYvLAoF9IscxeY=;
        fh=aZHsIjtL9eoj6fdbN7sv0+road0mHYR+UXGGFldblc8=;
        b=XsYLFN/tls/L+RDoCV+2qC8PA116TW5NUcAwS4ZHbEiwbND46X+Ck1OtvPm4YXEKTT
         JE4ZEjUFyMhRFOtpFgj0oQBRGg97zDJweveIW8f7qdLOOh5NLYaDqQmSLHkX9pnyhkb0
         kB/XPgaZiFSrRGO2rbZllcl7lAu7ms/RLIoJYJPDmM3KE9UnZgXx8+jHfocQAKN+9tEk
         ahu1t7TMFc2SzZaNtRaWGNacAFdIkaVi1CVJdvhlghHVYlB+F91TVGmFNdmfgJDGOFVa
         QQv/eneDY83PeCHn3RuCNGmxl6oQir4/XXO0TpJGSR6Y3bRIRElQH4lULNJOU/ANo4Md
         EQNQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777306134; x=1777910934; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQLblr+BjjE/swYXu92lTRWtyaQojvYvLAoF9IscxeY=;
        b=LtM9XTkD86lhVNjr5BYanSME3EdZGS2qpBuzjPljLf9kYjIKO2uDuyHwBQNhz6C6Nc
         NT2igw6qMaEHSGODkjt2sNjoDZvOPyernC8pzS9Xyb4nX4AAGbQL2BwvaQsr+xtfamNh
         EnVkMMSXtDhOqfoVy10EWXEBt2XC1acwKl45tsl5LOd1XKssavGWqtnFfMjgwSmyH+h+
         jABRhAoWFaqj0BlyyMNi9d2BoaIr0x4UU2MU3yUANHSKSSGpH7MyzhEUer5Lua/KLVw2
         NojF2lTATg6aVeOfsy+jdqjDI33eN6X7DTFeZFMcw4y0GlUarU2SMTbKT8SMbMet4mN0
         5xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306134; x=1777910934;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQLblr+BjjE/swYXu92lTRWtyaQojvYvLAoF9IscxeY=;
        b=jc1q/79u6XZL9aKlNyZBmNp+jlhZzw+vVGhBGf/eVFGteGx//EV6Y7KdYFbtZtOiqx
         8cThwl9bvEEyvgWNq9rCxaHjMFw1FVJgyCQNYWsdy4VksfmqhE+e9OERXGfsPWsXrRAa
         WE7V9rlptoPdLObXPv/DE/7eUizR4gSgUb2AjwgDdZFwfe8AT2W3yGHViZG0JIhIqnji
         pHoB3LypAZAGtnTIf6jysHcSsCUzmghLF4m6SP0pmMSMuwu4A3dgpU2PpvK8S1ir8tBL
         UdP17ocyCofhwboM6k0ObyoXhUb0DouBuXVf5EaVPudUSxZO9lq3SvakxwUOOtXqOmaj
         Kd9Q==
X-Gm-Message-State: AOJu0Yx3f34vUD1+LUTvktz7e78XRBwv0yQKEXCtP1CUwMaJdCaHPBoO
	wvRfhwraX/nWuY87r67Hs6Fybk8kRPQcD+iIzdZs4FKUtQ2mHBcP8TyqOkH7g/5wwwfJCSReKE0
	kb+SSL9hQHXkOEkS8k0v8ve2SyB8S7ufpnTnG
X-Gm-Gg: AeBDievtgo2VKuJBl0hf11TIw+0FiNP/nXW1q5QMVeACFE06ksUS98cxzd2XiDpYJyA
	fSkZ2XZdNwdf8YxN6Nqi3fxN1Ol9RTnOUQHlUrbBJE7m41s1Z4/KQQRawm2ojt13W5g/nPgLLKM
	pIB277YM0rhBE9ZGoEnmZnDd5FgERaOiYWLZzGxk4FTaZyUmwjCauwrxaVPhxVHz0/jhUKv4xsK
	7gqFa5OCPG1dWXp2OOsxKoicMr6u8Z0Mp+qSwcjd09iH7ks2EBID9R4jgP5rBOUvv0RrWfzYjjs
	Lrxlgsg9tBxGxLXwL+RkGYCZZVgEam9LURpinfM2m0+c11kn5kooREGbOW/LeBZrebCiL950F/5
	3Pas=
X-Received: by 2002:a05:6122:90b:b0:56f:bb91:4861 with SMTP id
 71dfb90a1353d-573a2942f6dmr76070e0c.0.1777306133677; Mon, 27 Apr 2026
 09:08:53 -0700 (PDT)
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
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 27 Apr 2026 11:08:38 -0500
X-Gm-Features: AVHnY4KZo7457tIFn7vqE4NSH-KPj8YwTtWhGe8HhN99DpPMsyqPzieioi9Ggcw
Message-ID: <CALLMt=pNb5LNP3niks=6cECC8bBbP-2XJ3aoxQZX_M05AHKMdQ@mail.gmail.com>
Subject: Gerrit/Jenkins server migration this weekend (May 2nd/3rd)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c14bb30650735431"

--000000000000c14bb30650735431
Content-Type: text/plain; charset="UTF-8"

Hi,

We've been running gerrit/jenkins/grok on a bare metal server the last 5+
years. I was recently asked to move it all over to our virtual private
cloud env. Long term it will make hw upgrades a bit easier and hopefully
reduce the risk of something catastrophic occurring.

I've created the new instance and have started prototyping things. My plan
is to take down our gerrit/jenkins server at some point this upcoming
weekend, replicate all of the relevant files over to the new server, and
start them all up there.

The DNS change goes through the Linux Foundation so I'm assuming everything
wont be officially up until sometime Monday morning US Central Time (LF
will need to process my Jira ticket and roll out the DNS change).

I'll keep the #infrastructure channel updated in discord with status.

Let me know if you have any concerns,
Andrew

--000000000000c14bb30650735431
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>
<span>We&#39;ve been running gerrit/jenkins/grok on a bare metal server the=
 last 5+ years. I was recently asked to move it all over to our virtual pri=
vate cloud env. Long term it will make hw upgrades a bit easier and hopeful=
ly reduce the risk of something catastrophic occurring.=C2=A0</span></div><=
div><span><br></span></div><div><span>I&#39;ve created the new instance and=
 have started prototyping things. My plan is to take down our gerrit/jenkin=
s server at some point this upcoming weekend, replicate all of the relevant=
 files over to the new server, and start them all up there.=C2=A0</span></d=
iv><div><span><br></span></div><div><span>The DNS change goes through the L=
inux Foundation so I&#39;m assuming=C2=A0everything wont=C2=A0be officially=
 up until sometime Monday morning US Central Time (LF will need to process =
my Jira ticket and roll out the DNS change).</span></div><div><span><br></s=
pan></div><div><span>I&#39;ll keep the #infrastructure channel updated in d=
iscord with status.</span></div><div><span><br></span></div><div><span>Let =
me know if you have any concerns,</span></div><div><span>Andrew</span></div=
><div><span><br></span></div><div><span><br></span></div></div>

--000000000000c14bb30650735431--

