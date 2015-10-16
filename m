Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CEFD41A075D
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 15:38:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vVc74fA6; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=Y5OcoZ4D; 
 dkim-atps=neutral
Received: by oiar126 with SMTP id r126so58025813oia.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 21:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=6dYiWJLdN3CGDUGZklhavQ0EoDvJNBwYnl8G55pgM48=;
 b=vVc74fA67rlq4EUtyVaCoqEzAf8GSDVFcSic0QzmrAjPeCINQQpUDFs1/w3D1dQVLq
 HXNT2ShLWnb/cEmN6fAX0XCWU/6Xxg8C8Rf91HMyGgnYyai1YvPMvstdrLDEBWRjz545
 LotQ7idvnJ39OhtudrCuda76tOdzMTB6mgeXfNs1bvRV7JCkFFehhA7dAhclL4I2kZJz
 C7pyUOOwwSE3FI2SmkuQ3EJmSJKg5xgTRZpFj5+WaZMISd8KbrcyISZmy3ZR/GkigudB
 x3m9b0hxeIRxm7REDf4s6C4bjWlt0B9i3ocKKqzLF24Qgrvnh9POzfvmEn1jt5Vwwdax
 sdXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=6dYiWJLdN3CGDUGZklhavQ0EoDvJNBwYnl8G55pgM48=;
 b=Y5OcoZ4DyYzxDqSfD/z/W7cUWQOy5KaoBYwD6XBcfqWbbcxe1COGHYKbwc2u7Sfxdp
 5tNnsdtdVTi1pYRWTow3+egvhmhEsvBW/BiD5Ki+o8UVZfNpCmLyZ0VxOJ5jXZU6U9n7
 0qtR0przB0/UffLUGhhTTAfK2GajvwrncYDPw=
X-Received: by 10.202.91.2 with SMTP id p2mr7201678oib.41.1444970320564; Thu,
 15 Oct 2015 21:38:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Thu, 15 Oct 2015 21:38:20 -0700 (PDT)
In-Reply-To: <201510160429.t9G4TOAZ013079@d01av02.pok.ibm.com>
References: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
 <1444923803-24688-4-git-send-email-patches@stwcx.xyz>
 <CACPK8XfvXL2Cq=tavbmaMsczus_fbV38V6NxSEujpqkMA8mLaw@mail.gmail.com>
 <201510160429.t9G4TOAZ013079@d01av02.pok.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Oct 2015 15:08:20 +1030
X-Google-Sender-Auth: O2MgiqsRyQkAVnsQNGc72Pu0-Ro
Message-ID: <CACPK8XccWFdF1mu_Vf1Sxtb92ZRG098JLQUVx129gtsiRqnURg@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid 3/4] Suport examining sensor records
 and calling dbus
To: Chris Austen <austenc@us.ibm.com>
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
X-List-Received-Date: Fri, 16 Oct 2015 04:38:43 -0000

Hey Chris,

On Fri, Oct 16, 2015 at 2:59 PM, Chris Austen <austenc@us.ibm.com> wrote:
> Thanks for the code reviews.  The questions about the files in tmp... I
> first put them there because there wasn't any dbus objects to to do anything
> with yet.  Norm has now provided those objects but since then I have found
> them pretty invaluable in debugging and building a system.  I hesitate to
> remove them since it is a great debug entry point.  Would you think it could
> be cleaner if I added ifdef's?Or maybe if I set an env flag?  They are
> pretty worth while.

Coo, for debugging that's a different story. I would simply print them
out though, perhaps hidden behind a verbose or debug flag.

We should decide how these tools are going to do their logging, and
adopt a common method. Jeremy has some logging code that we use for
opal-prd that backs into syslog; that would be a great start I think.

  https://github.com/open-power/skiboot/blob/master/external/opal-prd/opal-prd.c#L172

> You are right about the lack of consistency with the function and struct
> naming conventions.  I'll have to pick one and go with it.

It's something that we should nail down. I really like the kernel's
naming convention, as many open source developers are familiar with
it, and there are good tools for checking code and patches against it.
It would serve us well for C and C-like C++ code.

Cheers,

Joel
