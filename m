Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nf9juEE+"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yB2H81Ky9zDr4W
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 14:12:51 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id m7so5206945lfe.5
 for <openbmc@lists.ozlabs.org>; Mon, 09 Oct 2017 20:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1K8njngOrQG7laUTk55jrxb5n0Z4v1T88IIuFaiYlqc=;
 b=nf9juEE+LoSJGsqLkOiBDNYC4REpg8/gXmyuHoaeUMFdQWn04saQR8f4TAm3n5jlml
 Uy2mevoiojhlhr5peJz6WRLnmoNZKY/eX1zICDNBXJbOfiUuDmcFnm7h0vpRRwQDhPcB
 sScHiy1BjOZIGeHZl1LzwHGrL+kIB80UsEfDcbgSDaBLnE+nQ9NCUoMhhlMcjewerZGd
 CektO3tl5lhxj5lftKvBy+oSLS1ID2Zbu75ZpJGKYeRldwJitce0XW8jyXPDHNbJfwYu
 8v10CfPWy8lTL0rqJgQxETDxIExuq1Idm8kRhpOFQCFVWSCTHiGhxek4jaRFWOXGVtCK
 hUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1K8njngOrQG7laUTk55jrxb5n0Z4v1T88IIuFaiYlqc=;
 b=Zp7kVfV0/IMsefLZor0i7vVul71seT5L5khij861vShP6CJ2QJYCkRFiE3f3r30O+4
 FybMsKq7dL6MlwhRYP4ixd4LBkna//L24Uj8JieulNX6Qip2YZXxMzuxmVxxy6KCKm9d
 4izew3LFPBD/IW+lCL9SlDyOcJL8Q0iyiiV21zY4M35AQ5WiJ8jV2ASl6Bw8NnUBQFDt
 vQ5YhMSU7+UJAYYLWmF1PNoUPrqC6f9Y2eTJ2aJZTf7XrXZbbaTfO31o+KTV1J1PrPl2
 AqF5cvK5K482ANSuEOqd2x/5vGhZKThbYX4UZ8q+KNn6ZT2KL7C6c47I9kHhMnUZ51rh
 3+7A==
X-Gm-Message-State: AMCzsaVqekWh/TRBfmK9O5bBz3KtBU0vOhaiaOLMrzf7aaxoc8JmaWPE
 usJx31FItR0HXFXCC1hDi2aoYSiiab9XM0FsoSA=
X-Google-Smtp-Source: AOwi7QClzO+uI09T0kDlvaqO0RAYDJ3oLw02S52OZN0F0ra/9jLpQma9biCORCBACCH5Ku7I0Lj3K6cAMO3CENR/F4E=
X-Received: by 10.46.88.94 with SMTP id x30mr213083ljd.138.1507605168371; Mon,
 09 Oct 2017 20:12:48 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.6 with HTTP; Mon, 9 Oct 2017 20:12:27 -0700 (PDT)
In-Reply-To: <1507594837.5452.158.camel@aj.id.au>
References: <CACPK8XdfxO5y3DHfBeZgvK=jUCM4noh2YFmX4w0GxEH8UDD+9A@mail.gmail.com>
 <1507594837.5452.158.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 Oct 2017 12:42:27 +0930
X-Google-Sender-Auth: 8X6Ye2TNPRk4aLTT_zNTjh06nAs
Message-ID: <CACPK8Xfh0tYY7TycLtJejHWQwvfnpkmRjS0FrJ3mGf_+eH4u4Q@mail.gmail.com>
Subject: Re: Moving to kernel dev-4.13
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames.ibm@gmail.com>, 
 Xo Wang <xow@google.com>, tomer.maimon@nuvoton.com
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
X-List-Received-Date: Tue, 10 Oct 2017 03:12:53 -0000

On Tue, Oct 10, 2017 at 9:50 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2017-10-09 at 16:34 +0930, Joel Stanley wrote:
>> Hello OpenBMCers,
>>
>> I've pushed a new branch to the OpenBMC kernel repository. It's called
>> dev-4.13, and is based on the latest stable release from the 4.13
>> branch (4.13.5).
>
> Woo!
>
>>
>> There are currently 40 patches on top of the upstream release that
>> include the patches sent upstream since 4.13 was released. In
>> addition, there is the new Aspeed clk driver that is out on the
>> upstream lists for review.
>
> Have you looked at my reviews on v4 yet? They're not all acks :)

Not yet. Thanks for the reviews, I'll get to that today

>> If you wish to have your non-upstreamed patches added to this tree,
>> please send them to the list with the [PATCH linux dev-4.13] tag.
>
> I haven't looked at the tree yet, but do we have a list of major
> features that we expose in dev-4.10 to match against dev-4.13 to know
> what needs to go in?
>
> Maybe that's a lazy question and I should generate it myself...

We should have a list. Here's a rough one:

$ git diff --dirstat=lines,1 v4.10.17..dev-4.10  | sort -hr
  20.1% arch/arm/boot/dts/
  13.2% drivers/fsi/
  10.6% drivers/pinctrl/aspeed/
   6.9% drivers/hwmon/pmbus/
   6.2% drivers/net/ethernet/faraday/
   6.0% drivers/hwmon/occ/
   5.0% drivers/i2c/busses/
   4.2% drivers/mtd/spi-nor/
   3.1% drivers/hwmon/
   3.1% drivers/
   3.0% Documentation/devicetree/bindings/
   2.5% drivers/gpio/
   1.9% include/
   1.7% drivers/misc/
   1.5% drivers/iio/pressure/
   1.5% drivers/clk/aspeed/
   1.3% arch/arm/mach-aspeed/
   1.1% drivers/leds/
   1.1% arch/arm/configs/
   1.0% net/ncsi/
   1.0% drivers/tty/serial/8250/
   1.0% drivers/mailbox/
   1.0% drivers/iio/adc/

A number of these were upstreamed between 4.10 and 4.13, so we do not
require any patches to be sent.

Cheers,

Joel
