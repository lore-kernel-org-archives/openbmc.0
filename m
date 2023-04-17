Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52624C77B70
	for <openbmc@archiver.kernel.org>; Mon, 17 Apr 2023 07:29:34 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0JbJ5x59z3f44
	for <openbmc@archiver.kernel.org>; Mon, 17 Apr 2023 17:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0JZk6XBGz3bWj
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 17:29:01 +1000 (AEST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-54f21cdfadbso357018967b3.7
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681716539; x=1684308539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnMtUDlq18qCzE4nMfxBUChC3EigpjNhzosV0xBwPc0=;
        b=DDgA+Hn+WyLJkg/cg/j/tLQnmpOlI9/i8ozoA6pL7eKNw3IgnUcOT2OeG2Wqq/HRpd
         8j4i6nqOSfZ8KaxqXm6VnbBuwpCsFrb3lRzqhwI1X7OkPU5GTcx498JGMO7EIDHc/13c
         j0MUhNCn5fNC1352ZmI9/eEnb/B0pMO8o22EsIdRclgWrncCVmh9JFxjLvgghGrH2cbN
         t+wbK0d9Ia5cE3kChtuDdE2Udnge+NEoTcnPAe1BrAu4DlYdjoqbqLNgmlqVx4mfpfjH
         Bkzk822PYj7EYrvOXaPtuG8WvRevmQCNkkCynBmVCmdEBSb6OAs4xmHPEga4lE8N69EZ
         zlRQ==
X-Gm-Message-State: AAQBX9dkbeYVAr/BX6sNqrzdSgEv51jNNNzQDgFF0RHqPwLd8RXsDy3+
	1gLJIApmZNbqdvFBL9hYwry+zpDElt8Wrg==
X-Google-Smtp-Source: AKy350aknhSlnGUqftQ903lpLkqUVWVDxqiYhgjlkkLDZKzrKCnR6TzoM9dm01K6NpMSBLgg1iu60w==
X-Received: by 2002:a81:49c8:0:b0:54c:1d2e:f371 with SMTP id w191-20020a8149c8000000b0054c1d2ef371mr11561313ywa.27.1681716538902;
        Mon, 17 Apr 2023 00:28:58 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id a84-20020a811a57000000b00545a081847esm2969512ywa.14.2023.04.17.00.28.58
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 00:28:58 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-54f21cdfadbso357018737b3.7
        for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 00:28:58 -0700 (PDT)
X-Received: by 2002:a81:b71c:0:b0:54f:b931:adf7 with SMTP id
 v28-20020a81b71c000000b0054fb931adf7mr9321539ywh.4.1681716538192; Mon, 17 Apr
 2023 00:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412183834.3769519-1-j.neuschaefer@gmx.net> <CAMuHMdVdJooFiLfttxeRVZO_0doWiurwg3ZkxEbyO7D8eaDeKw@mail.gmail.com>
In-Reply-To: <CAMuHMdVdJooFiLfttxeRVZO_0doWiurwg3ZkxEbyO7D8eaDeKw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 09:28:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_y3ctAWAWSU-PjdE_hwBJjkgwFhpBQ84WFrhcXU8_2Q@mail.gmail.com>
Message-ID: <CAMuHMdV_y3ctAWAWSU-PjdE_hwBJjkgwFhpBQ84WFrhcXU8_2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] soc: nuvoton: Add a menu for Nuvoton SoC drivers
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Mon, Apr 17, 2023 at 9:25=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Wed, Apr 12, 2023 at 8:38=E2=80=AFPM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > Add a menu "Nuvoton SoC drivers" to make it easier to add other Nuvoton
> > SoC drivers later on and to prevent asking about the Nuvoton WPCM450 So=
C
> > driver when configuring a kernel without support for Nuvoton SoCs.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Link: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-Vb=
QmQ5u+4Q8c7-wYQ@mail.gmail.com/
> > Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")

This reference is wrong, it should be 7dbb4a38bff3.

> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
