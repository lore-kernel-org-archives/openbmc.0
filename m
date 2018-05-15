Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ljWz5VHPzF2R1
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 02:22:20 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2018 09:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,403,1520924400"; d="scan'208";a="51056019"
Received: from mauery.jf.intel.com (HELO mauery) ([10.7.150.73])
 by orsmga003.jf.intel.com with ESMTP; 15 May 2018 09:22:16 -0700
Date: Tue, 15 May 2018 09:22:16 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Patrick Venture <venture@google.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: quanta q71l not booting with 4.13
Message-ID: <20180515162216.GA105329@mauery>
References: <CAO=notzi+BtDV=m5TYPE7UrtO-TYPVLe+LYhUcApX4UgvwfVyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notzi+BtDV=m5TYPE7UrtO-TYPVLe+LYhUcApX4UgvwfVyA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Tue, 15 May 2018 16:22:24 -0000

On 15-May-2018 07:26 AM, Patrick Venture wrote:
>Hi;
>
>So, i have a couple theories to test but before I ran them down I
>figured I'd just ask here.  The quanta-q71l won't boot if the BMC is
>running the 4.13 kernel from openbmc.  I'm theorizing that the spi mux
>is flipped somehow (maybe a default pin value is getting flipped) or
>something else is preventing the host from reading its flash.
>
>Has anyone experienced anything like this on their platform?

The 4.13 kernel has a bunch of new stuff that has to be worked out in 
device tree to make pins and clocks and resets work. We had trouble 
getting our hosts booting as well when we first migrated to 4.13. We had 
to fix a few things in our device tree to get the espi clock working. I 
think it also included a patch that Jae sent to this list for the clock 
and reset driver. This may be an entirely different issue, but that was 
our story.

+                       espi: espi@1e6ee000 {
+                               compatible = "aspeed,ast2500-espi-slave";
+                               reg = <0x1e6ee000 0x100>;
+                               interrupts = <23>;
+                               status = "disabled";
+                               clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+                               pinctrl-names = "default";
+                               pinctrl-0 = <&pinctrl_espi_default>;
+                       };
+

I think we also had trouble with the host video showing up after the 
host powered on, this was also dependent on some clock control settings 
in the dts. But Ed tells me this is a AST2400, so video is not your 
problem.

--Vernon
