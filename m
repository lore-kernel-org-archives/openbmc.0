Return-Path: <stern+5b37fb5a@rowland.harvard.edu>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=rowland.harvard.edu
 (client-ip=192.131.102.54; helo=iolanthe.rowland.org;
 envelope-from=stern+5b37fb5a@rowland.harvard.edu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rowland.harvard.edu
Received: from iolanthe.rowland.org (iolanthe.rowland.org [192.131.102.54])
 by lists.ozlabs.org (Postfix) with SMTP id 419K8t14GNzF0jD
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 06:20:43 +1000 (AEST)
Received: (qmail 2212 invoked by uid 2102); 19 Jun 2018 10:49:19 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 19 Jun 2018 10:49:19 -0400
Date: Tue, 19 Jun 2018 10:49:19 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To: Avi Fishman <avifishman70@gmail.com>
cc: gregkh@linuxfoundation.org, <tmaimon77@gmail.com>, <venture@google.com>, 
 <yuenn@google.com>,  <brendanhiggins@google.com>, 
 <mathias.nyman@linux.intel.com>,  <bjorn.andersson@linaro.org>, 
 <jhogan@kernel.org>,  <albeu@free.fr>,  <chunfeng.yun@mediatek.com>, 
 <tony@atomide.com>,  <baolu.lu@linux.intel.com>,  <elder@linaro.org>, 
 <digetx@gmail.com>,  <kstewart@linuxfoundation.org>, 
 <hdegoede@redhat.com>,  <linux-kernel@vger.kernel.org>, 
 <linux-usb@vger.kernel.org>,  <openbmc@lists.ozlabs.org>, 
 <robh+dt@kernel.org>,  <mark.rutland@arm.com>, 
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] USB host: Add USB ehci support for nuvoton npcm7xx
 platform
In-Reply-To: <20180619142246.104469-2-avifishman70@gmail.com>
Message-ID: <Pine.LNX.4.44L0.1806191044530.1473-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-Mailman-Approved-At: Wed, 20 Jun 2018 12:27:42 +1000
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
X-List-Received-Date: Tue, 19 Jun 2018 20:20:47 -0000

On Tue, 19 Jun 2018 avifishman70@gmail.com wrote:

> From: Avi Fishman <AviFishman70@gmail.com>
> 
> This patch adds support for ehci controller for the Nuvoton
> npcm7xx platform.
> Most of the code was taken from ehci-spear.c + specific initialization
> code
> 
> Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> ---
>  drivers/usb/host/Kconfig        |   8 ++
>  drivers/usb/host/Makefile       |   1 +
>  drivers/usb/host/ehci-npcm7xx.c | 212 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/usb/host/ehci-npcm7xx.c
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 9f0aeb068acb..e3100b249f0f 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -185,6 +185,14 @@ config USB_EHCI_MXC
>  	---help---
>  	  Variation of ARC USB block used in some Freescale chips.
>  
> +config USB_EHCI_HCD_NPCM7XX
> +	tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
> +	depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
> +	default y

Are you sure this is what you want?  The value defaults to Y whenever 
COMPILE_TEST is enabled?  Will that annoy people doing compile tests?

Aside from that one issue,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
