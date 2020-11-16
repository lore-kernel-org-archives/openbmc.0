Return-Path: <SRS0=DP8Q=EW=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04FEC4742C
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 16:20:59 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1190B22263
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2020 16:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8fvivrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1190B22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZZ7W5ZQRzDqNZ
	for <openbmc@archiver.kernel.org>; Tue, 17 Nov 2020 03:20:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j8fvivrL; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZZ5L2mQjzDqKL
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 03:19:01 +1100 (AEDT)
Received: by mail-oo1-xc33.google.com with SMTP id q28so4033662oof.1
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 08:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mEWZWVny3DzRQaKyGhsUsJEdRWFB3p6tPs7kk0rw2jU=;
 b=j8fvivrLPQ8OEDCw+bL7JlysUT8jzxkNW87A6c0d1Tw6q7woWbnZejj9yEC2l8bu9v
 t8kpXHkWnlMOJ0F8H0k8chSmZdV6OovBpUY/mUnlo38dJM0pTHMa80YKW3P+Bx4QyOwJ
 P0Pje36Yc7uDZOjF1kJHbdai0v8TUENGTBZ5hZSxwzWKYjQhTgS4QgpMww7P6SNpks75
 vfCPgcktO3GOJVbTDlvef5rJCGAczLgg0OSmxLbSrCVqozy6h6VgfSTr9fpy8BVnWbb6
 0TppQTppPtJndfzE8nEHAjOSR0LgxloYImFR5e3d5S8rQTBn2P9NR9/o6lLfaYt2PH3X
 nTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mEWZWVny3DzRQaKyGhsUsJEdRWFB3p6tPs7kk0rw2jU=;
 b=RYDTnXSF9hcIiCyQtjs6ZRSLKy7uZQpykz0SahjG9Z81cYFnYfuiNF16Nqfofig+Li
 iDKrW9SYfPRusYcfWNndFDXb+yF2UmynNPK/dmspgOvxy2GGMkUTpZb7+e2TB2kty2Oy
 fP42o2+oEnf1iVhPUC7HvbDNWUhrasMlgbMe4OZk1RyKbZGmYQjGesMCeJWCQdvCANE6
 AaKDE5mi1yNVs921TtsiN+JhcOC57eZO8kvwvydSHi9A6dMGnYWbLihPRvXYBoYTzTHo
 0nKXwOXgh9L7D+ebazM2xKBohjVuSdh6ad7GQe6KX5pRHH4dFM9ptaaly7FwTp3JH1nb
 dfHQ==
X-Gm-Message-State: AOAM533BwpC/+lEE7RbQnYXYIu+Vxh4eFn1be7CVFcL0i96n1HZD4CjS
 UigEmrwaeAnbqGdM86EPhHw=
X-Google-Smtp-Source: ABdhPJxd2GUfi0w4Xft6sQz5wJBqEFpvHBWH4W/BjO6jA2R48B78OgyU21ywYxQ3uM5dgfIrBXLisw==
X-Received: by 2002:a4a:3b83:: with SMTP id s125mr92957oos.82.1605543536934;
 Mon, 16 Nov 2020 08:18:56 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:b437:3772:6361:e1b])
 by smtp.gmail.com with ESMTPSA id q10sm4756760oih.56.2020.11.16.08.18.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Nov 2020 08:18:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Add peci-pcie repo to CI
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <eef808e1-34e1-096e-a335-5b6ebbff9964@linux.intel.com>
Date: Mon, 16 Nov 2020 10:18:55 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <033645AC-B5C4-4FE9-A1DC-BE2030431613@gmail.com>
References: <7d749dad-e4c0-0243-d701-4a6448fe3433@linux.intel.com>
 <eef808e1-34e1-096e-a335-5b6ebbff9964@linux.intel.com>
To: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>



> On Nov 16, 2020, at 9:32 AM, Wludzik, Jozef =
<jozef.wludzik@linux.intel.com> wrote:
>=20
> Hi OpenBMC,
> I am looking for guidance or advice how to enable CI jobs for =
telemetry repository (https://github.com/openbmc/telemetry =
<https://github.com/openbmc/telemetry>). Thanks in advance for response.
>=20

I added the repo to our CI. I do see this error though:

meson.build:1:0: ERROR: Meson version is 0.54.3 but project requires =
>=3D0.55.0

If you need that level of meson then please submit a gerrit commit to =
openbmc-build-scripts
to update what CI uses:
=
https://github.com/openbmc/openbmc-build-scripts/blob/master/build-unit-te=
st-docker.sh#L284

> Thanks,
> Jozef
>=20

