Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="AlvW46CR"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44gLhS0zJTzDqTT
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 12:00:40 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id c189so4759457qke.6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGP4WUVeiabVhPfwirgxFMoVbB8b83/5ZJdhLhVsN4g=;
 b=AlvW46CRWwva2+cIHqyMfEu+PrQnfLaaV8w14imm3aph81kyNcS+mgw4MB1vUI9mwp
 2fJ0ENOo03vT4XX2UddZs4JAhZnEHRd4BXffL5Pep8Kymnd8IvXeBPAVt+gqlzCXJrQf
 o1CCClNDMKmQQFvmgJTZl8lCw5jTuX0ibwGa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGP4WUVeiabVhPfwirgxFMoVbB8b83/5ZJdhLhVsN4g=;
 b=l20cd91WgAM5ouHRp6C4dvIkPyIa6r1nfQS/QXa/CkFCoSZh1gJXGunZS2e1rKuLmj
 NswWoQnOLZDkpw9d/yKF+FKRy/6FDjco4k7VS07fZo3QxUjdNPDsaO1llgiOYzYcC7Xt
 /kgU/QvOf85sBOLnTJo+LQbC7IRNJ/ORK0PLjuk4g0OD1np8cTlahWKFbIKi51bNWGMJ
 CRZaZEMRD1cVl8qihZJIV3D/K1OfHe4GfjuDcHVqtFBqnbYkJS/yFNicVQKfPsxx2qsm
 g3heq91Qx4E5BuhkIBB+ttwTg/+QrGUppkyA8cCxsxC+rsQ1knOd1koXyNOvYxgw4BIQ
 1xTQ==
X-Gm-Message-State: APjAAAX+loElMXOdP7tnMU1BWTSfDummZm1r9C1m7nRqoxJJG5dODdaj
 ccUtTaKMs2GmUQEDwI5GuXJquAO8MV+0+m/kg4c=
X-Google-Smtp-Source: APXvYqzb1FuRyNvLRE5JIZtPU8pxfWsMfOJwFPbdcpd3yxVtA9cTmx9FliFQkBJ6VIyjN/IKm1v5KCWzcl9Dmby5jTw=
X-Received: by 2002:ae9:e002:: with SMTP id m2mr42194065qkk.178.1555034437467; 
 Thu, 11 Apr 2019 19:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190411172350.11956-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190411172350.11956-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Apr 2019 02:00:26 +0000
Message-ID: <CACPK8XeON0NEN6xSKrM-4oX61=JLjJUKxR3bZQwwWqM6mu-n3w@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 0/2] i2c: aspeed: backport I2C patches from v5.1
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 12 Apr 2019 02:00:40 -0000

Hi Jae,

On Thu, 11 Apr 2019 at 17:24, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This patch series backports changes on Aspeed I2C driver from upstream
> v5.1 tree to support multi-master bus environment stably.

Thanks. These are applied to dev-5.0.

Cheers,

Joel

>
> To enable the multi-master configuration with this patch, each platform's
> dt overlay should have 'multi-master' setting like below example:
>
> &i2c5 {
>         multi-master;
>         status = "okay";
> };
>
> Jae Hyun Yoo (2):
>   i2c: aspeed: Remove hard-coded bus timeout value setting
>   i2c: aspeed: Add multi-master use case support
>
>  drivers/i2c/busses/i2c-aspeed.c | 120 +++++++++++++++++++++++++-------
>  1 file changed, 93 insertions(+), 27 deletions(-)
>
> --
> 2.21.0
>
