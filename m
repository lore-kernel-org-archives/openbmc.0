Return-Path: <SRS0=ySTy=HO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749F1C433E0
	for <openbmc@archiver.kernel.org>; Fri, 12 Feb 2021 08:25:39 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957EF64E2D
	for <openbmc@archiver.kernel.org>; Fri, 12 Feb 2021 08:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957EF64E2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcRQS2g0dzDwxm
	for <openbmc@archiver.kernel.org>; Fri, 12 Feb 2021 19:25:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rVogwN5q; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcRP305YSzDwwr
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 19:24:14 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id u4so10581653ljh.6
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2021 00:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4QtRP7t8Cqt7Zt0AmnpBiTpw0QsRRYsCTiIBHf9N+0A=;
 b=rVogwN5qGXKHZw8jS8KeHozl1/d1t7cbJm5keBbB1liAdxUF4/orhzCcSoBKp3WjWG
 HqHTbQUdLkmJTkh2da/AZSLEr9BTF7I3VVPO6Jb6XPcwox6Np69iyk4PsM/6199zqAED
 jIZw5+Xj24j3inqJxZYbTSSPYg8fe/7nSgX98xUYC629YxIQNTlTTgxMxTsKqIe5hvqw
 dXm7+O3gg4o4OABeWyfzADBxDo1XUzAm96axWnwdq92npgnjux7b6NBC+i9JiRgmg0Cl
 AoVguj1asIsC6gredLH2SOyaPDTeu9+UQnZv4au1UF4IREvA1i3XqIwV6LnPQk6LQq7l
 TZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4QtRP7t8Cqt7Zt0AmnpBiTpw0QsRRYsCTiIBHf9N+0A=;
 b=NgVPFTuBrk/o9MduJ5qcKB4K4L56le7Q85SCMlUYP1iWwuc+ewpIat6/kMcxKvRohj
 UNCFGGdJBf9t9exEDkcJqYVdnLiIvBGSsr7Sc0EddsXNB+jdEGhr4w/sONmmfcYQnPYR
 6ECnL/ZdbIvlJs5o25McCbdV/r+QFzpjNbhOIprwlZEx2SHnoCBWogPeaZX+Nes98AXG
 TNjvWANj1UBNLu6f+hYzut9e98gFMWiJ1g8d+ajMxwq51ouTyqcdfNTVFQKywF2/rb7O
 ak5mdnXbROi1PbBa9a30OkltG+otB5VJTdapUCtFAJQdyiWrQQnwToQNbrebLaRZv5pO
 nCDA==
X-Gm-Message-State: AOAM531o5bNTsOP+xm4W5ZVwNvLsmWIhe5eeKCBM/XYy76QpY1HfXxm/
 c4IEBfCF7sjAxQkDY00EAyDbz3wha/v5OTiSkXsQrQ==
X-Google-Smtp-Source: ABdhPJzquUd4ZWErN3S/4cnERxh6F+nJs7jN3KlfXXxGcEQ6JrbmiYABGJcLHhMWvsSJIoytqcDddlQIcZMpRAkowWY=
X-Received: by 2002:a2e:a403:: with SMTP id p3mr1054267ljn.368.1613118248643; 
 Fri, 12 Feb 2021 00:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20210130162954.918803-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210130162954.918803-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Feb 2021 09:23:57 +0100
Message-ID: <CACRpkda8EK+Y7mtcO3VZ2iL6fO_dNP-wzTbVSPvPL+Y0hG7g7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: npcm7xx: Fix alignment of table header
 comment
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Sat, Jan 30, 2021 at 5:30 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Make it so that each column label is in the column that it is supposed
> to refer to.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied, sorry for delay.

Yours,
Linus Walleij
