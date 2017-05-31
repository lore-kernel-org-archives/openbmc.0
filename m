Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdCY72rV7zDq5j
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 00:29:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qBuMbwC+"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id y64so1035104ywe.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 07:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=T5j66KcWt15eT6VRsK6wbOctnDP7pX6/vcF8yx3zb1c=;
 b=qBuMbwC+nUzhyZnIcmrxWlC5IlXp3EaWihdfLSu6PQqXYyBsqavwT+ZJ5u8kUT/7rz
 6Nk2JH6TE+eTljTQtRA3P9mwxdLVT3I4oIkNLsDcXw8kJ9cMCCjSoeCSKhHiy8VXj7NI
 d5rTSerjO0ODl2v9+UY7YL86NUikL/tCwZHdEDoEpTj4EdPmY9w7amF7VEfKa6RZNWl1
 Oth5sLs3N00iPmcQqyKTE6Eou9Hs3SdzVLZUC8PstHZO1PP+EPLqqCAANv/MyQ1dESq0
 PRts+qxs2KWx5Kz1Hg4DWjFGpd4TNET0IZJIdRLX6SQQb5Z7hZPyQgvi+WQt7F2n1tL7
 DsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=T5j66KcWt15eT6VRsK6wbOctnDP7pX6/vcF8yx3zb1c=;
 b=Mlzl6BI0+zmm+uoYZMe601yynXPj+gP89U0JNfUWZxKE7pBSwwZ0gN4FAsAzM0I7PK
 rZ+1Xj4l0hB0RQtVfh/7DFB38RqHTPQedwMpOthu58IlyCcfkxg6zvE/XX48XLERKm0m
 jFC6YCY5jirj1BUJ5XvfT2xXOYTDJvhOhTEzCT3YBrhGmJ5au7Wgq8t2RxZ3V6T5sI/z
 PhTl0heTdAYphBlf7UVSAc3tQ8GcFsOm6TC9mkWoPRFMlqOO967VogokFZ24iEBozxLK
 QXu3BcH5AMZL72L3gspdHYq3Wtmt8Q/7NNLoWIyUCthsqZXsfVOZaLpWYubtHrpYnkGM
 8Lmg==
X-Gm-Message-State: AODbwcCPH5e0RncHjFwolnwUlkF60X9YvwVn0aF2ufUHgFJwF4b/IsVi
 UxpLlpuTQYkwoKSWuxMHJy2JdBPEYM1z
X-Received: by 10.13.207.194 with SMTP id r185mr19086874ywd.135.1496240985260; 
 Wed, 31 May 2017 07:29:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 07:29:24 -0700 (PDT)
In-Reply-To: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1495820793-24205-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 23:59:24 +0930
X-Google-Sender-Auth: MoMODdzY5b_cE9KYykEm5AQqF30
Message-ID: <CACPK8Xcajw_TgVAEYp4XY0UP0SRrgUROAVN+YBW-H49z8e=wPg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 0/3] drivers: hwmon: Add OCC driver
To: Eddie James <eajames@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
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
X-List-Received-Date: Wed, 31 May 2017 14:29:48 -0000

On Sat, May 27, 2017 at 3:16 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This series adds a hwmon driver for the POWER9 OCC (haven't tested for P8 yet).
> The driver obtains the OCC poll response and exports all the sensor data as
> hwmon attributes. This driver is intended to operate on a service processor.
>
> For the POWER9 application, the driver communicates with the OCC from a service
> processor using the SBE engine. The low-level transfer protocol details,
> however, are contained in the OCC "fifo" driver, in order to arbitrate accesses
> from different users on the service processor.

I have merged this series to dev-4.10. Do you have the relevant P8 bits too?

Lets sync up with Andrew on where we are at with the upstream review
these drivers.

Cheers,

Joel

>
> Edward A. James (3):
>   drivers: hwmon: Add P9 OCC driver
>   drivers: hwmon: OCC: Add common functionality and SBE access
>   drivers: hwmon: OCC: Add P9 sensors, hwmon attributes, and device
>     setup
>
>  drivers/hwmon/Kconfig      |   2 +
>  drivers/hwmon/Makefile     |   1 +
>  drivers/hwmon/occ/Kconfig  |  24 ++++
>  drivers/hwmon/occ/Makefile |   7 +
>  drivers/hwmon/occ/common.c | 110 ++++++++++++++
>  drivers/hwmon/occ/common.h | 124 ++++++++++++++++
>  drivers/hwmon/occ/p9.c     | 350 +++++++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/occ/p9.h     |  17 +++
>  drivers/hwmon/occ/p9_sbe.c | 195 +++++++++++++++++++++++++
>  9 files changed, 830 insertions(+)
>  create mode 100644 drivers/hwmon/occ/Kconfig
>  create mode 100644 drivers/hwmon/occ/Makefile
>  create mode 100644 drivers/hwmon/occ/common.c
>  create mode 100644 drivers/hwmon/occ/common.h
>  create mode 100644 drivers/hwmon/occ/p9.c
>  create mode 100644 drivers/hwmon/occ/p9.h
>  create mode 100644 drivers/hwmon/occ/p9_sbe.c
>
> --
> 1.8.3.1
>
