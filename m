Return-Path: <akpm@linux-foundation.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux-foundation.org
 (client-ip=140.211.169.12; helo=mail.linuxfoundation.org;
 envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KLQT231kzF1D8
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jul 2018 07:45:18 +1000 (AEST)
Received: from akpm3.svl.corp.google.com (unknown [104.133.9.92])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 3333ECDB;
 Mon,  2 Jul 2018 21:45:15 +0000 (UTC)
Date: Mon, 2 Jul 2018 14:45:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: avi.fishman@nuvoton.com
Cc: davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Avi Fishman <AviFishman70@gmail.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: add subfolders for nuvoton *npcm*
Message-Id: <20180702144514.18b45671a29cf5250aacb153@linux-foundation.org>
In-Reply-To: <20180701093028.10174-2-avi.fishman@nuvoton.com>
References: <20180701093028.10174-1-avi.fishman@nuvoton.com>
 <20180701093028.10174-2-avi.fishman@nuvoton.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 05 Jul 2018 11:44:20 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2018 21:45:21 -0000

On Sun,  1 Jul 2018 12:30:28 +0300 avi.fishman@nuvoton.com wrote:

> From: Avi Fishman <AviFishman70@gmail.com>
> 
> Add several subfolders to look for *npcm* files under
> ARM/NUVOTON NPCM ARCHITECTURE
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
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

The Docuemntation/ pathnames have changed.  Please refresh to the
current Linus tree.
