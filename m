Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OKhlyxve"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Zbls3wbNzDqWX
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 04:31:53 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id n2so3602733pgm.3
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdHhiVYkBuPnx1GrxU48fHXjGJ9L/0G4/hNRmRJqUpQ=;
 b=OKhlyxveXSKJZUFph30iOYRertG7FgyI8qXEQtM1JT/VTQtMF9DzRicxERLj96GHQZ
 Mb58BLmv7S9zIaixWxAnlOy1CzTQ3dPyK/pmLhQ6bbEgkHbFe1LWNtmZaFi+ozZZkpWo
 vvkZOcDrTJ60CFefntYSBJ1GSTMlLaeIMXuh6AxwJoCMqlzhhOWTVem/323wN5EE3Egs
 mBJwI0RNzJstTebVXXetin7T1ix8CQD3+OHBkr31tGskutwXMhT6lrwzmFzFwDD7T+pP
 IE346Yo5jlxH8l5A+OsWlrTD6NUo2T8RNcOmfP+07JNmMNbmh1VXkAGiAa4Ghse3xfcQ
 IP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdHhiVYkBuPnx1GrxU48fHXjGJ9L/0G4/hNRmRJqUpQ=;
 b=OvyYhAIT37960Ea9JStxcFDSJ8p679zbg2m7s2KT7mWDFd4iwQjFsLht5Ln//WAkov
 ezMelECFgZhjJgNGnARvWeYtqSaXXOSbA4sUGps+76BHOYP+5q25zPFCPQKgm1l9StK9
 0tifQ5Pa4qL+yZXKEQbcHb/Wx4YFz60yyG1RHHvGpB4OkK3BxRxaN3Qv80+4HChjKsKA
 TKkwxYCfaxwo3bPCdfoVFobdAoxH0PR954m8b6e26D6IC49MES6goCy7DG2BGYHmW2vu
 PpMR4FMvIRxb8iiv4X65gzEa/2PUL/EFDQWpTcRv/0E2KlC5nP75SkFKjg5iFtOLkVyZ
 TdTA==
X-Gm-Message-State: AJcUukcwKFZKBrihWUAT9toNmK9dX99KkPNGvMwY95kbUF2ifTEC5ieo
 s0J52OFnA9d9ZTA87F6kfMGCuat7BSSutJp5DM+ivyZUHZU=
X-Google-Smtp-Source: ALg8bN7JQuMjkrmkL5p3T3TaW3cnaCHnPAuNBNYkeq3lsG3iDRFQoeYMiR7rjT7pPPPrQKAbcr8lDZKd1XtW7HEDZzU=
X-Received: by 2002:a63:e545:: with SMTP id z5mr6219278pgj.195.1547055110779; 
 Wed, 09 Jan 2019 09:31:50 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
In-Reply-To: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 9 Jan 2019 09:31:39 -0800
Message-ID: <CAO=notxRKPw1_=Pe3BCf1KMg-qdDzCNKV7QokjyhwLX2yPPROA@mail.gmail.com>
Subject: Re: Packet Size Mismatches
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
Cc: Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Wed, 09 Jan 2019 17:31:54 -0000

On Wed, Jan 9, 2019 at 9:10 AM Patrick Venture <venture@google.com> wrote:
>
> Per the maximum response size patch
> (https://gerrit.openbmc-project.xyz/15743), the goal is to know how
> many bytes can be returned by the channel.  This can vary by channel,
> per the comments, and other related changes.  However, presently,
> we're seeing a memory corruption over kcs which has a limit of 256.
> So, we're copying way too much data onto the response.  The code
> itself has no idea how many bytes it can send.
>
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.cpp#L409
> is a 64-byte buffer, but the ipmi message could ask for data beyond
> that, and leads to a blind memcpy situation.
>
> If I'm reading that patchset (not yet merged) correctly
> (https://gerrit.openbmc-project.xyz/16285) it lets the IPMI client
> request channel information to know the maximum it can request.
> However, what lets the code running ask that question?  How does my
> library know it's responding to a legal request?  Or is the idea that
> with the reworking that's underway it'll only be able to provide legal
> responses automatically for the channel on which the request came?

It looks like that method is in an installed header, and should be
accessible from downstream callers, however, how does a downstream
caller know the channel through which their request came?

>
> (Also, unrelated, but at some point is the goal still to have one
> daemon handle all ipmi traffic, including network ipmi traffic, via a
> bridge similar to kcsbridge and btbridge?)
>
> Patrick
