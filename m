Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sN0jY1wnXzDrgb
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 15:35:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=eOQdC8PP; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 2so5331000uax.2
 for <openbmc@lists.ozlabs.org>; Sun, 28 Aug 2016 22:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=4Jkx4lChc55ffXd2G4eJn8Ufw+l4THWMh21CmXewXpw=;
 b=eOQdC8PPg0+o5GHBLYLKeuKNkQbJRiKTRCgcfg17TRYX2YSWiEgZfnRbYa4s1cmghx
 p/bAXsnd0M5oy9Qhf4DIXh2DNPLTaOqwjJNCvjC7GJPxheoP5zybt/vzUp+7w48oF8H/
 xz9gQ2b1clTwFFhfbfnoGOgtiWI4n4hlugsdPgFKiXAwl9d4Q9KFYXeVO49PvMhjCJVb
 fnXsfTk95/sLwXeq8C4J7ch6aRsj+BOIgubDKRigFf8bV+CPY7kn9aVi7bKviafN8zZT
 lfeodKKrHHQ0O5kX+aGP/tukwo9T24QAXlGUK4MM8P2hOt7dceXC63H0KzXdMQNd1Ptx
 8mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=4Jkx4lChc55ffXd2G4eJn8Ufw+l4THWMh21CmXewXpw=;
 b=ljl8hIA5uyvMH+uHsa0Y9SGrHTIwI0YvG7von8d2umDLjLEVvpMuP+zB5TZda6tmhm
 MXep4e/HQx3yNRhSsugTf6H8Hw8ICKmsRs4t8lmgmeaiecHtBjtMjPir5Yjf9bbAtfYf
 5LDptpMg7a4kQMQmzvvFk1uOMDfQ/FlpDgeO8PMWCHMwDq/D0gBvCNPvYVQorRNVb80d
 MUj2PO8ysd9spvVEsC6uH/5SGNfWxBuoaGlp94AVBoxtyWYKMRi9ZLVN7D9fYW27007u
 iEI6YJp7/bTHPIMjEKcdToDc8HyCsUZahjfhdSA6/5tnJWq8BC7gnk1dcy4s+L7ikHIm
 EK3g==
X-Gm-Message-State: AE9vXwPL3+S2hPO2Ol0Jp0z5L3/E0meqL244GAeicQ4qJ/sT7xvk/wQ3aL9Rh+zZhRCFekxI6QffN0E0u/Pfww==
X-Received: by 10.176.80.85 with SMTP id z21mr4595987uaz.46.1472448927002;
 Sun, 28 Aug 2016 22:35:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 28 Aug 2016 22:35:06 -0700 (PDT)
In-Reply-To: <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Aug 2016 15:05:06 +0930
X-Google-Sender-Auth: PBy6vJaohT62lZ2dug5okxVVqB8
Message-ID: <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: aspeed: cleanup driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Mon, 29 Aug 2016 05:35:30 -0000

Hi Brendan,

On Sun, Aug 21, 2016 at 11:04 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Rewrote most of master IRQ handler, xfer functions, and error recovery.
> Minor refactor of probing functions. Added remove functions.

Thanks for the patch. The diff is quite noisy given you're deleting
lots of cruft from the vendor driver. It would be easier for us to
review if you send the patch that adds the driver from scratch.

One suggestion I did have is to rename the driver to use the aspeed_
prefix for all functions so that it matches the drivers that have
already gone upstream.

Given our goal is immediate upstream submission, how about you send a
complete patch that adds the driver to upstream (say 4.8-rc4?)? Send
it to the i2c lists and cc myself, jk@ozlabs.org, and andrew@aj.id.au.

I hope we can get this sent out for upstream review this week. Let me
know if there's anything I can do to help achieve that.

Cheers,

Joel

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 932 ++++++++++++++--------------------------
>  1 file changed, 318 insertions(+), 614 deletions(-)
