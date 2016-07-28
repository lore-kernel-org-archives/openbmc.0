Return-Path: <clg@kaod.org>
X-Greylist: delayed 37845 seconds by postgrey-1.35 at bilbo;
 Fri, 29 Jul 2016 04:53:27 AEST
Received: from 3.mo7.mail-out.ovh.net (3.mo7.mail-out.ovh.net [46.105.34.113])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0gx308zTzDrPh
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2016 04:53:26 +1000 (AEST)
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id C8715FFCADC
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 20:43:43 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 89EE35C0099;
 Thu, 28 Jul 2016 20:43:42 +0200 (CEST)
Subject: Re: [PATCH linux v4 1/4] drivers/fsi: Initial stubs for FSI device
 driver.
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <83431667-f0cc-6a9d-143c-3bb1872c5fec@kaod.org>
Date: Thu, 28 Jul 2016 20:43:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5935462835177622274
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuc
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
X-List-Received-Date: Thu, 28 Jul 2016 18:53:27 -0000

On 07/28/2016 08:14 PM, christopher.lee.bostic@gmail.com wrote:
> From: Christopher Bostic <cbostic@us.ibm.com>
> 
> Signed-off-by: Christopher Bostic <cbostic@us.ibm.com>
> ---
> 
> Changes to this patch based on reviewer feedback
> 
> V2:
> - Removed enums in fsiinit.h and replaced with #defines
> - Added proper file copyright and license headers
> - Added certificate of origin
> - Removed version string
> - Replace kobject with struct device in struct fsidd
> - Suggestions to implement standard bus_type will be implemented in
>   later patches
> 
> V3:
> - Removed white space
> - Suggestions to add Kconfig will be added in follow on patches
> 
> V4:
> - Removed blank line at end of fsiinit.c

It would be nice to add a [patch 0/4] explaining 'briefly' what 
FSI is. This is really an IBM 'thing' that people don't know about. 

C.
