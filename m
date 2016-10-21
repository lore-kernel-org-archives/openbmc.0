Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0b9K2F8XzDvK4
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 17:19:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=XfVpTQdo; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id 139so9651849itm.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 23:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=KYrW4w92lGACf+YNOlKBubdakkqIYF/SPmrYk98cYEQ=;
 b=XfVpTQdoz/G04yWbl718cf0c3FcMFi1Tyoe6CNomT4A7IKGbCzeQh5sox6y3SxXToA
 9pcHy5hNSkJ0fDIWea91BsgER5yBy9/6JDArVUNSzPSS0dh1sdqQWjtOo2ht4EITXqyH
 r7bqvFMiKYh4gBVzgPyg9Y6AeaTaEwNfkod46CCxfugw99Pz0G0gDp86yeHHw25hhG7v
 iDWdFDRb/pR5F81RWVSVZlDr7JTkVQQ5uD/KBkbMuIyK86ROmejaVVBfFnLNpCU/0tKY
 UYsVPdKT7y3kAADavlyA41iW0syE5Y5pdd43Wd0VKATLJc2zj2Vt19Yf+29DyQQf+VYA
 7czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=KYrW4w92lGACf+YNOlKBubdakkqIYF/SPmrYk98cYEQ=;
 b=kTCszkoLLSYq+D3w/XLBhBk0rpWsJpT6QXngS6Vr/EigjrlUwAuk8tT2qGRXhd4pUH
 bFmTFvrq7iObwAzWBijIUh9M2IO574U/cJnQMKTWFElY8JqmymFDyyid3xAdsYerfxzx
 1tVS8HUiTOGne0jkzcpFoble0Q7imwfLpO9I9Xb0xpryPlkpegSyzPOGSdIXDqUshdav
 0Sw+U5N6ydNks12YvdEttd3PFHx84CciMcrgaN1XufYmhXKFsqkF4DupusJFYjjE+Kmx
 vpk/FE23N9KNjk7ouHIqu0mkYrw5EAttuuoYRIfZAMvNVCz/sxVOkgmvBLUxV1EYpNBl
 lDNQ==
X-Gm-Message-State: AA6/9Rn/mC/ZVkVzDM/rGjpiXlatmio8gZ7vq21yVzrHCb27CB4JR12DYuY35ZWX7I4Tl7cS5o8DnJN1O6zrgg==
X-Received: by 10.202.252.9 with SMTP id a9mr9204677oii.124.1477030738753;
 Thu, 20 Oct 2016 23:18:58 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 23:18:38 -0700 (PDT)
In-Reply-To: <1477029796-22983-1-git-send-email-mine260309@gmail.com>
References: <1477029796-22983-1-git-send-email-mine260309@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 16:48:38 +1030
X-Google-Sender-Auth: Vg4ihjab1RAn75vbyyW-5nKipXc
Message-ID: <CACPK8XdKmtf9ZYBgcUvk9f3kx8VRjr6wcHVyp906Q3xMSsZaQw@mail.gmail.com>
Subject: Re: [linux] ARM: dts: aspeed: witherspoon: Add ucd90160 sensor
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Oct 2016 06:19:02 -0000

On Fri, Oct 21, 2016 at 4:33 PM, Lei YU <mine260309@gmail.com> wrote:
> Add UCD90160 sensor to enable pmbus hwmon.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>

Thanks, applied as 9efee2db48c4b5d08f668c6ce5a0ec1d875be9d3 to dev-4.7.

I gave you the wrong line for your git format-patch. You need to
include PATCH in your --subject-prefix:

git format-patch --subject-prefix="linux PATCH"

You can also chose to put the branch you're targetting, in this case
dev-4.7, if it's not clear.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index fcc880a..14376f4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -149,6 +149,10 @@
>                 compatible = "atmel,24c64";
>                 reg = <0x51>;
>         };
> +       ucd90160@64 {
> +               compatible = "ti,ucd90160";
> +               reg = <0x64>;
> +       };
>  };
>
>  &i2c12 {
> --
> 1.9.1
>
