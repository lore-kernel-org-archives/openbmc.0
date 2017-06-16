Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpq3h10CfzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 15:41:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qGl8LXQx"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id u13so1769771ywg.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 22:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=NtQ61/wjgLbxwa8ntqOLdBEFyCuU0u5GhfuxmvWBVXM=;
 b=qGl8LXQxdvK+ZbVW6vI91wU7SR8SHON2pOj3T7LgIA85qt5NhR7dpL25yZbCE77mNj
 jxCGlS3RyJ3BjOuiD3L4QT5pj/pG+okgMlkJWkkkz99uveDONqA7n3MuFSpExLiCHJB4
 fwh65WThQ9hhrwHdp1R9bHl6Bk2eKOU0nLOVJ8yUVWOZNqsnWQYtzcR1ERgFKdomfTIk
 THufheOoepwSTrFPXFqozQu8qi0ezQKptbSi5+TJudSKunby14bN6vpz3P45ULi1SJ+9
 /UtP6PP+PyM6h3nfg3K5QZY3pGm7zr+PLLnrOhnI5ueuTIh9ZTOEvnTyjQ/na8eC/TFx
 iVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=NtQ61/wjgLbxwa8ntqOLdBEFyCuU0u5GhfuxmvWBVXM=;
 b=D59XvekeKQ2dNXzoiCdspNwT1l2bi9fyK9bNCSclV9fpAYG71J8KvIuaYk9h360wJp
 DZlg6YL7nuvGr3wNMcHkSMtSxqAZoVLzKgiAxkGYoaQnpKM5IfMwoxkXeARyFcVVod1V
 T4OOlqXCGTcFu0zNEHajddTBIXKPve/U+u6XfkaW4Kk/8O5W2ZPaxoCfReBsrlyDAkxl
 TLr18+USI8EVBPvRb0GjRwIA6AMJxR2FqPBa2aA/cWWk1sh4xtRJ7hSEh57qtwhyfJ8g
 khsxmHuwMukCvJn2Cm/EIYAsNogGu+vk+kV9yPaHT1Hq+iDLBBOKpFyZdaoTDH7SRfzN
 Jyxw==
X-Gm-Message-State: AKS2vOwDqVtklLHcMbPj7LgbD1vQiU1jWmRCqOf08AVZK6C3k+lYCbvT
 KZXeMZmv4cNhxLyozGE5Xi+XXXb8NsmlKHk=
X-Received: by 10.13.208.67 with SMTP id s64mr7662189ywd.43.1497591662095;
 Thu, 15 Jun 2017 22:41:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 22:40:41 -0700 (PDT)
In-Reply-To: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1497031265-29545-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:10:41 +0930
X-Google-Sender-Auth: 7RD7y-WKe-YdlKeA0raFUHw79VM
Message-ID: <CACPK8XcJ1owjXZdunnMjQ=tyAmren8Oi_MfTBwTM2kbpUzG8Sg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 0/5] drivers: OCC: Update sensors, fix
 probing, add P8
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
X-List-Received-Date: Fri, 16 Jun 2017 05:41:04 -0000

2017-06-10 3:31 GMT+09:30 Eddie James <eajames@linux.vnet.ibm.com>:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This series refactors the OCC hwmon driver to make a number of changes and bug
> fixes. It also includes bug fixes for the FSI OCC driver. This includes 3
> patches that were previously sent individually on the openbmc mailing list.
>
> Edward A. James (5):
>   drivers: fsi: occ: Fix 1 byte response and rc for O_NONBLOCK
>   drivers: hwmon: occ: Add new sensor versions and non-hwmon attributes
>   drivers: hwmon: occ: Add P8 OCC access
>   drivers: occ: hwmon and fsi probing fix
>   aspeed: update power9 dts and defconfigs for OCC

I've applied this series. They look like there is some more work to be
done, so please find some reviewers ASAP.

Cheers,

Joel

>
>  arch/arm/boot/dts/ibm-power9-cfam.dtsi |   9 +
>  arch/arm/configs/aspeed_g4_defconfig   |   2 +
>  arch/arm/configs/aspeed_g5_defconfig   |   1 +
>  drivers/fsi/fsi-sbefifo.c              |   4 +-
>  drivers/fsi/occ.c                      |  22 +-
>  drivers/hwmon/Makefile                 |   2 +-
>  drivers/hwmon/occ/Kconfig              |  19 +-
>  drivers/hwmon/occ/Makefile             |  12 +-
>  drivers/hwmon/occ/common.c             | 991 ++++++++++++++++++++++++++++++++-
>  drivers/hwmon/occ/common.h             |  17 +
>  drivers/hwmon/occ/p8_i2c.c             | 270 +++++++++
>  drivers/hwmon/occ/p9.c                 | 350 ------------
>  drivers/hwmon/occ/p9.h                 |  17 -
>  drivers/hwmon/occ/p9_sbe.c             |  60 +-
>  14 files changed, 1354 insertions(+), 422 deletions(-)
>  create mode 100644 drivers/hwmon/occ/p8_i2c.c
>  delete mode 100644 drivers/hwmon/occ/p9.c
>  delete mode 100644 drivers/hwmon/occ/p9.h
>
> --
> 1.8.3.1
>
