Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GFXBBhz7"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VDvf3JyxzF2ZM
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 11:08:14 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id c23so1791718otl.9
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 17:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FlaQvgYXAYWplrE6GduA7gBJdNzDzsKWyFiNuiUmspo=;
 b=GFXBBhz7tT3XU7qvIy95wer/iz8fBpS4RCEvFn4GR3kxlbWj9cWjCw0csbuwGx9udh
 7lo8KeFlQXbOwxhQVc1EJqWKx9cxJFjipFbs6B4JAzv+BNermRpqU6pPNy4NkveHmPeb
 NL+PFoOEsTodehG/URFFAj2tkGXFrXYDuwa8TjkOAtydd4TXeCXyKzPMIWT8e4+/DBMU
 1SXFtm43j5DnYspsl+vePEqoZjC+TivuNbF4LuG7JQCSyd7DGYcUwBHvjSXbpWtTx1hh
 osYtZmpaeul3dmIU6KJDueGuRnbIRwShuSQl6HY+hKVXpT7Auh8g7+JY98Y9C+uJa/MV
 KmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FlaQvgYXAYWplrE6GduA7gBJdNzDzsKWyFiNuiUmspo=;
 b=OaMRj5GjZcUtOe8Oip7gip61l5NwPg5hoJL8EKtzMcAmp8x9x9mXvzwtmCjSNIxfev
 Xabf8uFd7LGYazlVB6aDEu8K/6giUBSmv5vkuvEEV3LUIT0HzuufuMzzmYadl6ABj55o
 IAat3kz/d5ZawnY+RvAs0wngb6qb9FLa3gANsOW1n9Uckb/92iHBpMxRpdLA6GDGdr9Q
 /ULfJ7a23DXE3hNomgyapvGizOxptFi6+XY5VVFME2ShcaOkajG1/mpqSRXZ0zojuhEN
 j/FqObpM8xII5+SXOzOXyi7ZZNALIz4dltaVrQqYrmZF479tnwyB8KDs4WlekUhxOSRG
 mfBA==
X-Gm-Message-State: ABuFfogZYSEFh+QdD0ww2dckOJmHvzwG/3uDz/+HT61f2POM58G40kGv
 HEfBaO1a2RwWzQdv0ssWQA0U/gFzoCTlwR9lrPrRNQ==
X-Google-Smtp-Source: ACcGV60FHXVbmSY5eVdVWkU/c1RwqnqI6JsQ90+S/7jBXxVwqAicXw6HupiEOBLP3G0YkqOSas1NQguzTBLjV7I6q2M=
X-Received: by 2002:a9d:20e1:: with SMTP id
 x88-v6mr18437110ota.338.1539130091719; 
 Tue, 09 Oct 2018 17:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20181005214507.26315-1-jae.hyun.yoo@linux.intel.com>
 <20181005214507.26315-6-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20181005214507.26315-6-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 9 Oct 2018 17:08:00 -0700
Message-ID: <CAFd5g45JkK4BnGR7yOA3eCazTZ86FyUaNdi81Ew6VBbKxS3EZA@mail.gmail.com>
Subject: Re: [PATCH i2c-next v7 5/5] i2c: aspeed: Add bus idle waiting logic
 for multi-master use cases
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
X-List-Received-Date: Wed, 10 Oct 2018 00:08:15 -0000

On Fri, Oct 5, 2018 at 2:45 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> In multi-master environment, this driver's master cannot know
> exactly when peer master sends data to this driver's slave so a
> case can be happened that this master tries to send data through
> the master_xfer function but slave data from peer master is still
> being processed by this driver.
>
> To prevent any state corruption in the case, this patch adds
> checking code if any slave operation is ongoing and it waits up to
> the bus timeout duration before starting a master_xfer operation.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
