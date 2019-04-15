Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="SKr3vMGl"; 
 dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jc554bd8zDqFZ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 04:11:20 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id h39so20279380qte.2
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 11:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4SRgMak7QYMiV35EOJbcM/ayu8FBgIkApDO0eGueVf0=;
 b=SKr3vMGlqF28e9lin3KnyBq2ZVi2ilOKycvDML5HE28SHjkfQkiAMiw9hlh90bJ3Sd
 lp0nCDzgt2/MaRr5pAIdncRhjA01qOn9y0G5+2gOlfwpjfMyoXncuOo5D2xSpQkgMv7u
 72bs3sudA8yhniZ+I0T4T2z7Ez38m8jo2SOJIlg4GEHNEZemKfEulc2BIolMO222CdCC
 iMz1cFG/lGantddNSBwEDvoj1qeqUHwG8GnxstS4dtCXM72HB2TaN3gqrI7J02C2Epot
 SE6ENTKElmuf4K7VbcZ38S25GCcE8fGetOVgXNOtThLcAoCzxZaSRV3+2DzQzUQ+5KLx
 q1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4SRgMak7QYMiV35EOJbcM/ayu8FBgIkApDO0eGueVf0=;
 b=pTEAjhAuqW0s4upZ8jTIdl/QQ7Y3dI4w5oE8hbWxX9bf3uir6YXQzuGMZ4zhu3aVr0
 h8JjxNy8kbRDciQZgxV13dpVEcKRBKqJPiYjTtKfRx7BGM4989DTH6SIQI0mD0fyYCgu
 bxKlkA7z3t3peyHexypR5/hyblnu+J9S139mIlmLkEX+czBfHYd2tjA2cUzJcy3Fh+4W
 tulcRjMgei50fS2Q9Y6YdlgfDLhL3fgN6wgl/sUidwgqFrok+qDHAr8LnPYSps0tdC2Q
 m59nKGuzG+tzS3xF4idlIQaByQyFPctPL9p3jcGZdvnqGlW5HL79p203KDKt8IjPnSTP
 bmJw==
X-Gm-Message-State: APjAAAUl7/nGDVpEIXiYHbFnm/CPUyWKowfX4UKYDLcStLRJz4821aqQ
 k0Tgs03cfbJtczLJyFx22biQhzHSQLWeAaOOAWXGoQ==
X-Google-Smtp-Source: APXvYqyoMP1H3SqZ02NUYy9Z9EaFVudMCBij2BE/2LXKPejxNE3tREgV6/xAMV6Vl9zIF+Tk4W2LtoFYh5OZPrqe2Us=
X-Received: by 2002:aed:3c75:: with SMTP id u50mr60789861qte.128.1555351876885; 
 Mon, 15 Apr 2019 11:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAG5Oiwi4iEc3nv3S5eJL-WYP2NrMA1oYe5nA2XrU5LRWi88s-Q@mail.gmail.com>
In-Reply-To: <CAG5Oiwi4iEc3nv3S5eJL-WYP2NrMA1oYe5nA2XrU5LRWi88s-Q@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Mon, 15 Apr 2019 11:11:05 -0700
Message-ID: <CAJoAoZnFbQYT1T5MtHswC5a+iu_+Dj0f=50p+HMRTK9EqXJRAg@mail.gmail.com>
Subject: Re: OpenBMC website updates coming soon
To: Kurt Taylor <kurt.r.taylor@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 15 Apr 2019 18:11:22 -0000

Hey Kurt, could you point the Code of Conduct link in the footer to
the modified CoC in the source?
https://github.com/openbmc/docs/blob/master/code-of-conduct.md

On Mon, Apr 8, 2019 at 12:08 PM Kurt Taylor <kurt.r.taylor@gmail.com> wrote:
>
> I now have access to our openbmc.org wordpress account and have
> already updated the broken link there. I plan on adding links to our
> community project info. I'll also be adding news there about upcoming
> events, releases and so on.
>
> Let me know if you have anything that you would like to announce there
> and I'll get it done.
>
> Kurt Taylor (krtaylor)



-- 
Emily Shaffer
