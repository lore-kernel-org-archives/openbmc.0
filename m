Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZPhV1DwZzDq66
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 22:55:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=c7YLcMpV; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id t127so62749754qkf.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2016 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=efUpsWK4HCbajwT+9m7tMr0iBbfiFVUlNTFAIIh3/98=;
 b=c7YLcMpVukf6ggHBPczxhmjUYGpowCltZXnqGdMDL+OEaGgBWTpgCIsENMfWleYBkb
 NffEZvk8z25nebAk8T7clJSAB+P4vkklQHucmeuCY8M5HtKj5s7BrdIVtJNYYWpydzoG
 mqUxs/Mw87SRIUmt+M7Zm8JxIk3XxIH3IIirs+su01L0JYZqLY83m+2tt/P/SQdk4sJN
 v+zLa7OBxHwefeHtk5bOPNPJvZbGp5dtnRk5RsdjyyU8Ayt3WM43Nn1WKGkAXYLKW9uq
 rDMzusISjqvjJ+kDHpPL0J+QYuV0rZL8x1qCxm9bfixJOhT2gPzSamZL+Bft6kqi8mqc
 0vsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=efUpsWK4HCbajwT+9m7tMr0iBbfiFVUlNTFAIIh3/98=;
 b=W5oQW653ZbE6j0BRbxLwLVyxneKPxNjp2HSTTIMbvg89na0scpni10JMacYYS/MGr8
 AfLm863fTBbtyiYAUedjtkArs+uhi0Oe+n8cTKm7ozqg7SF2Qnby8rL9W2YEv9hmhOwt
 f5BXWYPao04edtiR6Oks0bTDZS80oyeNWhApvJY65xvbTMlxTAwyML5b19qqR44651F5
 VUkqkBTQwVKAgngN15pJScKmeXAPP0/UfpeLy7A988+RFiY5BpcUo7sFvZN/M7gEhc9g
 3w+T4YRDcwUfvld8xFLxa9i5rKhvUieJ1OZQ/bEuHlTgVb+sQh+PLWMdM3pnvOOZTDwt
 VMXw==
X-Gm-Message-State: ALyK8tKq7K0xbhTO6Ihru5gDZJESM7TdrFUSLSg10lCKpjsph30FFXkGbCXM+aC3VgF5jDJyTW7QXjXD7bL7aQ==
X-Received: by 10.55.212.89 with SMTP id l86mr3417855qki.114.1466600119863;
 Wed, 22 Jun 2016 05:55:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Wed, 22 Jun 2016 05:55:00 -0700 (PDT)
In-Reply-To: <71b0d0d9-54d9-9aad-d034-4356a318ee8b@kaod.org>
References: <1466494185-24459-1-git-send-email-joel@jms.id.au>
 <47db0c5d-907c-4622-0659-2cef581a467c@kaod.org>
 <CACPK8XdXSeaa8_CopXjz2JdxYRE5eDs7-z=LtmwfzxSMU-MZhg@mail.gmail.com>
 <71b0d0d9-54d9-9aad-d034-4356a318ee8b@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Jun 2016 22:25:00 +0930
X-Google-Sender-Auth: HkljNU7NewxMtqqO-QVaVsi4njE
Message-ID: <CACPK8XeOkAZAGu0oVw3R00hAxnKv6H1h+KpYbK9e2kRHjVmE5A@mail.gmail.com>
Subject: Re: [u-boot 0/3] Add minimal ast2400 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Teddy Reed V <teddy.reed@gmail.com>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 22 Jun 2016 12:55:23 -0000

On Wed, Jun 22, 2016 at 1:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>>  https://github.com/shenki/u-boot/tree/v2016.05-aspeed-openbmc
>
> Thanks for doing this. It was important to have a common branch for both
> ast2400 and ast2500 to start cleaning up.
>
>> I'll boot test it on a palmetto, ast2500evb, and witherspoon tomorrow
>> and then move openbmc to use this branch.
>
> Tested on palmetto and ast2500evb. It boots fine the OpenBmc image and
> network is ok after boot on both. However network does not work on the
> ast2400 in uboot. This needs digging.

It was using the faraday driver, not the aspeednic one. I fixed this
up and re-pushed (along with a bunch of cleanups - you may find the
history was rewritten, sorry).

aspeednic.c has a bunch of #defines I copied from the board files when
bringing up witherspoon which forces the driver into NC-SI mode. I
suggest we use the ftgmac100 driver for platforms with a dedicated
phy, and aspeednic for NC-SI. The goal is to add a NC-SI library to
u-boot so ftgmac100 can be a NC-SI driver in a similar fashion to the
kernel. Gavin will work on that next week.

After doing this work today I still need to re-check it boots on the
ast2500 systems. Once I've done that I'll push to openbmc/u-boot.

Cheers,

Joel
