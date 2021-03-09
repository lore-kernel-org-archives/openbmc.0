Return-Path: <SRS0=GYqG=IH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A856C433E0
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 21:21:04 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA03D65253
	for <openbmc@archiver.kernel.org>; Tue,  9 Mar 2021 21:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA03D65253
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw7Rf1fM4z3cKR
	for <openbmc@archiver.kernel.org>; Wed, 10 Mar 2021 08:21:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=hAR38hYW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::136;
 helo=mail-il1-x136.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hAR38hYW; dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw7RC4J9sz2xyG
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 08:20:37 +1100 (AEDT)
Received: by mail-il1-x136.google.com with SMTP id g9so13523855ilc.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Mar 2021 13:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tXsFhGulqBvTZESeLUu+8jiZ2gHqjRtsUetw1/CcR9c=;
 b=hAR38hYWJvmX3PmVA4so5ZnxBXQV367VBU90TO7UAH5tUpOr/oL2tvtAKCMGN+jyFV
 aJw85X3dqkcW1dVSjbZrkyt3ilJvRQf3a4Q1T7VQI/7mUhrUXFI0PTFBtIxMyklzABj0
 5y7y8iCDpBG7LbRH/MhmSKwcoPIVi3xsCHrC99lwFmzY0GAElCF1A09bvpcqUgqRSYic
 wCJeFd+jM6eDjpjyo3mpC33OrP4eZ4JYWgLh69E7DG0iVZ7ZNE6XK8KYTUprMFObVuir
 wWp/Baep4RcDUKih9bV06QhlZbaZY4IGnKFB0vwPx40uiXGAuyY4HYOKKXVNy3HCpGZQ
 qsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tXsFhGulqBvTZESeLUu+8jiZ2gHqjRtsUetw1/CcR9c=;
 b=mvIYq+eRa+j58wBeoUDFLQrbWBKrIxLoit+mlAbTU2DC6N+XHQ8FsTBy7huRr9rcpj
 6B05or8oTd7YO5E6SnKkEI2rrlP+acSeWt13SjO4kZu0BhgHP1x4NRqFKKjitnrxPIBO
 1MuI/52mFEMHjGB6nXjsv1xfuWwUhGr6flE4ZJGgEwQ0ZRDKCJHapK1nH5PkSMoUevrH
 cb2AL5FLlrgWDswQh9l5hOljSQYoMAVRURBa0UaEJp0+lucr960gQ1jNEhlA76eqjHcQ
 baBc5bwfWsHGKFPG4Qplkg2rW2/QAt0gi7LdKaF0vqpaNdZ3XUpy8dS5EtMGrdtycjxB
 V0BQ==
X-Gm-Message-State: AOAM532UvHuM48J4deTBUyNHUIPdSF602wNwe0wZXlwp0c8LXADVntp9
 WnYXNXhRJ8nt1a96reLqO2cGYuIG0lg8K88gSSUMKI9nF+M=
X-Google-Smtp-Source: ABdhPJwZJXmA6r8cAC/bUTcZaO+xiFuKj/KiQoNr074zakcqt9rUkjyRlbT40TPsRdxunjlKZ04XyHLvs+668UvNP3M=
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id
 i14mr140844ila.58.1615324833282; 
 Tue, 09 Mar 2021 13:20:33 -0800 (PST)
MIME-Version: 1.0
From: Nancy Yuen <yuenn@google.com>
Date: Tue, 9 Mar 2021 13:19:56 -0800
Message-ID: <CADfYTpHsG2yMZ4zdGeb+g1wT6+PvvB57owyPgZnEOFysB40b_A@mail.gmail.com>
Subject: [Announce] OpenBMC Monthly Office Hours (starting 3/16)
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000e2f73505bd211e1e"
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
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

--000000000000e2f73505bd211e1e
Content-Type: text/plain; charset="UTF-8"

Last year, we proposed OpenBMC office hours.  Thank you to everyone who
volunteered to be a host!

Office hours schedule and details can be found on the OpenBMC Office Hours
wiki page <https://github.com/openbmc/openbmc/wiki/Office-Hours>.  The
highlights:

   - Intended for newcomers to OpenBMC
   - Please sign up on the wiki for a slot if you want to attend to ask
   questions, unless the host indicates differently.  More than one person can
   sign up for the hour.
   - OpenBMC Discord #Office Hours voice channel will be used unless host
   specifies differently.

--
Nancy Yuen

--000000000000e2f73505bd211e1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Last year, we proposed OpenBMC office hours.=C2=A0 Thank y=
ou to everyone who volunteered to be a host!<div><br></div><div>Office hour=
s schedule and details can be found=C2=A0on the <a href=3D"https://github.c=
om/openbmc/openbmc/wiki/Office-Hours">OpenBMC Office Hours wiki page</a>.=
=C2=A0 The highlights:</div><div><ul><li>Intended for newcomers=C2=A0to Ope=
nBMC</li><li>Please sign up on the wiki for a slot if you want to attend to=
 ask questions,=C2=A0unless the host indicates differently.=C2=A0 More than=
 one person can sign up for the hour.</li><li>OpenBMC Discord #Office Hours=
 voice channel will be used unless host specifies differently.</li></ul></d=
iv><div>--<br>Nancy Yuen<br><br></div></div>

--000000000000e2f73505bd211e1e--
