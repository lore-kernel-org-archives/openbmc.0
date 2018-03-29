Return-Path: <arndbergmann@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oevwOuO3"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BxQ667sjzF1WD
 for <openbmc@lists.ozlabs.org>; Fri, 30 Mar 2018 07:37:34 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id g5so7611008qth.7
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 13:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Mfao0PH4CMu37ynIrrMe5tpLNGHXgXD6YWUaWk2jLYM=;
 b=oevwOuO3k10PpRZgq9dAyjJVOHJmtVpSp5rsC8MI7z6240NzGcPobCe0R1qRXJ8NAP
 bkB8oLx2yrUVg36Lzy3G1wiAKW8WHU+y/kLKMZasF2nfMx1C7jXjn7zhdl/KEKj3YxUR
 kP6MG28bvTfTOdA2jfPMhNvX6JIrO6hNtznnbIB9Ch34B5aOmUhRMCICOOJhF88maWEp
 AFo6KTQdHDmnzNfSZqezvVBLPTqLCk8kyAxWdPL/dfwKR1itLTTHNc1tuyZF0pLQNWd5
 U3g9SgpYhDn1j4Wt/RHwO3N5KiIBi5qKlzNzMBHa7aI12lLD1hK18PuzhmgJIvPoPZqu
 DocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Mfao0PH4CMu37ynIrrMe5tpLNGHXgXD6YWUaWk2jLYM=;
 b=TUMvPvnHxQTcOhzbxXYcsaI7S0KjObBZyh01zJtibI0NBWuhtLNOBnV1eSDZROM9nC
 TvRICoLS9Xu4SrIPgBMKWLl4wSKPnjwP14OZeyc69cISDRaJwqF399kdsNjpGArBYOIZ
 zqQFxXIc4elsCq2DDilxEgGcxinT5LpT/7AtENnJp+vxnl2gKGKIAGuNScPOMepUmuGJ
 24LN23+YqMRQs60owMPrffEJ7BuxfKBClQ/KnYOQTz/lE+rM3DCoPHFdxEzu2DMzIifb
 A+UF5mI7mm9cRzBld1jMPHno5usoVw93GHt1FVSWD3DeKRJ+XDoYEjd6nDpmwPwRtFfR
 Tr8A==
X-Gm-Message-State: ALQs6tB1rkUs+pQhZRT6jJTj+Bstka+r5Rt0RUWk7Ni1mHBdmdoS60sw
 piIDYu5Ml9Nlx9X8hkRIPHDAZ38tCge0J+ic680=
X-Google-Smtp-Source: AIpwx4+Z4f8CFeXO25KMW02TqAG4m3Zz994vydx4mkd18PFZ5Pz870VuqGcV6iDedUpZO1L50YVUWZUWmjVq896T/Rw=
X-Received: by 10.200.18.71 with SMTP id g7mr13562698qtj.35.1522355851885;
 Thu, 29 Mar 2018 13:37:31 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.12.185.25 with HTTP; Thu, 29 Mar 2018 13:37:31 -0700 (PDT)
In-Reply-To: <1522059113-20418-1-git-send-email-tmaimon77@gmail.com>
References: <1522059113-20418-1-git-send-email-tmaimon77@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 29 Mar 2018 22:37:31 +0200
X-Google-Sender-Auth: vP3pTOx9YKIlKdbDreq76IEt-Bk
Message-ID: <CAK8P3a2MhXOPKob++DzWrMdmDwSkUketpdv-_VAEsEQSMkkNCQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] arm: dts: modify Nuvoton NPCM750 device tree
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Avi Fishman <avifishman70@gmail.com>, 
 Brendan Higgins <brendanhiggins@google.com>,
 Patrick Venture <venture@google.com>, 
 Joel Stanley <joel@jms.id.au>, DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2018 20:37:37 -0000

On Mon, Mar 26, 2018 at 12:11 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> The NPCM7xx are a family of BMC's that include several chips as:
> NPCM750, NPCM730 etc.
>
> All of the NPCM7xx BMC's have the common modules like Cortex-A9,
> WDT, timers, etc, and there are a optional modules that can be added.
>
> NPCM750 device tree already pushed to arm-soc.git:
> https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/commit/?h=for-next&id=d6bdd009c21db3f677dd1d1bbb8c20bc819074bc
>
> After discussion with Rob Herring we have modified the structure
> of the NPCM7xx device tree as follow:
>
> nuvoton-common-npcm7xx device tree include all common modules
> nuvoton-npcm750 device tree include specific npcm750 modules,
> the nuvoton-npcm750 device tree include nuvoton-common-npcm7xx device tree
>
> In addition, the NPCM7xx device tree include the following changes:
>         - watchdog module added
>         - clock module modification
>         - serial module modification
>         - Modify Makefile NPCM7XX configuration name
>
> Sorry if it cause more work after pushing NPCM750 device tree.

I only see one patch here, which fails to describe the changes and
combines all of the above changes into one commit.

Please follow the usual style for sending patches and do one thing
at a time. In particular, never move large parts of a file code around
in a patch that also contains other changes, those need to be split
up. Each patch should also have a description that explains what
it's for.

       Arnd
