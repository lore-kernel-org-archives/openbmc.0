Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::234; helo=mail-qt0-x234.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NDiKUxLv"; 
 dkim-atps=neutral
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4242vn258ZzF38k
 for <openbmc@lists.ozlabs.org>; Tue,  4 Sep 2018 07:21:24 +1000 (AEST)
Received: by mail-qt0-x234.google.com with SMTP id x7-v6so1876378qtk.5
 for <openbmc@lists.ozlabs.org>; Mon, 03 Sep 2018 14:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ffkQ+KkzRR7BDtWATdVuS8mRdCAm8PpZzQ+0fcvvKk=;
 b=NDiKUxLvrFK+9KLFS3GgRZPQqVhWX8Ko8wCZNjvaTxhW33gDi++UoBa8cSnHU+p1JL
 mnhJhmerVP2drYijS+iXtSKoVI+tQqmrmmncj3uTE0MtTQWITowABQQIpMqUzv1Mpmm/
 CTC3wEaVINXaKk+yUDjG51OcPHisexCIOhfqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ffkQ+KkzRR7BDtWATdVuS8mRdCAm8PpZzQ+0fcvvKk=;
 b=XfOGsy1LZyZOI2yX4Z42YIxHeffEC1kfe7B3fqGOwfoRGEIYjFWYsoPGuqw+ngQxpo
 fM93DsFRhYATsmJwZTv5l4zMy/ssjEo6ojg66Gkj67kcJNrM5rKKjdCZbjfQUd1fREVd
 mIKEwawxVgGnsAWurrTYT7UoLzdChzuWoWPaXEG1tFfBy8TgQNTXLPRaNjtp+JAbXoSD
 v+M1HOXLn04ZBafnu2fCwtJ5oEXAM8LKmP2ncVQgd6369tiESNUxXnvyq+g0a26EWXcz
 oRq3SyprU1BVuZDCYKS0Jv9SYSVORFL60iobwt14Lzz244WbAe6lpBTymmA0KwTnrPMe
 XYvA==
X-Gm-Message-State: APzg51B3sbKy2wmy6pulmyxgfxtHF3T0Pg7+15/Cz9U4InSYhYbRTFHc
 cPJoC6P6G4cHM8XpI8gUPsRopy7rNyLIys6X+nI=
X-Google-Smtp-Source: ANB0VdaiyBbmhZlmyAO5rpeZEpVjUsPKt0yfW6ioiovlGl4x8eqCC2V+O6CEK9Q/8sIGIqIwUgPWv7+HGfNz30cidB4=
X-Received: by 2002:ad4:4089:: with SMTP id
 l9-v6mr27050808qvp.160.1536009681911; 
 Mon, 03 Sep 2018 14:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
 <CACPK8XdnZLoLhLLX5jKEd7StWLFdE8ujXdQMFb2w0N7asnY7=w@mail.gmail.com>
 <ff51f90b5a654cf498067dc598717518@NTILML02.nuvoton.com>
In-Reply-To: <ff51f90b5a654cf498067dc598717518@NTILML02.nuvoton.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Sep 2018 14:21:09 -0700
Message-ID: <CACPK8XdRU4EEKavmH4E=Co3jBQ0Yw9A-PpvKwp9wZeqhhdYn-g@mail.gmail.com>
Subject: Re: Linux kernel: Moving to 4.18
To: Tomer Maimon <tomer.maimon@nuvoton.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Eddie James <eajames.ibm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2018 21:21:26 -0000

On Thu, 30 Aug 2018 at 07:24, <tomer.maimon@nuvoton.com> wrote:
> Please add to dev-4.18
>
> Commits upstream to kernel 4.19

Some of these were already upstream. I have picked the ones that
weren't and put them in dev-4.18. Please test
6082c3474393633ed6452419e9c3e41273201121 and let me know how it goes.

Cheers,

Joel
