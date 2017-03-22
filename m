Return-Path: <xow@google.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpR4d1ttnzDq7N
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 10:40:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GFDL7JBM"; 
 dkim-atps=neutral
Received: by mail-qk0-x22c.google.com with SMTP id p64so167704151qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 16:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=A3Me1Ojy6mABlcScCC6+SAu0H0/lGhamD6B9ARSOiMk=;
 b=GFDL7JBMbfPFbvzkxeQ2Dev7v5PkWZ10vIX3tFhqR7TNM4pt6YSjbEiWnkWSKHfIEL
 J9idKgYBtKSHzOswFBuPyeg0XPv6cgyOMjumShJNbFTIMQT3aPSN1ZnYuknk82v0dVZu
 qWlqUdMhCTqJCgZr4zZ9tTbdLG/Q/KZH6ITNL5pk/sVj0euH1dgjZr1SkBDT6G7g+D2k
 YorXEadIpTIZOz6q3xhlLQshhXnEb2TCyK+Yu8LeD8MRgayI2M8bKRyZu/rWZXm9BCWD
 itmzHmtsEDM9W7so1BuvknzVuz3zGRKz8dJe7JA1WEHEp+/yZGhSpMokkSeHQ4ddFHAc
 Glcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=A3Me1Ojy6mABlcScCC6+SAu0H0/lGhamD6B9ARSOiMk=;
 b=KmfIhkEYELBY5JMLtMHRPxatURJ13kfldGEvXeTgu3rnSZVl/z588CYEdojWm8ba1J
 SWnCbRDO5u8ENFSrPJWD3q0ticGo2TWG4Oe/8wx4LRXi+VxXwbTBq5QDx5W4EHY6N2OA
 9tsYQXuyidPkKexiL31JOWXecPlJwc+Madbms6fI9KkBI81QL3qpzXTnGv3fg4wG033U
 Dk6KFwn63sXerDErAth++4a0drir/IV6mBVU1O0DsLaxMi4djF4qTWrk1re3jhGWC43u
 6XdQab2hDjTI26Xch4QRzuUj5ziqeWJoNYuYpMTPFw2f4W+jZf8eUTRPoT6Gf4+xEkwy
 jVyg==
X-Gm-Message-State: AFeK/H3mZb5cF6FOCfemkc2CJShTKQVF36kGhNA57oFJ1OZD4cxIfhbTKDevQQMqkIJGzt/lpxGVBPX1xy0D1xdy
X-Received: by 10.55.153.199 with SMTP id b190mr18681266qke.305.1490226014141; 
 Wed, 22 Mar 2017 16:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.40.229 with HTTP; Wed, 22 Mar 2017 16:40:13 -0700 (PDT)
In-Reply-To: <CAPozSNqWfu9_+uY7Hs4ALQknS2GPnPpp8xe7eD1ShmuNjEEzoQ@mail.gmail.com>
References: <CAPozSNqWfu9_+uY7Hs4ALQknS2GPnPpp8xe7eD1ShmuNjEEzoQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Wed, 22 Mar 2017 16:40:13 -0700
Message-ID: <CAPH-5w5NOyWW_DEBv8-95z0x_u_XhazEgEJb=F1KrKh62j7Ppg@mail.gmail.com>
Subject: Re: [PATCH] Add Zaius device tree entry for 12V Delta Power Brick.
To: Peter Hanson <peterh@google.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Mar 2017 23:40:17 -0000

Hi Peter,

Please include the commit message (first line = email subject)
prefixes used in previous changes to the dts file.

ex.: "ARM: dts: aspeed: zaius: Enable NC-SI mux"

On Wed, Mar 22, 2017 at 4:07 PM, Peter Hanson <peterh@google.com> wrote:
> Signed-off-by: Peter Hanson <peterh@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 3bd70ed810af..4fd27617bb3a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -269,7 +269,13 @@
>   /* Master selector PCA9541A @70h (other master: CPU0)
>   *   LM5066I PMBUS @10h
>   */
> - /* 12V SMPS Q54SH12050NNDH @61h */
> +
> + /* 12V SMPS Q54SJ12050 @61h */
> + q54sj12050@61 {
> + compatible = "delta,dps800";
> + reg = <0x61>;
> + };
> +
>   /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
>   /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
>   /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> --
> 2.12.1.500.gab5fba24ee-goog

cheers
xo
