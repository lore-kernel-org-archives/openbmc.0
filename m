Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mml8EAtC"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 442qCg4k5KzDqKS
 for <openbmc@lists.ozlabs.org>; Mon, 18 Feb 2019 14:31:27 +1100 (AEDT)
Received: by mail-it1-x144.google.com with SMTP id f10so14498961ita.4
 for <openbmc@lists.ozlabs.org>; Sun, 17 Feb 2019 19:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m95NFxNrF/YmVtgxwOtis+e4eqg+kg9wYRQ3FWA1ors=;
 b=mml8EAtCZ7bqYYO+t7uU+FyWfbC0fH52Td47cA+7JylImnF6CLBhQ1wktbRts3k7bk
 IbNPedYb9FsRQzRB+ziGAkFZB/HjhjOn39CUnDZNqk6E1ps8ogzAPoCroOELg11cmVlo
 +FvJeR4CTvnj69Uk6tTrEDE5MS9HylHChljJqmx+9Kkv3cjtuK94Aln9k0iwvwnfE51m
 DVzTNhzs4MV67AHS4L1RyKGXLLlQdE9S5VaX41jlvVjjqEo9qce0GWTIn+vjWDWdauEr
 xA0TooBr6rEsNqF6aVyjabd2O8mw0P5zM86CVS7re08uJ6kFtlNuJ/cs26FahCHbC1mY
 EeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m95NFxNrF/YmVtgxwOtis+e4eqg+kg9wYRQ3FWA1ors=;
 b=U+BxgLqNJ7TL2iupBPPBpmap/pS5tjw/XUnNrBeBAxtnUAwjnjqLuw/7cdNxsc9b+8
 HC0Hf39xA5Xg6JuSvcLlqBTsMgbhK3goh2af6B6vzr3iaY0G46whMmauPG42HeM/R9Sn
 bV71IB3+Sn5oSK7IBWHls1RTciZ5ZuM7hhLhppeTi1pOzaWQ3jV3n+vy0hMSl4YLfHK3
 dtyFR9mXlORBgCclRY31oQO1XEncoRLbT67kqp0/RqURYvmSddBHPGrS83yJ+ltr/kZw
 rxjgab+TtcSywDPaemP22YAUWvu4Ysxz2UWG+BNyYtMlSC3CBICXxWHwGFEK39lHZIEn
 eDzA==
X-Gm-Message-State: AHQUAuaSKURqm7pa2oiqADxfKam2FY1YUUGjL9B36kN/5Kq1W5ZyTN4E
 VlO4ibkEHycZDcH4NXpRx4KkVpwRKOo2VTxHURY=
X-Google-Smtp-Source: AHgI3Ia4hXgkcslYjNRio8IG7VkoWpeZSaVbS1rE65U3bNpfGb/VRq6N7xvx6wlku/uTdcm1ZKsqfTD2x581eQjkZ/Y=
X-Received: by 2002:a24:5f52:: with SMTP id r79mr4100418itb.125.1550460685101; 
 Sun, 17 Feb 2019 19:31:25 -0800 (PST)
MIME-Version: 1.0
References: <1550216841-57006-1-git-send-email-mine260309@gmail.com>
 <CACPK8XeYeGw_PRhn8ZW8e9ep=PRR6PTb4VOcBC5nc=RRdeRVDg@mail.gmail.com>
In-Reply-To: <CACPK8XeYeGw_PRhn8ZW8e9ep=PRR6PTb4VOcBC5nc=RRdeRVDg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 18 Feb 2019 11:31:07 +0800
Message-ID: <CAARXrtn0e_4o+XA=UNmkh7UEg65bPFPAbX-yJWGU68QCfX7qnw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.19] ARM: dts: palmetto: Fix flash_memory region
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 18 Feb 2019 03:31:28 -0000

> > The flash_memory region was incorrect and exceeds AST2400's RAM range.
> > Fix it by putting it before coldfire region, and aligned with 32MiB.
>
> We've had a patch to do this in patchwork for some time now:
>
> https://patchwork.ozlabs.org/patch/879522/
>
> We can't do that as it breaks booting, as the FIT loading will
> (sometimes) place the initrd or dtb in the reserved region, and this
> stops Linux from being able to map it, causing boot to fail.
>
> We need to fix that bug before we can resolve this issue. There is a
> u-boot environment variable that can be set that stops anything being
> loaded too high. The proper fix is probably to make u-boot's FIT
> loader aware of the reserved mappings and not put things there. Other
> suggestions are welcome.

This patch puts the window a bit lower, 0x5c000000 instead of 0x5e000000,
and from my testing it does not break booting.
