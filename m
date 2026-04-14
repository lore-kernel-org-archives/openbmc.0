Return-Path: <openbmc+bounces-1812-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5559CF9D0EF
	for <openbmc@archiver.kernel.org>; Tue, 14 Apr 2026 19:34:06 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fwDwl1tCCz2yhD;
	Wed, 15 Apr 2026 05:33:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::a2b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1776195238;
	cv=pass; b=a0CfNQpgCoihmT5kRLYf5nNST2mPYoj4ZJ60jJnlGRmDyC0FvwEvBVtC4D8ZFaLwhMnfGGaW7nZbDVZD/8jQ49cZifJwA/FGRSbZF0ua7TYHT9wV7n3VMNOWr3pCHLPSIp5Eh/mie017rFgTiQ49gt6fPuxzficsDx5/enHlISeEh8Cb15FrgIXA1T29pCj5hfMQX/30ugktSuUzqLVJDYtPf3xtNtNGFLmCAGtiyGp6rCBXrcAg0D0jrl38U0aMO4BY2V7/nA151YA1+1jaTmKdzo3Q8APfxkAVdFt61vxpZLKs7ABkujpWIo3Pgvp7Os5MgAQIY/x+1sZVITGRXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1776195238; c=relaxed/relaxed;
	bh=LMaoe+968TVXJz89kM187lJ3RWtJssxpI07LIMBbDPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEmcVtb9rDSrhGnsrRZAucnIED5FvqqOBDaOnDq4MDR33Znj7/+qIAWEnr2Qh66uDFL/H3xjU0cIOgGBYXNAIIXbJ54N2Co/Xxh7cydRUMSn0OqfV1gVPiZT9mB/x2YdlUNN34PGQ/m8SRLKgMcGskx+q3Z9o8+Hmgx8HtYaT4000s3wTdP5/PRHnUA/qtTBGMf9xVPfV1/wMsGP5AazwSGYnT4ts6YvVftF8Pxqzuh0YXhP6PBXnrU99prU33carYab9DlUpWw1/ts7TRkE0RvqZgFJOCfH25EQxrN5eV6/BoIy/EIzkWqI6HAJjztUMny6o7MzoDAQPqR9A2Mmfg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g4ym8W0w; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g4ym8W0w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fwDwj1JhLz2xm3
	for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2026 05:33:56 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5637886c92aso2563033e0c.0
        for <openbmc@lists.ozlabs.org>; Tue, 14 Apr 2026 12:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776195233; cv=none;
        d=google.com; s=arc-20240605;
        b=hIZFW5y7SZhM5uW+IEXvmUcFOGDCKvt+0Kq5drACJVLQ42/fSzf7Ny2yO4+JoipY6U
         23cqidRgUtvugHubQ8JIUAOw1rRSZ4ntqOEeUL1f7/s/2Dq65R6hX5+7or+w36fYq9Cn
         dCr0fjunP2DYwzOJLpFsr7u0Wv3/uy3Y2lYddIaaUJ2tO1p8JAtpIBISHkims2M/1Z4O
         ecdRNL8q7vSfyDFYCwOBNS64kGtE7pnCdPI4c7QdPIDURHN1sE/Hm+FGkb9/IkGE/fDd
         YPUjs/kxuKzNLfaH2PBm7M+1THFQ4qYY0CF9o3m2s2Xzi4bnV4Znp25fJp1GTi9XCMH9
         +VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LMaoe+968TVXJz89kM187lJ3RWtJssxpI07LIMBbDPU=;
        fh=7YfzPGQHhwg8YLf34mxOwNlta9ZLqFNWHUBeIy42V/U=;
        b=DBxU9Yg2eMKcKU8aXZO9dXg/eaNQEdGpzOKNCoKCvGsr8p7bcQ9zPIB5mQBzrPOuzk
         1T2epLNlqA2GWe/2N1FN2h8fz5BbVlQSL61ZigwhGDzMaryjnP7i0m54Jggnx4r5PFS+
         Rzx9TUtPS8gacZN2YzbVVu+Aus4FHwKB3MWhU8Y6goBo5PjCmwQy01aU96bBqAsN23vc
         4x3oGIBbatxFvmQOdPmSfN3+3Crq1kBlZTXI+GJSAGhd619tr1kFwnxH4TpXZReIUf1a
         9Akmjn5MtFl+a0jY/OrNmlugKJlvRVO6J5dFg+bcqQmhJyKXl8ztanbnGIJr4FWE+66j
         a2uw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776195233; x=1776800033; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LMaoe+968TVXJz89kM187lJ3RWtJssxpI07LIMBbDPU=;
        b=g4ym8W0w3N5uVhEjSUD25H8gMGNQY20EeS/4+42e/9CQJ4Os5/xzmM2ltL30QIzgfR
         /+01tAom2g582ntKdWqkWr5p8aODfE+9n2ct2KE+CmgAtM1L3GaxvSjILUhx80uEG72j
         +RYv0yV3QQNP27NqfT/OAOXjxDeZqCjwmQcQga89Iqrz45G0U/I5hi5a80u5l/bREtnk
         OXwTspOi8OKIusDQsr/4qEASE0npZCJC/jkaf08fFRvq0mMRBAZNTfMXGgmqNxC3vJNq
         8tF9oVoukVCL34YbxpFQPe+u+x5FuQSzTAxDXPIojveK+uh7+vc30IG6sE2R07YxwwDU
         Z9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776195233; x=1776800033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMaoe+968TVXJz89kM187lJ3RWtJssxpI07LIMBbDPU=;
        b=MNisIbU9Zm2R9Z6Pe/RMCxyzwEdW1Nrgr+WRCN3N19v8AL8CBh4nLI63x0u3uOXJZv
         WLZAbd4+5NzY17ZoikdPs/dATyRrnkDcUuHxJoP3eVZq1UxTmHpSPzD5hnVf/eCe/uPT
         5at2kcKbhA/dbsX+3jxz1M8ubkoBQwuuWXqNhw8lEVVmVfp6bpXwfaV8MJ0rIdufPSOo
         9KoddyJcHfmQhdg2ZdAVk0DHY/S+vumNepjNXiQoBTgc+Hu+EcZXzrU3bq5Kg3b1Qdq6
         oTkXuUI63Df/gYLqHzCJbC0w91SNnRpG4AE5icGMOUYm/3GlwlWC02Wp5+wIGzzfR2w5
         yDQw==
X-Gm-Message-State: AOJu0Yy1b05UbynqQ8eJmd+rN9MKGrXRqEHVQKMbey2POk65KL2HwduN
	pDYwuu7WflRPAKs0fGRBuaeoYsVONRb4AB9TtcOGgjnuSYr/ncCQmNwaP/eEo1njF+QZ+NONmLQ
	MJwaDLD1mgqeoRZ7KhwnTjIDtwoWWYaY=
X-Gm-Gg: AeBDieuoSTaZFKoOD7Jg46Ybmo5YLcvtt2N7CGF6tOF+i9n5Y+WQ3baxyVxp1Ryi2bR
	LhRdfIa1pWiBcb7DchVhbzigtq4dhM5C3Y1BYwYO+BPCPJeo8LKzR/0nsb2HyxhBRpVJ/HO8Kac
	NEv8AGS1oApZ/9QUwuQKuJ0CWti06eOpUPaz3d46IUmfNTf9pMrlI/4oBJQ1F7QNe+SjVKx1UFt
	0Io/2T4lWPrkRy1u34WUHyqxK8wzJ0I9u3eTNOoI5M6/YpHck5F+c1EJ5107prLrdUbb45SX6Hw
	9zdSFOhPlnf/eWOUBhsmvKoASJw6s1u9Zyu7N964EmmbN2zC5xuzvmJOg7vNUfRcdcmI
X-Received: by 2002:a05:6122:788:b0:56f:1ed6:1d29 with SMTP id
 71dfb90a1353d-56f3bca6059mr8008904e0c.9.1776195232765; Tue, 14 Apr 2026
 12:33:52 -0700 (PDT)
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
References: <CAFme=rmRF03V1RLm4v6071ET-vVzrPjz_oVKCfWoO5G0CMzJUQ@mail.gmail.com>
 <CALLMt=pmg3CBB5SNVffAPMgVemj_L4Am5bc6egh9y8xAXt5jaQ@mail.gmail.com> <CAFme=rmw3=bjc8ZY_kVT-xEuFRch=pHPt5dSshDc+xbpe+on8w@mail.gmail.com>
In-Reply-To: <CAFme=rmw3=bjc8ZY_kVT-xEuFRch=pHPt5dSshDc+xbpe+on8w@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 14 Apr 2026 14:33:36 -0500
X-Gm-Features: AQROBzAZZ2xSDpjiwtN2u0Q2DfVj86GszqmjRzv8GOTPg11f1sQ_uPJ4uDV8xjY
Message-ID: <CALLMt=oqRA5_TEE9gT+9QAfSYw_dw7nM2YO0Y1GUWNNgunx9Ug@mail.gmail.com>
Subject: Re: [DISCUSSION] Drive-level power control support in phosphor-state-manager
To: Eric Yang <eric.yang.wiwynn@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000e69959064f70ad09"

--000000000000e69959064f70ad09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 4:29=E2=80=AFAM Eric Yang <eric.yang.wiwynn@gmail.c=
om>
wrote:

> Hi Andrew,
>
> Thanks for the feedback, responses inline.
>
> If this direction looks reasonable to you, I would like to start
> submitting initial patches to Gerrit for review. I would appreciate
> any further guidance.
>

Seems reasonable to me. Please start of the commit series with an update to
the README summarizing the design.

Andrew

--000000000000e69959064f70ad09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 13,=
 2026 at 4:29=E2=80=AFAM Eric Yang &lt;<a href=3D"mailto:eric.yang.wiwynn@g=
mail.com">eric.yang.wiwynn@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi Andrew,<br>
<br>
Thanks for the feedback, responses inline.<br>
<br>
If this direction looks reasonable to you, I would like to start<br>
submitting initial patches to Gerrit for review. I would appreciate<br>
any further guidance.<br></blockquote><div><br></div><div>Seems reasonable =
to me. Please start of the commit series with an update to the README summa=
rizing the design.</div><div><br></div><div>Andrew</div></div></div>

--000000000000e69959064f70ad09--

