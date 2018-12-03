Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="lwj+9853"; 
 dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437ZW01gpfzDqXZ
 for <openbmc@lists.ozlabs.org>; Mon,  3 Dec 2018 17:15:56 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id q1so6650724qkf.13
 for <openbmc@lists.ozlabs.org>; Sun, 02 Dec 2018 22:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=NlFDagDUkdnlvR/41N+ZRzjWgnOVa2OQ6mGmP//ie8U=;
 b=lwj+9853M3hjbHHgxQztq/jOPSWrJ0XfMTI1OdsTF1PcRkjnj7T2BYbXRk3pHv7hFx
 eTL65jc5xKmI7dWRiXp8hVg+ENAKZSPjnQBzXv4XODyNUVgTbgQbZS2zAm8YDDEVLtT0
 EwsL1tbXTQ/upVRvQAPrrna9vK/dQHt1t71BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=NlFDagDUkdnlvR/41N+ZRzjWgnOVa2OQ6mGmP//ie8U=;
 b=ProLRvnLr10k+ApD/4FJTbYF0w7OUitBFEnR0/dwYKTcuU8PfqBDRDqkhpHm6RWbN0
 UX7VD5O7fjfnDAtK4/VAu4a9DqTOsmyFUqcDuKx4qZv6HOlZlZvzF+MN6iFWitAA+c+4
 Vg2FobSDUH9ZPFTY9xZnET1hz/wGiYAgtflGs9Co3NRn3V7yLmHCwPRR78IghRo1/9Bs
 +RK9El6EShuqYRFpRVjAgGqS18MGJUxZfWkCJtPolESNAoSf8texcma3S+grFpOZTcey
 N7f4zB6ieerjuKxQqAKICC4kCoKyopJ05pgIjeb1UOyUBaY4MBdgiV7pI/sdXZHw6m6K
 hU/w==
X-Gm-Message-State: AA+aEWZw4b52dud5tkbnapT0PUu4jRIg6qAiZAQZmIwN0NAuYo2s9JOC
 5Y7C28aK+XT3W6TfqiGC2ABORhjJAWCtEUtOmwujyiIg
X-Google-Smtp-Source: AFSGD/XMM+VZGy+P3+Q4k90+Lrn6lcBDpphuh6sFkFSLwE5i8RULoM+TIphtLSH653xa4PSUUKYeqwaQ96YZTcYd5Sk=
X-Received: by 2002:ae9:ef8a:: with SMTP id d132mr13280408qkg.11.1543817753198; 
 Sun, 02 Dec 2018 22:15:53 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
In-Reply-To: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Dec 2018 16:45:41 +1030
Message-ID: <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 03 Dec 2018 06:15:57 -0000

On Thu, 29 Nov 2018 at 11:19, Joel Stanley <joel@jms.id.au> wrote:
>
> I've had some off list questions about moving the openbmc tree to
> 4.19. Apologies for the delay responding, I was busy with another
> project in recent weeks.
>
> I will put together a 4.19 based tree next week. Once it's booting on
> the hardware I have access to (ast2400 and ast2500 openpower
> machines), I will push it to github and notify the list. Further
> testing would be welcome.

This has been done. There is now a dev-4.19 branch:

 https://github.com/openbmc/linux/commits/dev-4.19

The tree this time around was a simple rebase of the 4.18 tree on top
of 4.19. I didn't drop any patches (aside from those that went
upstream).

I've published a gerrit commit that bumps openbmc to use this version.
This has had some testing by our CI on Witherspoon and Romulus, and I
did some manual testing on Romulus and Palmetto (hardware and Qemu). I
intend to merge it tomorrow:

 https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/16363

> If there are patches you would like to add to 4.19 please send them to
> the list with the 'dev-4.19' subject. This is probably best done once
> I've published the tree, so you can ensure they apply and are tested.

Please test on your platforms, submit the patch sets you would like to
see included.

Cheers,

Joel
