Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iLVP8pHJ"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyX0F1q4TzDrdP
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 11:50:21 +1100 (AEDT)
Received: by mail-lf0-x242.google.com with SMTP id x204so8671802lfa.11
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 16:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xl+PmIktipG29cxsIk2Vx/LPDN4do7T2LJyFd2PUVT0=;
 b=iLVP8pHJK3e8yMCQuHFcvrJrAeUwpr4MC4NThbWgwKklAA5wbiLDWXeTmEn2sDmBc2
 4WBcRDzWRrblX17zBaxRX0HzI3PFYeR3y8dK6LVbZBSIEM4285aAG51xRfgoM9wjQomi
 hUJE4xKJO5fxUYlq79oMOMcm4PaMTd2hdogkeb0MHNovzLGg6o9atYDqZrYJxQv+N9pg
 TWqyfPDpRakn+fZg7ovHQV9T8IaOpVVGt4t6Iw9797Cw9YXTs10nLVkvsmZBU24/u5Xs
 L2tMneldzKHobBBMSdqqBnmgDMuzQ7xcuhmaPBZVNWqp82RQJ+9KBj/3nIlTdWxQSOyi
 gIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xl+PmIktipG29cxsIk2Vx/LPDN4do7T2LJyFd2PUVT0=;
 b=Xhs32tNDtTcgwyGln54qYLuQW+EF5WV/LhpB1HAVJnbTY2DCe9RJgL9zNcFiUlIXqM
 I5v/fPQKNVmb1l/jjxNu84GDQUwKCv4ASdIJE4tJ4+jsNM/BtgHaynL3G0/+z64Igfr+
 uRDgaD6Uompcid7Un6Sc4wXeVR1B36r6CXwWVxYLoUbDnYOjkeFnMNWY4WepgHDc61tL
 27b3jd4znqQmoKdf0OSASBbvKAxKMzUiRrcFB54ImwEFXKZh1vxCiFTrm8mjDtZyI/M3
 6Qnp7uBsxT+IjYZsggFNAQWekUov9TUH7kVF774MFvHH9c7o57YbELAW23x60M5In9SY
 wHsw==
X-Gm-Message-State: AKGB3mISgrWxk6BBh+oafBS1np+pdBwha71ibQb00fdfuG29Mx/UQqab
 o0numgUzGVnKAGeWzrrpLtM8kpT6KzXpGK6CTCk=
X-Google-Smtp-Source: ACJfBovDMB+md4vxzorPN3FUK/QsxE0p8r89MViFrD3hofLnchi1E3z2uLxKb/1f3YSqQqoAIYYzFq+NFWAUPYBpq6U=
X-Received: by 10.46.29.11 with SMTP id d11mr5005466ljd.24.1513299018180; Thu,
 14 Dec 2017 16:50:18 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 14 Dec 2017 16:49:57 -0800 (PST)
In-Reply-To: <1513244371-10369-1-git-send-email-tmaimon77@gmail.com>
References: <1513244371-10369-1-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Dec 2017 11:19:57 +1030
X-Google-Sender-Auth: Ts4lABa4rEOTfMJrTHuoNgaAFo4
Message-ID: <CACPK8XcGZgx2aGez0Fzz3mZLsqo46BYV-rvixnE+GnEVN2axnQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm: npcm: add basic support for Nuvoton BMCs
To: Tomer Maimon <tmaimon77@gmail.com>
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
X-List-Received-Date: Fri, 15 Dec 2017 00:50:22 -0000

On Thu, Dec 14, 2017 at 8:09 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Changes since version 1:
>  - Add dt-binding documentation to NPCM
>  - Add dt-binding documentation to npcm7xx-smp
>
> This patch set adds support for the Nuvoton NPCM Baseboard Management Controller
> (BMC) SoC architecture as well as the NPCM750 variant. NPCM is an ARM based SoC
> with external DDR RAM and supports a large set of peripherals.
>
> The NPCM750 is based on Cortex A9 and comes in single core and dual core
> flavors.
>
> The device tree added in this patchset has a number of bindings for which the
> corresponding drivers will be sent out later and thus do not yet have binding
> documentation. Apologies in advance if you would like the bindings to be added
> along with the corresponding drivers.
>
> this patch set based on Brendan Higgins patcehs.
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?submitter=170155

Thanks for the submission. I am happy to merge these in to the OpenBMC
tree while the review is ongoing upstream. Please cc me on the
upstream patches so I can assist with review.

Convention is moving to use SPDX-License-Identifier tags for new files
instead of spelling out the GPL licence message. Please consider
updating your patches to use these tags before you send out v3.

Finally, please follow the tips in our documentation on adding a
branch to the subject line:

 https://github.com/openbmc/linux/wiki/SubmittingPatches#use-the-git-tools

git format-patch -v3 --subject-prefix="PATCH linux dev-4.13" ...

This is only for submissions to the OpenBMC tree.

I noticed you're sending through your work mail server, but from your
gmail address. This might cause delivery problems, I recommend using
the gmail SMTP servers instead.

Cheers,

Joel
