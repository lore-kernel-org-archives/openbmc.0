Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Tr32gkYzDvPg
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 13:46:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=GTRIDyE3; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id x4so4247256oix.0
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 19:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OxIuuIgI8IyTy4ZgXIL4i5/5/NY9K7WrhukB5MvVi/k=;
 b=GTRIDyE3O06ir3ZMpMBulPi6PLxcSVcJ04zrjvUekmylg2wV5sOnaC92OIeRK/8d58
 YmcWENPXz9GCyXXAuyNOuZBG2wH272Upqhs5tfhUXSURwmmdvdmiJ4O7ZNnNC5rKzfKn
 kC35jn1BGe0S287syOvwEVcnguDdN1FUgKyX4NN0/XnOEZRLZmPWqEhUqSorDFZtLED1
 Jj9GIu3D1guRoEzHQSZgMB1u+Bz0h0DtqONScWnMMmVMXLWvdRxD4daUjTNLElAdr9OY
 OhL/pMKLor6WcLYc1qkllJdNdhHjFCEsZmzK9jnhTvL+LBUdA3WbGrmcGRHSwhFXmD+o
 5YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OxIuuIgI8IyTy4ZgXIL4i5/5/NY9K7WrhukB5MvVi/k=;
 b=giTUyG8hHoAnbAI/R5Vc2jzKn+RSusA8txETrty4DmAM1Dwsds73WEoVBdDGaZiSfe
 QVDA+3TCeIB1X/6xoys5z9cNFEB/b+UZwhEsKKgO/b7of87T9U3DhxbsH7l+pKKarPZ3
 GbuZt1SH9GWUVFd3CGUOFOQpk7wNanygkKUoO7qtZ1g0elrxJY8WRW6YkfTS0Ks4862/
 E7XIhE6Cuvt3EG+zV9SMly/6XFLnKi2g6vISiAaPcASycbtLZBY4ugb6FkeA3R5u4aj5
 0Zj4vbPMp18NYhOgjeIzailyfSelVWCtbLlGC4mSq7Wpk73c3Vj0Gru1pi/BuCDCLHmX
 aSFw==
X-Gm-Message-State: ABUngvf/veac56auzhDv8Sz5ZnWyT+IIyWdwlsVS7Qj1zfa5E//JdLa7fKxwxVTTLzWuM4U3J1YlNaHCY/CMGw==
X-Received: by 10.202.92.198 with SMTP id q189mr6365401oib.6.1478141185346;
 Wed, 02 Nov 2016 19:46:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Wed, 2 Nov 2016 19:46:04 -0700 (PDT)
In-Reply-To: <1478134561.728.7.camel@gmail.com>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-5-git-send-email-clg@kaod.org>
 <1478134561.728.7.camel@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Nov 2016 13:16:04 +1030
X-Google-Sender-Auth: 84LY-3dWatMwVAYOOIyN7tBc7Jw
Message-ID: <CACPK8Xc+BoiZqQ5-i7EC7DQTugQVM0i1o2rN+9P0ekor6R+ZXA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 4/8] ipmi: add an Aspeed BT IPMI BMC driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
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
X-List-Received-Date: Thu, 03 Nov 2016 02:46:28 -0000

On Thu, Nov 3, 2016 at 11:26 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
>
>> +static int bt_bmc_remove(struct platform_device *pdev)
>> +{
>> +     struct bt_bmc *bt_bmc = dev_get_drvdata(&pdev->dev);
>> +
>> +     misc_deregister(&bt_bmc->miscdev);
>> +     if (!bt_bmc->irq)
>> +             del_timer_sync(&bt_bmc->poll_timer);
>
> The old bt-host driver had:
>        devm_iounmap(&pdev->dev, bt_host->base);
>        devm_kfree(&pdev->dev, bt_host);
>
> Is there kernel magic that means they aren't needed?

Yep. The devm_ api's in the kernel are "managed" (hence the m) by the
driver subsystem. When the driver detaches, all of the resources
allocated with devm_ calls are automatically freed in the order they
were allocated.

 https://www.kernel.org/doc/Documentation/driver-model/devres.txt
 http://haifux.org/lectures/323/haifux-devres.pdf

Cheers,

Joel
