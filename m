Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B75FA1A0567
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 21:36:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PeAcScuJ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=ZZFenSvh; 
 dkim-atps=neutral
Received: by oixx6 with SMTP id x6so9373823oix.2
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=B6GKYgrO+4fMhPYeJXH0xhEz1Rw6XkyteHbypbFzGFU=;
 b=PeAcScuJhaYP59yJJz4I0jO9sfoD+woxx5AQ37VynCG6t+sNGYN9SSY31l+DiR67RC
 hNrEy4ULF9bYHsrbDwla02MPrefAW6vOkflTEpdlW3xkSTs/fzBEBbEf5jP10U8sRfvl
 f7jpeNQeSXdoLvs3z+dd2DsVkH13juAYCgGuINugJAvpCCnUyCtTMu24QbKZ7zker4lz
 Vm4X1DAroSGR1c3fbQLlSEGcTC8cSLOsGcsr9SjsflBYk5SvplA6WoV19MuYLrWyKNcc
 QPHMkkfkCXFyPpfT2rbLHno5eLWsHRgXHD2StRLfYtsX7SlHng7Pm63a+uRB9gKVbdDI
 iUsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=B6GKYgrO+4fMhPYeJXH0xhEz1Rw6XkyteHbypbFzGFU=;
 b=ZZFenSvhjdAZt62dtolgC1re1D32GTswupE07UzKu8Iwrc+nlQmXjsw1w3lOjM/FjR
 2wQNZR1lHWbopIx6xtP/MoM/a9Kq9DnDX/pFYbhBtNkyhxWuGiHRwnDO8aXLFoj1Ihta
 A7Y0RhoEYX3YMz3bV33O8EV8tBYYP7pW19MW8=
X-Received: by 10.202.232.12 with SMTP id f12mr1095583oih.122.1444818975805;
 Wed, 14 Oct 2015 03:36:15 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Wed, 14 Oct 2015 03:35:56 -0700 (PDT)
In-Reply-To: <20151008000300.GD12084@asimov.ibm.com>
References: <20151008000300.GD12084@asimov.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Oct 2015 21:05:56 +1030
X-Google-Sender-Auth: oeW4MU_8Ptvep-dNbM1nj5eZzno
Message-ID: <CACPK8XdKBk+g7PJiHXVktKQEWNVeeUHRFUMVBV6a8CV5+76TZg@mail.gmail.com>
Subject: Re: Github Pull Requests
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 10:36:18 -0000

On Thu, Oct 8, 2015 at 10:33 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> I'm going to run the script directed at the mailing list for the first
> time momentarily.  Please give feedback if there is anything I can do to
> improve it or if you hate it.  I'll post the code itself on Github
> sometime.

It would be better if we moved to using the mailing list directly, but
this is a good compromise while the team gets used to open source
development.

Would you like to publish the script?

I wonder how we would go faking the from address? Gmail, etc might get
a bit unhappy I guess.

Cheers,

Joel
