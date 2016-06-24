Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbMz54ZYRzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 12:41:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=BCcBuTAg; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id r136so78683qke.3
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 19:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fd1ETkmWskjabKvslfp/XcRx200IsPkXgW4QptPjedM=;
 b=BCcBuTAgSgAnOYHhkdVJRrFBrBPAOu/w4nUCWwXxm1I6zWhb+zO6HPL96fNyehsxJs
 4l8wexwyDYtHocUO7K3Gt3OUeV7FMwF+p5TQ0yV258pWInzbI+nnJALxEXltYPI+js4t
 YH/5bMVr5anFZDMGpx0PpWvh6dZBZ3AbhVG31ImdaeCUp/seEzwtv9Atid1JFAy3RVyl
 gV8gTXFcasyNqpUpRQsbQ76JjmlhCM67ixPSV+zbYtPLP/5U2KBXX8gYcy2Xv/k+BrAJ
 pOhcFpR2LHmUCPEqf81IoyHqvL6AC+1dwTnLZy5aEhat3lipwFNkp+P+d4JfcgIvpp7j
 1dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fd1ETkmWskjabKvslfp/XcRx200IsPkXgW4QptPjedM=;
 b=QA5zRd2H2HNvCdAXLmrjYhmMCsPLkB2tMc1xvznk13gZ5XoL69ynlV5e7i6Es/LODU
 Dr+DXH8L9MFvdD2ZSl8cXoGWwlXlFOdc1s/cF5hLN+cnJrHYrZvMV+TDQsWrJhXBqLcP
 wFO1254XIw9MGUisNCWFfdNkoKs6LUjfx7J8Z/Men2bs8ekpQ+aGd26Mcrj0gi46okro
 57GSkpNsCJ/IL9+SJo4DegsqEisw8qTTx4sQl4B75NX1LvpxanmSXoUgOD7MrD9SYDGI
 uFyJ9EOqZLAz+jwV+ZrNAlItFAPAek6GejPT83F+RWXQaIZCF0j+fbWTkyHFhOr3MEGu
 kDrA==
X-Gm-Message-State: ALyK8tLn73Oeabs6oIry2L6IdX1jFuwYpm2UX9YiuXdkwj+QQBAZj9xJNFFjVMmVC+dbkbB0Wi+DevQuOcN3Lw==
X-Received: by 10.55.212.89 with SMTP id l86mr2022523qki.114.1466736079069;
 Thu, 23 Jun 2016 19:41:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 19:40:59 -0700 (PDT)
In-Reply-To: <20160623204033.13165-10-openbmc-patches@stwcx.xyz>
References: <20160623204033.13165-1-openbmc-patches@stwcx.xyz>
 <20160623204033.13165-10-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Jun 2016 12:10:59 +0930
X-Google-Sender-Auth: 9PJXH4QTN_RyyWolEwcABVZw0Xo
Message-ID: <CACPK8XfYmEOtb+PxiHi4VuH72hkNDRZheUO8BWRvC1N4-GNyQw@mail.gmail.com>
Subject: Re: [PATCH openbmc v5 09/11] u-boot-fw-utils: Update to latest
 version.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 02:41:22 -0000

On Fri, Jun 24, 2016 at 6:10 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Patrick Williams <patrick@stwcx.xyz>
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> index bfbdcf6..a514cf2 100644
> --- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> +++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb

Can we delete this recipe now we're using 2016.05?

> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
>  # SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> -SRCREV="4b44678c11ac82c7c797bb115e276181752ad54d"
> +SRCREV="44f1262bdf39ad93032d39f17a298165372be82e"
>
>  PV = "v2013.07+git${SRCPV}"
>
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
