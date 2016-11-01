Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x232.google.com (mail-oi0-x232.google.com
 [IPv6:2607:f8b0:4003:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7p070WTKzDvNS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 10:51:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Yzhx7DBd; 
 dkim-atps=neutral
Received: by mail-oi0-x232.google.com with SMTP id x4so3664558oix.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 16:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=sqYeKzIaFITCiOBDQ+AzK9Dw2Ixddfa/CAtLLA9W0fk=;
 b=Yzhx7DBdISNNZd2PcvFzHk8X2GQrIhGjbIV2eTuP1z87vb/pHD4o5//dB0P8zrbuR5
 8+MmK4fFJHJ3jVNQi87RmVZFD5GxvQthtmI/Jd/ngw1MthW+7TO/FDojxK9SmjCyl45J
 Upl+4Fy9lN5xsYYpeMseWBVQX3E8gVRSmporCGjfdyOIJvaF1V1ljDHwKJR0ROzD0Aii
 2SB0ANNN9cnm8U4luG4GzNmvFcP0BWoGTsiFbu7ZXx8AtxMKhlAYXp2NM8XE+PRUbsF1
 tksK/A4ytat1xqAUGBZwA7r+Qe6vN7392S1YByIHip4QnvUYivIRwt9domxiG9iqVmEA
 cJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=sqYeKzIaFITCiOBDQ+AzK9Dw2Ixddfa/CAtLLA9W0fk=;
 b=K5H2qE2x1liEz7nwrLESZJowjGu39i4rJ+kfiRCDiEFHRHEO5J7cIB2duP5NIyqiN/
 N1sDc7W8k0m0sXdR1NHMEj4FIqvF7s36l+DiljiFZiZklp30+ii+0mtJQgWSXwnPYQNK
 8UQeEAic4T2+KSTjk3KJjK6TCileJjvalyoppd/tQGItXSsYQiLRFyy0qSCsQKJR0m+T
 m9oSSd3ewC1FODLKNDu8OzubfupaXcrPi5X/fV9q3l9R0y2wT4sW5FPc6HSlWScRnCkY
 0EmMyPJscc6Ab4EJyegwS0weimjoMnx5Q/287vnzJDC5+2pXDd2lfAhCRTqA1fRDW7iK
 ymvQ==
X-Gm-Message-State: ABUngvcqIpWGyigZAA7V1Yf8l8HqwlkwNOF8qy5omlvmYrmSe3ig02ednSLN2ie6V1ekKDrx86L5iJk3S4SPyA==
X-Received: by 10.202.179.68 with SMTP id c65mr553763oif.125.1478044260278;
 Tue, 01 Nov 2016 16:51:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Tue, 1 Nov 2016 16:50:39 -0700 (PDT)
In-Reply-To: <CAPH-5w5ZUracAQ+mbLtBHaAeo9F+FpyDi-2yQ9UPWExj2__Xiw@mail.gmail.com>
References: <20161031150038.zcvop7gbpu44ojsf@asimov>
 <1AF77AD5-4ACB-4DCF-8429-A87096312A27@fuzziesquirrel.com>
 <CAPH-5w5ZUracAQ+mbLtBHaAeo9F+FpyDi-2yQ9UPWExj2__Xiw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Nov 2016 10:20:39 +1030
X-Google-Sender-Auth: ZBs-wtgS7t4rxcWQA95zRvKGVOM
Message-ID: <CACPK8Xd3XC9WcSmnz61NFaEJZPDowL71XovBRqPVYE7DbpEqsQ@mail.gmail.com>
Subject: Re: Opinions on CLI tools.
To: Xo Wang <xow@google.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2016 23:51:03 -0000

On Wed, Nov 2, 2016 at 8:41 AM, Xo Wang <xow@google.com> wrote:
> Hi Patrick, Brad:
>
> Based on your criteria, I think iotools would fall into the category
> of a narrow-mindshare tool when viewed from the broader project
> perspective.
>
> We'll keep the iotools image inclusion internal to our layer, since
> the primary benefit is Google developer familiarity and ease of
> porting our collection of traditionally host-side scripts that depend
> on it.

Out of interest, which of the tools in there are you using?

Cheers,

Joel
