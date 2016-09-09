Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVhh646PYzDrpW
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 12:57:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ONWih833; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 16so1623713vko.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 19:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Fg14n7jJF3yolq+BkBKgnxUsF1KmHEqRoFm/YQjsPw8=;
 b=ONWih833TQgitJjwPGj3MN3aEgANt9VYUiEoceI2iDR5HNjMiVk3NT0VCpYmpzapnu
 Vx5ch6DuOEqxY3RfAus2+xYHjiGnmdaLz4qyaEcbZ8M8Fie7CRgT9Gv1xBFS13mWSZH7
 6HToP0V+c55sJ8epAjsIBEmjdyxrtlwK8scZZu6d+zDfv8dSmkjT8snckI6ojU7z2lAO
 6qnDhC/mkrBBWQmhdYLWQh73aiazTbIKTmFgV11JrvMnOJJt1D0zJ4GqK2BYdDLNsXDH
 k3lXlVkF0cMQq1F/pSZJJ7hoBbH+DXk48glMQpbG1mkURPtv2oMz0yP5s+4j0zkTwevA
 t/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Fg14n7jJF3yolq+BkBKgnxUsF1KmHEqRoFm/YQjsPw8=;
 b=ZR8r1/B6PCzqaqIsvNKJKQnYyVEWIyNRbBOVqu2nkcBFQVb7lTZz6Tgfa9vRrHOJ7B
 SkyC41EjhflfFUQDlxZCA5TuknTiDMh9jXaG2fIVPoRJ72WFR4b6a1qYzyem/aaf6PDB
 DsP+YxnjkFTKT3hJxilDpB+CUC0GmnNWTWnVa7KfblYfK3pktxek6AUQhtCZe3EmCxiO
 skhXlAFH7EUsHo2gJJ+L+ieZ0iJbEDiluigtNKrz1qBBoiHEKAMo/y7hf8UTvS+L0Jbl
 xHyyu6kDWdQQmXZ004TdpgfY43TgYKk0w7ddfKpdxerpqz0UEKXFqpBDfu05aO9k1VIf
 l1dw==
X-Gm-Message-State: AE9vXwO+T4jdrQ7neppskewHdUNkalIFU1kpoMWEsi3Pg1VIRzTDMKbUCz/ppX2edTQoeXWA+dAdJyhGG1Ofyw==
X-Received: by 10.31.141.21 with SMTP id p21mr820276vkd.152.1473389841791;
 Thu, 08 Sep 2016 19:57:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 8 Sep 2016 19:57:01 -0700 (PDT)
In-Reply-To: <1473384271-7185-2-git-send-email-brendanhiggins@google.com>
References: <CACPK8XdutpE97bUr2goj3Vqw9R0_HOtZ0rLWLnT-FcmYnLQHZg@mail.gmail.com>
 <1473384271-7185-1-git-send-email-brendanhiggins@google.com>
 <1473384271-7185-2-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Sep 2016 12:27:01 +0930
X-Google-Sender-Auth: wW5rfTHUd-m0U2jU0u5292HO6rM
Message-ID: <CACPK8XfFuNFjRqNs7ihLdaAwNYG-vO4pbvXLZ6S8mATXgFMuXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: aspeed: added driver for Aspeed I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 09 Sep 2016 02:57:27 -0000

On Fri, Sep 9, 2016 at 10:54 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Added initial master and slave support for Aspeed I2C controller.
> Supports fourteen busses present in ast24xx and ast25xx BMC SoCs by
> Aspeed.

Looking good! Would you like to submit this to the i2c list now?

Please cc me and jk@ozlabs.org as well as the people suggested by
scripts/get_maintainer.pl.

Cheers,

Joel


>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/i2c/busses/Kconfig      |  10 +
>  drivers/i2c/busses/Makefile     |   1 +
>  drivers/i2c/busses/i2c-aspeed.c | 816 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 827 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-aspeed.c
>
