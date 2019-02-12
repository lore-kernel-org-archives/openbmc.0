Return-Path: <wak@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="ll3QktIZ"; 
 dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43zXpM32rgzDqLW
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 06:31:39 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id u21so2955159lfu.1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 11:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lbMpAGLzfLRj+WDgH/5Blly4NNYRA59m3MIv+SDHpyE=;
 b=ll3QktIZwxulsDTmR5VrLzqi1AE+wUgwSepZyPKOACnG7Y4BClZhwDOe5TuOnKomds
 LXbONIJId0eeiUVph74olGxZT/nGrDe3Nlzk0YjPEHsoKvNubUECMfzEKIhVXwXpxQS/
 LN2wyfPFWw0cW8eGwcqxirqwC26k1vfzdBrnb09GKqQDyMn72lg+LTdflAkC4s9B3BqH
 NwT2DBV0GrUpUhILejv1HbMu7FCJ37ALOW9bKAaFyt3mTyqSoyf0r5RQFFclrGqOYhcw
 F/useCv/t5IhE21CAPDpDgTtFhnyb+GuUIM93c07maC/1brKKnhncno9NI+bWHUEkxLd
 3U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lbMpAGLzfLRj+WDgH/5Blly4NNYRA59m3MIv+SDHpyE=;
 b=Ri7gvrt+mcjyk6JSWmYsYiGMikXyQxguwkRzPzORLgd0S147/HEO7GU6Hfso5y6Ebc
 d1p1CkqVSTlBqdYNjxsaaAelmWfsIU/yz0gK7vcRuOzzHqEybMwlyQsJEtqWON5xz/Hp
 FFGB2tohNLO8JOo49EZlXtGNi4XNzvDovhG8Xbw5RPr8lleLZCTbNL7bdqlZDTD9Wlb5
 oNEDFekzrTxcMp3WI395yeNBMsAxyXAV9zk0/IzS3ZvsbEveH7bSm5MYYI/aXFZ19oq3
 o2L5Kd8psn5H8oQvSXBVMLuCQ26akZKtrtBi29AH/QegIdOyxTxRffJrG/XQzVdZWYLs
 0wzQ==
X-Gm-Message-State: AHQUAuZF4Zs7jJnxlcPdwevLuXPbKyaj9w4FIgRixO2rjUI+pL5HTkRk
 lTrtTzGisCg3/CMhOgYPghfpuZY5oSPGaKMQTXms0A==
X-Google-Smtp-Source: AHgI3IauNCLgR7nyHxAMujM5wdpQ+OXyhGMrfuMkJVfVsFvWzU7BNY+OV9SVrxgcj6hcaK3VCDpNaRpbTxhr5PB1W8c=
X-Received: by 2002:a19:5209:: with SMTP id m9mr3299881lfb.51.1549999895504;
 Tue, 12 Feb 2019 11:31:35 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8XcrM9tT6WgaNAPDTmSMFEC4qb3ETx5uVj2UrrB396tMGg@mail.gmail.com>
In-Reply-To: <CACPK8XcrM9tT6WgaNAPDTmSMFEC4qb3ETx5uVj2UrrB396tMGg@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 12 Feb 2019 11:31:24 -0800
Message-ID: <CAPnigKnGz=8cEiUYYvmv3CcQP6ygN-8NzLLV2KfktSkxx=JVCQ@mail.gmail.com>
Subject: Re: ppc64 asan issue
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
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
X-List-Received-Date: Tue, 12 Feb 2019 19:31:40 -0000

I'm doing autodetection for it now, but it is something I need to test
with a compiler closer to upstream.
https://github.com/openbmc/openbmc-build-scripts/commit/0b7fb2bcfd603949f9999127f56e3fc0e0351fbc

On Tue, Feb 12, 2019 at 3:03 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi William,
>
> I saw this change to our build scripts, where we disable the sanitiser
> for ppc64:
>
> https://github.com/openbmc/openbmc-build-scripts/commit/282e33011ea62fe80bff2c5ab0e9ef9446d6c551
>
> It would be great if you could open a bug report about this one. As a
> starting point it should file it against GCC, but even an openbmc
> issue would be a good start.
>
> I did some investigation myself and I could reproduce the failure on
> GCC 7 on Ubuntu 18.04 ppc64le. It didn't happen with GCC 8, nor with
> GCC trunk.
>
> However even GCC 7 took a few compiles before I started hitting the
> issue, so my testing may have not been comprehensive.
>
> Cheers,
>
> Joel
>
> --
> My testing looked like this:
>
> $ cat san.c
> #include <stdlib.h>
> #include <stdio.h>
>
> int main()
> {
>     void *p = malloc(4);
>     printf("%p\n", p);
>     return 0;
> }
> $ gcc -fsanitize=address -o san{,.c}
> $ ./san
