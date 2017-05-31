Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdCTQ3gVTzDq5j
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 00:26:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uITQOZls"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id 130so526195ybl.2
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mlXaK1iLus1czGU7MiM5g9TKimkMNAD75U+CH296mF8=;
 b=uITQOZlsq7PSRepQOFqwhtWN+shpUVoxJ5mR9kGS1aawwxNhE6bdlMuTQaysIOCMCF
 DHWRCMSGmwGVKrhdsu8/QVdXiZnzpbCVftVbjieDkFvVsw/RnLuUb12DieCfUZLxqBHJ
 4SbO0e7YysHcY0htATvBL7SU89Pb3XiYjq/2NoyXhB7a3I7z/g03FYFJIvjyB1cNIcgX
 hy8hfNREUxSN/Pj95SG/ZRP3uDB7Bd3qtThAFl0Sowic7Ftujt8xRXeRqC0LU6ay3SnI
 cFa8LjkmysRK1BwGm4jG9Q6tTLya44GtbNqlck7HLuXQFKHNMi6TqDsHmsYtrIgWTVdp
 1FWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mlXaK1iLus1czGU7MiM5g9TKimkMNAD75U+CH296mF8=;
 b=LM0yHWLazyjaRqxrjqOMcba66odsg+MsvmRzI4qVcSft5B96TdTf5cnlutKDwdPFZN
 uJGNcLmnq1t4C/Lp1Z7NJr2t2e/7y4F6OqnuJGwt+96d9DmuBw7/VUEwRSSlGO2aCTwD
 fZD/Fhoc6DunMOZetozUghQdKHW9ZeziDwNotrgZxqHtelP2jAbboq0jWeFaJQ39Qxub
 KtmGyYsH0iVomZhGGeYlIUdp5JAs6mLR9ZzMzW10V5VCAMSnZrMQN/VuzHZRAzhYnEn5
 UJmOdjdThdw0KxGBKYsFqLlojhqrWowwUFFQZX7PAhBNOu98WDcF4vHi+pbcDG1Oqbsw
 Y5BA==
X-Gm-Message-State: AODbwcDHUtFE6Y3L6Iw8oS/Fas+uCezOCSvtTksw1DRJSgb7S+COJ4/q
 FtXjHAfe8GW4vPc1NgS6PaOrXVVkEw==
X-Received: by 10.37.59.210 with SMTP id i201mr515992yba.25.1496240792142;
 Wed, 31 May 2017 07:26:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 07:26:11 -0700 (PDT)
In-Reply-To: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 23:56:11 +0930
X-Google-Sender-Auth: eawA1q0hKD9geq0gejHt0xw6qk0
Message-ID: <CACPK8XfGrZARPMn7hNg73OELV=JTwL32VgUnZEjZvERbhT1L6g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 0/6] drivers: i2c: FSI-attached I2C
 master algorithm
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
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
X-List-Received-Date: Wed, 31 May 2017 14:26:35 -0000

On Thu, May 11, 2017 at 1:22 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This patch series adds an I2C bus algorithm to drive the I2C master located on
> POWER CPUs. The master is accessed over FSI bus from the service processor.
>
> The driver creates one chardev entry for each port off an I2C master by
> registering one I2C adapter for port. This implementation requires locking of
> the master in the driver to prevent transfers running into each other. The
> master registers are shared between ports.
>
> This patchset also adds the latest in FSI dt bindings from Jeremy Kerr. This
> describes the entire FSI tree structure (master -> slaves -> engines ->
> engine data (such as i2c master ports)). These bindings are required for the
> I2C driver in order to enumerate the ports off each I2C master.
>

I have added this series to dev-4.10. Note that under our kernel
rules, this means you must be in the process of submitting them
upstream :)

I think you can send them to the i2c maintainer with a mention in your
cover letter that it depends on the unmerged FSI series and that you'd
like to kick off the review process for your driver.

Cheers,

Joel


> Edward A. James (6):
>   drivers: i2c: Add FSI-attached I2C master algorithm
>   drivers: i2c: Add port structure to FSI algorithm
>   drivers: i2c: Add transfer implementation for FSI algorithm
>   drivers: i2c: Add I2C master locking to FSI algorithm
>   drivers: i2c: Add bus recovery for FSI algorithm
>   dts: aspeed: witherspoon: Add I2C master under FSI masters
>
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 156 ++++++
>  drivers/Makefile                                 |   2 +-
>  drivers/i2c/busses/Kconfig                       |  11 +
>  drivers/i2c/busses/Makefile                      |   1 +
>  drivers/i2c/busses/i2c-fsi.c                     | 654 +++++++++++++++++++++++
>  5 files changed, 823 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/i2c/busses/i2c-fsi.c
>
> --
> 1.8.3.1
>
