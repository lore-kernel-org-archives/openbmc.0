Return-Path: <openbmc+bounces-2728-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030EDCA5FFC
	for <openbmc@archiver.kernel.org>; Mon,  5 Oct 2026 16:36:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hz4lg62ncz2yjw;
	Tue, 06 Oct 2026 03:36:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:3a::2a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1791218191;
	cv=pass; b=LWW70+uehzoOdfcEiByRuGcW+9uE5enbOdVjcJdAaoxJD0mMhDRBPDEcff4Jj37g8G3/ABKXkQI+k0xx6Prm841wv8FeP5XDzznQKOOMZHi+puziz5TS7THR/X6BvGHv06L1xQNlDsNKtzASgU2uks81qguRE+xoTXU4aFF4omhRY0dlUiqoYLrXD0MSXlHrDjDvmd3WpkfpFScAGGKtDum7LcbJyrdTaMVonV8PD87h/BqEf/S+yI6ReXnO+AJ+Ic4NZovzBVAHKEMjVOBfY3N5XlPvoYeAL1pPQzF8bH3oWenhyUjWs5me3DmW0/ZOf1FdqrmF61RBfDPpeGVWPg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1791218191; c=relaxed/relaxed;
	bh=n8Vh5MgSY6LLcXOJO6HzEg15NsZmJi1VYbXQJuM7W5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgPWHrkc0K3H6E1ZdA+lDTFrulXW2jSBMrI/rTnubwuEkO9kKGLaXilnXHNKtkf22kq1nu57ocCGRaO/orM3wbVum7+t4NwNXxASXMQ/LBO9S+LkYdKGoRPz3iQSaIQKpqcnoPLBLlEBweAfx/5gdlShCR/3fAA45MJ+IvARdb8yg6iUoW1DrmUs4Nx1WlX/6j+T9Q0jcKo3sf/cCYqJa/E049CmK7QBSprSgB+wo7ZdNgTgDRXIwI7lV4tAqd79Tejq0HH9582ETck6xO2oj73iZQRCcIHGrGQzEhG8Sx2w2HtYcO1ykL+twNU0biMQTky8EPW7Bu8Cl5Fn7jvbGA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CVSLUXhN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:3a::2a; helo=mail-vs2-x2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CVSLUXhN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:3a::2a; helo=mail-vs2-x2a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs2-x2a.google.com (mail-vs2-x2a.google.com [IPv6:2a00:1450:4864:3a::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hz4ld4GBlz2yTP
	for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2026 03:36:28 +1100 (AEDT)
Received: by mail-vs2-x2a.google.com with SMTP id ada2fe7eead31-7c0632898c9so634564137.2
        for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2026 09:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791218184; cv=none;
        d=google.com; s=arc-20260327;
        b=jWj6Kw74XUa6eYLxqmMs3TQI9gLPPCm1Jy7nAj8CHaqeyl/VvlJ89cVFVZBlDMhwYA
         VV55X3rfzZTaYYEMZrYJh6whs31U0SyisVLLV3L+HtrLKcKvMvvp0UZbDN8PWhZ72RhK
         ZiXSkG0CoGGrOVQHxcNKGzS5RWX2i6h+5GyxpRYvCE8qupPA2sTzR3Hehd/BDOekSoEs
         IyG04xRBIu8ERsg6UcLci99kC7GPuLcPLbd6q8E4g8EXvQQX1tkzdyiha9A3Mma9EDZb
         rqGqM/vL23O8+dggscyYf01L6KKUfYzRKq0zKmRz2rYhD2/OIdNKokMLyaazYHKCOvqu
         EXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n8Vh5MgSY6LLcXOJO6HzEg15NsZmJi1VYbXQJuM7W5Q=;
        fh=ssgFbFxDJmTwdeFdZ6Ieoz/My+IYiMJDlpotSNfb+dg=;
        b=gnGskSMVaiDnPifuQlS7oFZ1mstesknXcA8Ja8KXKdM1H4L8KNbR1Vj9Qp1fJatNUe
         jHVXLmImNiJn5fTmzbuBjPmOF0TytucUoyZkpzJJA4azQHbSUvsh17KJN+Gpr3h0iA0D
         mgFXY2syu18ksW6NugYl1TrNbHGy5uw4K550CzxKh1ZEPXglRLnp8SJ781EM9KNrZ90X
         2M4juKSyWninj6nU5ArCKm52SNe6GfWMbINcSxg97IEjL0yBhjSlK/Qio8TbFe3pCWsX
         BzTOV3doZ5tpEFRHp+hDbniywEyEhcm7VEUuPVCyFGpChLI73IfHx9t0Oo866DGTbwKH
         rPnw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791218184; x=1791822984; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8Vh5MgSY6LLcXOJO6HzEg15NsZmJi1VYbXQJuM7W5Q=;
        b=CVSLUXhNXHOUzq8GKTC+JfI2yhYPHhShneqKCOJXQp/ADBcp4yiFAdZwGUm+p6MWkl
         aIopBpmo1CpHUbPc7I9m+SfTZXXdG+EQIvRvwbZCb6XWV0NK30lY9d+LSwPfyy4/4ySe
         xshhpQqnPf2hhpYDJ1bY+f84pOQQTbHYc/M4mgQVf4GvjOgaN56kaK3iOLG1GoGQns8s
         goYp8okhi8Eouw1Sa1zpKCPTvHx9qkjfZpAwZ4Zsnb1TllyGEWP2nA7rINe1YybFcMVF
         7Q0dP0ROqVmQGF39r4Mey3nI6EvlggEqVKMCiMAPYKc+iStzN9Ytq3Au1tWI78L12TX+
         pUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218184; x=1791822984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n8Vh5MgSY6LLcXOJO6HzEg15NsZmJi1VYbXQJuM7W5Q=;
        b=UvMH+pb0e81mxB7CwPxg1QEWslulQAfnjSaE/nQjGcvR0xXGe3SYSHBTWx+VYzqH97
         56xz1CrLxuUHfpaNf+/OAb3YQn1EMnjZOQqfQPxltPiy89i9hy2NUZ5dz0z7v2VnIp+x
         C2m21Jsb62HW1HEjkRpqYxoPS4Y8F/KUoyPSIEwTIGlxXcxp24fG3oBfPiE3BKvSaSAH
         27kL99BACEy79QNkTueCw/qn+tbxBBpOkJSuzd4QtGUQyel7r1YqjyUteQsTRAXRXe1G
         e2w2P4UwYTKZwXFSLXXJpv94nfR8c0mIawMkHPebxvFP9tJHZDQ0l/7j5NKDFSJOhQeM
         5f3w==
X-Forwarded-Encrypted: i=1; AKwUvBxUK5s/Ipox2Zp5xkcdMC+UcZ0uKY1OdQXbtw+epWWWRsZwPnmvbySLXWh//xAclHD6ullCrplV@lists.ozlabs.org
X-Gm-Message-State: AFq9FYLNizs1cOKE2Hhg2KIWyszFJgKTxSUB8JTFt0ITJJxMJpt/bmrI
	bDL5FHDiR83YLziEd+aP4xGOGGPfMEd9s7aqJcLpVsf+YJW2tbgw2ZzUH6C+W4mTCeNVDCXZXVb
	Uz4CmO0A/djVvxB0/hyCt+70lMtle/eQ=
X-Gm-Gg: AYBFou3HHViHaszyf3YLjAtfZdKfIlPXtWLd9DRy+SMhq0xJqHJPcBJu+pRTexBFiR8
	UsAqQ3j49zUaNOiXYwRuq77Vt3cWyjZsQOHxvijU2U9m8J6eV2GecHCucORg9ravHYLM2iW0Phq
	BpPcxMNhcl4NiXUUbcm7suDf5Wzl6BpUgcfizC8F8aW9j2D445LLR3M7PZqVq1ocsqcOIJfF14o
	hZb4Cefm9zSguJH5rjhsGOFKztOxaL+srxLfz8YA6cnuPt8miFR8bMuqKsURyzSkuVH7FPO6cCE
	eeRpuCugiExU6IvQP32RFKatBhCfn3SgbLqEbUCP1Zc0wLzvD7QaFmDtNlT7s8PtRFN7Hr6Z82z
	1kNzsXEMUpD+IMg3VwAaTfl1umn0PPP8Uu4bJwohN
X-Received: by 2002:a05:6102:1492:b0:7c3:fcb7:8c8c with SMTP id
 ada2fe7eead31-7c3fcb7c6d4mr1058118137.29.1791218184319; Mon, 05 Oct 2026
 09:36:24 -0700 (PDT)
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
References: <CACwt7EbP_LJ1070N9xyPK2YHe8uwEZ2Wn_Jpqf26JMqbN+wOhA@mail.gmail.com>
 <CACwt7EYM8zS2xZJyCNSDek2EMsWwY9LJ9qn7Zde-EJ=czAwkCA@mail.gmail.com>
 <CACwt7Ebr8Vng6WHK9Pd+R=M-hfMtwNSfU1gQwCRPAV3AuFfSdQ@mail.gmail.com>
 <CALLMt=o4dtC34DHbRjCML0z-1wXkkWpMdMsbXmB3oR5SEXUxqA@mail.gmail.com> <CACwt7EbTtDs=Mt9gyPBHV-hw6fok=sFA1jw3B0wVt3_Sm_mVNQ@mail.gmail.com>
In-Reply-To: <CACwt7EbTtDs=Mt9gyPBHV-hw6fok=sFA1jw3B0wVt3_Sm_mVNQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 5 Oct 2026 11:36:07 -0500
X-Gm-Features: AclHuK_zgQOj4LhMJ0Arz7N_FIlzKRQKx-UpgDonuXNB6JRKqitIELT_u8fqByw
Message-ID: <CALLMt=oSTZ06PkP5URUZC3T9Kwnr8ZNf-=im8tcN7oJG_w6yBg@mail.gmail.com>
Subject: Re: Signed Individual CLA - OpenBMC Project - Hung-Chun Tseng
To: alan <alan.tseng.cs@gmail.com>
Cc: "manager@lfprojects.org" <manager@lfprojects.org>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009776d0065d1a7bc7"

--0000000000009776d0065d1a7bc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 12:19=E2=80=AFAM alan <alan.tseng.cs@gmail.com> wrot=
e:

> Hi Andrew,



<snip>
>
> One question in case that process stalls: would a signed statement from
> MediaTek (e.g. an employer disclaimer stating the company claims no
> rights in my OpenBMC contributions) be acceptable in place of a CCLA,
> or is the CCLA the only option?
>

Hung-Chun, there is no documentation within the project on exceptions to
the above rules so no, unfortunately I don't think this would be acceptable=
.

Andrew


>
> In the meantime I'll leave 93691-93694 as they are.
>
> Thanks,
> Hung-Chun Tseng
>
>

--0000000000009776d0065d1a7bc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 3, =
2026 at 12:19=E2=80=AFAM alan &lt;<a href=3D"mailto:alan.tseng.cs@gmail.com=
">alan.tseng.cs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi Andrew,=C2=A0</blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&lt;snip&gt;<div>
<br>
One question in case that process stalls: would a signed statement from<br>
MediaTek (e.g. an employer disclaimer stating the company claims no<br>
rights in my OpenBMC contributions) be acceptable in place of a CCLA,<br>
or is the CCLA the only option?<br></div></blockquote><div><br></div><div>H=
ung-Chun, there is no documentation within the project on exceptions to the=
 above rules so no, unfortunately I don&#39;t think this would be acceptabl=
e.</div><div><br></div><div>Andrew</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
In the meantime I&#39;ll leave 93691-93694 as they are.<br>
<br>
Thanks,<br>
Hung-Chun Tseng<br><br>
</blockquote></div></div>

--0000000000009776d0065d1a7bc7--

