Return-Path: <openbmc+bounces-1673-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7935108B8E3
	for <openbmc@archiver.kernel.org>; Fri, 20 Mar 2026 09:51:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcd9q6wGzz2yZ6;
	Fri, 20 Mar 2026 20:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::630" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774000271;
	cv=pass; b=kR0N4rV9Cz+dPA78Wa+dMmI/60wzmEMvQyN/Sn3kl7KGNJFFoHRpIQdHQI5hhqCA8YHma+OIEq7z67JX14k4MKMrnsXuipQv/sLv86f66pWbZHhubE5MB2RgWeHGaK5YSjfYQYy8pZwAamesQ1M18GZIOg1luqQUmAyZ7HNar6IH7+v9CGVz1OpXoEEMEASN8eUV0xb0V/r5bIIdL8skI537OQ9GEefFiDxt/sUSk7+fGJ1AwaPG/Meme6f+4cZBbgGSDRSRSFWS4iujJBppNqHk0+yNHWxFZEYw6q45YjWnFh9MPswRXfWqySmvneKF0OJJbRB58rrD6bgc7ovpxA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774000271; c=relaxed/relaxed;
	bh=Sc2L/VVqKMiHWN+iMN7FgwWBA2pWSLkft9LblFD8zJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nT/qWrnmvsNXbZBQY1lwuYqxA1klXIEEVe8EXQOgGW+1q1aXtdCgfFjy68nnG3Z+6vTGlNBX/bC33m6P/Lihy/X2n6i04qyucQeBt3mDQqWdvqPcl9f9ksqfqcsUa+H4ayhPb9QOdpPacDe4NsOC+lbqAscxL+kIXTC1hRkdNuZYSRYQiVeb67XZ9uDIwQTaaIhuFhNbh/DRcD6q0aX1EMqXse/P/bVVDWkHDf+5JiUM8Xw9eckXl4N8MaHQFQY68Q8tDJyYMLlCggU0WrdE1+WaENzi0u7B401SplQWLxAKjTMol4AysvGHmYQo89Gr6cIir7O7IBYHk4zlHs9JJQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UP2LPSqT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UP2LPSqT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcd9n3jRqz2yY1
	for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 20:51:08 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b93698bb57aso362278866b.0
        for <openbmc@lists.ozlabs.org>; Fri, 20 Mar 2026 02:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774000263; cv=none;
        d=google.com; s=arc-20240605;
        b=EobxJ2ENFQOo9n0PG3C3LAMgXlysuaRAgXZ+ZOV6D7m1ZeUL9/i1sAMIJJiQSJ8VVj
         +jpPgglsQxmd5c+4K5480ig5mhLRB5X38Ae2fg0crjFVFbSE00hd8mzenkB5eBgH2G54
         vgl0ywF5oQvcC/flbXszp99qNcHupJHjIYhJBV+CyAMouAql3lNYmhXfiY4YtMhlRvDF
         0SuIzh9bjp5NQ6ui+xihFPsF2IPKU/ibt4abBCRUNdmjWionlRL1lZZ9XIS5b+FXYp4b
         8HC3bthptmbyvKa09WIdBEyWFbYaVR+67CXo/RMcP/fEqrja3Lk7uns790G1XkPO5use
         MUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sc2L/VVqKMiHWN+iMN7FgwWBA2pWSLkft9LblFD8zJg=;
        fh=FD0vqnDumQ9DSr/xVRIdO7ly46uZxiceyiQs2zsUQTU=;
        b=RN3RE487AxZWhWA5qX/eisVmOcvjtvGR/+yXCSAJSHNCn5AMP+tOPbBvK3JQfNurQ0
         h+UgFh4bb3vSfhqZw1JzN5LcBBO+kPt9qtiX2+2qVaKe4phCToxqQLmQbut+3FrDX8j7
         VIPJ40rkvEeYNVDnj3peBCFumHbVxsgwNcnFV4xl8BgwXZm6iOW4fWAivEWw3g/uzzw8
         v6W69aPR3kDQzwnMdqgUGmJukjXN0t73egkVI2KTbAfZSsuhF7mdMX8G5sQYr3/aPBIM
         pq8hUA5+K5j16z0Mr+C07FDeHUayoaT+aWQTNlz4XpZrN54DSD/G0ma6vIvUfTQjsJaz
         0ngA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774000263; x=1774605063; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc2L/VVqKMiHWN+iMN7FgwWBA2pWSLkft9LblFD8zJg=;
        b=UP2LPSqTbodTeO30wmAO+d9MWdLc5nsK+yaPooLdETbUjzE84+74c+pSbV+NRbTyTy
         qx96bDvPhKWklBwtv7h0WHCSDO4LA+3i24ObnTNBFZumurol2mG8YgsBvAyO4dybpfoH
         XdQw/Ved1MGxdWRnpMRuV+1CPnhQdl/6GzYbgqdzrXhHB3QbfqBwlSpaX+BoBQ3SWpl6
         D3iPkeo4O7QCj+jpuWRquvtyw0enc228s9pCwyEDWUiEE6HGJV5SiwuRPMuSpllrkv3n
         t39LYBBsrT7ceoMoEhP2qBwvncqBH4apDqE7hOCiubF2oh72BqSaqyAa3XqVUmMlOe5Z
         bK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000263; x=1774605063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc2L/VVqKMiHWN+iMN7FgwWBA2pWSLkft9LblFD8zJg=;
        b=Maq7mlCFgW0ueCwLHcwNj+CJcziRtOTbGe6m5jml2wMQuB9N6Rh0UcagtK1U5vW3dv
         CJRkBtekUOjoB+qUglI4GGM9WX9yz2umRKkT81NXAdLKuuD5zgZZKvXKP06NRVJjDEU3
         +f9qyusC/mccWMZ5q5MnKrKSgLtZr8e9YiHJGqBX/B+B82BD/RWB0lEHbkqToYCpJwfq
         HGpatW7f6Ax0NG38yXcyaNK8njfl+tC4rcr1i1t7/fqnNFmEj9nvZb7OeTO5Dv2eCL1M
         3SpkFoD3IVDmHK3USi3fQuYE0ft6W/WsSS/arMHr3KhpMWaw+Hn90dCSfWhk7H6ajea1
         TBNg==
X-Gm-Message-State: AOJu0YzNzSE/TxmUZzpFicw9sNrBcXZrCrBbpUdvUL5Zn3/8jnmn7syx
	+3PR9K7HRIQNtTlkEh3JxksByFqdCRxdIdnV1ggsDYP2UW/onoI6ibntJcGcWAB+KAmTQw5VV6S
	o6nSiXoX6l/Z3pdkirPLKwGkGtqvUOpg=
X-Gm-Gg: ATEYQzzL/hVSrDWZBAr74OpEUxSPCAxNhYFEsCyn4TJNTP9FANMH6MkMXfdz501Z8+H
	/7p8wtRuKzp3hJ2bkS0XGSGnJXbNLRPO2wrUltlmZfjKEy2eHM6PjbVKRxtDj4kHMuzK3Ar6XZw
	DBmvQRNKTbp59rzvvawla97Pnz8RiNIdEPpfNKN/XenTWHyhM8NNTs0lcV6CGmtrfQK3LPivX64
	ftPjP9fMPf8auJwh0VoXBeBRKHb4GRfAvJhDifzdQJ1pkG/nAU9NXrmunKrKC9vPID8jJzFRjsT
	j8A0Lm8p
X-Received: by 2002:a17:907:c016:b0:b98:40bb:332 with SMTP id
 a640c23a62f3a-b9840bb219cmr40850766b.24.1774000262852; Fri, 20 Mar 2026
 02:51:02 -0700 (PDT)
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
References: <aXDmS4BmR6AGXKGW@heinlein> <absG_8pQilMHGMnO@heinlein>
In-Reply-To: <absG_8pQilMHGMnO@heinlein>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Fri, 20 Mar 2026 15:20:49 +0530
X-Gm-Features: AaiRm53nKQfOy0QRizQ-RiQIiKhrba22C6_SWEV1QfSSKMv0OeiCWq2q-4w_Svs
Message-ID: <CACkAXSr69mM+rQ0fbZ290tda3NUszwQhvZq-Lb2Vrwqx+6spqg@mail.gmail.com>
Subject: Re: TOF elections for 2026H1
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000007fb27d064d719f92"

--0000000000007fb27d064d719f92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 1:48=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz=
> wrote:

> With this being the most nominated-for election in TOF history, I would
> strongly encourage candidates to reply to this email with a [brief]
> campaign: who are you, what work have you done for the community, why do
> you want to be on the TOF, etc.
>


I=E2=80=99m Jayanth (ojayanth), TOF member, long=E2=80=91time contributor, =
and maintainer
of phosphor=E2=80=91debug=E2=80=91collector and phosphor=E2=80=91certificat=
e=E2=80=91manager.
Along with my regular contributions across the project, I recently
contributed significantly to the ongoing *clang=E2=80=91tidy enablement eff=
ort*,
helping bring many repositories closer to consistent clang=E2=80=91complian=
ce.

If you=E2=80=99ve found my work helpful, I=E2=80=99d appreciate your suppor=
t in the 2026
TOF.

--0000000000007fb27d064d719f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19,=
 2026 at 1:48=E2=80=AFAM Patrick Williams &lt;<a href=3D"mailto:patrick@stw=
cx.xyz">patrick@stwcx.xyz</a>&gt; wrote:</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
With this being the most nominated-for election in TOF history, I would<br>
strongly encourage candidates to reply to this email with a [brief]<br>
campaign: who are you, what work have you done for the community, why do<br=
>
you want to be on the TOF, etc.<br></blockquote><div>=C2=A0</div><div><div =
style=3D"font-family:&quot;Segoe UI&quot;;font-size:14px;line-height:20px">=
<p>I=E2=80=99m Jayanth (ojayanth), TOF member, long=E2=80=91time contributo=
r, and maintainer of phosphor=E2=80=91debug=E2=80=91collector and phosphor=
=E2=80=91certificate=E2=80=91manager.<br></p><div style=3D"line-height:20px=
">Along with my regular contributions across the project, I recently contri=
buted significantly to the ongoing <strong>clang=E2=80=91tidy enablement ef=
fort</strong>, helping bring many repositories closer to consistent clang=
=E2=80=91compliance.</div>
<p>If you=E2=80=99ve found my work helpful, I=E2=80=99d appreciate your sup=
port in the 2026 TOF.</p></div></div></div></div>

--0000000000007fb27d064d719f92--

