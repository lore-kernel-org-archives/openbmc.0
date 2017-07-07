Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3lMt1PwGzDqj8
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 16:39:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ccfsMDlM"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id o195so1014912yba.3
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 23:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UxDZTuWS5LUpLPkLqJ8wVXkjCHVVoOswSsFS8uSbkow=;
 b=ccfsMDlMM23jsRpspcHxln5aDtgOXnkjBNpLy856cLtKp6LZI24Pr9fqx6nQ2OctYA
 s/86u3Gbuea5AQCQY49eoAttNZghMS80PQp0ydnO/V7B6u2bXkOYyU4W4Yz225T7/+X7
 lC0cpHMf9yUpMv7vhG/BJMN7JE52TG75IIYli8Fjmid5k7ATuyXbTq3nMYXRJOFNzENL
 9fgrVJo1zi4Uoe+XUyEUqVNZk7d+IftIJXaTk90Pvp+dvDLmmdN2GHe4le2eig5esSs6
 yfKTZ0YGdEqh4s9trxoc4+ghn+8k+snMuOCT0s4bvID3xTyOKXoYlGVFla+AlMfEBIvp
 JhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UxDZTuWS5LUpLPkLqJ8wVXkjCHVVoOswSsFS8uSbkow=;
 b=g48IjWKaqwxB8GLpKtj1fng6J/ijFZhUPqvDGchxNBAaPf/9iRFuNXhivGKiz7G8f+
 ihspSc9VrRfMyxBFeWmYoc5ioPOpwaF4JdegDrQkpRVd1O9FvxiYLuYpo4crwx6yYBE5
 y3hMspOxhwFk/j2s2zYRteTkMOLKC2xc0uWY0oTZMRAJ2lPVgiaWrEVQJ3N/6ZjtPIhD
 83NjgFzGyqSP1IHac0Rdv1gFHNOQQaWTVacXJxqISJpMGf67mi81CH/1Eyj+BRuf+FuA
 oSIzcLwqQxioT6EWierH4fm8tAtOEGPGi/lKGGpKlMKj4mV53A5el4aNiOgEawY4TOTl
 esRw==
X-Gm-Message-State: AIVw111tpXAV8WvKn4OK7keINZWP348oqf2p8J7xoamrQ/YtD+qvOu7I
 trbx4HddLnyIw6gAkT3SBpHq68nlqkCQ
X-Received: by 10.37.35.212 with SMTP id j203mr2394956ybj.94.1499409591575;
 Thu, 06 Jul 2017 23:39:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Thu, 6 Jul 2017 23:39:30 -0700 (PDT)
In-Reply-To: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499377469-30625-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Jul 2017 16:09:30 +0930
X-Google-Sender-Auth: cK6uIR0LWDGv817Rfoc6-KJTRJg
Message-ID: <CACPK8XeYkeJUXh5cee9D_jij3iVMYMWupEbNTXr5gzLUdmcO9g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3 0/3] Add I2C busses to P9 device tree
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 06:39:54 -0000

On Fri, Jul 7, 2017 at 7:14 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This series adds FSI-attached I2C controller and associated busses to the P9
> FSI cfam device tree node. It also enables the devices in the P9 machine-
> specific files, and adds aliases to preserve the expected /dev/ entries.
> Also does a couple of dt parsing fixes in the driver.

The code changes conflict with the fixes I posted. Please review the
fixes I posted, and rebase your patches on them.

Cheers,

Joel

>
> Changes since v2:
>  - Split adding and enabling busses into two patches.
>  - Add aliases.
>  - Add the device node to the I2C adapter dev (needed for alias).
>
> Edward A. James (3):
>   arm/dts: Add I2C master and ports to FSI cfams
>   arm/dts: Enable FSI I2C busses for P9
>   drivers/i2c: Fix devicetree parsing in FSI-attached I2C master algo
>
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 150 +++++++++++++++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 150 +++++++++++++++++++++
>  arch/arm/boot/dts/ibm-power9-cfam.dtsi           | 164 +++++++++++++++++++++++
>  drivers/i2c/busses/i2c-fsi.c                     |  12 +-
>  4 files changed, 471 insertions(+), 5 deletions(-)
>
> --
> 1.8.3.1
>
