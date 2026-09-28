Return-Path: <openbmc+bounces-2664-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2379CA5FA1
	for <openbmc@archiver.kernel.org>; Mon, 28 Sep 2026 16:44:37 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4htnG74tm7z2yqq;
	Tue, 29 Sep 2026 02:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:3a::d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790613871;
	cv=pass; b=CSCXUpbK/x2WoHwTvv/wQUSR1IvVpCnQM+KMyNIGwivbCsZG+A5lEAEqAqXTBQrGAOra/iBZV/B1SosP0ovoSyVz08xFzfAKqOP3cXoiLuZg/9qDo71uqOOltwJJ8c8bhsB85Bl2nrXENuobaa/BPbIbbzxnyB6Krccgdv8TZ0RE9HU11QVXA8kwjVM30JOp0zGyF+kSTGTKwIswt24UQ8d+6hlBDUEH9yKivmA6qrkhhHO6yrBG9+7d36o6SvuffPEoJfg/3TqOM3iHTPQe/k2LhZVeM7XbMxNF1Bfe9e8Ms7p43O9GKV3tETA7orEKWJty+Vb3LRqd2NM10xY7kw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790613871; c=relaxed/relaxed;
	bh=XfANe1Pt7PSanl6zHX0zpl+5k3fxV6XZYz7UDcvUG6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIgkp/v4Mpqy34kQ45QLUUXm0eYHDCPsjRMYYJXbKGPuDikE0qix5JiIBv6gfPCMQKfewCwdPY3hm7/G0DLTyhQl474n2qJ85ocZ7RTqIpHx1xc4plTO0nlrwp9PfxdQMg4F6XgpyjL1aITpZN09ta2AZLbfjIpfBg2EakKkvKIq71f3jcbdfixJJLIxa2GLy0i2q5mj1UuwQjqowTKtWxljcte2eAxfv/LtWbf1+WCPJagsOFRBFotKVKCNEL2C8qeY0+8m1nu3rBkSJOBW0NOHtN/7tp6DcO3cDasoe9ZizMg4XJs3Sg9z9NlJLzWEoIbw+8A8f2VLelxDUDsIzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VMXUWWTq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:3a::d; helo=mail-vs2-x0d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VMXUWWTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:3a::d; helo=mail-vs2-x0d.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs2-x0d.google.com (mail-vs2-x0d.google.com [IPv6:2a00:1450:4864:3a::d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4htnG53Ttqz2y2B
	for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2026 02:44:28 +1000 (AEST)
Received: by mail-vs2-x0d.google.com with SMTP id 71dfb90a1353d-5c9031e714dso1156820e0c.3
        for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2026 09:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790613864; cv=none;
        d=google.com; s=arc-20260327;
        b=h0auOfeWG5D4Ev0JU1VYuLzrdedMQGMBUPlJPOtbOqVh2QZ6Ys18vVKd0d8lkjhmZU
         Ds8MIy3aXa7M66EB4IeY6W85V/A35AFTFlSLA5PPh7KKjsuIPEauJa3isDlRhv4DCrMX
         jdmL2bb53oR4ZhAE9xqEMsAqf+6T9yriv5clHjJT4nxo/C4YOiVokkz3W1Lu+f5W3yDS
         Jwn3bzE7CSdpmAfg38EN/IqFWkYMP88s0ydcEpZw9/3iwDQjuOUFOgUMGw/aptdpfrKZ
         q8pIRfh64xQIyp31Oe7in0uLBA7za/EvIAfoesRJ8y1zpd0tA+r2zNGhKm1GHyn0soHj
         KN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XfANe1Pt7PSanl6zHX0zpl+5k3fxV6XZYz7UDcvUG6g=;
        fh=RhWjHLiv/CYDydld7XnoDVEqtbUbQlTCntKSorS7m8Q=;
        b=iIICAZlrj9MgHGb6uXTby1WCKOlLY4Fb6PLCOzBJFjdG+QsWJ8bZACfp2gqQHNR5Eo
         oqpVtMZ+rXaG2k2APHUqK7UjTwyNijoAawDciesz/5R8th/ENPhBx7zm6IDEr4RXuz8j
         Sb8xVVi17CNwZOzQiScBsN4EiIKQN7GlPZRKEQ9aa+IIQMGv1Cq6U8dhMWsJgH2Uxyoa
         suOMGV+YgthEzyj6dLK7AFqtVmX6w46HuAqcvZ5XQ6yqZOfuh2tGjeI1IXRpfHaPLx63
         uyswager1sLJIkrUODJl1sr2ArPo5azAUFLKU0+YyTYhXilIQljwL3L29Gp8QTRLYyGM
         c2iA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790613864; x=1791218664; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfANe1Pt7PSanl6zHX0zpl+5k3fxV6XZYz7UDcvUG6g=;
        b=VMXUWWTqb6j04I25pgxsaYG1CL0PGARvpWbZvdjxk4plgmjtjKWLbsZWt0Uq3WX5Vt
         fKG+1sRPgALGLgp0dhmsItdP57XVqSO4Oh2hAyCoem4iI4Dh/cF4NkPs+xOXkN1wpOXJ
         nx9B1wiI5RNxGcABvNN9afMVNfDGNhGQoIn+SNiXKwIouqAGycD3ZI0uI7QD3EylwUMP
         QgaEAnXAKF3nCt8iFBYdTqjh0gcv2oplp7xGbGTcLM882WdztR7PnkSEmFip9Iqsbz6J
         Fki6901BhsSC39tfKNn28OKMyFoTFY9gb3tNewVqqRw1UcyGXuPiMA5uYDqKgavSXhYC
         IEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613864; x=1791218664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XfANe1Pt7PSanl6zHX0zpl+5k3fxV6XZYz7UDcvUG6g=;
        b=QA1w140VNDeZuSb5BUKOL3bLqrgArtfVIvueJxw+bnIpaXFxwbBtkePYMOkQDzoB1Q
         sBcGwzNTFxiVrfx1U2rWUzQ9DcX7BROrWK5aB3UMqSkKSXXa57YTNwD2diZXo2G7DQFi
         RlhBgckTU2rXmCBb4s2hBP4JvFAhDRPeYujhGnKvx/GoUsdjjMjFotifQSR8NPbwZfZc
         CGzxQ4fmjtrwiAv5xx2z/03Fuo3z273QnDTJfA46Vov+JJgQANQP/axhQ6h3oLA6C1jR
         5NM0LP7mWkt3zN1LWsZQRDh4WKkzleEsU7tgZydu/dcJXHWCw5TeuKxlNRHVUsVFEkxE
         oZVA==
X-Forwarded-Encrypted: i=1; AKwUvBz/2Uf10VXcmAwppOLXsns6sufVMHQYYdn2w7WgftuhnXvusw/22auvy818MHCOPZtCUMg2cix9@lists.ozlabs.org
X-Gm-Message-State: AFq9FYI8Xm+L0HnSWpn4GaMyWYGxbGh5OFafmdRHyMHhFR0kcNsIaixi
	XDN8GpBE+vDwgdOLzBArQxI+WuDjY6eHm6vNIS1G2B9Cuya2HtrzVLMWOGtWWXyMKMXoATNipz6
	6jPs5mqTe5szmOF/z1oI1XnZYXJFIISU=
X-Gm-Gg: AYBFou0Et+F3BQPcASj+XH9+Y+YjKwBoYnG0XJcdYgzP3xfF1M93aia/HgSHump7tI0
	bAHm6Iq3OhbzjL/xuWsBKrkcHAeCz9msR1XsZ43xzpw94j2/aQbgpNiKBOCl8u1jU3MsDE6rpW4
	E6/PouJwLLg0O5V/CFaOfQh6a3e8p+hQtME5Kpku1ll/BGXkzkl5dhNLCP8ZDAqGcmHDuMw/vcN
	qKJMAIWp21rqrbpf0/CBNp6fSejZDgrplO8/eeTjoAuu/FfNV1LbjWiRCSDqoDXQmIUrpoSxi56
	R3USa7iQffPvhmIsqv5iOytQo+orivJKtF5Vl6WDd2eyf4C5P5kx2zYkP3pStlqwNYqKhzpTXbD
	MUTZBXQRptXOYtSe2Npzv/Yrew3Dd1gPfZuj9sTI=
X-Received: by 2002:a05:6102:2910:b0:7b7:7d0a:4421 with SMTP id
 ada2fe7eead31-7b77d19a878mr697371137.28.1790613864420; Mon, 28 Sep 2026
 09:44:24 -0700 (PDT)
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
 <CACwt7EYM8zS2xZJyCNSDek2EMsWwY9LJ9qn7Zde-EJ=czAwkCA@mail.gmail.com> <CACwt7Ebr8Vng6WHK9Pd+R=M-hfMtwNSfU1gQwCRPAV3AuFfSdQ@mail.gmail.com>
In-Reply-To: <CACwt7Ebr8Vng6WHK9Pd+R=M-hfMtwNSfU1gQwCRPAV3AuFfSdQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 28 Sep 2026 11:44:04 -0500
X-Gm-Features: AclHuK_KBPidgIYQCtLFUtrzcoudktGaHq4guEIqW2EECa7sN4d4adByouctoLo
Message-ID: <CALLMt=o4dtC34DHbRjCML0z-1wXkkWpMdMsbXmB3oR5SEXUxqA@mail.gmail.com>
Subject: Re: Signed Individual CLA - OpenBMC Project - Hung-Chun Tseng
To: alan <alan.tseng.cs@gmail.com>
Cc: "manager@lfprojects.org" <manager@lfprojects.org>, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000005198a3065c8dc736"

--0000000000005198a3065c8dc736
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:25=E2=80=AFAM alan <alan.tseng.cs@gmail.com> wro=
te:

> Hi Mike,
>
> Looping in the OpenBMC list and Andrew Geissler, since I haven't had a
> response to the two messages below.
>
> I sent my signed Individual CLA on 2026-08-20 and followed up on
> 2026-08-25. It does not appear in the Individuals folder of the
> OpenBMC Executed CLAs yet, and my libpldm changes (93691-93694) are
> still held with "User not approved, see admin, no CI".
>
> On employment: I work at MediaTek, which is not involved in OpenBMC.
> These changes were written on my own time and equipment and are
> unrelated to my job. If you need a statement from my employer
> confirming that, please let me know and I will arrange it.
>
>
Hi Hung-Chun, I've been struggling with processing individual CLA's because
there are a lot of gray areas in accepting them. I also need to do
due diligence to verify an individual contributor is actually who they say
they are which is another whole pain point. I tried to make some more
consistent rules up in https://gerrit.openbmc.org/c/openbmc/docs/+/93905.
Your place of employment, Mediatek, falls under these rules so I will not
be able to accept your individual CLA. Please work with your company to get
a corporate CLA in place for the OpenBMC project.

Andrew


> Name: Hung-Chun Tseng
> E-mail: alan.tseng.cs@gmail.com
> GitHub / Gerrit username: alanhc
>
> Thanks,
> Hung-Chun Tseng
>
> alan <alan.tseng.cs@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8825=E6=97=
=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:48=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hello,
> >
> > Following up on the signed Individual CLA I sent on 2026-08-20 for the
> OpenBMC Project.
> >
> > Could you confirm receipt and let me know the expected processing time?
> OpenBMC CI is currently blocked for my account pending the CLA, so my
> patches cannot be verified or merged.
> >
> > To answer the question I understand usually follows: I am employed by
> Mediatek, which is not a member of, nor otherwise involved in, the OpenBM=
C
> project. This contribution was made entirely on my own time and with my o=
wn
> equipment, and is unrelated to my employment. That is why I am submitting
> an Individual rather than a Corporate CLA.
> >
> > Name: Hung-Chun Tseng
> > E-mail: alan.tseng.cs@gmail.com
> > GitHub / Gerrit username: alanhc
> > Changes: 93691-93694 on openbmc/libpldm
> >
> > Thank you,
> > Hung-Chun Tseng
> >
> > alan <alan.tseng.cs@gmail.com> =E6=96=BC 2026=E5=B9=B48=E6=9C=8820=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:15=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> Hello,
> >> Please find attached my signed Individual Contributor License Agreemen=
t
> (v1.0) for the OpenBMC Project.
> >> Name: Hung-Chun Tseng
> >> E-mail: alan.tseng.cs@gmail.com
> >> GitHub / Gerrit username: alanhc
> >> Thank you,
> >> Hung-Chun Tseng
>

--0000000000005198a3065c8dc736
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25,=
 2026 at 11:25=E2=80=AFAM alan &lt;<a href=3D"mailto:alan.tseng.cs@gmail.co=
m">alan.tseng.cs@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Hi Mike,<br>
<br>
Looping in the OpenBMC list and Andrew Geissler, since I haven&#39;t had a<=
br>
response to the two messages below.<br>
<br>
I sent my signed Individual CLA on 2026-08-20 and followed up on<br>
2026-08-25. It does not appear in the Individuals folder of the<br>
OpenBMC Executed CLAs yet, and my libpldm changes (93691-93694) are<br>
still held with &quot;User not approved, see admin, no CI&quot;.<br>
<br>
On employment: I work at MediaTek, which is not involved in OpenBMC.<br>
These changes were written on my own time and equipment and are<br>
unrelated to my job. If you need a statement from my employer<br>
confirming that, please let me know and I will arrange it.<br>
<br></blockquote><div><br></div><div>Hi Hung-Chun, I&#39;ve been struggling=
 with processing individual CLA&#39;s because there are a lot of gray areas=
 in accepting them. I also need to do due=C2=A0diligence to verify an indiv=
idual contributor is actually who they say they are which is another whole =
pain point. I tried to make some more consistent rules up in=C2=A0<a href=
=3D"https://gerrit.openbmc.org/c/openbmc/docs/+/93905">https://gerrit.openb=
mc.org/c/openbmc/docs/+/93905</a>. Your place of employment, Mediatek, fall=
s under these rules so I will not be able to accept your individual CLA. Pl=
ease work with your company to get a corporate CLA in place for the OpenBMC=
 project.</div><div><br></div><div>Andrew</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Name: Hung-Chun Tseng<br>
E-mail: <a href=3D"mailto:alan.tseng.cs@gmail.com" target=3D"_blank">alan.t=
seng.cs@gmail.com</a><br>
GitHub / Gerrit username: alanhc<br>
<br>
Thanks,<br>
Hung-Chun Tseng<br>
<br>
alan &lt;<a href=3D"mailto:alan.tseng.cs@gmail.com" target=3D"_blank">alan.=
tseng.cs@gmail.com</a>&gt; =E6=96=BC 2026=E5=B9=B48=E6=9C=8825=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=882:48=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; Following up on the signed Individual CLA I sent on 2026-08-20 for the=
 OpenBMC Project.<br>
&gt;<br>
&gt; Could you confirm receipt and let me know the expected processing time=
? OpenBMC CI is currently blocked for my account pending the CLA, so my pat=
ches cannot be verified or merged.<br>
&gt;<br>
&gt; To answer the question I understand usually follows: I am employed by =
Mediatek, which is not a member of, nor otherwise involved in, the OpenBMC =
project. This contribution was made entirely on my own time and with my own=
 equipment, and is unrelated to my employment. That is why I am submitting =
an Individual rather than a Corporate CLA.<br>
&gt;<br>
&gt; Name: Hung-Chun Tseng<br>
&gt; E-mail: <a href=3D"mailto:alan.tseng.cs@gmail.com" target=3D"_blank">a=
lan.tseng.cs@gmail.com</a><br>
&gt; GitHub / Gerrit username: alanhc<br>
&gt; Changes: 93691-93694 on openbmc/libpldm<br>
&gt;<br>
&gt; Thank you,<br>
&gt; Hung-Chun Tseng<br>
&gt;<br>
&gt; alan &lt;<a href=3D"mailto:alan.tseng.cs@gmail.com" target=3D"_blank">=
alan.tseng.cs@gmail.com</a>&gt; =E6=96=BC 2026=E5=B9=B48=E6=9C=8820=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:15=E5=AF=AB=E9=81=93=EF=BC=9A<br=
>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt; Please find attached my signed Individual Contributor License Agre=
ement (v1.0) for the OpenBMC Project.<br>
&gt;&gt; Name: Hung-Chun Tseng<br>
&gt;&gt; E-mail: <a href=3D"mailto:alan.tseng.cs@gmail.com" target=3D"_blan=
k">alan.tseng.cs@gmail.com</a><br>
&gt;&gt; GitHub / Gerrit username: alanhc<br>
&gt;&gt; Thank you,<br>
&gt;&gt; Hung-Chun Tseng<br>
</blockquote></div></div>

--0000000000005198a3065c8dc736--

