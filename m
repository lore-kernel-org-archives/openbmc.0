Return-Path: <gregkh@linuxfoundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41DrQp23BbzDrq6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 00:00:01 +1000 (AEST)
Received: from localhost (li1825-44.members.linode.com [172.104.248.44])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 0A6C1CFD;
 Mon, 25 Jun 2018 13:59:58 +0000 (UTC)
Date: Mon, 25 Jun 2018 21:59:53 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: avifishman70@gmail.com
Cc: stern@rowland.harvard.edu, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, brendanhiggins@google.com,
 mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org,
 jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com,
 tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org,
 digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/3] MAINTAINERS: add subfolders for nuvoton *npcm*
Message-ID: <20180625135953.GA3999@kroah.com>
References: <20180620063306.134820-1-avifishman70@gmail.com>
 <20180620063306.134820-4-avifishman70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180620063306.134820-4-avifishman70@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
X-List-Received-Date: Mon, 25 Jun 2018 14:00:03 -0000

On Wed, Jun 20, 2018 at 09:33:06AM +0300, avifishman70@gmail.com wrote:
> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>

No changelog text?

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ce3c5f32e5..23c450adad44 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1727,7 +1727,10 @@ F:	arch/arm/mach-npcm/
>  F:	arch/arm/boot/dts/nuvoton-npcm*
>  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
>  F:	drivers/*/*npcm*
> +F:	drivers/*/*/*npcm*
>  F:	Documentation/*/*npcm*
> +F:	Documentation/*/*/*npcm*
> +F:	Documentation/*/*/*/*npcm*

Patch does not apply to 4.18-rc2 :(

thanks,

greg k-h
