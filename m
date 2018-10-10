Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::242; helo=mail-oi1-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QQJT4una"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VDkV6KtxzF2ZM
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:00:17 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id j68-v6so2688267oib.7
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 17:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8QAeh9Tz7X3Mwvi8glm9eUiZ24FrTdrg5t4W7wx+fw=;
 b=QQJT4unaeZYRy2N6c8aiXWtrryXmnLl97l1a2f4HdE4icht+7i95pzKskfEwwUAYJu
 AaJvykhR66lNfYlFMtqi1um8V1ihZb3hbvPbH4glr2fV98gSox6YyXMfomJutJ5z7lNL
 JKfC3U2XmAO3mT/fPP5dGa1uTGByeqEWDLYEAMuQgBN5gWRe1J0LRIn3ELVbxXcB4htv
 j33DObeiMpk1ZfSldmvMH5fHSjWq625Omhsidd8CC+wE4TXcXxk9oVLMeDhdfLAm9ig3
 8v9zv7AITsj784eyqa6f9baaNErrW6RGfBeIYRg2GrGSrmwR7y6TsMIzs7L/eBxJkmNm
 Hxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8QAeh9Tz7X3Mwvi8glm9eUiZ24FrTdrg5t4W7wx+fw=;
 b=e/XVJEAkR+cVY7LPPnNxdKCJ3B4734r75qN6Tn25rsvYklpotbSxAyBIwzo9M0tEhP
 bfy5jevB/6BT/ixxb0/Bda+EEO+wR4972zDUnyP45g91uUXYHa5YIII+GSYMwxfBU0vn
 9ZlirYJ3uSCygTzvpzPnEckzZcmLoVPPS40i6jX3oxeyNcbOyfi+RTT45LvV9J1g6Ubr
 NrBUOUyy6+hx8BrE2Hk5mkPZqfyzbk0q6dW4cRbDPfwOOzbpma5/HnzEs3QOMI2oVLbv
 GBFa/kFBFGicGPzh/jNEiyOJY2RqIbneC6XLzkVBgaGmqUzrLnl4eDbqcJR1k/ru5JxT
 WH0w==
X-Gm-Message-State: ABuFfojL6XY83yr6aLmit6j7gFgI0eFfBniiAbhxWJ6ht6iYvDfPaHsr
 PBxpM4O3X0tk1Hg+QeZcU1clG1AB95lor+qIg9Sqig==
X-Google-Smtp-Source: ACcGV60bhqcIhUrmrmCYiVSWn8TMRR/7G0eXm1/RDapvbFAHKIKor6c0KCEz/LeUI8vsIJ+E6momboG/0iZoqL4cMB0=
X-Received: by 2002:aca:ebcd:: with SMTP id
 j196-v6mr330640oih.206.1539129614533; 
 Tue, 09 Oct 2018 17:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20181005214507.26315-1-jae.hyun.yoo@linux.intel.com>
 <20181005214507.26315-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181005214507.26315-4-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 9 Oct 2018 17:00:03 -0700
Message-ID: <CAFd5g44WcAE5oJCmRQKsRmbrfYPx55kdaT6xW1hzCoYAR5YQNg@mail.gmail.com>
Subject: Re: [PATCH i2c-next v7 3/5] dt-bindings: i2c: aspeed: Add
 'bus-timeout-ms' property as an optional property
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
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
X-List-Received-Date: Wed, 10 Oct 2018 00:00:19 -0000

On Fri, Oct 5, 2018 at 2:45 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds 'bus-timeout-ms' property as an optional property
> which can be used for setting the bus timeout value of an adapter.
> With this patch, the bus timeout value can be set through this
> property at the probing time of this module. Still the bus timeout
> value can be set by an I2C_TIMEOUT ioctl on cdev at runtime too.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks for putting all the work in to do it this way!
