Return-Path: <andriy.shevchenko@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lC0F6F2nzDqBx
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 21:26:49 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2018 04:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,455,1526367600"; d="scan'208";a="61261028"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2018 04:26:26 -0700
Message-ID: <3a50932025929d1b318cb42c05a727892603d31d.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] i2c: npcm7xx: add i2c controller master mode only
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>, avifishman70@gmail.com, 
 tmaimon77@gmail.com, venture@google.com, yuenn@google.com, 
 brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com, 
 davem@davemloft.net, mchehab+samsung@kernel.org,
 gregkh@linuxfoundation.org,  akpm@linux-foundation.org, arnd@arndb.de,
 wsa@the-dreams.de,  pierre-yves.mordret@st.com, cedric.madianga@gmail.com, 
 baolin.wang@spreadtrum.com, jarkko.nikula@linux.intel.com,
 hdegoede@redhat.com,  rmk+kernel@armlinux.org.uk,
 ard.biesheuvel@linaro.org,  thor.thayer@linux.intel.com,
 geert@linux-m68k.org,  heikki.krogerus@linux.intel.com, tglx@linutronix.de
Cc: linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Aug 2018 14:26:25 +0300
In-Reply-To: <20180807110709.31847-3-tali.perry1@gmail.com>
References: <20180807110709.31847-1-tali.perry1@gmail.com>
 <20180807110709.31847-3-tali.perry1@gmail.com>
Organization: Intel Finland Oy
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 07 Aug 2018 11:26:54 -0000

On Tue, 2018-08-07 at 14:07 +0300, Tali Perry wrote:
> Nuvoton NPCM7XX I2C Controller
> NPCM7xx includes 16 I2C contollers. THis driver operates the
> controller.
> This module also includes a slave mode, which will be submitted later
> on.
> 
> Any feedback would be appreciated.  
> 
> v2 -> v1:
> 	- run check patch in strict mode.
> 	- use linux crc.
> 	- define regs in constant offset without base.
> 	- remove debug prints.
> 	- no declerations for local functions.
> 	
> v1: initial version

I don't know / remember why I'm in Cc list here, but you can go through
my other reviews and find style recommendations for your code as well.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
