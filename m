Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDx4W3Yh2zDqBX
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 10:27:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dXNPgZmd"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id x84so234162oix.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 15:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kpUN3o13hV7uYjhzb1B8NUx8+61tk6v/nFD18/nKnHU=;
 b=dXNPgZmdd3MXut9Cbx7s7enEG796fDUUHoUbAZAIRCCYRXFspleP8980hiH+jVlB6J
 F8i4JijH95iad1I3msPpSeWKVR8ouiqgAyveZdGN9gqrXQAeuF+YJ2bnHJn/F4rY8wFd
 X7wWMe5hcvtAxkm9VbmHZ5xjWgYSEs/YKkk84NefGTAAivicwmGyF+NFLeIoUXKL9f10
 dxJug1E0OtuzIf91736KuSltSjVi7eK+dl/z0WDa1NTdxTfF99djgL4LEsfRfXZK334w
 hsJk+GC7/hls3IC73BCrHKY4bbZes3kdzXs0UEBFPMMJdbVLDftjFb7kEBW2gA1cfl6r
 WD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kpUN3o13hV7uYjhzb1B8NUx8+61tk6v/nFD18/nKnHU=;
 b=m+XHdPPfHV6adUwbnJC9DL0Kycdei5nn6mfS/DeUUcS+3FFkrwW5BSaV/4N1I/JUHc
 5NHCTF4dhI8pmaj8zX7p2Ajm591gMxCwmY1K3yeuyunRtgWEQzztIhF9rCMGmQT0Ihnx
 AgFAO/o3+DySXGvkgAYwZXVXiXpNt14lBYPpEo7aSqTJwqY1Pg983ZSA1n77V/PjFI0P
 LyX9lbe1zWPXJUWxaJe4Hf1tnr38BH5ZBxai8IW4hvlHGJ28Kp/ZvFQT7tn3Rxun3cSu
 +zxSqaKHvOw0cpqICX2r3J8eGnVDc67+EQa6tGra56MY8lXbuyQr01IOA0iKV7XcI8Se
 Ju3g==
X-Gm-Message-State: AIkVDXLWGHN1mYQCFHkGe4fJ7uy2BfmwAgioCdbdp+R68u3o6TBM96UQoxJeLv+GcMlc2wBq01V8lFUNbMf6dg==
X-Received: by 10.202.74.213 with SMTP id x204mr5750652oia.51.1486078073015;
 Thu, 02 Feb 2017 15:27:53 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 15:27:32 -0800 (PST)
In-Reply-To: <20170201222201.49331-1-cbostic@linux.vnet.ibm.com>
References: <20170201222201.49331-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 09:57:32 +1030
X-Google-Sender-Auth: OEARPvHpr1mZuI-0WgvIE7Q12aY
Message-ID: <CACPK8Xc0BrQU-Ziqq1S9FXCnwNqcU5o4CO4mOhZSbYwPED_z3A@mail.gmail.com>
Subject: Re: [PATCH] drivers/fsi: Add slave interrupt polling
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Alistair Popple <alistair@popple.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eddie James <eajames@us.ibm.com>
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
X-List-Received-Date: Thu, 02 Feb 2017 23:27:56 -0000

On Thu, Feb 2, 2017 at 8:52 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Scan slaves present for asserting interrupt signals in the si1s
> register and call a registered client's interrupt handler as
> appropriate.
>
> Signed-off-by: Eddie James <eajames@us.ibm.com>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
>  static int fsi_bus_match(struct device *dev, struct device_driver *drv)
> @@ -566,6 +655,16 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
>  }
>  EXPORT_SYMBOL_GPL(fsi_driver_unregister);
>
> +int fsi_enable_irq(struct fsi_device *dev)
> +{
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(fsi_enable_irq);
> +
> +void fsi_disable_irq(struct fsi_device *dev)
> +{
> +}

This is not finished. Do you have another patch that completes the
functionality?

Cheers,

Joel
