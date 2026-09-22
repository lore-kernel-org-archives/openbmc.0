Return-Path: <openbmc+bounces-2639-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2BEC982FA
	for <openbmc@archiver.kernel.org>; Tue, 22 Sep 2026 18:29:18 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4hq7sd2Yt6z2yqL;
	Wed, 23 Sep 2026 04:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:3a::10" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1790101748;
	cv=pass; b=DR4wq0GAzsRvZptTSRyqmru2Qa4eVqmPc9hPC74siUGbrnSGnZLXzBcmFo+N7WGQINSgJD+lOaZG3YubE5v249MI6Cw/6BLgoO93Nb//YDDJHik4YabSqPIZR90rpoWy42miY//JTF8VTlMeBQLeQ/t84to98S+KLn5+hgnJQP64CPX/mPegTK3Je9PqPKlZDTBLue+BYIIQpWGQ5YdUvKwiczsmOfBbRtosXykywR9P2wb2qvgKWXSVHHP8pfr8ZMPqpb1DLTdMA4HnlID0vpzDh2+1mjBptmgGTJguzMVc436FIJoZEs0+zeSd4fneUXZj391QsS2Vuz5Z7rMC0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1790101748; c=relaxed/relaxed;
	bh=9s7R5tFIrbNB/h//GfaZmeWi21KjRriR0WfoE8tg++Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odxGo74tNEkMnChrsXXLD/io0q7OTzsTmAdodr/zyAIkHYqleFUCZWAfn4bnRzNH/8oT51eQVYYs6i3dToyR663fDjJejUrX/otjxhWOyoqoFWq7Cx215Ulf3VBOyOHpyd7qCIyMvIADWc5MB9ZE+cbWtHvI3sMPmTI2qE0k0EPtG8mcO/yhgfgvM6qilOR+kdiMgR4ZhwjJBlUaGPmHKzFgie+Dyb4nbutsF3aN9qgao+9CZ5P+xF2L1HO83f196yqy+R0hQNrMWYEDyKDhItDX/D++ITBXkvf/QQQBB0lP24gC8ht5nuKlF0/iLpf6fGDRTvJ3Ou76atG7CIZ4lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NEAJ42+U; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:3a::10; helo=mail-vs2-x10.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NEAJ42+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:3a::10; helo=mail-vs2-x10.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs2-x10.google.com (mail-vs2-x10.google.com [IPv6:2a00:1450:4864:3a::10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4hq7sZ55M8z2yFQ
	for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2026 04:29:05 +1000 (AEST)
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so112428e0c.1
        for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2026 11:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790101741; cv=none;
        d=google.com; s=arc-20260327;
        b=HtTqyEo1CPe2ErZ/E6hWyj4VCpogoWO5q1RLZ6PO2pM3PZ5OpSDzdAZBN97Iiy8CQ3
         0ASsKjBdg9Bp9pzNlL4hY3G4SdHmsUMCgTtWl5c4wNmogDuTxsV90wrWWhj8E3TxEkyc
         neN55bIWbhOIUjvmCYsGM+SrUjGcB8vpB/ptHbhZXXhax9kXxjPJ1OpRvVF8TmixoHyL
         4DCFcorf2QlKy+AYLYoIKALW8UBrXBsfWUI67IR8MRYfcVfM2wke+wsRAWLn0ru13IZc
         pwENImqYDrHiY1IZMXxheF16YJNu4DxNFEMylfbWQ2h/I4sHlJsi7DsHqNtI3tdoMWLx
         Y4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9s7R5tFIrbNB/h//GfaZmeWi21KjRriR0WfoE8tg++Q=;
        fh=phzoPfGbkA9gUrQfBEfpZVqbcjGMkzsmNZBDr21gv8c=;
        b=TGexbwfgPhKR7vxsOHLxAxtGqSkARyXx+luafhqFTAJjT0IcwSPMXwBjZbMuJ7QBJD
         QE2cEKG/kz3IPb4Ubhdbz8RznFCPA+R1lJulSeyFdPPG/w0ds3/wZqyK7Aos2M9pTtpc
         EVlMwH8MQobNmg62KP2UqzBaW8QzzHNjp64AMnxAM/3ZpmxpxNCfMBGgDj0IMVRIp/KJ
         3GVtQyuH8wp2F2GvOBnkY+YX/GqZm3jgbpmFeoUS7Kaw9EQsOaobF4lppYtr7yrvFrSN
         VrfaO5h8ItJrlnD1/WxwsBQgYTjIiGj6oCe2xTG06bF8FYl4usBPkFaADtWerxafIJdz
         Jypg==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101741; x=1790706541; darn=lists.ozlabs.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9s7R5tFIrbNB/h//GfaZmeWi21KjRriR0WfoE8tg++Q=;
        b=NEAJ42+UqEC32dYiwnKdbmVqkaLzEPmhsV87Oz7r9noTWbgmjBjJ78rc84eebnsjvg
         S1KDspCyybxCVs5QAzpODLv+A4MmdmkhhqBPkwDCOp0T0Tjyk+SoiD7w+U5a9catPknW
         EOo0qZSQk8QUBQUZALYko8jNRfJGHOF2wCAxRVu9z1h5ZofCNodR25SN1P2IyVqNs9G6
         esj2t5TlPUtQv+7uog0Q5KfpRGJIK4HTBJZcKtjgQ7IRLHFkOryDTATVB62+32BS85tC
         RQYuWiAhc5nwapk0NwG+ukKhodq80IFki1Ju2SwwriVCv/FVv0ytdsvNV6edJijGa1RE
         wJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101741; x=1790706541;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9s7R5tFIrbNB/h//GfaZmeWi21KjRriR0WfoE8tg++Q=;
        b=FUYiIKIA32dAFnwSI/YDKn8M2iGoBQQLhNPuaxdkLaSLH6I9/PFoOqJwgHkcqw8aT+
         hllR2c0T4VEGwCpba3uR+NoI6I8BfiTxMe1Swv46tm/FyONXS58FBVZyUyw1Dx0eXdYG
         Q2JOwxtq1ACroBoK9UGf9MXhnCa/dE3ZyhLdTvPJNe5/XWcHo0qN9YXIv6kYlWh+V584
         3X/SjXWQEfc5FjUX3kWfUd2hXdbGgtSZ1PIFyOtz4UhTp0c/Wn8kIveDW7vaoXZICn+O
         eojz1n16tmGuTPmiSOBogYA39Va7cWAvdGEgxqh2iZP6s3nkrj+wR6544Vl6iohG2gqj
         dYBQ==
X-Forwarded-Encrypted: i=1; AKwUvBytJGhT/b+aoPAvAzKEAfhGSSX11lSxz5uZ95GZuwjYmxIKuLAmOOVXP1cz1pAYYECHnz9Bat92@lists.ozlabs.org
X-Gm-Message-State: AFuF++n5ByKYnJAxHGEqA8v4n3c6tb0MWVcMUDV8N2f+lOqOe45kdmcL
	AcDNziAoDjKwkICguvFWHXwUe7Jesr7y5mOuEFqeP1wHa91Tg3YdukBv+sM80JVaWlSg3TW2pra
	0UjLL7CUmJJNJXmUjAZqXkL0I5yWLYdM=
X-Gm-Gg: AYBFou1dOAALjsbQkM05YuFzV6azqmlgZyVo34mU2IuC+IafLZheY46KOTALf3QowBd
	Aeyx7jYvtthzOT4DSKkY3+z3uX/4i23l/z0Z81H20iNb61OwDTjpLrQsYPeJHILbTVgxPTfWh8y
	9k5eOYUJeAry9ToIy/oEWXMh740r5QSOz4zUdTair9vMGK/Hdt3vUU5Rz6ZWVJ9jN2eXgowhCXl
	mwtiHGT67GK7pDFALbVxY11ez9+96B8Z/1YvAvAFeeW2xjysFolMA1xBtWIm80m3MhKxS7jsw0q
	l+5U2Bq6WbMxHrRpu5nf8Rc0cu5itVstAI0a7FId6h4x48bg4hLdu61K9BwfQdsOlIRpqfO4v9G
	W+4v7Jj9UXDABDAd63JMlyhbxVx/Q0fh5cwfmBhnZa62f94LczRBuYTEQtaSf
X-Received: by 2002:a05:6122:488a:b0:5c9:72ea:141b with SMTP id
 71dfb90a1353d-5c9f15ce401mr767937e0c.6.1790101740751; Tue, 22 Sep 2026
 11:29:00 -0700 (PDT)
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
References: <PH0PR04MB8323768CF3D318ACE6AB3C60EABA2@PH0PR04MB8323.namprd04.prod.outlook.com>
 <PH0PR04MB832316CFAC50580AA11369F9EAB82@PH0PR04MB8323.namprd04.prod.outlook.com>
 <PH0PR04MB8323902F7602FC21B9B92B9FEA842@PH0PR04MB8323.namprd04.prod.outlook.com>
In-Reply-To: <PH0PR04MB8323902F7602FC21B9B92B9FEA842@PH0PR04MB8323.namprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Sep 2026 13:28:44 -0500
X-Gm-Features: AclHuK_BOE0-vmt4yw8wTe986SJ3IwG4J-W9RPbf8uIVgOoybHCnsuhvDcwrYc0
Message-ID: <CALLMt=rfoGBatm8ixETYeqFo2nDwQ_PdWNk8EhkjTw_W7AK7FA@mail.gmail.com>
Subject: Re: Submission of Signed CCLA for OpenBMC Contribution - Einfochips
 Pvt. Ltd.
To: Krunalkumar Darji <KRUNAL.DARJI@einfochips.com>
Cc: Mike Dolan <manager@lfprojects.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Bhavin Patel <bhavin.patel@einfochips.com>
Content-Type: multipart/alternative; boundary="0000000000005e9202065c168a8c"

--0000000000005e9202065c168a8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:37=E2=80=AFPM Krunalkumar Darji <
KRUNAL.DARJI@einfochips.com> wrote:

> Looping openbmc@lists.ozlabs.org
>
> Hi @openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>,
>
> We have signed CCLA and shared it on 15th Sep 2026 with
> manager@lfprojects.org. However, I have not found the same CCLA has been
> uploaded to
> https://drive.google.com/drive/folders/1Ooi0RdTcaOWF1DWFJUAJDdN7tRKde7Nl
>  yet.
>
> Can you please share the next steps to get it uploaded in CLA Repository =
?
>

CLA accepted and
https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/94791 created
to get your company into the approved CI group.

--0000000000005e9202065c168a8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21,=
 2026 at 6:37=E2=80=AFPM Krunalkumar Darji &lt;<a href=3D"mailto:KRUNAL.DAR=
JI@einfochips.com">KRUNAL.DARJI@einfochips.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-18412436117=
42043914">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Looping=C2=A0<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">=
openbmc@lists.ozlabs.org</a></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Hi <a href=3D"mailto:openbmc@lists.ozlabs.org" id=3D"m_-1841243611742043914=
OWAAM797088" target=3D"_blank">
@openbmc@lists.ozlabs.org</a>,=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
We have signed CCLA and shared it on 15<sup>th</sup>=C2=A0Sep 2026 with <a =
href=3D"mailto:manager@lfprojects.org" target=3D"_blank">manager@lfprojects=
.org</a>. However, I have not found the same CCLA has been uploaded to
<a href=3D"https://drive.google.com/drive/folders/1Ooi0RdTcaOWF1DWFJUAJDdN7=
tRKde7Nl" id=3D"m_-1841243611742043914OWAda6277f4-b2db-c269-52e3-9c68b01551=
40" target=3D"_blank">
https://drive.google.com/drive/folders/1Ooi0RdTcaOWF1DWFJUAJDdN7tRKde7Nl</a=
>=C2=A0yet.=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
Can you please share the next steps to get it uploaded in CLA Repository ?=
=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">
</div></div></div></blockquote><div><br></div><div>CLA accepted and=C2=A0<a=
 href=3D"https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/94791=
">https://gerrit.openbmc.org/c/openbmc/openbmc-build-scripts/+/94791</a> cr=
eated to get your company into the approved CI group.</div><div>=C2=A0</div=
></div></div>

--0000000000005e9202065c168a8c--

