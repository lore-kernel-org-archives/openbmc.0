Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fy5zdUGx"; 
 dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44jd8x2w65zDqBZ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 04:59:45 +1000 (AEST)
Received: by mail-vs1-xe35.google.com with SMTP id a190so10113599vsd.0
 for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2019 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pn+U/XcnHQsmhUG1o9Jd8oVMExjy9RjIJ313FonRuuw=;
 b=Fy5zdUGxotUGVbk0BfxrOEfyliXN+69FV5Okg1nJ8hbR/X8638pPJkDVkzeQYjwGP2
 TZyRzy2hFn2c1nyt5cqTKZvXntP1RoGUrpSjjbFJNT/ydOgpRK0MH6Xpob85Sxt65W48
 h0VewVh7FrGh0n8Xwh8yoDfl6xFT9ci7j4nJwe3zAu8C67bMHDXag/yV+vv2ao/2X9Fh
 c3a3IC0zsy8MkAKjGdO/n/XC5uNXBW/8MQftOl6Lt17xYEDGGl2PLJpUtnklcprcG9s8
 fIrC02QJKbji5pPRGLfSXQHhXuOcUZ2/kgS/cjpHQUcMVeU2iCFWGeJhB/ZZu8LBklkU
 H0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pn+U/XcnHQsmhUG1o9Jd8oVMExjy9RjIJ313FonRuuw=;
 b=O62eCVKVLNWMj1iBAhSj2Q9oXdOYismIgbNbUPx/Gw1SJQTsgjEPkjum2KPTrLQjde
 CWIOj3+fhE6An7plZdlcg9s8/QR41LE9Stm4ZuTZ0sY/n0Rn/nQ/qnFmu2NDh6P7qvcW
 BOAeSkyQJjGtiELmRur2vZHp2GnBwauByMBeRt4nGRiD40Q24PBneDhNxvRYyqkQo/+z
 nkpfGzcaddKWltXOmo8M0GonDtHJyJcVbLUjzmUggZdqG28171NbyUgHXphhYPyBa7Y9
 4i0bNul49WJ/LjfofL6oFD3Ci8g3L7AMye3jmDG4M9WCRLUP8GtJm8WRrrNsgBrKeaVO
 oO+Q==
X-Gm-Message-State: APjAAAX2jhoXvCt+bvRjNvE8gQD0GoOcDLRKomB5/nOQZzSi7ZOEf4x/
 T4OvZfto4janPn+stkzA8h72AUEcAqJXB6NrMyA=
X-Google-Smtp-Source: APXvYqxnAU6+BfNF5xNnmlP1Mc31+pkxQg3j0394DRV0frF4jmxe1xhsyD56SJhaA7FX3iZEBEp5PxK4LRjErc5H4ug=
X-Received: by 2002:a67:c812:: with SMTP id u18mr42545182vsk.87.1555354781598; 
 Mon, 15 Apr 2019 11:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAG5Oiwi4iEc3nv3S5eJL-WYP2NrMA1oYe5nA2XrU5LRWi88s-Q@mail.gmail.com>
 <CAJoAoZnFbQYT1T5MtHswC5a+iu_+Dj0f=50p+HMRTK9EqXJRAg@mail.gmail.com>
In-Reply-To: <CAJoAoZnFbQYT1T5MtHswC5a+iu_+Dj0f=50p+HMRTK9EqXJRAg@mail.gmail.com>
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Mon, 15 Apr 2019 13:59:30 -0500
Message-ID: <CAG5OiwhWppC8g+1VAdOifcMNV1q8QJK3QVA-nNJoF_tjTv4_SQ@mail.gmail.com>
Subject: Re: OpenBMC website updates coming soon
To: Emily Shaffer <emilyshaffer@google.com>
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
X-List-Received-Date: Mon, 15 Apr 2019 18:59:46 -0000

Yes, I'll add that - good catch.

Thanks
Kurt Taylor (krtaylor)

On Mon, Apr 15, 2019 at 1:11 PM Emily Shaffer <emilyshaffer@google.com> wrote:
>
> Hey Kurt, could you point the Code of Conduct link in the footer to
> the modified CoC in the source?
> https://github.com/openbmc/docs/blob/master/code-of-conduct.md
>
> On Mon, Apr 8, 2019 at 12:08 PM Kurt Taylor <kurt.r.taylor@gmail.com> wrote:
> >
> > I now have access to our openbmc.org wordpress account and have
> > already updated the broken link there. I plan on adding links to our
> > community project info. I'll also be adding news there about upcoming
> > events, releases and so on.
> >
> > Let me know if you have anything that you would like to announce there
> > and I'll get it done.
> >
> > Kurt Taylor (krtaylor)
>
>
>
> --
> Emily Shaffer
