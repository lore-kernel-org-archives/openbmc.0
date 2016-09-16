Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
 [209.85.213.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZyfG049pzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:40:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=pewfHJ7E; 
 dkim-atps=neutral
Received: by mail-vk0-f66.google.com with SMTP id g9so239987vkg.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=SypsuysS55/ymjNS4+P9bjbii+QzG++cZ7T412UJo94=;
 b=pewfHJ7EYNmgF33e6lapq6MCRn8NSD5TYJHFFUhstA3CbXqqPNM6Il3DJFi7uohWo6
 cz0zkFn9U9G9MmsyYqj0pqQmjJcLlU47rHW0qsqdEm1s45j79alxuVnT8lI5ec4volw2
 Ipp9PewDkxZj/70Uf6CNYa6X8TTJVnsVTcvHCZ33SxjFh6514lO2QfgR50pWeVX77oZ+
 eCRIeW1ps13TokDHRwKS85CiC1sRuPq0h+elvWiDdnLk2gpEtAR4LW2btyiRuOrFkt/j
 I3rnatjYmcaQAoqGge/PhVQMQhIY7dVXsJME4J4IvibJ+Lrv5ISLZ5+eusSEie4PHqPn
 zIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=SypsuysS55/ymjNS4+P9bjbii+QzG++cZ7T412UJo94=;
 b=l6ojxXCjwHpTsrzpI/XcFK72ZzRht6i4OFI9tkLhT2HD96reZQpmfA3rM8wmC0Ewlg
 hw4tsaZi07vGbkFgKOjD3pQ2CgltSJhx/Ds5JBwazyIRqD4vzWnfURwzD02GaZtyMY+T
 Q8W65dhLh6cKrcKr9ZtbTdESp8CQ5BcT/g+SdC5QNDLua9IiK9Axg85iNut6PsS71PTR
 GuwDWCqnNs+jOEoHPTu1MEV0oD/wO9Q+fzsHMxT0iqlzqOcJH5IruciJCgCBcT+wC/go
 gGBOdRSbFVu2rwgIWVuvywz5GbCPHLTO3uNW/frj9emXw/fOY3CmLlHUJwcJG+hokm+L
 7kFQ==
X-Gm-Message-State: AE9vXwMw0WixbjVDUtcizfrwdcSBcCyHXILGEOzdWUSQsQ+AgDtUn3eAYTDJUintBZihPqbBtVBHYPduZ3HdGQ==
X-Received: by 10.31.6.146 with SMTP id 140mr854696vkg.145.1473989976093; Thu,
 15 Sep 2016 18:39:36 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 18:39:15 -0700 (PDT)
In-Reply-To: <822637739.194632.1473971801609.JavaMail.zimbra@raptorengineeringinc.com>
References: <822637739.194632.1473971801609.JavaMail.zimbra@raptorengineeringinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Sep 2016 11:09:15 +0930
X-Google-Sender-Auth: c5-G5bu57WNOu_aKzFsMdBrgqT4
Message-ID: <CACPK8XfaObpxkWA3Y7-f99vUvJ=oksqkt6FT+gqutAc8Ud8p6Q@mail.gmail.com>
Subject: Re: [PATCH 10/16] Add missing UARTs to Firestone DT
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 01:40:38 -0000

On Fri, Sep 16, 2016 at 6:06 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:

Missing your s-o-b.

Please add a comment as to why you're enabling them - I assume that
these are the physical ports on the back of the chassis?

>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 82df794..c6e81f4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -9,6 +9,8 @@
>         compatible = "ibm,firestone-bmc", "aspeed,ast2400";
>
>         aliases {
> +               serial1 = &uart1;
> +               serial2 = &uart2;
>                 serial4 = &uart5;
>         };
>
> @@ -73,6 +75,14 @@
>         no-hw-checksum;
>  };
>
> +&uart1 {
> +       status = "okay";
> +};
> +
> +&uart2 {
> +       status = "okay";
> +};
> +
>  &uart5 {
>         status = "okay";
>  };
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
