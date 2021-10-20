Return-Path: <SRS0=5iJr=PI=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B662DC433EF
	for <openbmc@archiver.kernel.org>; Wed, 20 Oct 2021 07:48:49 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4362D6139E
	for <openbmc@archiver.kernel.org>; Wed, 20 Oct 2021 07:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4362D6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ2mb6X4Yz2yRS
	for <openbmc@archiver.kernel.org>; Wed, 20 Oct 2021 18:48:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZG2DiMNZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZG2DiMNZ; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ2lp6yfBz2xWt;
 Wed, 20 Oct 2021 18:48:06 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id z20so23037471edc.13;
 Wed, 20 Oct 2021 00:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q5XgWi3RBd7+1oXKWAvtLEhuOtUBO2Nw1UT8cn9MibE=;
 b=ZG2DiMNZPbcfjS4RMK5jWp7G1spCaTkIxItupWSid7oeaCWUKdtPR4D2AEDNrmBmRg
 nt9obFF/b7A5CAa3eNtF+5RqnR7ZGeK2uT5SCHjdYBq+nVwynGUd2w4ksKtTwkmwuWm+
 RYvqqlsADC7Tm9s+kf6gpCGsWK8JJGhcsH59w1M4HUptrEOW276TWsc+b9LlbFp+qxtr
 Xh/YHWi8vn802G1O+7MnNBKFi5q5f7lMRhm5xopknaxghagXKMmidGXvrU4NYBruXc4L
 abABQDHtAup0jN9msraFmPmRiuW9DU/PBq9xL6Zke2dpShQ+kEHeLKMqbNElycYXaxGD
 pBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q5XgWi3RBd7+1oXKWAvtLEhuOtUBO2Nw1UT8cn9MibE=;
 b=43Nxl7oWUYltyfpfaFrxlOkduwgcVP9B0KslVcTRysZQOh6xV/E5D0Aw6Mhv5eFT2V
 /Q4wczII7G2f+NI4cBEpZdYgiMXt8mwjAzKmHeFTZBeiWXGYUDzyyYyb0c3eb6fwRpdo
 NgF5YlmOxMZGjgImHxrtRxPkX9ATmqI+U8PWKxvPk/YSnYJeq/SEWR+GBX9lDSRBBA0k
 8LQMkt8myD65tbCNrdpgmw2zWDiMuQS0BIKvUeCTe7Cj7/LppTGU61cR4FYSGvNj2D/u
 twWUQ6KhlS/V2EbF/mHPPn+vRaKSLp0UiPMRPcMeZZsg9qLOFfYLyU//5YC51/z6KXgb
 jK1A==
X-Gm-Message-State: AOAM532EngogDQVCw/MCxa7MzoKSNdzxiBcZ/Q3/a7ygGK3NMQ9ZWM0c
 EBb1YUhEWyU/+A1iIllW7X9ldx2G02To/LkELA8=
X-Google-Smtp-Source: ABdhPJwYTapTcZYITscGYAX2BMNMgv8VssGNaam2KAUVgYHPOzHowJjTpv4zSWf3/8gVrPTGbjI3Vuhvu1lTsn/Dm0w=
X-Received: by 2002:a17:906:bceb:: with SMTP id
 op11mr44769970ejb.449.1634716082878; 
 Wed, 20 Oct 2021 00:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144127.GA12978@gmail.com>
 <20211019120724.50776b81@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211019120724.50776b81@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 20 Oct 2021 13:19:55 +0530
Message-ID: <CAA7TbcupuBqyq_UhsL6f5723m1afzWJW0+A+jPhY_aKyEAPoMQ@mail.gmail.com>
Subject: Re: [PATCH v2] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000006dbe5c05cec3ff23"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--0000000000006dbe5c05cec3ff23
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 12:37 AM Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 19 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:
> > +     payload = ALIGN(nca->payload, 4)
>
> This is missing a semicolon.
>

    Kumar : Ack. Will fix this in next PS.

--0000000000006dbe5c05cec3ff23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 20, 2021 at 12:37 AM Jaku=
b Kicinski &lt;<a href=3D"mailto:kuba@kernel.org">kuba@kernel.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 19=
 Oct 2021 20:11:27 +0530 Kumar Thangavel wrote:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0payload =3D ALIGN(nca-&gt;payload, 4)<br>
<br>
This is missing a semicolon.<br></blockquote><div><br>=C2=A0 =C2=A0 Kumar :=
 Ack. Will fix this in next PS.=C2=A0</div></div></div>

--0000000000006dbe5c05cec3ff23--
