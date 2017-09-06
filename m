Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::233; helo=mail-lf0-x233.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="twDjMKft"; 
 dkim-atps=neutral
Received: from mail-lf0-x233.google.com (mail-lf0-x233.google.com
 [IPv6:2a00:1450:4010:c07::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnBfL1jDvzDrJL
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 15:17:13 +1000 (AEST)
Received: by mail-lf0-x233.google.com with SMTP id q132so15094394lfe.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 22:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=02fRP6vUh/gx7OHz2vEMOiR8qfs8IGQ7EVJOB8+Gkmg=;
 b=twDjMKftXwo2UzxGRy2YpkeCUtSz+tyeIdY22SD3JzmiW11AG4JJDFQIhS8in/HydU
 QIa4IokrUuQfNO5tweQkYH+pWADcF4ZU6KrdWihRPifflf9ul1tH/jCGXgvyiFoI6jME
 YbzdvqRvr2iKCuge+m6/9vo5E51dE0wQZSNP3Q5R78FuhbW4mW3CwWEcQnKXwr/Dpd2L
 ylsDyNNu6BFnyoA8f7/4tyLJWw20HBTKwYTpcwvs89W3pXJIboO5Qw4doBNVATPVYPZ4
 yWMxMz2gE/p1qiWDpJ6/FRr0GxRfWxPyhqB/GeUzVXMx8lsm+QgvjF9IEMKY05w3PxVe
 susw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=02fRP6vUh/gx7OHz2vEMOiR8qfs8IGQ7EVJOB8+Gkmg=;
 b=lVVb4/gOHzAtmcDwS8BRwXJzZ59WVrlgqqAXoDhe3dzMPcn1do9aNIdad+IuW0eTgI
 9Em/n5go0UCEcn2/5kutMjtp01uhA/MT8W9qUvg6UeK8Y5bMZVaR//3/V2gm2jNZZUGF
 apGrnKLHF2rqtP7csIURzCcndnIHan1NzFFIivtbO5gF5sqHcjnXyztSmO2D7s5dVcUc
 IiPV5qL1hSTVLVFHPYnT3B3ez4vqaz5KDV9p0KQfENwS540XtmNdYMGAqMBjGJgOGN9k
 s2eYGjGl1KRaqGDBMUG8PH9o/F7+KXIenFrRxxAq/GfyfJBJmozTIrzKkx1AZIaPMhKO
 ilCA==
X-Gm-Message-State: AHPjjUifbuXfKwOLO7WYhNoaRk2TfqZUSOKjus55XgyHKw7D0oi9kGHX
 Vy5SW5v0W4DLTTmjhS8cAtLRtmrygw==
X-Google-Smtp-Source: ADKCNb5nKPivJaUCHxzvY4HvvIARQFjEaxWV4HqLNjyaHhq+zq4gVkkbkKIUGzpXqIqvHeSU5JygoS842CmQAncgbXE=
X-Received: by 10.25.143.27 with SMTP id r27mr458862lfd.85.1504675030210; Tue,
 05 Sep 2017 22:17:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Tue, 5 Sep 2017 22:16:49 -0700 (PDT)
In-Reply-To: <DB5PR05MB1224502182F8C6EAF62E17C9EF9E0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <DB5PR05MB1224502182F8C6EAF62E17C9EF9E0@DB5PR05MB1224.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Sep 2017 14:46:49 +0930
X-Google-Sender-Auth: 0Pz90PgvCnZoNo2KaF6VriaydxU
Message-ID: <CACPK8XcBWbdKQruu5wdAP2xo6xmxQ867fP41SUU+0d38H7O-Wg@mail.gmail.com>
Subject: Re: Mellanox ipmi daemon discussion
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 06 Sep 2017 05:17:15 -0000

Hello Mykola,

On Tue, Aug 29, 2017 at 12:57 AM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
>
> We'd like to add Mellanox ipmi daemon recipe to mellanox msn platform. It's based on openipmi project.
> Code review: https://gerrit.openbmc-project.xyz/#/c/5694/.
>
> We added some hooks in openipmi code and also our specific module.
> We use it for SoL, SEL, serial console redirection, console switching between the host and BMC, PET/PEF, LAN related commands, time setting,, and also a lot of OEM commands for LED, FAN control, reset signals, reset causes, BT connection with CPU, etc.

The reuse of existing code is a good achievement. Well done.

How did you find the use of OpenIPMI for your needs?

> It doesn't use DBUS interface.

This is a downside. The use of dbus as an inter-process communication
mechanism is something that defines OpenBMC at the moment.

Could you add dbus IPC to the existing codebase?

>
> We are planning transition to OpenBMC ipmi demon, after we are done with all kernel related patches. Our plan is to start transition in the following order SoL, SDR, SEL, LAN, LED and so on.

What lead to this decision? What are the up and down sides of the
phosphor ipmi daemon compared to OpenIPMI?

> At his moment we'd like to have functional image, which can be built from OpenBMC with no any patches.
> We also have one customer and it's important for us to have a functional image, which he can build by himself.

Agreed. I've +1'd your patch, and would like to see it merged.

Cheers,

Joel
