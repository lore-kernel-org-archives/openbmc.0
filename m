Return-Path: <SRS0=4lTl=LT=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A87C2B9F4
	for <openbmc@archiver.kernel.org>; Fri, 25 Jun 2021 04:54:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36086140E
	for <openbmc@archiver.kernel.org>; Fri, 25 Jun 2021 04:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A36086140E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB4Rx1ndmz3byD
	for <openbmc@archiver.kernel.org>; Fri, 25 Jun 2021 14:54:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=SP8qnEk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SP8qnEk+; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB4RT1CPjz2xVt
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jun 2021 14:54:28 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so6989123wms.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 21:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LYjGH4GErXBdyu5ORO1PpE1TCtcUIFQiWAbRUuls0oY=;
 b=SP8qnEk+trBN4zLJUEO13hPw1JP556sLnKngL6/qEUZIF/k0OQMYeDCeF2qKDpCehK
 Vm7KTbjRiz7YqXoOTIEo6lJPSNifYt1B6UpMPFaVtobO6aEIfy9fh1k1fBQjKjX6DxSq
 urIJeOAFzRAfkqrLs9XaI/G4cv5/rRLnpOT02Jf/FGja4IlIlBl1Oow/36ElVoURJWnO
 TJc6AAyhwUcy57OKZ0Ra/Psi6+ONh4NKfmWNzOhhHRTUZSaRus63EXnAxk67N0OE51q1
 2qoEINtCMQVojMxoiuzMcVgpd8OUrrtT2CnOhuoSsrIzvnFNDl/lny9r6u4RLIG5R0v/
 /EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LYjGH4GErXBdyu5ORO1PpE1TCtcUIFQiWAbRUuls0oY=;
 b=alZiphAn+QVb3pnUqfTy+cPMRZFU/qT5Imyk24B3+yrkLWbSds1X7rs9ndom7944Wa
 gnhyPbtarqm4yIeg3clZ5JpULZaqY3GPPbWBKnHgkpmwqA3rW9W69hTveDk5MJZ3Ut6K
 iwCvFESCB06PLxwypfR3X8QQB0+vth+aXr4f6W4DnhM+JzdEpCMULPNeqZ+V6TTXex6g
 WUk5Fv0MTS3CtlZRrApAqFFFDb7hWgmUEYAF2P2cy8yPnRbMONVLDPKbgq7IFVJ0/oj4
 3eV6hRF/J1QQsChJKp+hDiuXLOFrzjEO3aAW8eyrwXD2FZVpb0GJikufXD5R6E1nrJ8t
 oxIA==
X-Gm-Message-State: AOAM530uDjwm0LcA/0Tn46aIG5Wv52sMJJ8+vMiRr1swMSo+kPhwW9XA
 9C24Ual8x8I49y1iTbwQkbq+aXrhBGg/BSOiHz1TRA==
X-Google-Smtp-Source: ABdhPJwwq6eJZb7d2yVyY9H6/KCkJPkVWd0i+obtACpD9G/G6pI1mNDRDGfMKlBUyNREyKZkcKe+kA/i3e1zH3swpK4=
X-Received: by 2002:a1c:5405:: with SMTP id i5mr8080294wmb.93.1624596861612;
 Thu, 24 Jun 2021 21:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB30932F39EFCE1A165A5F9A94E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB3093E0EC673F8D5AEEEB7613E1079@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093E0EC673F8D5AEEEB7613E1079@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Thu, 24 Jun 2021 21:54:10 -0700
Message-ID: <CAH2-KxD_m2UNn0mmbV998queZr5_HUmjhZCXKJFKJRQhX8Y2Yg@mail.gmail.com>
Subject: Re: SDR sensor implementation query
To: Jayashree D <jayashree-d@hcl.com>
Content-Type: multipart/alternative; boundary="000000000000d7479205c58fee4b"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--000000000000d7479205c58fee4b
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 24, 2021 at 10:13 AM Jayashree D <jayashree-d@hcl.com> wrote:

> It has 4 dbus method call, whether this approach can be implemented in
> async_method_call() ?
>

Yes, there are significantly more complex flows than this implemented in
other places using async_method_call.


> Could you please share your suggestions on this.
>

My suggestion would be to look around at other code that does this already
and use that as an example to build your code.

--000000000000d7479205c58fee4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 24, 2021 at 10:13 AM Jayashre=
e D &lt;<a href=3D"mailto:jayashree-d@hcl.com">jayashree-d@hcl.com</a>&gt; =
wrote:</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"=
EN-US"><div class=3D"gmail-m_1769879613617180375WordSection1">
<p style=3D"vertical-align:baseline">It has 4 dbus method call, whether thi=
s approach can be implemented in async_method_call() ?</p></div></div></blo=
ckquote><div><br></div><div>Yes, there are significantly=C2=A0more complex =
flows than this implemented in other places using async_method_call.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=
=3D"EN-US"><div class=3D"gmail-m_1769879613617180375WordSection1"><p style=
=3D"vertical-align:baseline"><u></u><u></u></p>
<p style=3D"vertical-align:baseline">Could you please share your suggestion=
s on this.</p></div></div></blockquote><div><br></div><div>My suggestion wo=
uld be to look around at other code that does this already and use that as =
an example to build your code.=C2=A0</div></div></div>

--000000000000d7479205c58fee4b--
