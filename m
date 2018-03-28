Return-Path: <xow@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::22f; helo=mail-pf0-x22f.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vbowDaSX"; 
 dkim-atps=neutral
Received: from mail-pf0-x22f.google.com (mail-pf0-x22f.google.com
 [IPv6:2607:f8b0:400e:c00::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40BDNs5rHKzF2LQ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 03:49:00 +1100 (AEDT)
Received: by mail-pf0-x22f.google.com with SMTP id m68so1191781pfm.11
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 09:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/CA1eJ9BnorBfdZPuHMMOVy050JPvmGABBZyRWj+mY=;
 b=vbowDaSXmA9FGjYl0Y3zL6QpokbPrWcgsLCvbdCMEgtm9b4j0i3ZNQfLIaqasGEL/e
 GznL0+j2wlLAGyMKFsPRrE2omCflKE+6LJx7hSvH78oMp+5nO6QPqO3coJly08lyZSMZ
 avJ7HBTeEtU7EsUHlO44FJfraYHXliZPAosS9reLVj/dNoEgLvy63/7izIuX3KHZhEs5
 5k9fBQhB0LxSK6EJOjLAYqot4vpXhEHqFOhU0nDuMNqSPMS03kPVb+KdsE4qZiK7JFgS
 Ma7tPcBihHVJp7x1l6f2iFOAtf9bv/0dhR3kUwnTAHu5+mOAuEFG+InqczQU8cFmxERY
 1PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/CA1eJ9BnorBfdZPuHMMOVy050JPvmGABBZyRWj+mY=;
 b=PlVVuXYhHB9RCmdCs/BZvNXI+FHmhqYzEwcsqQHwlH0W/b6oByBANv1N8v0GWXA7zY
 Rf4gYp0C/FOGTaOuehCPti4CJ5fk2UEJGllKPnNziU2LWMKQG26nP/I1fywde1smJCBW
 oxUWN9HdCkZGqSY8mKeMDBXofH4ITpHwCc/FBI3R1wUk9cKqE8WmBwaMDErjiwSkow30
 +h8oldFK0kTQF9DCMXwqROzncV0qnD20cnCoBgR2Vzc3M1RN3dJaNEA5kNAKZW5+UOyB
 7TWA7iG0iv6P08u+fdUmEAdf3MVzYG52GvNDD7ARKNaYenlYMT6ZVAYwsVToHBkRMbjF
 InJg==
X-Gm-Message-State: AElRT7G6hJLZrjwYFB/5zGccCoBDh9Cd1N/SNUMZM8nMayUAizTGZTY8
 YXCbirHdDogyok5NX96Hp3abTZPA14HC8OJ6NYaQOg==
X-Google-Smtp-Source: AIpwx49Sf5ndteJL/5olErZM4g+GWSjSWPGDyO/cl7Fnz2eiE8WysOwQcWJb+zjeoF1rqgNV3ZZIaZJ4AgM0wsIJpKM=
X-Received: by 10.98.217.85 with SMTP id s82mr3592335pfg.208.1522255738095;
 Wed, 28 Mar 2018 09:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPH-5w6f25PWLwhZ6669eB9HrjH50Bq1-L+YqC5R21RAE2aOXA@mail.gmail.com>
 <CACPK8Xexitu__0UQ=Om=Ao8b-mmsUhCXeHOpoFB9LbEcGO00NA@mail.gmail.com>
In-Reply-To: <CACPK8Xexitu__0UQ=Om=Ao8b-mmsUhCXeHOpoFB9LbEcGO00NA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Wed, 28 Mar 2018 16:48:47 +0000
Message-ID: <CAPH-5w434v=1K3_QGOuBvQzJHtEqtTPUD5moiDk7RbKLrhQ-Mw@mail.gmail.com>
Subject: Re: Xo deactivating
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Robert Lippert <rlippert@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 16:49:02 -0000

On Tue, Mar 27, 2018 at 9:38 PM Joel Stanley <joel@jms.id.au> wrote:

> On 28 March 2018 at 04:28, Xo Wang <xow@google.com> wrote:
> > hey y'all,
> >
> > Heads up that I'm no longer actively working on OpenBMC so please don't
> > expect expedient code reviews from me. I handed off my Zaius machine
layer
> > maintainership and nobody really touches skeleton these days.

> Thanks for the heads up. Who should I ping about Zaius related kernel
things?

> It was great to work with you. All the best for your next project.

> Cheers,

> Joel

Rob Lippert is fully familiar with the Zaius kernel support and already
owns some Google parts to be upstreamed, so I'll point to him (...to pick
somebody else, if necessary).

Pleasure working with y'all.

cheers
xo
