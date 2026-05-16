Return-Path: <openbmc+bounces-1943-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8018ECD4851
	for <openbmc@archiver.kernel.org>; Sun, 17 May 2026 03:11:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gJ5Z00Gnnz2yFQ;
	Sun, 17 May 2026 13:11:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::12e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778969196;
	cv=pass; b=WG5xRIDNKWJq1yxYyX54Mvqgy+g+wbQ9pMs4rkFaTYMDmcAGHn4itnaHdsT1yWIzwPK7BKt1UFk79Ab42sXAyUjr3mr5O2korHx1in/vj3xaNDW8x0kl2wbnmlAwBCtii5jbfKlPKxYJgk2xfraqDJUDZR6cWeE3LCk0gx5O5xcwjFd29Zl12ldLuXdBP9WWspaJGdFu2Arsv6RNzKsZ3I/L7mEb4ywDFYKrOuKKC4SeSNN++EBzqg394ZUZo8AZA61ttCFYxWWY/apooVCanbyRKFmveBLrPzdnFA4BdulgsKID5QOPtWGsw+TJxEQZgUOylDpxmcpmeV3uxh9gGw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778969196; c=relaxed/relaxed;
	bh=1hE11VnzLJ5mff4cUIxPGWIRHX4JLDCXuPzLU822DMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwmAkoe21tM1RrqakBE8BhKLrOHHw7v133K4mPl+8OzxKCr5T3IC94/5T+fJxpN02KgUyq+bVCSYSHHt8Zb2ucLHj/MmPNU0c4qQQ7iUWJOcW1WC26CqGTBq6i6uk0t8q7qp+HvSEUw0hOqCKM9UHNCXLi/zzADfLKUJB/lgQgYMIOhQSl6iLcdM+ebzija/o9jz/UfXejWVk2nfXJYlk73Hxj/rKUJ9j80GeSoZ8HkAJ+VpuiJ9+3oa3it2uWgZHbjraPU79q1L5zmFziUXhhVM3uCXnjDZOSTlGVbsQj+/MWXQfKOckIbha3UaIp86A/kMFSWJwWpFeSzPR3wsMw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lhfghiBd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=gomba007@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lhfghiBd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=gomba007@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gHyp03mM5z2xBb
	for <openbmc@lists.ozlabs.org>; Sun, 17 May 2026 08:06:31 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso1152869e87.3
        for <openbmc@lists.ozlabs.org>; Sat, 16 May 2026 15:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778969186; cv=none;
        d=google.com; s=arc-20240605;
        b=YDuNh7gNTF9k6zAV2M/ih4eQF6WV3pslN7da7/pl2YqnZWAxC49jpgOOhqaKzZCXQF
         GzQMlbBynsrQOXmjY5qj03b9aw7nYBE8Cme/MXNqYheO8dsUyE4ZGP6YXJ9jFxgrROTA
         Cfq913r4yjaeMynd0guJsRxhn90GvbGImAvoV9ZYAweNOXTZvL6RoZk0p1jxLF3OtDCm
         1cDHwlhn+8OKCKIeMnZn3jbF+T2KBjDkWHawRL5L7KfNmJs/jHy7+2M7GEaaqfePtm78
         8DZwJskgGYVSMn8Z2QqcfCTiHrgiZDv+YhI2Xd8BhpfYvBy4vwpRSH/0X+5EKX8u6E1U
         E1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1hE11VnzLJ5mff4cUIxPGWIRHX4JLDCXuPzLU822DMM=;
        fh=Bh7rd8rEQaIi4KJSdxINr0O7UtHK+auKmwqamzA6bA4=;
        b=PP96AnZwF515qNrx5dYWwrRfbCIghybzjoTcZXXkG8mFdfBw6CAX1XgwOzZkKtHv6+
         j7Ga9AnVVWpLcfY94TUKtN/vWEfUMo/HZKd251lMp3JTAMRUc3n2Bv6AJndSXbP/esZy
         zDl6DZBgV8o3nmzlUevL4GCJCfa31i7IVbF9lqiFphwTGvV3HFCLZqK/+V7revMGH5Q7
         QtquFhMCxUAJ4RCEY4aQwqdsUN69QTjoSwypxH4W8wI/ivg2avl1CiGMo6/MnyN9auHU
         p0/+k71igqKODufg/aw2DhKNi0QaH8NXHNQl8wS7GDzPBGpxq6XuMcdq/dM/7xBE9eUf
         RA0Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778969186; x=1779573986; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1hE11VnzLJ5mff4cUIxPGWIRHX4JLDCXuPzLU822DMM=;
        b=lhfghiBd6AIE5KLHz5jOJFStM3BYaoYUcYd7n1Lu60XOVIakR7Ss0YTbkpI7yK1IE3
         hRT5Qr7BfNnuwfjgwJcsTagi8wBS9lNj79I7tNN1UhxzaXdDiUsk52A1JF/ItzJEWunC
         saerYE09JtFJQ6q4PW7NFCTDxdShZcEb5l7W5O81FdDL6b6ZI3uDXRpiTAMsOi0vP13o
         UV8il8sLs9/e+gYy+2XE9BblUtYx6LMmR4modTa8yiZzVwh5SNVPtAv/YKnV4Ne5azz3
         PaZWHPbSpSY0dn2KvKt5wGMV/3KfC5B+GCTQdOJMrkdxnCGDYK99cDm4QMguNBOSDrbG
         0IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778969186; x=1779573986;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hE11VnzLJ5mff4cUIxPGWIRHX4JLDCXuPzLU822DMM=;
        b=BIqgddHnKSauN+fqGxyZlpw78pL+yD/y4iYN+z7i9PRt0nS8WPWJdCpyHTURVcH5j1
         aEAIlX1nS5gJegomge2V5w1MfQhs4lpJFBuqTAQe0I3EEw58cNYA3M3oShWqFAvwBQNx
         xkHQ0yQHxNBLMmehcOCSTTNIwzHyGqQcq1MId1uGgz+psPiZX7XA6SVqYz4d2fd2bd/o
         LrWDKpDhIwUaqwIMObnZGJLXCvydH/3lmmJnAJhhUkHF0TBXMVTlD9YlyTr+cHUTNnTZ
         BIe9+TX5du9fpjajIz44C5iZ+vPhvAcHN8gzjms6JCDxRr+1TGUHPiCYXobMzjvpbJJr
         LqOg==
X-Forwarded-Encrypted: i=1; AFNElJ8PPVTcG9L2Nn5do4lwpb1lo6UuudUfcMJIUwY5DbNvVZOsjRu5zq3IAzZO/dImdarCvaNqy6ae@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8KFIyuVtPl2IjNKr1EFNcfyf8Wya+XHnxaB3BSdsVkTwNwPyF
	SooEMmV5eJ8KC3pX4+A199/AdY84B7OIJwSqMX7AlZP5GxAerygHJTWcEY6sQ7m724p/w8hdXlg
	TCS2wmXMP/l03LrivmPFDh7dowX+ZbHk=
X-Gm-Gg: Acq92OFdGZ2aJ4UVW5mT3mlawmmS0NRw8dlkFcSr/g+UmG655QlLdcxH7uM0ojBhAEX
	ZIgnHx/e1yAg2jFbZw5vmzVE0Ona0yIGomCn63fAsCgioK2KHRVOy0688946Q1rleYhGYgyOK46
	Jq9el/JmsbvOuzx4DiaSF6Yw9wQiy6W8yzqEgtgFp+CNqW2Dnf0W6uDNEq+ATGK+OxmhFoZ5lCR
	5vu99W0Q3xW+e6FgN2Z5qBesPCZcxWKjrFdeFKgsipQT6zv08bZZiVaradvxATCjtyixN2/Begd
	lPdO6xN13K3iXS2fS8VLaCUuaJ1ArXi7MnCMVeeCKrw9df9CgwKVpe6Y9LQQZ0RlbaOIWx3r
X-Received: by 2002:a05:6512:2396:b0:5a8:923a:5369 with SMTP id
 2adb3069b0e04-5aa0e613fc7mr2772182e87.16.1778969185657; Sat, 16 May 2026
 15:06:25 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260515154720.406128-2-u.kleine-koenig@baylibre.com>
From: =?UTF-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
Date: Sun, 17 May 2026 00:06:14 +0200
X-Gm-Features: AVHnY4L1jrF6gwJ2o7-i9GxCodL3KvqWvSGZ-UO3oxoxATzb0SqS9hlwb_MKpyw
Message-ID: <CAPDFPBW3NreOUriS+=4CT8NmL+VDn+Um-BE+aAD5xzwnKkThxA@mail.gmail.com>
Subject: Re: [PATCH v1] rtc: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Dianlong Li <long17.cool@163.com>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000060a89b0651f68aa1"

--00000000000060a89b0651f68aa1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: T=C3=B3th J=C3=A1nos <gomba007@gmail.com>

Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.com> ezt =
=C3=ADrta
(id=C5=91pont: 2026. m=C3=A1j. 15., P, 17:47):

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>
> While touching all these arrays, unify usage of whitespace and commas.
>
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <
> u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> the mentioned change to i2c_device_id is the following:
>
>         diff --git a/include/linux/mod_devicetable.h
> b/include/linux/mod_devicetable.h
>         index 23ff24080dfd..aebd3a5e90af 100644
>         --- a/include/linux/mod_devicetable.h
>         +++ b/include/linux/mod_devicetable.h
>         @@ -477,7 +477,11 @@ struct rpmsg_device_id {
>
>          struct i2c_device_id {
>                 char name[I2C_NAME_SIZE];
>         -       kernel_ulong_t driver_data;     /* Data private to the
> driver */
>         +       union {
>         +               /* Data private to the driver */
>         +               kernel_ulong_t driver_data;
>         +               const void *driver_data_ptr;
>         +       };
>          };
>
>          /* pci_epf */
>
> and this requires that .driver_data is assigned via a named initializer
> for static data. This requirement isn't a bad one because named
> initializers are also much better readable than list initializers.
>
> The union added to struct i2c_device_id enables further cleanups like:
>
>         diff --git a/drivers/regulator/ad5398.c
> b/drivers/regulator/ad5398.c
>         index 0123ca8157a8..dfb0b07500a7 100644
>         --- a/drivers/regulator/ad5398.c
>         +++ b/drivers/regulator/ad5398.c
>         @@ -207,8 +207,8 @@ struct ad5398_current_data_format {
>          static const struct ad5398_current_data_format df_10_4_120 =3D {=
10,
> 4, 0, 120000};
>
>          static const struct i2c_device_id ad5398_id[] =3D {
>         -       { .name =3D "ad5398", .driver_data =3D
> (kernel_ulong_t)&df_10_4_120 },
>         -       { .name =3D "ad5821", .driver_data =3D
> (kernel_ulong_t)&df_10_4_120 },
>         +       { .name =3D "ad5398", .driver_data_ptr =3D &df_10_4_120 }=
,
>         +       { .name =3D "ad5821", .driver_data_ptr =3D &df_10_4_120 }=
,
>                 { }
>          };
>          MODULE_DEVICE_TABLE(i2c, ad5398_id);
>         @@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client
> *client)
>                 struct regulator_init_data *init_data =3D
> dev_get_platdata(&client->dev);
>                 struct regulator_config config =3D { };
>                 struct ad5398_chip_info *chip;
>         -       const struct ad5398_current_data_format *df =3D
>         -                       (struct ad5398_current_data_format
> *)id->driver_data;
>         +       const struct ad5398_current_data_format *df =3D
> id->driver_data;
>
>                 chip =3D devm_kzalloc(&client->dev, sizeof(*chip),
> GFP_KERNEL);
>                 if (!chip)
>
> that are an improvement for readability (again!) and it keeps some
> properties of the pointers (here: being const) without having to pay
> attention for that. (I didn't find a nice rtc driver that benefits, so
> this is "only" a regulator driver example.)
>
> My additional motivation for this effort is CHERI[1]. This is a hardware
> extension that uses 128 bit pointers but unsigned long is still 64 bit.
> So with CHERI you cannot store pointers in unsigned long variables.
>
> Best regards
> Uwe
>
> [1] https://cheri-alliance.org/discover-cheri/
>     https://lwn.net/Articles/1037974/
>
>  drivers/rtc/rtc-ab-b5ze-s3.c |  2 +-
>  drivers/rtc/rtc-ab-eoz9.c    |  2 +-
>  drivers/rtc/rtc-abx80x.c     | 20 ++++++++++----------
>  drivers/rtc/rtc-bq32k.c      |  2 +-
>  drivers/rtc/rtc-ds1307.c     | 36 ++++++++++++++++++------------------
>  drivers/rtc/rtc-ds1374.c     |  2 +-
>  drivers/rtc/rtc-ds1672.c     |  2 +-
>  drivers/rtc/rtc-ds3232.c     |  2 +-
>  drivers/rtc/rtc-em3027.c     |  2 +-
>  drivers/rtc/rtc-fm3130.c     |  2 +-
>  drivers/rtc/rtc-hym8563.c    |  4 ++--
>  drivers/rtc/rtc-isl12022.c   |  2 +-
>  drivers/rtc/rtc-isl12026.c   |  4 ++--
>  drivers/rtc/rtc-isl1208.c    | 10 +++++-----
>  drivers/rtc/rtc-m41t80.c     | 22 +++++++++++-----------
>  drivers/rtc/rtc-max31335.c   |  4 ++--
>  drivers/rtc/rtc-max6900.c    |  2 +-
>  drivers/rtc/rtc-nct3018y.c   |  2 +-
>  drivers/rtc/rtc-pcf2127.c    |  8 ++++----
>  drivers/rtc/rtc-pcf85063.c   | 12 ++++++------
>  drivers/rtc/rtc-pcf8523.c    |  2 +-
>  drivers/rtc/rtc-pcf8563.c    |  6 +++---
>  drivers/rtc/rtc-pcf8583.c    |  2 +-
>  drivers/rtc/rtc-rs5c372.c    | 12 ++++++------
>  drivers/rtc/rtc-rv3029c2.c   |  4 ++--
>  drivers/rtc/rtc-rv8803.c     |  8 ++++----
>  drivers/rtc/rtc-rx6110.c     |  2 +-
>  drivers/rtc/rtc-rx8010.c     |  2 +-
>  drivers/rtc/rtc-rx8025.c     |  4 ++--
>  drivers/rtc/rtc-rx8581.c     |  2 +-
>  drivers/rtc/rtc-s35390a.c    |  2 +-
>  drivers/rtc/rtc-sd2405al.c   |  2 +-
>  drivers/rtc/rtc-sd3078.c     |  2 +-
>  drivers/rtc/rtc-x1205.c      |  2 +-
>  34 files changed, 97 insertions(+), 97 deletions(-)
>
> diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
> index 684f9898d768..6439ca427c32 100644
> --- a/drivers/rtc/rtc-ab-b5ze-s3.c
> +++ b/drivers/rtc/rtc-ab-b5ze-s3.c
> @@ -933,7 +933,7 @@ MODULE_DEVICE_TABLE(of, abb5zes3_dt_match);
>  #endif
>
>  static const struct i2c_device_id abb5zes3_id[] =3D {
> -       { "abb5zes3" },
> +       { .name =3D "abb5zes3" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, abb5zes3_id);
> diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
> index de002f7a39bf..b75f4f665076 100644
> --- a/drivers/rtc/rtc-ab-eoz9.c
> +++ b/drivers/rtc/rtc-ab-eoz9.c
> @@ -546,7 +546,7 @@ MODULE_DEVICE_TABLE(of, abeoz9_dt_match);
>  #endif
>
>  static const struct i2c_device_id abeoz9_id[] =3D {
> -       { "abeoz9" },
> +       { .name =3D "abeoz9" },
>         { }
>  };
>
> diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
> index 00d7de64ed3e..e5179d0208d6 100644
> --- a/drivers/rtc/rtc-abx80x.c
> +++ b/drivers/rtc/rtc-abx80x.c
> @@ -752,16 +752,16 @@ static int abx80x_setup_nvmem(struct abx80x_priv
> *priv)
>  }
>
>  static const struct i2c_device_id abx80x_id[] =3D {
> -       { "abx80x", ABX80X },
> -       { "ab0801", AB0801 },
> -       { "ab0803", AB0803 },
> -       { "ab0804", AB0804 },
> -       { "ab0805", AB0805 },
> -       { "ab1801", AB1801 },
> -       { "ab1803", AB1803 },
> -       { "ab1804", AB1804 },
> -       { "ab1805", AB1805 },
> -       { "rv1805", RV1805 },
> +       { .name =3D "abx80x", .driver_data =3D ABX80X },
> +       { .name =3D "ab0801", .driver_data =3D AB0801 },
> +       { .name =3D "ab0803", .driver_data =3D AB0803 },
> +       { .name =3D "ab0804", .driver_data =3D AB0804 },
> +       { .name =3D "ab0805", .driver_data =3D AB0805 },
> +       { .name =3D "ab1801", .driver_data =3D AB1801 },
> +       { .name =3D "ab1803", .driver_data =3D AB1803 },
> +       { .name =3D "ab1804", .driver_data =3D AB1804 },
> +       { .name =3D "ab1805", .driver_data =3D AB1805 },
> +       { .name =3D "rv1805", .driver_data =3D RV1805 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, abx80x_id);
> diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
> index 7ad34539be4d..20cd92d00fa1 100644
> --- a/drivers/rtc/rtc-bq32k.c
> +++ b/drivers/rtc/rtc-bq32k.c
> @@ -304,7 +304,7 @@ static void bq32k_remove(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id bq32k_id[] =3D {
> -       { "bq32000" },
> +       { .name =3D "bq32000" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, bq32k_id);
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 7205c59ff729..ee8196498443 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -1063,24 +1063,24 @@ static const struct chip_desc chips[last_ds_type]
> =3D {
>  };
>
>  static const struct i2c_device_id ds1307_id[] =3D {
> -       { "ds1307", ds_1307 },
> -       { "ds1308", ds_1308 },
> -       { "ds1337", ds_1337 },
> -       { "ds1338", ds_1338 },
> -       { "ds1339", ds_1339 },
> -       { "ds1388", ds_1388 },
> -       { "ds1340", ds_1340 },
> -       { "ds1341", ds_1341 },
> -       { "ds3231", ds_3231 },
> -       { "m41t0", m41t0 },
> -       { "m41t00", m41t00 },
> -       { "m41t11", m41t11 },
> -       { "mcp7940x", mcp794xx },
> -       { "mcp7941x", mcp794xx },
> -       { "pt7c4338", ds_1307 },
> -       { "rx8025", rx_8025 },
> -       { "isl12057", ds_1337 },
> -       { "rx8130", rx_8130 },
> +       { .name =3D "ds1307", .driver_data =3D ds_1307 },
> +       { .name =3D "ds1308", .driver_data =3D ds_1308 },
> +       { .name =3D "ds1337", .driver_data =3D ds_1337 },
> +       { .name =3D "ds1338", .driver_data =3D ds_1338 },
> +       { .name =3D "ds1339", .driver_data =3D ds_1339 },
> +       { .name =3D "ds1388", .driver_data =3D ds_1388 },
> +       { .name =3D "ds1340", .driver_data =3D ds_1340 },
> +       { .name =3D "ds1341", .driver_data =3D ds_1341 },
> +       { .name =3D "ds3231", .driver_data =3D ds_3231 },
> +       { .name =3D "m41t0", .driver_data =3D m41t0 },
> +       { .name =3D "m41t00", .driver_data =3D m41t00 },
> +       { .name =3D "m41t11", .driver_data =3D m41t11 },
> +       { .name =3D "mcp7940x", .driver_data =3D mcp794xx },
> +       { .name =3D "mcp7941x", .driver_data =3D mcp794xx },
> +       { .name =3D "pt7c4338", .driver_data =3D ds_1307 },
> +       { .name =3D "rx8025", .driver_data =3D rx_8025 },
> +       { .name =3D "isl12057", .driver_data =3D ds_1337 },
> +       { .name =3D "rx8130", .driver_data =3D rx_8130 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, ds1307_id);
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index c2359eb86bc9..8c247215d611 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -52,7 +52,7 @@
>  #define DS1374_REG_TCR         0x09 /* Trickle Charge */
>
>  static const struct i2c_device_id ds1374_id[] =3D {
> -       { "ds1374" },
> +       { .name =3D "ds1374" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, ds1374_id);
> diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
> index 6e5314215d00..c610beb55bb5 100644
> --- a/drivers/rtc/rtc-ds1672.c
> +++ b/drivers/rtc/rtc-ds1672.c
> @@ -133,7 +133,7 @@ static int ds1672_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id ds1672_id[] =3D {
> -       { "ds1672" },
> +       { .name =3D "ds1672" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, ds1672_id);
> diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
> index 18f35823b4b5..d1ef9e0dad34 100644
> --- a/drivers/rtc/rtc-ds3232.c
> +++ b/drivers/rtc/rtc-ds3232.c
> @@ -566,7 +566,7 @@ static int ds3232_i2c_probe(struct i2c_client *client=
)
>  }
>
>  static const struct i2c_device_id ds3232_id[] =3D {
> -       { "ds3232" },
> +       { .name =3D "ds3232" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, ds3232_id);
> diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
> index dc1ccbc65dcb..d555e5d59881 100644
> --- a/drivers/rtc/rtc-em3027.c
> +++ b/drivers/rtc/rtc-em3027.c
> @@ -129,7 +129,7 @@ static int em3027_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id em3027_id[] =3D {
> -       { "em3027" },
> +       { .name =3D "em3027" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, em3027_id);
> diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c
> index f82728ebac0c..28bb6d3f644e 100644
> --- a/drivers/rtc/rtc-fm3130.c
> +++ b/drivers/rtc/rtc-fm3130.c
> @@ -53,7 +53,7 @@ struct fm3130 {
>         int                     data_valid;
>  };
>  static const struct i2c_device_id fm3130_id[] =3D {
> -       { "fm3130" },
> +       { .name =3D "fm3130" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, fm3130_id);
> diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
> index 7a170c0f9710..3156aa5f2d9f 100644
> --- a/drivers/rtc/rtc-hym8563.c
> +++ b/drivers/rtc/rtc-hym8563.c
> @@ -564,8 +564,8 @@ static int hym8563_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id hym8563_id[] =3D {
> -       { "hym8563" },
> -       {}
> +       { .name =3D "hym8563" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(i2c, hym8563_id);
>
> diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
> index 5fc52dc64213..bc36288854ee 100644
> --- a/drivers/rtc/rtc-isl12022.c
> +++ b/drivers/rtc/rtc-isl12022.c
> @@ -604,7 +604,7 @@ static const struct of_device_id isl12022_dt_match[] =
=3D
> {
>  MODULE_DEVICE_TABLE(of, isl12022_dt_match);
>
>  static const struct i2c_device_id isl12022_id[] =3D {
> -       { "isl12022" },
> +       { .name =3D "isl12022" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, isl12022_id);
> diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
> index 45a2c9f676c5..b86a325d8a23 100644
> --- a/drivers/rtc/rtc-isl12026.c
> +++ b/drivers/rtc/rtc-isl12026.c
> @@ -485,8 +485,8 @@ static const struct of_device_id isl12026_dt_match[] =
=3D
> {
>  MODULE_DEVICE_TABLE(of, isl12026_dt_match);
>
>  static const struct i2c_device_id isl12026_id[] =3D {
> -       { "isl12026" },
> -       { },
> +       { .name =3D "isl12026" },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(i2c, isl12026_id);
>
> diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
> index f71a6bb77b2a..bcaa766a5068 100644
> --- a/drivers/rtc/rtc-isl1208.c
> +++ b/drivers/rtc/rtc-isl1208.c
> @@ -110,11 +110,11 @@ static const struct isl1208_config
> config_raa215300_a0 =3D {
>  };
>
>  static const struct i2c_device_id isl1208_id[] =3D {
> -       { "isl1208", .driver_data =3D (kernel_ulong_t)&config_isl1208 },
> -       { "isl1209", .driver_data =3D (kernel_ulong_t)&config_isl1209 },
> -       { "isl1218", .driver_data =3D (kernel_ulong_t)&config_isl1218 },
> -       { "isl1219", .driver_data =3D (kernel_ulong_t)&config_isl1219 },
> -       { "raa215300_a0", .driver_data =3D
> (kernel_ulong_t)&config_raa215300_a0 },
> +       { .name =3D "isl1208", .driver_data =3D
> (kernel_ulong_t)&config_isl1208 },
> +       { .name =3D "isl1209", .driver_data =3D
> (kernel_ulong_t)&config_isl1209 },
> +       { .name =3D "isl1218", .driver_data =3D
> (kernel_ulong_t)&config_isl1218 },
> +       { .name =3D "isl1219", .driver_data =3D
> (kernel_ulong_t)&config_isl1219 },
> +       { .name =3D "raa215300_a0", .driver_data =3D
> (kernel_ulong_t)&config_raa215300_a0 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, isl1208_id);
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index b26afef37d9c..3c8c379392c1 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -71,17 +71,17 @@
>  #define M41T80_FEATURE_SQ_ALT  BIT(4)  /* RSx bits are in reg 4 */
>
>  static const struct i2c_device_id m41t80_id[] =3D {
> -       { "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
> -       { "m41t65", M41T80_FEATURE_WD },
> -       { "m41t80", M41T80_FEATURE_SQ },
> -       { "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
> -       { "m41t81s", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ },
> -       { "m41t82", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ },
> -       { "m41t83", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ },
> -       { "m41st84", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ },
> -       { "m41st85", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ },
> -       { "m41st87", M41T80_FEATURE_HT | M41T80_FEATURE_BL |
> M41T80_FEATURE_SQ },
> -       { "rv4162", M41T80_FEATURE_SQ | M41T80_FEATURE_WD |
> M41T80_FEATURE_SQ_ALT },
> +       { .name =3D "m41t62", .driver_data =3D M41T80_FEATURE_SQ |
> M41T80_FEATURE_SQ_ALT },
> +       { .name =3D "m41t65", .driver_data =3D M41T80_FEATURE_WD },
> +       { .name =3D "m41t80", .driver_data =3D M41T80_FEATURE_SQ },
> +       { .name =3D "m41t81", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_SQ},
> +       { .name =3D "m41t81s", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> +       { .name =3D "m41t82", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> +       { .name =3D "m41t83", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> +       { .name =3D "m41st84", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> +       { .name =3D "m41st85", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> +       { .name =3D "m41st87", .driver_data =3D M41T80_FEATURE_HT |
> M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
> +       { .name =3D "rv4162", .driver_data =3D M41T80_FEATURE_SQ |
> M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, m41t80_id);
> diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
> index 952b455071d6..595816973851 100644
> --- a/drivers/rtc/rtc-max31335.c
> +++ b/drivers/rtc/rtc-max31335.c
> @@ -745,8 +745,8 @@ static int max31335_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id max31335_id[] =3D {
> -       { "max31331", (kernel_ulong_t)&chip[ID_MAX31331] },
> -       { "max31335", (kernel_ulong_t)&chip[ID_MAX31335] },
> +       { .name =3D "max31331", .driver_data =3D
> (kernel_ulong_t)&chip[ID_MAX31331] },
> +       { .name =3D "max31335", .driver_data =3D
> (kernel_ulong_t)&chip[ID_MAX31335] },
>         { }
>  };
>
> diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c
> index 7be31fce5bc7..8ef6d0fcd032 100644
> --- a/drivers/rtc/rtc-max6900.c
> +++ b/drivers/rtc/rtc-max6900.c
> @@ -215,7 +215,7 @@ static int max6900_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id max6900_id[] =3D {
> -       { "max6900" },
> +       { .name =3D "max6900" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, max6900_id);
> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
> index cd4b1db902e9..700a395fad3a 100644
> --- a/drivers/rtc/rtc-nct3018y.c
> +++ b/drivers/rtc/rtc-nct3018y.c
> @@ -572,7 +572,7 @@ static int nct3018y_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id nct3018y_id[] =3D {
> -       { "nct3018y" },
> +       { .name =3D "nct3018y" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, nct3018y_id);
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index e4785c5a55d0..1995e9f2756d 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1449,10 +1449,10 @@ static const struct regmap_bus pcf2127_i2c_regmap
> =3D {
>  static struct i2c_driver pcf2127_i2c_driver;
>
>  static const struct i2c_device_id pcf2127_i2c_id[] =3D {
> -       { "pcf2127", (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
> -       { "pcf2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> -       { "pca2129", (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> -       { "pcf2131", (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
> +       { .name =3D "pcf2127", .driver_data =3D
> (kernel_ulong_t)&pcf21xx_cfg[PCF2127] },
> +       { .name =3D "pcf2129", .driver_data =3D
> (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> +       { .name =3D "pca2129", .driver_data =3D
> (kernel_ulong_t)&pcf21xx_cfg[PCF2129] },
> +       { .name =3D "pcf2131", .driver_data =3D
> (kernel_ulong_t)&pcf21xx_cfg[PCF2131] },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);
> diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
> index f643e0bd7351..01e209d88f5f 100644
> --- a/drivers/rtc/rtc-pcf85063.c
> +++ b/drivers/rtc/rtc-pcf85063.c
> @@ -665,12 +665,12 @@ static const struct pcf85063_config config_rv8263 =
=3D {
>  };
>
>  static const struct i2c_device_id pcf85063_ids[] =3D {
> -       { "pca85073a", .driver_data =3D (kernel_ulong_t)&config_pcf85063a=
 },
> -       { "pcf85063", .driver_data =3D (kernel_ulong_t)&config_pcf85063 }=
,
> -       { "pcf85063tp", .driver_data =3D (kernel_ulong_t)&config_pcf85063=
tp
> },
> -       { "pcf85063a", .driver_data =3D (kernel_ulong_t)&config_pcf85063a=
 },
> -       { "rv8263", .driver_data =3D (kernel_ulong_t)&config_rv8263 },
> -       {}
> +       { .name =3D "pca85073a", .driver_data =3D
> (kernel_ulong_t)&config_pcf85063a },
> +       { .name =3D "pcf85063", .driver_data =3D
> (kernel_ulong_t)&config_pcf85063 },
> +       { .name =3D "pcf85063tp", .driver_data =3D
> (kernel_ulong_t)&config_pcf85063tp },
> +       { .name =3D "pcf85063a", .driver_data =3D
> (kernel_ulong_t)&config_pcf85063a },
> +       { .name =3D "rv8263", .driver_data =3D (kernel_ulong_t)&config_rv=
8263
> },
> +       { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf85063_ids);
>
> diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
> index 2c63c0ffd05a..e8354953836c 100644
> --- a/drivers/rtc/rtc-pcf8523.c
> +++ b/drivers/rtc/rtc-pcf8523.c
> @@ -495,7 +495,7 @@ static int pcf8523_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id pcf8523_id[] =3D {
> -       { "pcf8523" },
> +       { .name =3D "pcf8523" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf8523_id);
> diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
> index b281e9489df1..81d13733b1e9 100644
> --- a/drivers/rtc/rtc-pcf8563.c
> +++ b/drivers/rtc/rtc-pcf8563.c
> @@ -557,9 +557,9 @@ static int pcf8563_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id pcf8563_id[] =3D {
> -       { "pcf8563" },
> -       { "rtc8564" },
> -       { "pca8565" },
> +       { .name =3D "pcf8563" },
> +       { .name =3D "rtc8564" },
> +       { .name =3D "pca8565" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf8563_id);
> diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c
> index 652b9dfa7566..df5e20cbc26c 100644
> --- a/drivers/rtc/rtc-pcf8583.c
> +++ b/drivers/rtc/rtc-pcf8583.c
> @@ -297,7 +297,7 @@ static int pcf8583_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id pcf8583_id[] =3D {
> -       { "pcf8583" },
> +       { .name =3D "pcf8583" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, pcf8583_id);
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index 936f4f05c8c7..24bd795d9d95 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -75,12 +75,12 @@ enum rtc_type {
>  };
>
>  static const struct i2c_device_id rs5c372_id[] =3D {
> -       { "r2025sd", rtc_r2025sd },
> -       { "r2221tl", rtc_r2221tl },
> -       { "rs5c372a", rtc_rs5c372a },
> -       { "rs5c372b", rtc_rs5c372b },
> -       { "rv5c386", rtc_rv5c386 },
> -       { "rv5c387a", rtc_rv5c387a },
> +       { .name =3D "r2025sd", .driver_data =3D rtc_r2025sd },
> +       { .name =3D "r2221tl", .driver_data =3D rtc_r2221tl },
> +       { .name =3D "rs5c372a", .driver_data =3D rtc_rs5c372a },
> +       { .name =3D "rs5c372b", .driver_data =3D rtc_rs5c372b },
> +       { .name =3D "rv5c386", .driver_data =3D rtc_rv5c386 },
> +       { .name =3D "rv5c387a", .driver_data =3D rtc_rv5c387a },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rs5c372_id);
> diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
> index 83331d1fcab0..98953af2a24a 100644
> --- a/drivers/rtc/rtc-rv3029c2.c
> +++ b/drivers/rtc/rtc-rv3029c2.c
> @@ -807,8 +807,8 @@ static int rv3029_i2c_probe(struct i2c_client *client=
)
>  }
>
>  static const struct i2c_device_id rv3029_id[] =3D {
> -       { "rv3029" },
> -       { "rv3029c2" },
> +       { .name =3D "rv3029" },
> +       { .name =3D "rv3029c2" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rv3029_id);
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 2bf988a89fd7..b9b5fee16ee4 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -631,10 +631,10 @@ static int rv8803_suspend(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(rv8803_pm_ops, rv8803_suspend,
> rv8803_resume);
>
>  static const struct i2c_device_id rv8803_id[] =3D {
> -       { "rv8803", rv_8803 },
> -       { "rv8804", rx_8804 },
> -       { "rx8803", rx_8803 },
> -       { "rx8900", rx_8900 },
> +       { .name =3D "rv8803", .driver_data =3D rv_8803 },
> +       { .name =3D "rv8804", .driver_data =3D rx_8804 },
> +       { .name =3D "rx8803", .driver_data =3D rx_8803 },
> +       { .name =3D "rx8900", .driver_data =3D rx_8900 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rv8803_id);
> diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c
> index 07bf35ac8d79..1eacd470a27c 100644
> --- a/drivers/rtc/rtc-rx6110.c
> +++ b/drivers/rtc/rtc-rx6110.c
> @@ -449,7 +449,7 @@ static const struct acpi_device_id
> rx6110_i2c_acpi_match[] =3D {
>  MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);
>
>  static const struct i2c_device_id rx6110_i2c_id[] =3D {
> -       { "rx6110" },
> +       { .name =3D "rx6110" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);
> diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
> index 171240e50f48..ce3954132336 100644
> --- a/drivers/rtc/rtc-rx8010.c
> +++ b/drivers/rtc/rtc-rx8010.c
> @@ -50,7 +50,7 @@
>  #define RX8010_ALARM_AE                BIT(7)
>
>  static const struct i2c_device_id rx8010_id[] =3D {
> -       { "rx8010" },
> +       { .name =3D "rx8010" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rx8010_id);
> diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
> index c57081f9e02b..5eeaa929f3ef 100644
> --- a/drivers/rtc/rtc-rx8025.c
> +++ b/drivers/rtc/rtc-rx8025.c
> @@ -71,8 +71,8 @@ enum rx_model {
>  };
>
>  static const struct i2c_device_id rx8025_id[] =3D {
> -       { "rx8025", model_rx_8025 },
> -       { "rx8035", model_rx_8035 },
> +       { .name =3D "rx8025", .driver_data =3D model_rx_8025 },
> +       { .name =3D "rx8035", .driver_data =3D model_rx_8035 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rx8025_id);
> diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c
> index 20c2dff01bae..cf4dab94c337 100644
> --- a/drivers/rtc/rtc-rx8581.c
> +++ b/drivers/rtc/rtc-rx8581.c
> @@ -294,7 +294,7 @@ static int rx8581_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id rx8581_id[] =3D {
> -       { "rx8581" },
> +       { .name =3D "rx8581" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, rx8581_id);
> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> index a4678d7c6cf6..31394f34fb70 100644
> --- a/drivers/rtc/rtc-s35390a.c
> +++ b/drivers/rtc/rtc-s35390a.c
> @@ -51,7 +51,7 @@
>  #define S35390A_INT2_MODE_PMIN         (BIT(3) | BIT(2)) /* INT2FE |
> INT2ME */
>
>  static const struct i2c_device_id s35390a_id[] =3D {
> -       { "s35390a" },
> +       { .name =3D "s35390a" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, s35390a_id);
> diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c
> index 708ea5d964de..7982a910a537 100644
> --- a/drivers/rtc/rtc-sd2405al.c
> +++ b/drivers/rtc/rtc-sd2405al.c
> @@ -202,7 +202,7 @@ static int sd2405al_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id sd2405al_id[] =3D {
> -       { "sd2405al" },
> +       { .name =3D "sd2405al" },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, sd2405al_id);
> diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
> index 10cc1dcfc774..2c61f0e204a4 100644
> --- a/drivers/rtc/rtc-sd3078.c
> +++ b/drivers/rtc/rtc-sd3078.c
> @@ -186,7 +186,7 @@ static int sd3078_probe(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id sd3078_id[] =3D {
> -       { "sd3078" },
> +       { .name =3D "sd3078" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, sd3078_id);
> diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
> index b8a0fccef14e..bb1a5c86f621 100644
> --- a/drivers/rtc/rtc-x1205.c
> +++ b/drivers/rtc/rtc-x1205.c
> @@ -663,7 +663,7 @@ static void x1205_remove(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id x1205_id[] =3D {
> -       { "x1205" },
> +       { .name =3D "x1205" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, x1205_id);
>
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> --
> 2.47.3
>
>

--00000000000060a89b0651f68aa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: T=C3=B3th J=C3=A1nos &lt;<a href=3D"mailto:go=
mba007@gmail.com">gomba007@gmail.com</a>&gt;</div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Uwe Klein=
e-K=C3=B6nig (The Capable Hub) &lt;<a href=3D"mailto:u.kleine-koenig@baylib=
re.com">u.kleine-koenig@baylibre.com</a>&gt; ezt =C3=ADrta (id=C5=91pont: 2=
026. m=C3=A1j. 15., P, 17:47):<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">While being less compact, using named initializers allows to=
 more easily<br>
see which members of the structs are assigned which value without having<br=
>
to lookup the declaration of the struct. And it&#39;s also more robust<br>
against changes to the struct definition.<br>
<br>
The mentioned robustness is relevant for a planned change to struct<br>
i2c_device_id that replaces .driver_data by an anonymous union.<br>
<br>
While touching all these arrays, unify usage of whitespace and commas.<br>
<br>
This patch doesn&#39;t modify the compiled arrays, only their representatio=
n<br>
in source form benefits. The former was confirmed with x86 and arm64<br>
builds.<br>
<br>
Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) &lt;<a href=3D"mailt=
o:u.kleine-koenig@baylibre.com" target=3D"_blank">u.kleine-koenig@baylibre.=
com</a>&gt;<br>
---<br>
Hello,<br>
<br>
the mentioned change to i2c_device_id is the following:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/include/linux/mod_devicetable.h b/=
include/linux/mod_devicetable.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 23ff24080dfd..aebd3a5e90af 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/include/linux/mod_devicetable.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/include/linux/mod_devicetable.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -477,7 +477,11 @@ struct rpmsg_device_id {<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_device_id {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char name[I2C_NAME_=
SIZE];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_ulong_t driv=
er_data;=C2=A0 =C2=A0 =C2=A0/* Data private to the driver */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0union {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Data private to the driver */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kernel_ulong_t driver_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const void *driver_data_ptr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* pci_epf */<br>
<br>
and this requires that .driver_data is assigned via a named initializer<br>
for static data. This requirement isn&#39;t a bad one because named<br>
initializers are also much better readable than list initializers.<br>
<br>
The union added to struct i2c_device_id enables further cleanups like:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git a/drivers/regulator/ad5398.c b/drive=
rs/regulator/ad5398.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 0123ca8157a8..dfb0b07500a7 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- a/drivers/regulator/ad5398.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ b/drivers/regulator/ad5398.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -207,8 +207,8 @@ struct ad5398_current_data_=
format {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const struct ad5398_current_data_f=
ormat df_10_4_120 =3D {10, 4, 0, 120000};<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static const struct i2c_device_id ad5398_=
id[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;a=
d5398&quot;, .driver_data =3D (kernel_ulong_t)&amp;df_10_4_120 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;a=
d5821&quot;, .driver_data =3D (kernel_ulong_t)&amp;df_10_4_120 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;a=
d5398&quot;, .driver_data_ptr =3D &amp;df_10_4_120 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;a=
d5821&quot;, .driver_data_ptr =3D &amp;df_10_4_120 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MODULE_DEVICE_TABLE(i2c, ad5398_id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -219,8 +219,7 @@ static int ad5398_probe(str=
uct i2c_client *client)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct regulator_in=
it_data *init_data =3D dev_get_platdata(&amp;client-&gt;dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct regulator_co=
nfig config =3D { };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ad5398_chip_=
info *chip;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct ad5398=
_current_data_format *df =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct ad5398_current_data_format *)=
id-&gt;driver_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct ad5398=
_current_data_format *df =3D id-&gt;driver_data;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chip =3D devm_kzall=
oc(&amp;client-&gt;dev, sizeof(*chip), GFP_KERNEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!chip)<br>
<br>
that are an improvement for readability (again!) and it keeps some<br>
properties of the pointers (here: being const) without having to pay<br>
attention for that. (I didn&#39;t find a nice rtc driver that benefits, so<=
br>
this is &quot;only&quot; a regulator driver example.)<br>
<br>
My additional motivation for this effort is CHERI[1]. This is a hardware<br=
>
extension that uses 128 bit pointers but unsigned long is still 64 bit.<br>
So with CHERI you cannot store pointers in unsigned long variables.<br>
<br>
Best regards<br>
Uwe<br>
<br>
[1] <a href=3D"https://cheri-alliance.org/discover-cheri/" rel=3D"noreferre=
r" target=3D"_blank">https://cheri-alliance.org/discover-cheri/</a><br>
=C2=A0 =C2=A0 <a href=3D"https://lwn.net/Articles/1037974/" rel=3D"noreferr=
er" target=3D"_blank">https://lwn.net/Articles/1037974/</a><br>
<br>
=C2=A0drivers/rtc/rtc-ab-b5ze-s3.c |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-ab-eoz9.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-abx80x.c=C2=A0 =C2=A0 =C2=A0| 20 ++++++++++----------=
<br>
=C2=A0drivers/rtc/rtc-bq32k.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-ds1307.c=C2=A0 =C2=A0 =C2=A0| 36 ++++++++++++++++++--=
----------------<br>
=C2=A0drivers/rtc/rtc-ds1374.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-ds1672.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-ds3232.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-em3027.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-fm3130.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-hym8563.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0drivers/rtc/rtc-isl12022.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-isl12026.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0drivers/rtc/rtc-isl1208.c=C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0drivers/rtc/rtc-m41t80.c=C2=A0 =C2=A0 =C2=A0| 22 +++++++++++---------=
--<br>
=C2=A0drivers/rtc/rtc-max31335.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0drivers/rtc/rtc-max6900.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-nct3018y.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-pcf2127.c=C2=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0drivers/rtc/rtc-pcf85063.c=C2=A0 =C2=A0| 12 ++++++------<br>
=C2=A0drivers/rtc/rtc-pcf8523.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-pcf8563.c=C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0drivers/rtc/rtc-pcf8583.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-rs5c372.c=C2=A0 =C2=A0 | 12 ++++++------<br>
=C2=A0drivers/rtc/rtc-rv3029c2.c=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0drivers/rtc/rtc-rv8803.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0drivers/rtc/rtc-rx6110.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-rx8010.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-rx8025.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0drivers/rtc/rtc-rx8581.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-s35390a.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-sd2405al.c=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-sd3078.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0drivers/rtc/rtc-x1205.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A034 files changed, 97 insertions(+), 97 deletions(-)<br>
<br>
diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c<br=
>
index 684f9898d768..6439ca427c32 100644<br>
--- a/drivers/rtc/rtc-ab-b5ze-s3.c<br>
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c<br>
@@ -933,7 +933,7 @@ MODULE_DEVICE_TABLE(of, abb5zes3_dt_match);<br>
=C2=A0#endif<br>
<br>
=C2=A0static const struct i2c_device_id abb5zes3_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;abb5zes3&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;abb5zes3&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, abb5zes3_id);<br>
diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c<br>
index de002f7a39bf..b75f4f665076 100644<br>
--- a/drivers/rtc/rtc-ab-eoz9.c<br>
+++ b/drivers/rtc/rtc-ab-eoz9.c<br>
@@ -546,7 +546,7 @@ MODULE_DEVICE_TABLE(of, abeoz9_dt_match);<br>
=C2=A0#endif<br>
<br>
=C2=A0static const struct i2c_device_id abeoz9_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;abeoz9&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;abeoz9&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
<br>
diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c<br>
index 00d7de64ed3e..e5179d0208d6 100644<br>
--- a/drivers/rtc/rtc-abx80x.c<br>
+++ b/drivers/rtc/rtc-abx80x.c<br>
@@ -752,16 +752,16 @@ static int abx80x_setup_nvmem(struct abx80x_priv *pri=
v)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id abx80x_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;abx80x&quot;, ABX80X },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab0801&quot;, AB0801 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab0803&quot;, AB0803 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab0804&quot;, AB0804 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab0805&quot;, AB0805 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab1801&quot;, AB1801 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab1803&quot;, AB1803 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab1804&quot;, AB1804 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ab1805&quot;, AB1805 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv1805&quot;, RV1805 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;abx80x&quot;, .driver_data =
=3D ABX80X },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab0801&quot;, .driver_data =
=3D AB0801 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab0803&quot;, .driver_data =
=3D AB0803 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab0804&quot;, .driver_data =
=3D AB0804 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab0805&quot;, .driver_data =
=3D AB0805 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab1801&quot;, .driver_data =
=3D AB1801 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab1803&quot;, .driver_data =
=3D AB1803 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab1804&quot;, .driver_data =
=3D AB1804 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ab1805&quot;, .driver_data =
=3D AB1805 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv1805&quot;, .driver_data =
=3D RV1805 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, abx80x_id);<br>
diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c<br>
index 7ad34539be4d..20cd92d00fa1 100644<br>
--- a/drivers/rtc/rtc-bq32k.c<br>
+++ b/drivers/rtc/rtc-bq32k.c<br>
@@ -304,7 +304,7 @@ static void bq32k_remove(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id bq32k_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;bq32000&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;bq32000&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, bq32k_id);<br>
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c<br>
index 7205c59ff729..ee8196498443 100644<br>
--- a/drivers/rtc/rtc-ds1307.c<br>
+++ b/drivers/rtc/rtc-ds1307.c<br>
@@ -1063,24 +1063,24 @@ static const struct chip_desc chips[last_ds_type] =
=3D {<br>
=C2=A0};<br>
<br>
=C2=A0static const struct i2c_device_id ds1307_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1307&quot;, ds_1307 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1308&quot;, ds_1308 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1337&quot;, ds_1337 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1338&quot;, ds_1338 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1339&quot;, ds_1339 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1388&quot;, ds_1388 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1340&quot;, ds_1340 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1341&quot;, ds_1341 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds3231&quot;, ds_3231 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t0&quot;, m41t0 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t00&quot;, m41t00 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t11&quot;, m41t11 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;mcp7940x&quot;, mcp794xx },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;mcp7941x&quot;, mcp794xx },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pt7c4338&quot;, ds_1307 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8025&quot;, rx_8025 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl12057&quot;, ds_1337 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8130&quot;, rx_8130 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1307&quot;, .driver_data =
=3D ds_1307 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1308&quot;, .driver_data =
=3D ds_1308 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1337&quot;, .driver_data =
=3D ds_1337 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1338&quot;, .driver_data =
=3D ds_1338 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1339&quot;, .driver_data =
=3D ds_1339 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1388&quot;, .driver_data =
=3D ds_1388 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1340&quot;, .driver_data =
=3D ds_1340 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1341&quot;, .driver_data =
=3D ds_1341 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds3231&quot;, .driver_data =
=3D ds_3231 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t0&quot;, .driver_data =3D=
 m41t0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t00&quot;, .driver_data =
=3D m41t00 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t11&quot;, .driver_data =
=3D m41t11 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;mcp7940x&quot;, .driver_data =
=3D mcp794xx },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;mcp7941x&quot;, .driver_data =
=3D mcp794xx },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pt7c4338&quot;, .driver_data =
=3D ds_1307 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8025&quot;, .driver_data =
=3D rx_8025 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl12057&quot;, .driver_data =
=3D ds_1337 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8130&quot;, .driver_data =
=3D rx_8130 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, ds1307_id);<br>
diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c<br>
index c2359eb86bc9..8c247215d611 100644<br>
--- a/drivers/rtc/rtc-ds1374.c<br>
+++ b/drivers/rtc/rtc-ds1374.c<br>
@@ -52,7 +52,7 @@<br>
=C2=A0#define DS1374_REG_TCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x09 /* Trick=
le Charge */<br>
<br>
=C2=A0static const struct i2c_device_id ds1374_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1374&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1374&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, ds1374_id);<br>
diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c<br>
index 6e5314215d00..c610beb55bb5 100644<br>
--- a/drivers/rtc/rtc-ds1672.c<br>
+++ b/drivers/rtc/rtc-ds1672.c<br>
@@ -133,7 +133,7 @@ static int ds1672_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id ds1672_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds1672&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds1672&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, ds1672_id);<br>
diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c<br>
index 18f35823b4b5..d1ef9e0dad34 100644<br>
--- a/drivers/rtc/rtc-ds3232.c<br>
+++ b/drivers/rtc/rtc-ds3232.c<br>
@@ -566,7 +566,7 @@ static int ds3232_i2c_probe(struct i2c_client *client)<=
br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id ds3232_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;ds3232&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;ds3232&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, ds3232_id);<br>
diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c<br>
index dc1ccbc65dcb..d555e5d59881 100644<br>
--- a/drivers/rtc/rtc-em3027.c<br>
+++ b/drivers/rtc/rtc-em3027.c<br>
@@ -129,7 +129,7 @@ static int em3027_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id em3027_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;em3027&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;em3027&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, em3027_id);<br>
diff --git a/drivers/rtc/rtc-fm3130.c b/drivers/rtc/rtc-fm3130.c<br>
index f82728ebac0c..28bb6d3f644e 100644<br>
--- a/drivers/rtc/rtc-fm3130.c<br>
+++ b/drivers/rtc/rtc-fm3130.c<br>
@@ -53,7 +53,7 @@ struct fm3130 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data_valid;<br>
=C2=A0};<br>
=C2=A0static const struct i2c_device_id fm3130_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;fm3130&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;fm3130&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, fm3130_id);<br>
diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c<br>
index 7a170c0f9710..3156aa5f2d9f 100644<br>
--- a/drivers/rtc/rtc-hym8563.c<br>
+++ b/drivers/rtc/rtc-hym8563.c<br>
@@ -564,8 +564,8 @@ static int hym8563_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id hym8563_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;hym8563&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;hym8563&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, hym8563_id);<br>
<br>
diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c<br>
index 5fc52dc64213..bc36288854ee 100644<br>
--- a/drivers/rtc/rtc-isl12022.c<br>
+++ b/drivers/rtc/rtc-isl12022.c<br>
@@ -604,7 +604,7 @@ static const struct of_device_id isl12022_dt_match[] =
=3D {<br>
=C2=A0MODULE_DEVICE_TABLE(of, isl12022_dt_match);<br>
<br>
=C2=A0static const struct i2c_device_id isl12022_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl12022&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl12022&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, isl12022_id);<br>
diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c<br>
index 45a2c9f676c5..b86a325d8a23 100644<br>
--- a/drivers/rtc/rtc-isl12026.c<br>
+++ b/drivers/rtc/rtc-isl12026.c<br>
@@ -485,8 +485,8 @@ static const struct of_device_id isl12026_dt_match[] =
=3D {<br>
=C2=A0MODULE_DEVICE_TABLE(of, isl12026_dt_match);<br>
<br>
=C2=A0static const struct i2c_device_id isl12026_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl12026&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl12026&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, isl12026_id);<br>
<br>
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c<br>
index f71a6bb77b2a..bcaa766a5068 100644<br>
--- a/drivers/rtc/rtc-isl1208.c<br>
+++ b/drivers/rtc/rtc-isl1208.c<br>
@@ -110,11 +110,11 @@ static const struct isl1208_config config_raa215300_a=
0 =3D {<br>
=C2=A0};<br>
<br>
=C2=A0static const struct i2c_device_id isl1208_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl1208&quot;, .driver_data =3D (kernel=
_ulong_t)&amp;config_isl1208 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl1209&quot;, .driver_data =3D (kernel=
_ulong_t)&amp;config_isl1209 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl1218&quot;, .driver_data =3D (kernel=
_ulong_t)&amp;config_isl1218 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;isl1219&quot;, .driver_data =3D (kernel=
_ulong_t)&amp;config_isl1219 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;raa215300_a0&quot;, .driver_data =3D (k=
ernel_ulong_t)&amp;config_raa215300_a0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl1208&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;config_isl1208 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl1209&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;config_isl1209 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl1218&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;config_isl1218 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;isl1219&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;config_isl1219 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;raa215300_a0&quot;, .driver_d=
ata =3D (kernel_ulong_t)&amp;config_raa215300_a0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, isl1208_id);<br>
diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c<br>
index b26afef37d9c..3c8c379392c1 100644<br>
--- a/drivers/rtc/rtc-m41t80.c<br>
+++ b/drivers/rtc/rtc-m41t80.c<br>
@@ -71,17 +71,17 @@<br>
=C2=A0#define M41T80_FEATURE_SQ_ALT=C2=A0 BIT(4)=C2=A0 /* RSx bits are in r=
eg 4 */<br>
<br>
=C2=A0static const struct i2c_device_id m41t80_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t62&quot;, M41T80_FEATURE_SQ | M41T8=
0_FEATURE_SQ_ALT },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t65&quot;, M41T80_FEATURE_WD },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t80&quot;, M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t81&quot;, M41T80_FEATURE_HT | M41T8=
0_FEATURE_SQ},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t81s&quot;, M41T80_FEATURE_HT | M41T=
80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t82&quot;, M41T80_FEATURE_HT | M41T8=
0_FEATURE_BL | M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41t83&quot;, M41T80_FEATURE_HT | M41T8=
0_FEATURE_BL | M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41st84&quot;, M41T80_FEATURE_HT | M41T=
80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41st85&quot;, M41T80_FEATURE_HT | M41T=
80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;m41st87&quot;, M41T80_FEATURE_HT | M41T=
80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv4162&quot;, M41T80_FEATURE_SQ | M41T8=
0_FEATURE_WD | M41T80_FEATURE_SQ_ALT },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t62&quot;, .driver_data =
=3D M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t65&quot;, .driver_data =
=3D M41T80_FEATURE_WD },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t80&quot;, .driver_data =
=3D M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t81&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_SQ},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t81s&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t82&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41t83&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41st84&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41st85&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;m41st87&quot;, .driver_data =
=3D M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv4162&quot;, .driver_data =
=3D M41T80_FEATURE_SQ | M41T80_FEATURE_WD | M41T80_FEATURE_SQ_ALT },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, m41t80_id);<br>
diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c<br>
index 952b455071d6..595816973851 100644<br>
--- a/drivers/rtc/rtc-max31335.c<br>
+++ b/drivers/rtc/rtc-max31335.c<br>
@@ -745,8 +745,8 @@ static int max31335_probe(struct i2c_client *client)<br=
>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id max31335_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;max31331&quot;, (kernel_ulong_t)&amp;ch=
ip[ID_MAX31331] },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;max31335&quot;, (kernel_ulong_t)&amp;ch=
ip[ID_MAX31335] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;max31331&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;chip[ID_MAX31331] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;max31335&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;chip[ID_MAX31335] },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
<br>
diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c<br>
index 7be31fce5bc7..8ef6d0fcd032 100644<br>
--- a/drivers/rtc/rtc-max6900.c<br>
+++ b/drivers/rtc/rtc-max6900.c<br>
@@ -215,7 +215,7 @@ static int max6900_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id max6900_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;max6900&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;max6900&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, max6900_id);<br>
diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c<br>
index cd4b1db902e9..700a395fad3a 100644<br>
--- a/drivers/rtc/rtc-nct3018y.c<br>
+++ b/drivers/rtc/rtc-nct3018y.c<br>
@@ -572,7 +572,7 @@ static int nct3018y_probe(struct i2c_client *client)<br=
>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id nct3018y_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;nct3018y&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;nct3018y&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, nct3018y_id);<br>
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c<br>
index e4785c5a55d0..1995e9f2756d 100644<br>
--- a/drivers/rtc/rtc-pcf2127.c<br>
+++ b/drivers/rtc/rtc-pcf2127.c<br>
@@ -1449,10 +1449,10 @@ static const struct regmap_bus pcf2127_i2c_regmap =
=3D {<br>
=C2=A0static struct i2c_driver pcf2127_i2c_driver;<br>
<br>
=C2=A0static const struct i2c_device_id pcf2127_i2c_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf2127&quot;, (kernel_ulong_t)&amp;pcf=
21xx_cfg[PCF2127] },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf2129&quot;, (kernel_ulong_t)&amp;pcf=
21xx_cfg[PCF2129] },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pca2129&quot;, (kernel_ulong_t)&amp;pcf=
21xx_cfg[PCF2129] },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf2131&quot;, (kernel_ulong_t)&amp;pcf=
21xx_cfg[PCF2131] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf2127&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;pcf21xx_cfg[PCF2127] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf2129&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;pcf21xx_cfg[PCF2129] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pca2129&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;pcf21xx_cfg[PCF2129] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf2131&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;pcf21xx_cfg[PCF2131] },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, pcf2127_i2c_id);<br>
diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c<br>
index f643e0bd7351..01e209d88f5f 100644<br>
--- a/drivers/rtc/rtc-pcf85063.c<br>
+++ b/drivers/rtc/rtc-pcf85063.c<br>
@@ -665,12 +665,12 @@ static const struct pcf85063_config config_rv8263 =3D=
 {<br>
=C2=A0};<br>
<br>
=C2=A0static const struct i2c_device_id pcf85063_ids[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pca85073a&quot;, .driver_data =3D (kern=
el_ulong_t)&amp;config_pcf85063a },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf85063&quot;, .driver_data =3D (kerne=
l_ulong_t)&amp;config_pcf85063 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf85063tp&quot;, .driver_data =3D (ker=
nel_ulong_t)&amp;config_pcf85063tp },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf85063a&quot;, .driver_data =3D (kern=
el_ulong_t)&amp;config_pcf85063a },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv8263&quot;, .driver_data =3D (kernel_=
ulong_t)&amp;config_rv8263 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pca85073a&quot;, .driver_data=
 =3D (kernel_ulong_t)&amp;config_pcf85063a },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf85063&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;config_pcf85063 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf85063tp&quot;, .driver_dat=
a =3D (kernel_ulong_t)&amp;config_pcf85063tp },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf85063a&quot;, .driver_data=
 =3D (kernel_ulong_t)&amp;config_pcf85063a },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv8263&quot;, .driver_data =
=3D (kernel_ulong_t)&amp;config_rv8263 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, pcf85063_ids);<br>
<br>
diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c<br>
index 2c63c0ffd05a..e8354953836c 100644<br>
--- a/drivers/rtc/rtc-pcf8523.c<br>
+++ b/drivers/rtc/rtc-pcf8523.c<br>
@@ -495,7 +495,7 @@ static int pcf8523_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id pcf8523_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf8523&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf8523&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, pcf8523_id);<br>
diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c<br>
index b281e9489df1..81d13733b1e9 100644<br>
--- a/drivers/rtc/rtc-pcf8563.c<br>
+++ b/drivers/rtc/rtc-pcf8563.c<br>
@@ -557,9 +557,9 @@ static int pcf8563_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id pcf8563_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf8563&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rtc8564&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pca8565&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf8563&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rtc8564&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pca8565&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, pcf8563_id);<br>
diff --git a/drivers/rtc/rtc-pcf8583.c b/drivers/rtc/rtc-pcf8583.c<br>
index 652b9dfa7566..df5e20cbc26c 100644<br>
--- a/drivers/rtc/rtc-pcf8583.c<br>
+++ b/drivers/rtc/rtc-pcf8583.c<br>
@@ -297,7 +297,7 @@ static int pcf8583_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id pcf8583_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;pcf8583&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;pcf8583&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, pcf8583_id);<br>
diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c<br>
index 936f4f05c8c7..24bd795d9d95 100644<br>
--- a/drivers/rtc/rtc-rs5c372.c<br>
+++ b/drivers/rtc/rtc-rs5c372.c<br>
@@ -75,12 +75,12 @@ enum rtc_type {<br>
=C2=A0};<br>
<br>
=C2=A0static const struct i2c_device_id rs5c372_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r2025sd&quot;, rtc_r2025sd },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;r2221tl&quot;, rtc_r2221tl },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rs5c372a&quot;, rtc_rs5c372a },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rs5c372b&quot;, rtc_rs5c372b },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv5c386&quot;, rtc_rv5c386 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv5c387a&quot;, rtc_rv5c387a },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;r2025sd&quot;, .driver_data =
=3D rtc_r2025sd },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;r2221tl&quot;, .driver_data =
=3D rtc_r2221tl },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rs5c372a&quot;, .driver_data =
=3D rtc_rs5c372a },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rs5c372b&quot;, .driver_data =
=3D rtc_rs5c372b },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv5c386&quot;, .driver_data =
=3D rtc_rv5c386 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv5c387a&quot;, .driver_data =
=3D rtc_rv5c387a },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rs5c372_id);<br>
diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c<br>
index 83331d1fcab0..98953af2a24a 100644<br>
--- a/drivers/rtc/rtc-rv3029c2.c<br>
+++ b/drivers/rtc/rtc-rv3029c2.c<br>
@@ -807,8 +807,8 @@ static int rv3029_i2c_probe(struct i2c_client *client)<=
br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id rv3029_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv3029&quot; },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv3029c2&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv3029&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv3029c2&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rv3029_id);<br>
diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c<br>
index 2bf988a89fd7..b9b5fee16ee4 100644<br>
--- a/drivers/rtc/rtc-rv8803.c<br>
+++ b/drivers/rtc/rtc-rv8803.c<br>
@@ -631,10 +631,10 @@ static int rv8803_suspend(struct device *dev)<br>
=C2=A0static DEFINE_SIMPLE_DEV_PM_OPS(rv8803_pm_ops, rv8803_suspend, rv8803=
_resume);<br>
<br>
=C2=A0static const struct i2c_device_id rv8803_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv8803&quot;, rv_8803 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rv8804&quot;, rx_8804 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8803&quot;, rx_8803 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8900&quot;, rx_8900 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv8803&quot;, .driver_data =
=3D rv_8803 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rv8804&quot;, .driver_data =
=3D rx_8804 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8803&quot;, .driver_data =
=3D rx_8803 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8900&quot;, .driver_data =
=3D rx_8900 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rv8803_id);<br>
diff --git a/drivers/rtc/rtc-rx6110.c b/drivers/rtc/rtc-rx6110.c<br>
index 07bf35ac8d79..1eacd470a27c 100644<br>
--- a/drivers/rtc/rtc-rx6110.c<br>
+++ b/drivers/rtc/rtc-rx6110.c<br>
@@ -449,7 +449,7 @@ static const struct acpi_device_id rx6110_i2c_acpi_matc=
h[] =3D {<br>
=C2=A0MODULE_DEVICE_TABLE(acpi, rx6110_i2c_acpi_match);<br>
<br>
=C2=A0static const struct i2c_device_id rx6110_i2c_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx6110&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx6110&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rx6110_i2c_id);<br>
diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c<br>
index 171240e50f48..ce3954132336 100644<br>
--- a/drivers/rtc/rtc-rx8010.c<br>
+++ b/drivers/rtc/rtc-rx8010.c<br>
@@ -50,7 +50,7 @@<br>
=C2=A0#define RX8010_ALARM_AE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(7)<br>
<br>
=C2=A0static const struct i2c_device_id rx8010_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8010&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8010&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rx8010_id);<br>
diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c<br>
index c57081f9e02b..5eeaa929f3ef 100644<br>
--- a/drivers/rtc/rtc-rx8025.c<br>
+++ b/drivers/rtc/rtc-rx8025.c<br>
@@ -71,8 +71,8 @@ enum rx_model {<br>
=C2=A0};<br>
<br>
=C2=A0static const struct i2c_device_id rx8025_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8025&quot;, model_rx_8025 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8035&quot;, model_rx_8035 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8025&quot;, .driver_data =
=3D model_rx_8025 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8035&quot;, .driver_data =
=3D model_rx_8035 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rx8025_id);<br>
diff --git a/drivers/rtc/rtc-rx8581.c b/drivers/rtc/rtc-rx8581.c<br>
index 20c2dff01bae..cf4dab94c337 100644<br>
--- a/drivers/rtc/rtc-rx8581.c<br>
+++ b/drivers/rtc/rtc-rx8581.c<br>
@@ -294,7 +294,7 @@ static int rx8581_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id rx8581_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;rx8581&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;rx8581&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, rx8581_id);<br>
diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c<br>
index a4678d7c6cf6..31394f34fb70 100644<br>
--- a/drivers/rtc/rtc-s35390a.c<br>
+++ b/drivers/rtc/rtc-s35390a.c<br>
@@ -51,7 +51,7 @@<br>
=C2=A0#define S35390A_INT2_MODE_PMIN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(BIT(=
3) | BIT(2)) /* INT2FE | INT2ME */<br>
<br>
=C2=A0static const struct i2c_device_id s35390a_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;s35390a&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;s35390a&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, s35390a_id);<br>
diff --git a/drivers/rtc/rtc-sd2405al.c b/drivers/rtc/rtc-sd2405al.c<br>
index 708ea5d964de..7982a910a537 100644<br>
--- a/drivers/rtc/rtc-sd2405al.c<br>
+++ b/drivers/rtc/rtc-sd2405al.c<br>
@@ -202,7 +202,7 @@ static int sd2405al_probe(struct i2c_client *client)<br=
>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id sd2405al_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;sd2405al&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;sd2405al&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* sentinel */ }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, sd2405al_id);<br>
diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c<br>
index 10cc1dcfc774..2c61f0e204a4 100644<br>
--- a/drivers/rtc/rtc-sd3078.c<br>
+++ b/drivers/rtc/rtc-sd3078.c<br>
@@ -186,7 +186,7 @@ static int sd3078_probe(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id sd3078_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;sd3078&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;sd3078&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, sd3078_id);<br>
diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c<br>
index b8a0fccef14e..bb1a5c86f621 100644<br>
--- a/drivers/rtc/rtc-x1205.c<br>
+++ b/drivers/rtc/rtc-x1205.c<br>
@@ -663,7 +663,7 @@ static void x1205_remove(struct i2c_client *client)<br>
=C2=A0}<br>
<br>
=C2=A0static const struct i2c_device_id x1205_id[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &quot;x1205&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{ .name =3D &quot;x1205&quot; },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
=C2=A0};<br>
=C2=A0MODULE_DEVICE_TABLE(i2c, x1205_id);<br>
<br>
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731<br>
-- <br>
2.47.3<br>
<br>
</blockquote></div>

--00000000000060a89b0651f68aa1--

