Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="msYZfayS"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxqFS6l3YzDqBd;
 Wed, 20 Sep 2017 16:14:04 +1000 (AEST)
Received: by mail-lf0-x242.google.com with SMTP id q132so819556lfe.4;
 Tue, 19 Sep 2017 23:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gmsHScqLhMmUTnVg9k1tgfcQ0i5hvOXJ6NMV+zFkUP8=;
 b=msYZfaySRH2h4ZKMWrNjOoWY3cWTVIszC5iGst/KYcKqrEKIizXkPvpXLfLXx8Ks7s
 sEkqQ8ggo8p5mCbxRu9gnS8JcaU8XAVTEjlxC93XoN0flYv2vPszzb6M0RKVyDErgvq3
 hLQASPEIYZ+B0HhmckgXupbdQOVamIYIlr4ttFaxK6ci3Xq/bwanEmWjhiCP4RrkZmrX
 9I89i+z01r0vIMFIhSBIDi5FkD4WNnKOipejsaMkEZZ7RIgsz4h2A9qhoLt2gLOu6VK1
 tNWlkb9QO/Joa2fBCU7kpUiStynaajDL30/DLUf+x+6Mrl26Smgn3bk4I+/4dskpXjvk
 Ddrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gmsHScqLhMmUTnVg9k1tgfcQ0i5hvOXJ6NMV+zFkUP8=;
 b=bmyZyF3CUWIaQ2q0iNYYa1sIzc2NtreS/D0B6GzAKGbxZgwFRhFwYHH9yqMqwbibb2
 UK9Tt8QTMhxQrPBv4zXo4llPO1NCUFMr5sIlPb3+Fmw4uTONyzlKLMOAzdq0htZzbgL+
 tWuQgy9AGi1XFZ31UTKemFM88KtpDXuK3TzWQV7wE5uJx4YGMOYSo09lGl4YIEDWapVr
 phHY6+CSoUixQDUiroziKS3GMNwMVnHLEZ/ick1yhVmz3T4tN7ZylAObtxY6bhcWcnDq
 x4dT0lr73NEwSYBS0oV1HDYhYEryQnUJ0G1VFDdw2xjzCr9TRjPaE6y8IBbjyBT7CRob
 0JoA==
X-Gm-Message-State: AHPjjUjxBhuP6l8EwIX13iS1xIcyzJeRqWq+AG6AUC4/MeWZ3GVcsmQa
 fygwEZaie2NM5fpaF7/m3vgSG2QpAJSwQ8MweDE=
X-Google-Smtp-Source: AOwi7QCtpsJv9JLwkHPWekG6EvD2/JofKhz2P+kcpPtT/Oay5FY0R7AX5ezE81GXRbgfvRcnlcdL6hO81J05+smk1QA=
X-Received: by 10.25.23.38 with SMTP id n38mr384373lfi.104.1505888041616; Tue,
 19 Sep 2017 23:14:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Tue, 19 Sep 2017 23:13:41 -0700 (PDT)
In-Reply-To: <20170920053020.6860-5-andrew@aj.id.au>
References: <20170920053020.6860-1-andrew@aj.id.au>
 <20170920053020.6860-5-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Sep 2017 15:43:41 +0930
X-Google-Sender-Auth: R7NgMV4MThary1qfKlz8gfoD12I
Message-ID: <CACPK8Xdz1iK-4bqZfmfTUYw3zDLxCniwt6LupJq5mo-CCca3XQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] watchdog: aspeed: Move init to arch_initcall
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 06:14:05 -0000

On Wed, Sep 20, 2017 at 3:00 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Probing at device_initcall time lead to perverse cases where the
> watchdog was probed after, say, I2C devices, which then leaves a
> potentially running watchdog at the mercy of I2C device behaviour and
> bus conditions.
>
> Load the watchdog driver early to ensure that the kernel is patting it
> well before initialising peripherals.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I agree that we need to make sure the watchdog driver is loaded
earlier. I think this is the correct method, but I'll defer to Guenter
on this one.

Cheers,

Joel
