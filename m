Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jPKZZF7t"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43wTQv5xjFzDqLK
 for <openbmc@lists.ozlabs.org>; Fri,  8 Feb 2019 06:49:05 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id t5so1989863otk.1
 for <openbmc@lists.ozlabs.org>; Thu, 07 Feb 2019 11:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=32dcltOQ1P4EoeLXctHavIhMS0EvxGLs/iMVzRHCsGU=;
 b=jPKZZF7tN7/34sOt1r8tSTVBcxcos+cBMXyBuXvH6dVtt3C4pIb+IpiZG+HKpC+ot7
 dhEh/OcLGMV03sN9KWVOjb3a+CjR/P/GIghAyJxJta1IvRicRvLuzrfK51fdxKiSiUo3
 3EGtVjonMdx9hOeumg9x/oGgJVgiGFFJm4+a9Elg0RdflhKaMbYJu1crfwPUyxGae9FQ
 UZNRbppQejlKbAVjRtHIEjnH05TXMjeCNM4YyW+LO/CcproE/ug/kmXyr74T+TEG/fcb
 Dz5scdqDJ9tqLGTbSYugLPGPmaatIdhpcAmAlZWAz1kGP/IXJ22cmI1odr3YBd5ObWuR
 ftLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32dcltOQ1P4EoeLXctHavIhMS0EvxGLs/iMVzRHCsGU=;
 b=pT+ARlp5snKAGphHkfyqFxwSRLSN2chU1BZb60/lAzxwXzMsLSMuQp8MRWhNxpQTVI
 zmVP4FAbSTvMBdN+mb4h/wE1p9Q6x16ZQ5TEYfnepQlBQjF1/TyPZpvQbrfnGwu8VDqw
 eBdWM83ExiCo3+52hUomfkcHAZVKi/xy+TDvs9Xdl7MB+IaOEE670CvmbJeKm72Mo/Yn
 K7WLHvCahoi6hNgnqScieHC2dOknSiBsDkNf5gkMOZyHLTaKasTVolh/qtl2g+Mt4P07
 nJr0+sZUa0/Nq96TnZJBJ2dvUzlCvXJvzEKy7rgwvbjMaCVuWPd2coehYe/Ehz4Mxbih
 dLDQ==
X-Gm-Message-State: AHQUAuZHrekO9oCX5ae/oB8oeKwHqUMjnkXFvsfbGvLquPqq2G7V47se
 dDReQyArHg1aEFmj8n9HyGYX44gFzZg+KTGhUlrw6Q==
X-Google-Smtp-Source: AHgI3Iao5B2FksP2nvHzOyXP8JNL3FyTeoQrKLOUtI6ClvTUCW156Q1UP7kwUSycC27zsurQ1I8shPEE6xHo0kMlXcI=
X-Received: by 2002:aca:eb13:: with SMTP id j19mr1311537oih.100.1549568943164; 
 Thu, 07 Feb 2019 11:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20190116193958.6049-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190116193958.6049-1-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 7 Feb 2019 11:48:51 -0800
Message-ID: <CAFd5g46aiJ2srDf9akR+TwPg3ZheVYJE1JQ4AGm2t8hfO6rF1A@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Add multi-master use case support
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Thu, 07 Feb 2019 19:49:13 -0000

On Wed, Jan 16, 2019 at 11:40 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> In multi-master environment, this driver's master cannot know
> exactly when a peer master sends data to this driver's slave so
> cases can be happened that this master tries sending data through
> the master_xfer function but slave data from a peer master is still
> being processed or slave xfer is started by a peer immediately
> after it queues a master command. To support multi-master use cases
> properly, this H/W provides arbitration in physical level and it
> provides priority based command handling too to avoid conflicts in
> multi-master environment, means that if a master and a slave events
> happen at the same time, H/W will handle a higher priority event
> first and a pending event will be handled when bus comes back to
> the idle state.
>
> To support this H/W feature properly, this patch adds the 'pending'
> state of master and its handling code so that the pending master
> xfer can be continued after slave operation properly.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 118 +++++++++++++++++++++++++-------
>  1 file changed, 92 insertions(+), 26 deletions(-)
>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
