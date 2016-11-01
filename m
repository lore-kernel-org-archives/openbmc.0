Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7ncS00z1zDvNS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 10:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=mbW9UzBM; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id 62so15937034oif.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 16:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gKbo+xzYDJgIVQB01ZiZ1z83xEpFByG4r1CfTYTl0fc=;
 b=mbW9UzBM+kNTsulcQ5fJdPfGZYRKfCjugD0FQV6P7Z2WEOwaghJRE4coBjBBrQOrG8
 QAcfq8e9oFp5bYWl2KJDatvq/8r/tcYZKT+xZ/B5LnOwFshZW7grV9PiwDhOKDyINHLj
 0+JXHymydcYyeQU5EH2KwxzvbUEKU2wXv1XmKeHAeqKoMjBNPLae/E6jFX+Wi5JgW89E
 7UngHEHSB8GsZct5FzPOgyY5awmDxCeAt0su0Dg/pRXuHzXCCFivllHgPS6Z/hysJhmD
 M5WrtOrYYzIfmlU+CNgPN/HU9BkIvTdCerA5v9G/D2nzc59NMH6/X3pe6oPlpLG7A6h0
 FQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gKbo+xzYDJgIVQB01ZiZ1z83xEpFByG4r1CfTYTl0fc=;
 b=Fd6kQpgzZsq9kX0R3BCACH64h68SCQgtTEM2Gz2TyPFalTT7uokad/Gq65n0R7FGVB
 hFrMyBiXVKBu2O7Y5UZHj1jR5LsmkuXBo0fBXHZBcBIDsKIRTtNz9U94cnbgcrLU/zk0
 wSPiUShl9bM5Da1wVEfrlPD4dfr2fuFLijOxoQWj4F2u/lSBTlK+w4GjTI4a22ms0lg9
 fj5bZz65ZVRIJ4s/0WGEXD0j8NVlvGur+S8jtRyqgIjLmHLBGyXGJUPNb3hC4VzykNuC
 HuveppzdkZs2SV2PiLgbHgfIvyzOTU3qCT7gPtI/Lg/NIPDWJvmAYeAR8OQoq7KIfqc9
 f/Gg==
X-Gm-Message-State: ABUngvdBrHOBb8t3UT2ZzWIRnYnXadyuvHPeH8RsvunyQaFAHdDt+q+6kfqfYRe2R85LBkyq1FWipKVK4Oglmw==
X-Received: by 10.157.15.154 with SMTP id d26mr381671otd.85.1478043237704;
 Tue, 01 Nov 2016 16:33:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Tue, 1 Nov 2016 16:33:37 -0700 (PDT)
In-Reply-To: <CAFd5g45iH7=9EAmnN886DCCToxw-nJ5F_J4VuTxhj0030hHquQ@mail.gmail.com>
References: <CAFd5g47EH6Q=CAbs7BTBC7JBg_Gv_otK78p3hP431qBAKq=fuA@mail.gmail.com>
 <CAPLgG=nrn6ttw0AoueeFAiU74ib7v3BZk9OdOyu8mGrx3OCTCQ@mail.gmail.com>
 <20161101190930.gkr6bctv6iejbfj4@asimov>
 <CAFd5g45iH7=9EAmnN886DCCToxw-nJ5F_J4VuTxhj0030hHquQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Nov 2016 10:03:37 +1030
X-Google-Sender-Auth: AWFG4zZ2x4EF3FaUh94QvOjtpjU
Message-ID: <CACPK8Xft1E3F+QStUcFn2zu2xQOR=PaTxTo-n1noUbLSh61huQ@mail.gmail.com>
Subject: Re: Adding a MAINTAINERS file
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2016 23:34:00 -0000

On Wed, Nov 2, 2016 at 6:04 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
>> I'm not sure how you can enforce specific reviewers in Gerrit without
>> yet another config file per repo that we need to maintain.
>
>
> Again, the goal of listing reviewers is not to enforce a particular set of
> reviewers, but to offer a quick and easy reference as to who you should be
> talking to; where to direct your questions; and consequently good people to
> put on your code reviews; I see no reason to make that a requirement since a
> maintainer has to sign-off anyway.

Can we add tooling so pushing a review will cc the relevant
maintainers automatically?

In a past life I used repo to interact with gerrit, and we would add
the reviewers to the command line. This would be similar to the kernel
workflow of using get_maintainers.pl and git send-email. Perhaps this
is already available for non-repo Gerrit users, and we just need to
add it to our documentation.

On the proposal in general; I think it's a good move. Did we consider
using something like the OWNERS file that is used by Chromium? In that
project, developers are added to an OWNERS file anywhere in the source
tree to indicate they should be consulted over changes to that part of
the tree.

 http://dev.chromium.org/developers/owners-files

As an example, this allows me indicate that I should be consulted when
you are submitting a change to the u-boot or kernel parts of the tree,
such as meta-phosphor/common/recipes-kernel.

Cheers,

Joel
