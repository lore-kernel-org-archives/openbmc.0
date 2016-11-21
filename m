Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMbmv1zKmzDvLt
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 15:52:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sB0M5odb"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id v84so20450293oie.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 20:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VNGdf3ni1OgyfZuSk0MRPjA/mVes8R1XbgDAi+xebAs=;
 b=sB0M5odb5/aGbPvOKVYQQwJ7K5OWkCXPKrxf4Zkf2rTWeRmTZzVCCGIsfCYpgrTUM1
 aU6gTzlEhH5lTy1LwqVh3I95iTjwt39nG/Fg+47bTHcWTHyJiornp8cNOBQRxa5imlK7
 3PCFCnAGcXOSnsDlkB/yFqeWL3ctg1hsWWg2qa2EqNbljTxgOnXvnxk273ReA0VgBY+v
 JTBJGOoGHjKcNwwiLQB/ovq/ws6Jy/wdyK85wzvV41WVp6zORrzjBco5PwOk/vHkqbxz
 cSYn1n0iBVlZoqGe+cpVSMxWjtluC+7hjUPAEaq9986R4HgCHnDhubAYoh7kRjtlpk/r
 Fjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VNGdf3ni1OgyfZuSk0MRPjA/mVes8R1XbgDAi+xebAs=;
 b=eG11jO/eDqgDIRgXIz/Dg5JMYLKj/Yxt5NzMN/5+6OeYII+cPA8Rey4o0kSEmBaOtz
 V3hSaV7GKzz/Tub35iol27C/fLfLeLsWvQjjhnKhQYCLvpDN6HIj5Rex4vqiGNsCvz02
 oGD1u+cw0cHfh9Rmi+01EbsU4CLKl1hkQ1SEX40MV0rV51RtJJ3KYhhMPUYOIRv0Fn3/
 71haocReW6mZuvbIqX+2XZXfIxkI6d+voYa6SEjd3xi32cM4MqrKS6hcnjNec/YlzEvr
 rAxpzoUc4AUx5klTumHSZ6wAxMvOTri58LhBti2lA+UyGCPE7oiYxHv+vCfQA7ULH6IV
 tB+Q==
X-Gm-Message-State: AKaTC03c5mfA0JS+UY7g7XYDjqppCqbuj3cEckTq+bOS8jKsE5p6778I+HRWYQMowL/t3L8ijawavKlpiBOJkw==
X-Received: by 10.202.220.139 with SMTP id t133mr7405983oig.82.1479703933285; 
 Sun, 20 Nov 2016 20:52:13 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 20:51:52 -0800 (PST)
In-Reply-To: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1479696048-75851-1-git-send-email-christopher.lee.bostic@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 15:21:52 +1030
X-Google-Sender-Auth: ds6jEtgxos6VmoDm-zU6bMAcRfc
Message-ID: <CACPK8XemnuNG2LCk8ieboP3E1mGCgxLjjYZkcpgehZq=JesJhQ@mail.gmail.com>
Subject: Re: [PATCH linux 00/19] FSI device driver introduction
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 gustavo.padovan@collabora.co.uk, 
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch, 
 Johannes Thumshirn <jthumshirn@suse.de>, dan.j.williams@intel.com,
 sre@kernel.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, k.kozlowski@samsung.com, 
 Jeremy Kerr <jk@ozlabs.org>, zahrens@us.ibm.com, xxpetri@de.ibm.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Alistair Popple <alistair@popple.id.au>, Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Mon, 21 Nov 2016 04:52:15 -0000

Hello Chris,

On Mon, Nov 21, 2016 at 1:10 PM,  <christopher.lee.bostic@gmail.com> wrote:

> Chris Bostic (7):
>   drivers/fsi: Set up links for slave communication
>   drivers/fsi: Set slave SMODE to init communication
>   drivers/fsi: Add master unscan
>   drivers/fsi: Add GPIO based FSI master
>   drivers/fsi: Add client driver register utilities
>   drivers/fsi: Add SCOM FSI client device driver
>   drivers/fsi: Add Mailbox FSI client device driver
>
> Jeremy Kerr (12):
>   fsi: Add empty fsi bus definitions
>   fsi: Add device & driver definitions
>   fsi: add driver to device matches
>   fsi: Add fsi master definition
>   fsi: Add fake master driver

>   fsi: enable debug

Drop this debug patch.

>   fsi: Add slave definition
>   fsi: Add empty master scan
>   fsi: Add crc4 helpers
>   fsi: Implement slave initialisation
>   fsi: scan slaves & register devices
>   fsi: Add device read/write/peek functions

A few housekeeping issues:

You're missing patch 1, 4 and 14 from the series.

Please resend with the full series and add cc linux-kernel@vger.kernel.org.

You should base your series on an upstream tree. I suggest 4.9-rc1.
This will mean dropping the patch to the Witherspoon dts which is not
upstream.

Finally, make the subjects consistent: pick either drivers/fsi or fsi
for the entire series.

Cheers,

Joel

>
>  .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |   9 +
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   |   9 +
>  drivers/Kconfig                                    |   2 +
>  drivers/Makefile                                   |   1 +
>  drivers/fsi/Kconfig                                |  41 ++
>  drivers/fsi/Makefile                               |   6 +
>  drivers/fsi/fsi-core.c                             | 533 +++++++++++++++++++
>  drivers/fsi/fsi-master-fake.c                      |  95 ++++
>  drivers/fsi/fsi-master-gpio.c                      | 578 +++++++++++++++++++++
>  drivers/fsi/fsi-master.h                           |  62 +++
>  drivers/fsi/fsi-mbx.c                              | 196 +++++++
>  drivers/fsi/fsi-scom.c                             | 225 ++++++++
>  include/linux/fsi.h                                |  73 +++
>  14 files changed, 1851 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
>  create mode 100644 drivers/fsi/Kconfig
>  create mode 100644 drivers/fsi/Makefile
>  create mode 100644 drivers/fsi/fsi-core.c
>  create mode 100644 drivers/fsi/fsi-master-fake.c
>  create mode 100644 drivers/fsi/fsi-master-gpio.c
>  create mode 100644 drivers/fsi/fsi-master.h
>  create mode 100644 drivers/fsi/fsi-mbx.c
>  create mode 100644 drivers/fsi/fsi-scom.c
>  create mode 100644 include/linux/fsi.h
>
> --
> 1.8.2.2
>
