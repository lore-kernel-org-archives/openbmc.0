Return-Path: <raltherr@google.com>
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rKh0H23wCzDqZW
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2016 05:54:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=EUhzuNhQ; 
 dkim-atps=neutral
Received: by mail-it0-x22c.google.com with SMTP id e62so103651143ita.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2016 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:from:date:message-id:subject:to;
 bh=PcngDK48U4jzNZ4s5FVLKzTAGXTexoM4VSJs8rzDtUw=;
 b=EUhzuNhQ7fTEnGB+ljZVN6m5e7q9H6euN59F4RWkWocbEn2Woz4ZifGfXx6H/+YTuN
 vI5JxSjHPhvGLeiqoen9S93jFgBWpUxZ4/0wqRSxJtLgLx/DN9nFQNCfvclvmmjxMdxH
 rlUI032VFC71hVsDRfxCwO0Af+eSKz8ZRaWdzlbK/lY1LIqZCI6jetkKf4sAVChk1ygj
 AY1r2s0KJIdQWdaZCMnigs9ybxEOdQGCuqV+OpZaQlVI2TjKXozDTjMyScAgyYlRfwAa
 E4sZkI2gueDZ/PXxZ/OM2PeMuvmqaMc6XSUTlhsQRjeel735LeLLNn+1mMv4MPGjaSNI
 DrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PcngDK48U4jzNZ4s5FVLKzTAGXTexoM4VSJs8rzDtUw=;
 b=Gzq4LzNlaf3nuCXA2MWfsp+BgrX5EnQWk1NabO5llQTvNzeb33llthoIrd94LytzNB
 tkGxBceiWHKU4PB85ALfC3ULzgqzUKsL04xGY8ieXwHz+7n13q9Vns7L+TAO9T5K5gpv
 RU/xMg3vls6fMDWUWQTE+8zK1kaqUNeG+G6iICIKMUCK87y54UIUiRghrXNSpWBkmFky
 M78aO6oYORyBANslVCevZX5TPR7QoPuDasx+UcKlAWYKLnJiugApLMMzNjbcfS58g8d9
 Mk7f19JAyrjGwID9aey54UJk+SIDYXVBaxbFvn7Iew+0SKJ1GOizDHreT33cZ8ORXJ6/
 NpDA==
X-Gm-Message-State: ALyK8tL0N2nQl1iThTjBIyjlZ3CyTwRMEJ/lNODe/OnVlRzCtKLw1sH+5w4Onl4EeRSLCYHszotO/NlNZwgaIkXx
X-Received: by 10.36.2.71 with SMTP id 68mr24597729itu.38.1464810891660; Wed,
 01 Jun 2016 12:54:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.164 with HTTP; Wed, 1 Jun 2016 12:54:51 -0700 (PDT)
From: Rick Altherr <raltherr@google.com>
Date: Wed, 1 Jun 2016 12:54:51 -0700
Message-ID: <CAPLgG==KjbSt766V7ztyOJfhp9=tg7ZDOboO+45Jwzu3CL7gjA@mail.gmail.com>
Subject: Roadmap for AST2500?
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a1144b1d0e04ac305343cdc5b
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
X-List-Received-Date: Wed, 01 Jun 2016 19:54:55 -0000

--001a1144b1d0e04ac305343cdc5b
Content-Type: text/plain; charset=UTF-8

For Zaius, Google and Rackspace's Power9 server, we'll be including an
AST2500 and plan to run OpenBMC.  I have a few people on my team available
to contribute to AST2500 bringup and Zaius-specific OpenBMC development.
I'm trying to figure out what all needs to be done, what AST2500 work is
already being done, and where my team's contributions can best be utilized.

I know Xo Wang (xow@google.com) has already been talking with some of you
about the kernel work needed for AST2500.  What is needed in Yocto and the
userspace apps?  I can easily put together a AST2500 bsp layer but without
a corresponding kernel, that's not particularly useful.

Is there a published roadmap somewhere?  Where do you see the biggest need
for help?

Rick

--001a1144b1d0e04ac305343cdc5b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For Zaius, Google and Rackspace&#39;s Power9 server, we&#3=
9;ll be including an AST2500 and plan to run OpenBMC.=C2=A0 I have a few pe=
ople on my team available to contribute to AST2500 bringup and Zaius-specif=
ic OpenBMC development.=C2=A0 I&#39;m trying to figure out what all needs t=
o be done, what AST2500 work is already being done, and where my team&#39;s=
 contributions can best be utilized.<div><br></div><div>I know Xo Wang (<a =
href=3D"mailto:xow@google.com">xow@google.com</a>) has already been talking=
 with some of you about the kernel work needed for AST2500.=C2=A0 What is n=
eeded in Yocto and the userspace apps?=C2=A0 I can easily put together a AS=
T2500 bsp layer but without a corresponding kernel, that&#39;s not particul=
arly useful.</div><div><br></div><div>Is there a published roadmap somewher=
e?=C2=A0 Where do you see the biggest need for help?</div><div><br></div><d=
iv>Rick</div></div>

--001a1144b1d0e04ac305343cdc5b--
