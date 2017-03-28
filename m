Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x22a.google.com (mail-yw0-x22a.google.com
 [IPv6:2607:f8b0:4002:c05::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsnfC3d2JzDqck
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 21:47:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="L1dMOTBM"; 
 dkim-atps=neutral
Received: by mail-yw0-x22a.google.com with SMTP id d191so50316485ywe.2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=wsHZ6kX236d1Wyu4iE8JhDV2MKvaRxnelDr3HE2Tj9I=;
 b=L1dMOTBMRNIwFU9m/cE4KyDDUtszNkWaVfGnhcQFWITibGGt3P4WKw9Yoi1HnS7Vo1
 +pvpa8YjltZpJfRWdvLwUKWoZbwnMj1PXTwIhbplEX2dTrxRV9LTN4e2svXC5JpPiIOM
 Ff2dkBJ3uKJLofclUzeviCzh91jKgHAiHrEQVNXjiEd/lH9zHJSznjvEs4KybYukozF2
 Tu2XrjE/sJDnthk/yoij4c6lp2RdaXuHYtnPev9N3vKF7KKUl6opgbF3wQCc3JBdrL2d
 BtIxmoBs3rK6ger/k9nT392HGfh+GYKwkjbMKfD6NF/S51dR/rCf9nor5EOi5Gt4J+vE
 kNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=wsHZ6kX236d1Wyu4iE8JhDV2MKvaRxnelDr3HE2Tj9I=;
 b=tHPScIUcOgVzqAdQmBEqhd2fhCz+hqLcaqDorfVxgXjkSbhFDt6ClIak4sIojt9893
 ZvROzJSfdUQHrqHpAwSHeQiD4b1Wx0L2CUkh4a4xuGSSzsP7DO2Ij05AMI8G69YrgDeZ
 Z33h3KkJBpHfhRnujEQkBrc9godJzVS8Rl1RjCeGNPy7SmR4mb946Nr1ooU3OTNZrMDG
 /DRk3HDd2izoxIBblX0wlU195rIL4M3L3fXZIPoG1AE5wj3Ipiyi5G9cwfgrMWk1n6Yb
 LjPk9mOhuuc9qSd4mihvEO1yxmW1EwY70yO1WZde9DaFmBkADac6klhA+JoWw76nQWbw
 IIqg==
X-Gm-Message-State: AFeK/H0zNuWKiv/tdQ0ehkTWdnPPNuYaY0CtteQ3ozsPYGxRVHn8njiZqsTmudbJi2Uvjp2izOd8gWtpkRoFHg==
X-Received: by 10.13.237.5 with SMTP id w5mr23604205ywe.56.1490698045887; Tue,
 28 Mar 2017 03:47:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Tue, 28 Mar 2017 03:47:05 -0700 (PDT)
In-Reply-To: <1490366683-23401-1-git-send-email-clg@kaod.org>
References: <1490366683-23401-1-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Mar 2017 21:17:05 +1030
X-Google-Sender-Auth: f_ygNpebFiusrME1enCnl4LnXQE
Message-ID: <CACPK8XcwfZ+_bwdeCNhXnj38euQgQ-XFyuqbC7zoV_gRO3s1ZA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/6] Aspeed SMC enhancements
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 28 Mar 2017 10:47:32 -0000

On Sat, Mar 25, 2017 at 1:14 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> Hi,
>
> Here is a series providing a couple of fixes and enhancements on the
> SMC driver, among which :
>
>  - support of the segment registers which are needed to set the
>    mapping windows of the chips on the AHB bus.
>  - command mode support
>  - detection of the best HCLK settings for reads (adapted from pflash)
>
> The full tree can be found here:
>
>      https://github.com/legoater/linux/commits/openbmc-4.10
>
> Tested on the palmetto, ast2500 evb and witherspoon platforms.

Great work Cedric. I merged this series into dev-4.10.

In my simple test where I read off the PNOR, I get the following
improvement on the Romulus board I looked at:

$ time dd if=3D/dev/mtd6 of=3D/dev/null  bs=3D64k

v4.7.10-294-gec62e5e4b9bb       0m35.483s
v4.10.5-60-g5e4185ecf0cf        0m7.450s

Cheers,

Joel
