Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C0AB11A0741
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 06:16:40 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444936597798370.8983345683117;
 Thu, 15 Oct 2015 12:16:37 -0700 (PDT)
Date: Thu, 15 Oct 2015 14:16:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH openpower-host-ipmi-oem 1/2] Support OpenPOWERs OEM
 commands on openbmc
Message-ID: <20151015191635.GC21126@asimov.austin.ibm.com>
References: <1444832603-18260-1-git-send-email-patches@stwcx.xyz>
 <1444832603-18260-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444832603-18260-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_7
X-ZohoMail-Owner: <20151015191635.GC21126@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
X-Zoho-Virus-Status: 2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 19:16:42 -0000

On Wed, Oct 14, 2015 at 09:23:22AM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
> 
> diff --git a/ipmid-api.h b/ipmid-api.h
> new file mode 100644
> index 0000000..ef2be38
> --- /dev/null
> +++ b/ipmid-api.h
> @@ -0,0 +1,83 @@

This file should be used from the phosphor-host-ipmid package.  We need
to make a recipe for phosphor-host-ipmid-devel in bitbake.

> diff --git a/oemhandler.C b/oemhandler.C
> new file mode 100644
> index 0000000..c4eae21
> --- /dev/null
> +++ b/oemhandler.C
> @@ -0,0 +1,92 @@
> +#include "oemhandler.h"
> +#include "ipmid-api.h"
> +#include <stdio.h>
> +#include <string.h>
> +
> +void register_netfn_oem_partial_esel() __attribute__((constructor));
> +
> +
> +
> +const char *g_esel_path = "/tmp/";
> +uint16_t g_record_id = 0x0100;
> +
> +
> +#define LSMSSWAP(x,y) (y<<8|x)

inline function for this?

Recommend ((y)<<8|(x)) if left as a macro.  Otherwise, if 'y' isn't just
a variable or value, unexpected things happen.  LSMSWAP(3 ^ 2,1) might not
do what you expect:  3 ^ 2 << 8 | 1 = 515 , but (3 ^ 2) << 8 | 1 = 257.

-- 
Patrick Williams
