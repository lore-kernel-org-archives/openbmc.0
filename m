Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3l7T5thxzDqj8
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 16:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KpAYNdIZ"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id p203so1003958yba.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 23:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xHjvIGy7vlpUIa3p/kYbCjofT87p5/UuS+3tS7ErnI4=;
 b=KpAYNdIZ1EgipDdW+/JVUzaJ8c8Ts+lL/nLGk2Mdy2fJK/1VCxKDBUdUiIBQ3qUeVE
 TszBLBOKhqdURinH9x4Y9f9Cmtn9T4REbXtdfPKCI20S0uQliY2+uOwhPTnKHOy3D2vj
 uIZHM3E9FN9I3pKsWg2A82LNU10qiRAh1xd9+LoEuzB69GTva1E+erBjzdGAgCMuAH6X
 X9DJphbrYI/WX7bFVrIGc1cyG495eYcM1S5QBte+2HKxo8ALcoh3ecgAXLrWzkT+D8eD
 knilSRom1m979m63bTSidQATey+BMeYxla8IrDFZma35mqn+Ir1yrBON5PZCirIta8zA
 vMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xHjvIGy7vlpUIa3p/kYbCjofT87p5/UuS+3tS7ErnI4=;
 b=jPD8Ox8EPKIBDn3W8xEvyCXpoxDgs5d4Jd2TysW3ydjHWDz3W2VDqVpRRY6ArLYcbM
 VbyuTgyoS4S8hTo18lXBi2mH2libaQM7aLQE40YmkkXl9AbbvkzJ62j0k+hc01NUTjuf
 CxUVJBJAeu6fqWtkFJtpRG9VNRbLu2qVTybYUkywcpjWKR3GZD+7YgUkakgfK/XvxTdt
 7s5kALMLhMYpEL2+A8NtQGAssfVB9PS4FSwA7+bPKzFuRwWgJUbAZmckRly3mBrpDhe3
 BKcfixtRH8e1gcxtnRBgfHqnQCjyHCFFhbTv2gYgkdOE+CR6zmf4nW2H8fdXdX+hHG83
 wFoQ==
X-Gm-Message-State: AIVw1113D36JfrvfJ2Z8amylTwhbjGpGnHRxzVVCNgFmThhIpnIsZxnE
 4WnzWScsoDXUovrBhNalTRq72WaV5w==
X-Received: by 10.37.177.158 with SMTP id h30mr2998625ybj.214.1499408947498;
 Thu, 06 Jul 2017 23:29:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Thu, 6 Jul 2017 23:28:47 -0700 (PDT)
In-Reply-To: <20170706222801.26009-1-cbostic@linux.vnet.ibm.com>
References: <20170706222801.26009-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Jul 2017 15:58:47 +0930
X-Google-Sender-Auth: BGbJRBTXD-5xCarGpfYx2wm1izc
Message-ID: <CACPK8XdhUFqrh6ORVmm621Kez7QmcJ-1FPeupHP9QR6=a-11nA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] arch/arm/boot/dts: Add watchdog 1
 optional properties.
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 07 Jul 2017 06:29:10 -0000

On Fri, Jul 7, 2017 at 7:58 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Define external-signal and no system reset optional parameters
> to the dev tree so that watchdog 1 can be configured for these
> modes.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Thanks, merged into dev-4.10.

I tested that I could still reboot the system with the watchdog patches applied.

Cheers,

Joel
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 31315d0..44dad21 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -420,6 +420,11 @@
>         aspeed,external-nodes = <&gfx &lhc>;
>  };
>
> +&wdt1 {
> +       aspeed,reset-type = "none";
> +       aspeed,external-signal;
> +};
> +
>  &wdt2 {
>         status = "okay";
>  };
> --
> 1.8.2.2
>
