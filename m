Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8Tv42K2YzDvPg
 for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2016 13:49:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xtWrP0a+; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id n85so3330060pfi.3
 for <openbmc@lists.ozlabs.org>; Wed, 02 Nov 2016 19:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+obCeAyPb9Qw//xH2P86EzOhwWILEqXxw5cYKEWzha0=;
 b=xtWrP0a+2NT6LPix2n0lT1K76PbHZH8Me8V8ic9fVf9uifubFOKVJpkH68UBazl1Ci
 idPY0vcePWdw1zbvWrfb/V1OURRL7zkAVGKYroMUZTVHMHu4o2dCRru84aAcogh2XF0v
 0otmBQBV+wAOQ4A9mmakARMCMB0THPmL02rdHflLc6UddRmcKI5AiO6xFzeJ6V5wl3NM
 vb2RJqgJJUnJ8luEaBC5zDtsfUSKAhq6U8um5imcDlJedwIbYRBgPGeTiKcWSIAjpp/r
 gDLokzDMPG+vwRKdKUeH+wyWxLF5PGqFg6nL95zzIoW0UJQVDIMaS8zp6A3pO23cGJm7
 tSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+obCeAyPb9Qw//xH2P86EzOhwWILEqXxw5cYKEWzha0=;
 b=ZW84e+zjowpnPD/P4iou6mH1UaW1XQg5hp1Ut6zHepiEibt5dFk/XdvQmORAAuUNfO
 bYzlDYrGEgSlRqY/qYXYrt7YhFrPYosmw5kFKuM+/fowOVF3LgPK891IdOkThVT+yi0K
 zZYkZM6C0t6E8CQ3jUenop/E0cED0exYAuteRyvraXvE20p3KjAKCV5ei1qvYNR9fiPv
 Nas4M3985GXq/+z7PbwsAbhhCyj+9aa3rYQMY4HUnV3MddoLOP6BaPjwfBhkNfLdRO2M
 TUagdWY3gtC5XK7cqZNzIZ5Bkl2SbYjzR49uOqPtHFuX6A8BDbiH93tDXycDjUovfi2S
 fGqQ==
X-Gm-Message-State: ABUngvcFF6b6NOZQS+hptIVFVYboc+tSYip037mA8YPYxllMb3HNIfVawjypcUGDm1wYRQ==
X-Received: by 10.98.24.198 with SMTP id 189mr12626921pfy.31.1478141342496;
 Wed, 02 Nov 2016 19:49:02 -0700 (PDT)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 3sm7848290pam.21.2016.11.02.19.49.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Nov 2016 19:49:01 -0700 (PDT)
Message-ID: <1478141338.728.8.camel@gmail.com>
Subject: Re: [PATCH linux dev-4.7 4/8] ipmi: add an Aspeed BT IPMI BMC driver
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 03 Nov 2016 13:48:58 +1100
In-Reply-To: <CACPK8Xc+BoiZqQ5-i7EC7DQTugQVM0i1o2rN+9P0ekor6R+ZXA@mail.gmail.com>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <1477465067-19034-5-git-send-email-clg@kaod.org>
 <1478134561.728.7.camel@gmail.com>
 <CACPK8Xc+BoiZqQ5-i7EC7DQTugQVM0i1o2rN+9P0ekor6R+ZXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 03 Nov 2016 02:49:04 -0000

On Thu, 2016-11-03 at 13:16 +1030, Joel Stanley wrote:
> On Thu, Nov 3, 2016 at 11:26 AM, Cyril Bur <cyrilbur@gmail.com>
> wrote:
> > 
> > > +static int bt_bmc_remove(struct platform_device *pdev)
> > > +{
> > > +     struct bt_bmc *bt_bmc = dev_get_drvdata(&pdev->dev);
> > > +
> > > +     misc_deregister(&bt_bmc->miscdev);
> > > +     if (!bt_bmc->irq)
> > > +             del_timer_sync(&bt_bmc->poll_timer);
> > 
> > The old bt-host driver had:
> >        devm_iounmap(&pdev->dev, bt_host->base);
> >        devm_kfree(&pdev->dev, bt_host);
> > 
> > Is there kernel magic that means they aren't needed?
> 
> Yep. The devm_ api's in the kernel are "managed" (hence the m) by the
> driver subsystem. When the driver detaches, all of the resources
> allocated with devm_ calls are automatically freed in the order they
> were allocated.
> 
>  https://www.kernel.org/doc/Documentation/driver-model/devres.txt
>  http://haifux.org/lectures/323/haifux-devres.pdf
> 

*magic*

Thanks!

> Cheers,
> 
> Joel
