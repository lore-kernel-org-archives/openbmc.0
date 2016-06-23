Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZtJ63mRwzDqjb
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 17:24:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=KXZJiNJR; 
 dkim-atps=neutral
Received: by mail-qk0-x22f.google.com with SMTP id t127so96582428qkf.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 00:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=PBhbA8OFeFpiLMNgSiOpZaprH4CWheLg+CrX70ccmwY=;
 b=KXZJiNJRqEAEva8Zu+1y8IT5msALjc8zuYqa55j2RWo48K5NL/eGWcwExC7lYf+FHu
 9gPyNbn2PxpM6xlgMqnuo4tNxaAo9Woks0rb0idqCnebCApwnM+RBGRuIrzgOTtzELBE
 GzzXLn8/1IbWaYxCLmyR6oCTYSUFUcPNS80kfYvYvKT9W12OnlZEwwNkcbTtnrO7oZRY
 5q57ktfPszNOS5/UmELKOFwIFC8LWWOBRwup1NocvSKAw8hWyKIJaLZCXORFkyK32YbY
 Zx0paeBk353LqNXLml9C0UAov8DU+TJNPC3kOYgNSAKzChOM0VM7gY2GT3UzFYPMo9ff
 lJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=PBhbA8OFeFpiLMNgSiOpZaprH4CWheLg+CrX70ccmwY=;
 b=caMTm3v575dWzvAC6VuK7nfnDJiD+DF9hirpOJyoFz/hPfDJKCC2FriPMkFJWoZSyU
 etWlkUP+Ajct3Fa1a78yxReNuDQ5SxwxmDBb3x2qn9NBlffr1XwAIb//oitglu7Cbnjd
 7XapImWU8gb7DT4+3nmv+0nu2/QVAlXV7JdPknBmMZX40yetP5hjpFnMiLPLq8Na+Gas
 dhpNF9UkIKh4Terq5/tLWPi6VT8hTwCtcc1XloJMcSSPpJ/o1igaKRvJwxnTvaE2ch/T
 EM6OKQUTrumAckj85Cj0T3OnUiB4UAw6uBcQvvMvh+OrAtScv+xlqxRiZUAmwkGwvWOk
 xfWQ==
X-Gm-Message-State: ALyK8tKajKpinXkF4FXu+F9hl9VF40DWpBUos4Wl7/gZJ8RSfJMjW/0Lsr7Jtu0HMFLmxhYCBkhKhYmEPPjQgA==
X-Received: by 10.200.40.88 with SMTP id 24mr28976297qtr.73.1466666659877;
 Thu, 23 Jun 2016 00:24:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Thu, 23 Jun 2016 00:24:00 -0700 (PDT)
In-Reply-To: <20160620151652.GE19968@asimov.austin.ibm.com>
References: <20160620151652.GE19968@asimov.austin.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jun 2016 16:54:00 +0930
X-Google-Sender-Auth: tPgV9sBHdfUR-qnGCbNe7-dbhCo
Message-ID: <CACPK8XckHuFwbcX7bV5geozc2+fmDiZz0VMW7ynDsXguaHGe=A@mail.gmail.com>
Subject: Re: OpenBMC v1.0 tagged!
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 23 Jun 2016 07:24:23 -0000

On Tue, Jun 21, 2016 at 12:46 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> I have just tagged v1.0 and uploaded it to Github.  This is meant as the
> release to support Barreleye in production capacity.  Thank you to
> everyone that contributed over the last year to get us to this point and
> congrats on this major milestone!

Thanks Patrick. It's rewarding to know our work has made it into a product.

It's also great to have communication like this on-list. As our
development and user community grows, I think we want to make an
effort to keep them informed about what we're up to.

Cheers,

Joel
