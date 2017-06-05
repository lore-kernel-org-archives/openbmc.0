Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whFbH0qz1zDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 23:12:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qtXpGl8t"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id 202so4925777ybd.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nHnR5fldK0W43TubEQ6xUzippnnmKX+qTdnK96yWbJ0=;
 b=qtXpGl8tnPn4YCLLiq89bDboaspCUUeiKSxEJp3UQT31bWMOE6FuorTn1z6LYy/7/H
 eTEU8dyO/hnvrUETAVsZz2I1GxX6m9p6n7Z1n08+mZukUX035qFL7Dyk9xqu0CNxfIy4
 KGWas4PaxM9u3Xznx4/NewA4WzTkot9bVokFuHMUWMlps2Lte2rrU0RpjRzNQBpUQj/5
 8NykZauyDRc7ilU0dikodbqB9D68nnPrawHMLbXvuOp4+Oi6J7TTNJEqPMRfIfgmfeaA
 EViQy0NRgp8uC1MVezL8i7OklvsbeZu/ICorzo4JBGcmSFNFf5IDP70a+nDrXHpgTR7X
 rEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nHnR5fldK0W43TubEQ6xUzippnnmKX+qTdnK96yWbJ0=;
 b=Yw85F9bRF9awyPuPALJ10oEcD0W0cH+iLl/i0lTUjJn9178XER7in4tMh+8zjrammT
 pyoo8N6E5Reqv107who8XaFzuH5T6mfHbHkGQiOX8VbUK7ziumCjYi74JWG0PaNLIxxW
 upn4OA71cMNWJfvFtaYLHLecUz52U4+Od2ySyd3D3gYsrerzoZ2XDUBDNNnJlB2HjvQa
 j/wQB8YARQ9WOVUrz+kq6GByEFlJKoT3LXQ4Lk/w142PVAx+SCtGUdJtg4FRKU9hLWYa
 e7kzpKH4KYDDTT/Gxm6iK0znle9m8ag6aZzqskEUvVfdkztCnCPw7snqvKPrV8jb29QE
 wkdg==
X-Gm-Message-State: AODbwcCfoe+7IhbrviRHBTdzHIu8AC9mczoCHqsQaHSVUWEmCxGv2aiU
 ghzn+74lTIQx0xGEHjyJS/QY5LwUEw==
X-Received: by 10.37.207.7 with SMTP id f7mr8954292ybg.93.1496668328760; Mon,
 05 Jun 2017 06:12:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Mon, 5 Jun 2017 06:11:48 -0700 (PDT)
In-Reply-To: <CACPK8XewcZ51qZqQHBzn5EuPvJw+P+ue+B87v=NRKrPZSNzYYg@mail.gmail.com>
References: <CACPK8XewcZ51qZqQHBzn5EuPvJw+P+ue+B87v=NRKrPZSNzYYg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 22:41:48 +0930
X-Google-Sender-Auth: rbPr7pTYIwM83CDY8_xE3onSMQ0
Message-ID: <CACPK8Xe2V_C=CN7VfdhMqx7=iR4DQpYLnKpPvE4u44tiKga0cw@mail.gmail.com>
Subject: Re: Enabling p9 OCC hwmon
To: Edward James <eajames@us.ibm.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 05 Jun 2017 13:12:11 -0000

On Mon, Jun 5, 2017 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Eddie,
>
> As of 763d6007e084f480b7129f35560c30ce30938509 the kernel tree has all
> of the drivers that have been posted to the list staged, as far as I
> could tell.
>
> I was attempting to enable the OCC hwmon driver, but it is behind a
> config symbol that does not exist:
>
> $ git grep CONFIG_SENSORS_OCC_P9_SBE
> drivers/hwmon/occ/Makefile:ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
>
> Can you work out what has happened here?

I made a patch that fixes the issue for now:

 http://patchwork.ozlabs.org/patch/771128/

This my not be the fix you want once you've integrated the p8 version.
Do you plan on posting the p8 OCC patches?

In addition, we need to fix these sparse warnings:

$ make C=2  drivers/hwmon/occ/
  CHECK   drivers/hwmon/occ/p9.c
  CHECK   drivers/hwmon/occ/p9_sbe.c
  CHECK   drivers/hwmon/occ/common.c
drivers/hwmon/occ/p9.c:99:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:96:23: warning: cast to restricted __be32
drivers/hwmon/occ/p9.c:63:23: warning: cast to restricted __be32
drivers/hwmon/occ/p9.c:181:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:178:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:175:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:172:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:169:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:166:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:140:23: warning: cast to restricted __be16
drivers/hwmon/occ/p9.c:137:23: warning: cast to restricted __be64
drivers/hwmon/occ/p9.c:134:23: warning: cast to restricted __be32
drivers/hwmon/occ/p9.c:125:23: warning: cast to restricted __be32
drivers/hwmon/occ/p9.c:210:5: warning: symbol
'p9_occ_setup_sensor_attrs' was not declared. Should it be static?
drivers/hwmon/occ/common.c:77:24: warning: incorrect type in
assignment (different base types)
drivers/hwmon/occ/common.c:77:24:    expected unsigned short
[unsigned] [usertype] user_power_cap
drivers/hwmon/occ/common.c:77:24:    got restricted __be16 [usertype] <noident>

Cheers,

Joel
