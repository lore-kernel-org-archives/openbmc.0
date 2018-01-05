Return-Path: <xow@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="XyaKZI85"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zCtx33mbJzF0R9
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jan 2018 05:48:52 +1100 (AEDT)
Received: by mail-pf0-x243.google.com with SMTP id l24so2516643pfj.6
 for <openbmc@lists.ozlabs.org>; Fri, 05 Jan 2018 10:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=9b7geFHHBV4NyqahZwPa+XatokUF3lUZJFm2FRQxi1I=;
 b=XyaKZI85DsEWlqDr6QjmI3aezxchVdufq8RtBKrHT6bsTAKi6TIS7sUy6D9ZYpDj+H
 gq8WBaS13fU410m8uKw/WHiXkaB6ctZCujjeDi369LQc4M2HpfHgPGkhrgaUZfPh7O5x
 qayS28Z28O3fbyWgy3VmIFkp8Fay3bGhCNgw5+uEFUHu8Dq6yzjlFgS+WtFrKdCuQ5qA
 20eKRPVxhgW0/8o+tfeJv+a5eEmHO15AGrkkdjZX5V1aEv+OlxMsdkkvk5Y2BnkHqn2Z
 i/3Zv69u5/A4YNT9pbV/Xqp+/MmQq9obbbQhKpvOwPufI/H4bebFFBkfRhn+eFab6PtI
 D+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=9b7geFHHBV4NyqahZwPa+XatokUF3lUZJFm2FRQxi1I=;
 b=SREENYj5DNm5CXV+DklOLaH5OiVti5PaN6OWphmZcv78iHnJDuPpL64pwKCDAR0L6F
 Kq4DRwWkZXSq0GuAlxQaNfIfL5abXyBlk8Er5U+Hc5KWKHNWCIfoepZttCYFlL7ee1fa
 OolqJAnwbGBN50bYaiLANk/mypG/pmReAWK6ZNfehrFIMao2LiTF3f+QVJ+QRYbE8ZuV
 XMa7aBfFWPjHSyT4s4VVJUU6eaQzJVoK84brsSEvdzrP163Hiy/kytsYW4BDyzWjstKh
 DsDC/ccv2VTKgHethnElkTAoDlFIzSjeWjidyXEb/QaLdEjx9b9j3xmkk4AZqyLxMyag
 YKVA==
X-Gm-Message-State: AKGB3mJlrQ62a+UlOfm98QBkHonYwhZHm2f6XY3YWUaXSC7ZuBXE7+PU
 oHzExlmsbbmF+MyZVB3lUnqGVLHPg+/zmxqiav8Nrg==
X-Google-Smtp-Source: ACJfBovLevznBrZrUXwFkbBO4Aw69VeKaQb92cu1Rv0OVo6PobgMP3Njc7tEPPKjtGUbWfqirxnyo6wuVSxhtoM+w8w=
X-Received: by 10.99.51.77 with SMTP id z74mr3343842pgz.324.1515178127996;
 Fri, 05 Jan 2018 10:48:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.185.4 with HTTP; Fri, 5 Jan 2018 10:48:47 -0800 (PST)
In-Reply-To: <CACPK8Xf64OdfqNZiyu_v=hxB4YrgxPN5SHzxUsbEGkMbGqVwKg@mail.gmail.com>
References: <1515057847-30492-1-git-send-email-mine260309@gmail.com>
 <CACPK8Xf64OdfqNZiyu_v=hxB4YrgxPN5SHzxUsbEGkMbGqVwKg@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 5 Jan 2018 10:48:47 -0800
Message-ID: <CAPH-5w4VWj2J9wqHkMUWpZ4Xe9uMEMkt1LT4xDLL84HoOZHvsQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: zaius: Add
 pcie-e2b-present gpio key
To: Joel Stanley <joel@jms.id.au>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adrian Barrera <abarrera@us.ibm.com>
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
X-List-Received-Date: Fri, 05 Jan 2018 18:49:06 -0000

Sorry, just got back online after travel nonsense.

On Thu, Jan 4, 2018 at 5:58 PM, Joel Stanley <joel@jms.id.au> wrote:
>
>
> On 4 Jan. 2018 20:24, "Lei YU" <mine260309@gmail.com> wrote:
>
> Add GPIO key to check presence of PCIE E2B
>
>
> Xo, can I get an ack please?
>
>
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 17f2000..f583dcc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -55,6 +55,12 @@
>                         gpios = <&gpio ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
>                         linux,code = <ASPEED_GPIO(F, 7)>;
>                 };
> +
> +               pcie-e2b-present{
> +                       label = "pcie-e2b-present";
> +                       gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(E, 7)>;
> +               };
>         };
>
>         leds {
> --
> 1.9.1
>
>

Acked-by: Xo Wang <xow@google.com>
