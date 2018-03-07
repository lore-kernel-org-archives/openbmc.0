Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JkCAfRc2"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="CxsmodQF"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zx0FB0z9lzF1T6
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 14:56:29 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id y137so1093272qka.4
 for <openbmc@lists.ozlabs.org>; Tue, 06 Mar 2018 19:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=witsfSDPkJjOBc21sQZVLyRmhQFcQ/sna/Uvs6FCJvE=;
 b=JkCAfRc2OP8pxRep/I4MJ6brTyOCMVtCHXxrA9Kn356142kAhhhfnwye+XggmjUiL2
 JsTnBHZuno0ntgPX2OS3LJ/vVmZ+TbMxTDn6TlNKCbUauVnw2NYMc+i30loVAoMoGlgr
 fkP/M15SEtYr9XalWf1zDr0ssZdrLLLtHhKQHZ/4S3pCXCpuwy9zlIxbmnEmHt+HJQt0
 TLeXPMjNZH40m9WfTl3bX86KauSznwC9H95wyHVDUHo1lvnR5yXzJLx8apUl/dvZ8uFE
 S/ytJJIpUXsz66erT7/eTMnd/IXBZFqXPou2Hpj1PB/a0MwJczMEzEga+CZWPxAXGkLQ
 jWDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=witsfSDPkJjOBc21sQZVLyRmhQFcQ/sna/Uvs6FCJvE=;
 b=CxsmodQF0AEOMoMNZ1m/098Y92NlF3N8l/h8bzIfrYt4RrpHj94pXdY7nSPYPbWCkT
 DhjBnXMdJVvWLbbwrcmZSYOaERmMTSD4zH3JjgEFUmb90AhnPTH1ey026HjfirUddFrd
 xT9VK0TTVTyYRGlbm9+veqiz7p/4AuGIOCEjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=witsfSDPkJjOBc21sQZVLyRmhQFcQ/sna/Uvs6FCJvE=;
 b=fQKVXoFYVfTzf+WhCeAUkHUNfmvhx7z/x8tdjoEbUMzTlKT7p4ecvix0OyNPfxWb9T
 e3jFyZ7chO2X/gp+P4khtQ9ZktKx6K3mUG/iVUZdHjuRWEHxxDrV+Nb1HoBxwu+huK/+
 zy35NHF4G1BjsMqbcwwdO6/E4S3sPR9/odTMn1j2OKjGaQv4ERsa+sBKrl31KYyvqEd3
 N/6j8UZ71+ybdlPn/iVwrzOj8PswsT/6E3vx/w1yJkcjqyvVe1ItEBJRfkhrSeyHbme0
 4tjze01k2XkhomY4uxGwHzvFxX2FpyBHxbhzNfId5ZvQr3wIs3jKOH82P8kHBQy9+2BT
 Q/ig==
X-Gm-Message-State: AElRT7HONpW52pDkXMEAY5nVLOBawr2H+bUtcxANDSsNbUwMTGhpxMfV
 oZyYEe6tbo7kuvOXsrefmfj1TShl6172FqRUx/4=
X-Google-Smtp-Source: AG47ELvxilQ2a239p+11gqrIZogooreF/YOC/By1sYR9riCKRqcN4CYpFZX6Kfj9B0BBYcrw5NbiLW491HRdElFvbsA=
X-Received: by 10.55.139.133 with SMTP id n127mr31378746qkd.231.1520394987091; 
 Tue, 06 Mar 2018 19:56:27 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Tue, 6 Mar 2018 19:56:06 -0800 (PST)
In-Reply-To: <1520139829-10672-1-git-send-email-haiyue.wang@linux.intel.com>
References: <1520139829-10672-1-git-send-email-haiyue.wang@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Mar 2018 14:26:06 +1030
X-Google-Sender-Auth: JFWb6vOhh5sOhsFMHYqpAMlcY4I
Message-ID: <CACPK8XevaaJSn2eZUt3dfAK+eOJ-hifnMqMme120jCRszpth1A@mail.gmail.com>
Subject: Re: [PATCH dts/arm/aspeed-g5 v1] ARM: dts: aspeed-g5: Add IPMI KCS
 node
To: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 03:56:31 -0000

On Sun, Mar 4, 2018 at 3:33 PM, Haiyue Wang <haiyue.wang@linux.intel.com> wrote:
> The IPMI KCS device part of the LPC interface and is used for
> communication with the host processor.
>
> Signed-off-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> ---
> Hi Joel & Andrew,
>
> The kcs-bmc-aspeed module has been in:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/char/ipmi/kcs_bmc_aspeed.c
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
>
> I updated the device tree node about kcs-bmc, this is passed on my board.
>
> And the patch is generated by rebasing on:
> https://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
> Please help to review.

Thanks for the patch. I suggest you submit this patch for inclusion in
the upstream kernel. To do this, send it to:

Joel Stanley <joel@jms.id.au>
Andrew Jeffery <andrew@aj.id.au>
linux-arm-kernel@lists.infradead.org
linux-aspeed@lists.ozlabs.org
linux-kernel@vger.kernel.org

And I will consider it for merging.

From there I can backport it into the dev-4.13 tree.

Cheers,

Joel

>
> BR,
> Haiyue
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 43 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 8eac57c..f443169 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -267,8 +267,40 @@
>                                 ranges = <0x0 0x1e789000 0x1000>;
>
>                                 lpc_bmc: lpc-bmc@0 {
> -                                       compatible = "aspeed,ast2500-lpc-bmc";
> +                                       compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";
>                                         reg = <0x0 0x80>;
> +                                       reg-io-width = <4>;
> +
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       ranges = <0x0 0x0 0x80>;
> +
> +                                       kcs1: kcs1@0 {
> +                                               compatible = "aspeed,ast2500-kcs-bmc";
> +                                               reg = <0x0 0x80>;
> +                                               interrupts = <8>;
> +                                               kcs_chan = <1>;
> +                                               kcs_addr = <0x0>;
> +                                               status = "disabled";
> +                                       };
> +
> +                                       kcs2: kcs2@0 {
> +                                               compatible = "aspeed,ast2500-kcs-bmc";
> +                                               reg = <0x0 0x80>;
> +                                               interrupts = <8>;
> +                                               kcs_chan = <2>;
> +                                               kcs_addr = <0x0>;
> +                                               status = "disabled";
> +                                       };
> +
> +                                       kcs3: kcs3@0 {
> +                                               compatible = "aspeed,ast2500-kcs-bmc";
> +                                               reg = <0x0 0x80>;
> +                                               interrupts = <8>;
> +                                               kcs_chan = <3>;
> +                                               kcs_addr = <0x0>;
> +                                               status = "disabled";
> +                                       };
>                                 };
>
>                                 lpc_host: lpc-host@80 {
> @@ -294,6 +326,15 @@
>                                                 status = "disabled";
>                                         };
>
> +                                       kcs4: kcs4@0 {
> +                                               compatible = "aspeed,ast2500-kcs-bmc";
> +                                               reg = <0x0 0xa0>;
> +                                               interrupts = <8>;
> +                                               kcs_chan = <4>;
> +                                               kcs_addr = <0x0>;
> +                                               status = "disabled";
> +                                       };
> +
>                                         lhc: lhc@20 {
>                                                 compatible = "aspeed,ast2500-lhc";
>                                                 reg = <0x20 0x24 0x48 0x8>;
> --
> 2.7.4
>
