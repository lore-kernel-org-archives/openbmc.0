Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="fm/2DAAC"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437Nq35RywzDqX8;
 Mon,  3 Dec 2018 09:59:11 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id l11so11832934qtp.0;
 Sun, 02 Dec 2018 14:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2TvXV0hTCOcTxrx2KsS7UbKMfrrAJBCgpa8JkTjwFvw=;
 b=fm/2DAACjRnadLg9+sOS2DBh5ZE0aZ/sUNFuM0JPdbOeTyb0JPAZHL0oeI7RSN9DJV
 qPF+Vk4JpZ/YkeTWJ5fFGBPyGrD2c+3lObFTJF2fw7hv9lcCTacFyuzGMjHCAKlP+F24
 cOjHO5osVGHHPLXyLO9n0hSsCrxLDHVS8KF+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2TvXV0hTCOcTxrx2KsS7UbKMfrrAJBCgpa8JkTjwFvw=;
 b=UhkcOoXBaRXiAMVc463SV72+JtkCVB+BSWnEeF5483jjlu2jXi07l2BuEbKRCSpwIU
 5ShHpYzgxMjVGv18UJE7Qbd5wggqSTXGhlPROkplCuyewiL8PJvyCiKrT6MQIx8gwXkX
 1sRYp7/CUhZ7nyqHJncymupYQWfhxAGro4CkNI2ns+aY4tIgJvzB7mEdv2u8Ltvd2xV4
 HbW9yzUJke0k39jfxiBoeXNomQg7CqmK4X5AUC+fQszN0vX1AIxFTifxs3GkSKyVik+o
 k9xgP9SopETIKjcf7kzY9vLY4LGLxHUGF1F8yy1oJ+7VTWjh/z5//kSFfjA3bttVSzAL
 vYzA==
X-Gm-Message-State: AA+aEWYpfOJiOKN5XUNqsMQCxophrzwELMulWgZHrjME5l8ech+gCZtO
 XXH1Qzbt+d10SxwwTOqTRjTM6fK69ljIn6EJ/SIGjQ==
X-Google-Smtp-Source: AFSGD/UY+m2PICT71eDW75AQvAj/SGeSdxeSF1jBVruD3LfelpVJ0yHUMKEPfXP1xrdmYTaD+t8TwBXpG9UJtEhuAIc=
X-Received: by 2002:a0c:a4a3:: with SMTP id x32mr13531528qvx.89.1543791549430; 
 Sun, 02 Dec 2018 14:59:09 -0800 (PST)
MIME-Version: 1.0
References: <20181109005046.210657-1-taoren@fb.com>
In-Reply-To: <20181109005046.210657-1-taoren@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Dec 2018 09:28:58 +1030
Message-ID: <CACPK8XfVHDwso=kMXjk_6Q0eEJTQxUC5B=onqLfw6QzAYZU7vQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add Facebook Backpack-CMM BMC
To: Tao Ren <taoren@fb.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 02 Dec 2018 22:59:12 -0000

On Fri, 9 Nov 2018 at 11:20, Tao Ren <taoren@fb.com> wrote:
>
> Add initial version of device tree file for Facebook Backpack CMM
> (Chasis Management Module) ast2500 BMC.
>
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
>  Changes in v3:
>    - including pin configurations in UARTs 1-4 device nodes explicitly.
>    - including external pinctrl controller nodes gfx and lhc explicitly.
>    - deleting misleading i2c-related statements from commit messages, and
>      adding comments for i2c buses in the board device tree file.
>  Changes in v2:
>    - including "aspeed-bmc-facebook-cmm.dtb" in Makefile.
>

Thanks. I've merged v3 for inclusion in 4.21.

Cheers,

Joel
