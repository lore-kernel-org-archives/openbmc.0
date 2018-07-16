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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ThBg5QWqzDr55
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 21:34:02 +1000 (AEST)
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr
 [90.92.61.202])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 84458C03;
 Mon, 16 Jul 2018 11:33:59 +0000 (UTC)
Date: Mon, 16 Jul 2018 13:33:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arnd.de,
 avifishman70@gmail.com, yuenn@google.com, brendanhiggins@google.com,
 venture@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 2/2] misc: npcm7xx: add NPCM7xx LPC BPC driver
Message-ID: <20180716113357.GA30937@kroah.com>
References: <20180704091427.409971-1-tmaimon77@gmail.com>
 <20180704091427.409971-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180704091427.409971-3-tmaimon77@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
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
X-List-Received-Date: Mon, 16 Jul 2018 11:34:04 -0000

On Wed, Jul 04, 2018 at 12:14:27PM +0300, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM7xx BIOS post code (BPC) driver.
> 
> The NPCM7xx BPC monitoring two I/O address written by
> the host on the Low Pin Count (LPC) bus, the capure
> data stored in 128-word FIFO.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

It would be great to get someone else who knows that this hardware is
supposed to be doing to ack or sign-off on this patch, as I don't know
if this really is providing the correct api for it or not.

Right now it's just reading data from the hardware, what good is that?
Who uses this?  What userspace tools connect up to it?

thanks,

greg k-h
