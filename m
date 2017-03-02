Return-Path: <raltherr@google.com>
Received: from mail-it0-x22b.google.com (mail-it0-x22b.google.com
 [IPv6:2607:f8b0:4001:c0b::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vZ1l75NXCzDqGv
 for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2017 05:57:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B3yfvZPn"; 
 dkim-atps=neutral
Received: by mail-it0-x22b.google.com with SMTP id 68so3795534itg.0
 for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2017 10:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uEOq4GV3+AINKj3G/zS9jX8E2Nhr143aaC+8TLwQxPI=;
 b=B3yfvZPnljjtLRbv0/w1c+TaiTbbmWTkM9kUiI2XU7+V13Yp+SSg8pf0Mw+KWC+0o6
 WSr42VU7ZGXa8TKvpofJm2Zrvyv8aWqJruxSk5hqjP873Bxzku5K6NTzMK8iBVAg2s30
 ctrOGYUB4IZqct0w/ktn4f7BZ9idXmq+uZwPlPv2ldhs+KADuoLbimxo+31D3E2g3qeo
 7C2tB+7Q5ADkz2vUWCyPhhlq/VX8QYj4Fkip/mbkjEQzoXt+WTl9dp3JjDvjdTxY+71r
 znFND5fL7WdS7cHEGdzqfq2bnBcEEOD4gBjcpo75J+kgaIrhuu9nUS71LfvcGrwpGB2u
 yd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uEOq4GV3+AINKj3G/zS9jX8E2Nhr143aaC+8TLwQxPI=;
 b=p0L7CRmzAdzGV6HT4+XAjSaaujvyjbrngpTws5BtZWRLj+dzK5ifQgKH+6IYJndx2L
 VMyyYuwX2p7OcbkpSyy1KcRlPu+EWKEWzxtOGT630iJyxLT/8YLg7QaufHAKV1/quazw
 umfwpe8F3jL8FynvexkUplBDFAr0Hdb3PG1foTgHOBGvlze6cLKYwid774FafbMq98Gg
 ZZ093HOOjjfK4+aVaAD81jL/tvfTjGXZvXap5kycCsAog76hmVPWvjzoUCawssuvgw3k
 OLYOOnoT91VYP4TjzbBHfHh3H5f9gGKtjxT2OCCvnVUSpwJ5/Dr1k4vbwJDipzGm4CQk
 6ASQ==
X-Gm-Message-State: AMke39n9FgK0hrJ05cgwJ10PYmi78pSDGbAWO/ith2fYiFuhxYF5F/e4vwXjrg812ygJ3J8Gb2RFNfU9man5VvEY
X-Received: by 10.36.44.4 with SMTP id i4mr10841615iti.105.1488481025769; Thu,
 02 Mar 2017 10:57:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.25.109 with HTTP; Thu, 2 Mar 2017 10:57:05 -0800 (PST)
In-Reply-To: <CAJoAoZmWVWiAVxH4tHObCTtwxo_6JnjvmN-4zwM+GtxKhmOTew@mail.gmail.com>
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
 <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
 <CACPK8Xdx4cmCLp7TkVGCyk3ghGAET1WwW5yM871suNY-19cEzA@mail.gmail.com>
 <CAPH-5w7qxK6J6KsQQk6CVQt0eg6X2zfWDTPsTD09vFrpdh6UxQ@mail.gmail.com>
 <CAJoAoZmWVWiAVxH4tHObCTtwxo_6JnjvmN-4zwM+GtxKhmOTew@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 2 Mar 2017 10:57:05 -0800
Message-ID: <CAPLgG==uUMey8Ka3rF3ceGctjJLiKah8Jt8CfFdVMABu8s=hSg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Xo Wang <xow@google.com>, Joel Stanley <joel@jms.id.au>, 
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
X-List-Received-Date: Thu, 02 Mar 2017 18:57:08 -0000

Not that I've found.  Best I've been able to work out is grepping the
build log (tmp/work/zaius-openbmc-linux-gnueabi/linux-obmc/4.7+git999-r0/temp/log.do_compile)
for "warning".

On Thu, Mar 2, 2017 at 10:52 AM, Emily Shaffer <emilyshaffer@google.com> wrote:
> I'm going to give a try with those patches backported, no luck getting rid
> of the warning.
>
> Incidentally, is there a way to turn on warnings as errors with bitbake? I
> was unaware of those warnings until Joel pointed them out.
>
> On Thu, Mar 2, 2017 at 9:58 AM Xo Wang <xow@google.com> wrote:
>>
>> It looks like this issue is fixed in v4.9:
>> https://lkml.org/lkml/2016/8/15/569
>>
>> The cover letter to that patchset also mentions adding an unused "reg"
>> property as a workaround. I had probably copied and pasted the pca9541
>> bindings without "reg" to the Zaius dts without reading the rest of
>> the notes. Oops.
>>
>> Should we backport that patchset and/or wait for the next OpenBMC kernel
>> rebase?
>>
>> Emily: can you test whether the "reg" property is still necessary if
>> you backport those patches?
>>
>> cheers
>> xo
