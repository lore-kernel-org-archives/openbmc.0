Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gYAnGvKw"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zLcvm72r7zDqJv
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2018 04:41:02 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id e2so19224221qti.0
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2018 09:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2a9pp4O6qfR3T3+R85zGnQPh2469JxjbNAvlo3AQba0=;
 b=gYAnGvKwslEAZf60H7e2uo2oQS7bNn/zUljiq5pE79XQOnWskO0kl/fdWd3+6Rl1BS
 kjKVV4YVyCjAvclCbNfkO41GaO2faOvgt9qqj4uN/QeDQHPDwYU1csClfoHo8tcnGdjg
 beGSldoc0c+mVh0bXPyLUcFXCvevyT0cqfB3XdW1zXsDwuOoURYHgZojNg5UxLkbOC60
 RbqHKKPOvWtBfxr5Wcm+QcBhkR1cQpxwRyu9+Yidy/ZvJSEHC+cSqesYNe1Zq1/57EDE
 TF1scUIRBh49J6I3v991fmf0QJb0V/anMBzsRyKHYDNxNt1nFhX7gbZ1E2XSUBpvAA9M
 wCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2a9pp4O6qfR3T3+R85zGnQPh2469JxjbNAvlo3AQba0=;
 b=dBfmx3HiMr1zqjzPx4/fQAcHkhlhugHBT6+xraaUiyiuXzSowpsF27KdvYQXRew/XW
 otzvMAZmXUEKEUZY29W209DnR48YPy+OAvyJ1V7xxsv81c5/nvynEHnvMsoJNNZDC9FM
 ATjeos1jEsqJi9sc0RBF+7a5IFk8h+HxnekQcWQK4u1zHyKWQ1mQVo0Le/KcPFE+hdp8
 TCV1lHcOudcfGcGDF9/yNp7aZDvCRjKagPcgKO6c4VhqZmx6dkDx0bopgDOeKzKtg9zI
 t2gIUgGn9qcICipIYxYjfS5KIRD8ploy9M4RK4+jqOTQWshAheoEwjEVGFu+K9oRv/GO
 GTPA==
X-Gm-Message-State: AKwxyteVXJ4FsjD8M3OMFikivOgONocLnPQKmIm0DU4/ZECjtV2xv5AZ
 eOjo3MBtkIK5ga6+qtGEqoFGX2ZaeR1vGoBgf6gl+gMp
X-Google-Smtp-Source: ACJfBosXqhp+yjQzVjZkPHBWgp8RtVHOOnNq43E8gPlWCCtgdPYbK3xXB22R4YO3//NtZRXABlv5hhtWTQiuVlT9LR8=
X-Received: by 10.237.49.134 with SMTP id 6mr11935239qth.178.1516124460274;
 Tue, 16 Jan 2018 09:41:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.29.9 with HTTP; Tue, 16 Jan 2018 09:40:39 -0800 (PST)
In-Reply-To: <20180110224414.21516-1-andrew@aj.id.au>
References: <20180110224414.21516-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jan 2018 11:40:39 -0600
X-Google-Sender-Auth: iIzHhyLb2t3lqeRLaQIItuakmLQ
Message-ID: <CACPK8XeuAvoxMEvM719R05ONWBEk1Dh5Tvnpb2nq2o6RszOqeA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/4] gpio: Implement per-pin reset
 tolerance on Aspeed
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jan 2018 17:41:12 -0000
X-List-Received-Date: Tue, 16 Jan 2018 17:41:12 -0000

On Wed, Jan 10, 2018 at 4:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> This series backports the upstream commits necessary to enable reset tolerance
> for GPIOs on the Aspeed platforms.
>
> Two of the patches come from others, these were useful in the backport to
> resolve some of the conflicts.
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (2):
>   gpio: gpiolib: Generalise state persistence beyond sleep
>   gpio: aspeed: Add support for reset tolerance
>
> Andy Shevchenko (1):
>   gpiolib: Convert fwnode_get_named_gpiod() to configure GPIO
>
> Laxman Dewangan (1):
>   gpio: core: Decouple open drain/source flag with active low/high

Merged into 4.10, some what reluctantly.

Cheers,

Joel
