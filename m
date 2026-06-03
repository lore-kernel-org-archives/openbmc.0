Return-Path: <openbmc+bounces-2043-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F49CD6E55
	for <openbmc@archiver.kernel.org>; Wed,  3 Jun 2026 13:10:41 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gVp3F5wjMz2ytV;
	Wed, 03 Jun 2026 23:10:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::935" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780492233;
	cv=pass; b=m5jTgGiYwbvFucvGYSk6wlTgKUWhW1+PzRmrVy2kBCc3n2yIAj97rj0gD6eye646WMvAmL9ROIuVp2ie1yYiEBk1d4n8oa0KRVEbZApVo3fjRFm1yCNFxuBjifP/8kXY5ke1vDErPnVGNlLGPdQ3BiQb0xWuKG+CZb6soEQzK2vLeyAU6PbyZoIcIwIoXSZ87NWsDT874ZGeIvntF/L9jBN879FslB9YFIYKwPvF8fzq5Fr5W0KX9UzNdWibFtBK4U5XlxETC8x+sSRcxvjz60IS/aO5TtTRUziuquV49Tiw5YoAyXnud/FlJGAmaI/m0Z9x3N9VyialpukdZMEZRw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780492233; c=relaxed/relaxed;
	bh=mxbBwFMfo5ZBxkYMed6O4CIrLQRPFC/p3FQvoWrRK4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXl/BWjyUo2hFM5sjWAhxbHXtw5ViyYPDXsxoDXB/SM0v0nJ/H5cyNTaXDX00+1BU60FRatZ7P0JjF2fLW1p3Tl7IZfcA0RhqeBv3G5RaX6I7AINi7w/7zeFE+S+DvPXv+jU2NI8U77ixqCoz87bd4b4UUaMw/mtTmmpp/J4wP4uVkh4WocvVMn6eSd0s5U8PBpUJ18Bnr8/b+w9HHYv/CQ8riMq2dbrVxHICmAo0ncbX6js52Yn8o7MXBIqul7q2OK8XIWYlGsX/3xtcUXilE2ttGipAn7a1G12oxDZI+gJgAQfTmqKO8AHov3b/zQ5D57LSMdLkE6xkaDhO6/3pA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DR3JWREH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DR3JWREH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gVp3D02Vkz2xk7
	for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 23:10:31 +1000 (AEST)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-9638f7e9896so432507241.1
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2026 06:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780492228; cv=none;
        d=google.com; s=arc-20240605;
        b=XKXiiHRHy8Lhh2F8x2Cx27UkVjfl0ytoJLm8Kj83b15XEMTF4HyXejERbNVHM5dAFh
         3oorGQUWi9qmzeCde0L/82tyC/WQYsue3sDXkYQp6235jsDIrRHxloN48pbrlrarplhI
         Qw+msNNrqHB0/T6feb9JOfs9ocEM+QqE29C61tfFxN9q3N3OzJ8ahADpdeVUl89YXaQZ
         8e/0Sd8nawjy2XOKGFN+X63yK28+HzWXIwsUTRpgTfuj+7fEMnwfP/ounxACnPVWvFJm
         K0ps2OOBhJYdoPQs9SUaXrse5HtXQ89C+dZI8ylz5TYuZl1P8UjpRC6VZQQEqu8Ezp53
         EBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mxbBwFMfo5ZBxkYMed6O4CIrLQRPFC/p3FQvoWrRK4Q=;
        fh=b67LxACKoSNZZs1JD3RZc2j2vLwTORVPnfOe8YQEuZY=;
        b=Ld+0UieOspruNRHmAMZtLJY60X6AFRLWwnuuiIUIiNWw/0nw50lts8KNXc2xU3T84B
         0vYBOs3cmlrzXDpz9FHM3DwDMwR7AEMTEyrGZrdV6N3FsOFEvThdvy+BCwcmD2G+Q2wk
         HbPEQCQsLC0T8ZDdy+wweeRl5DswGwzprJJaMa1PfFjLfusnx/mid7CJJ/e5TaM9mu5f
         70Z0+zdfLpGN0nJ7PTte9wD5pk3pPW4JHIPeJtNTCUPxwDAlviO1NEb8JdZLScs1OCVX
         +Tlsp1cxe4yYCLdJzL86ejxu8e14yvUMP8vt2JJlpKRlJI72sfPxZWHOtnAb/grLU5/F
         YWaQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492228; x=1781097028; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mxbBwFMfo5ZBxkYMed6O4CIrLQRPFC/p3FQvoWrRK4Q=;
        b=DR3JWREHX+JuroQEiftTgWZDWQUCYT12SuQVyVMkow2n6RIDdD65HLERzLjSFZ1U2z
         UNW23Td37GATqLSRRlgviPIVgholf17CxB/Tk9YLXu/oBrQ/kkmB/M4vR0y9vsecujaB
         fGxigtsIZHSU5Fw3dmXFNN3lFJrfcMvc93lxlU6ve4j6/DDsFV/0eyjXqq2QoWV7CgQH
         AIfl2taCe7wUD1k6KpH6YFPOU+MZ5era4UifKBWG4gm5/8js0XisBf99bQTOa8g+BgF6
         SdZuO1Th4kjEE9iEdoGMT2OEDWKEVNz3Ahil+OollCUcT/f970ID0BJQcWL4kBL13kX4
         zdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492228; x=1781097028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxbBwFMfo5ZBxkYMed6O4CIrLQRPFC/p3FQvoWrRK4Q=;
        b=PGfvWOYGCod0+UIprP7z9NSaddLb38KxsPMkccPe0swI8MsRovspDzwYNm2/ErTiEI
         uJCwi8z07blsKk1vsc4zFPoPADMsE5qmBIczQ5xtWWr3rpBQ5YQtTN3BIrfh3ltyS+yo
         8sdYHZEc89iSZ5PF/VRElb7lR99ankbN5d2d4NyvEKybAXWRsKZwyH/ewETdtsph8lyo
         /8b7fnOIaEe2XP0E/47axDBJ0seqZDS4aeFhecJt59AKEHGsRScnwrQegbjkAtf1Ia/P
         BccGZCPkr3Y/3jQzxP1hkZE408R4kSy1isf9erKLoEPewFqF7LbMzXS4WsNRmNJRcSPK
         i/Ug==
X-Gm-Message-State: AOJu0YwF3o4dQSegjMiG1DEWLbZ2KNad5RpEh52El8G4wNcnjFWWuhcg
	IiU82MGTv/e9eMvsyz6vyLfQv3sYaucSeAqNPvgdQ/7qgdksYTEpCoxQU9ZfkmSI3ZZkLJWFZB9
	mI4zdb9iDtYO78ZKWrktmA89xUhWuvyg=
X-Gm-Gg: Acq92OETmUaCJvMwEJLZBe622XBs+T9n6Rem0f6gNdDRznSl1Bn3n87GiZ5HNGYKKtc
	RbuVFZLSjXtk1BYSokxHnWOtmUTN0EC3vp1zGWBfs6J49mnKV6Ner2pJdQL+3KMs3uopG+6FvYj
	h5GyzIloc9RKJlJqOOucKPHyMQS1HrZ9o5+6oCs/F0oa2jkfhhqaajrBBYA6tS0YHzDH3Re7PC0
	x8BRnWTdGuR4VYqRHMwowqZyZDBLvD7tz//s2WH+atQY7JCCQo0NqKL56rOEfG17g2dvnVcCSwp
	T3egH8kU7XXaEg2qVcl/4l5u8v3y7lyj8O/Vrc/9epcUl7J6iCvM36b3XHqm48VMmJ1rQPzEvOp
	mXiTWMyV1ReYnMQ==
X-Received: by 2002:a05:6122:1813:b0:575:39bc:c6d9 with SMTP id
 71dfb90a1353d-5a7119c737fmr1252351e0c.3.1780492227644; Wed, 03 Jun 2026
 06:10:27 -0700 (PDT)
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
References: <CAHLYVqdjJOecp7eRJDhXDv9K27c6cCE52YzWsJyzWm=5czV8Wg@mail.gmail.com>
In-Reply-To: <CAHLYVqdjJOecp7eRJDhXDv9K27c6cCE52YzWsJyzWm=5czV8Wg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 3 Jun 2026 08:10:11 -0500
X-Gm-Features: AVHnY4LxuTF04DRy7rGs8iefXCedWQXbJy97umf6DDTHSWpaFl02NjyyqLJ_UjQ
Message-ID: <CALLMt=q1mr9QfWk_HVREuOKk_39Q3uY-FJW507QQnMMaKB_GYA@mail.gmail.com>
Subject: Re: Gerrit Account Issue: Email locked after changing GitHub username
To: rio chen <rio.chen.hj.wiwynn@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000c113dc06535926f6"

--000000000000c113dc06535926f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 6:46=E2=80=AFPM rio chen <rio.chen.hj.wiwynn@gmail.c=
om>
wrote:

> Hi OpenBMC Admins,
>
> I ran into a duplicated account issue on gerrit.openbmc.org during my
> onboarding process.
>
> I recently changed my GitHub username. However, before that change, I had
> already initiated the Gerrit account registration with my email:
> rio.chen.hj.wiwynn@gmail.com
>
> Now, when I log into Gerrit with my updated GitHub account, it seems to
> have created a new blank profile, and I cannot verify my email because it
> says "Email already in use" (locked in the previous ghost profile).
>
> Could you please help clear or unbind my email from the old profile so I
> can link it to my current GitHub account?
>

I have removed the email from your previous account and archived your old
account within gerrit.

--000000000000c113dc06535926f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 2, =
2026 at 6:46=E2=80=AFPM rio chen &lt;<a href=3D"mailto:rio.chen.hj.wiwynn@g=
mail.com">rio.chen.hj.wiwynn@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi OpenBMC Admins,<b=
r><br>I ran into a duplicated account issue on <a href=3D"http://gerrit.ope=
nbmc.org" target=3D"_blank">gerrit.openbmc.org</a> during my onboarding pro=
cess. <br><br>I recently changed my GitHub username. However, before that c=
hange, I had already initiated the Gerrit account registration with my emai=
l:=C2=A0

<span style=3D"color:rgb(31,31,31);font-family:&quot;Google Sans&quot;,Robo=
to;font-size:14px;text-align:center;background-color:rgb(233,238,246)"><a h=
ref=3D"mailto:rio.chen.hj.wiwynn@gmail.com" target=3D"_blank">rio.chen.hj.w=
iwynn@gmail.com</a></span><br><br>Now, when I log into Gerrit with my updat=
ed GitHub account, it seems to have created a new blank profile, and I cann=
ot verify my email because it says &quot;Email already in use&quot; (locked=
 in the previous ghost profile).<br><br>Could you please help clear or unbi=
nd my email from the old profile so I can link it to my current GitHub acco=
unt?<br></div></blockquote><div><br></div><div>I have removed the email fro=
m your previous account and archived=C2=A0your old account within gerrit.=
=C2=A0</div><div><br></div></div></div>

--000000000000c113dc06535926f6--

