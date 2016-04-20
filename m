Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qqpcd02LSzDqZc
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 03:23:12 +1000 (AEST)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 20 Apr 2016 11:23:11 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 20 Apr 2016 11:23:10 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 277A51FF0055
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 05:22:55 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3KHN9x740435764
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 10:23:09 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3KHN9Ip026104
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2016 11:23:09 -0600
Received: from birb.localdomain ([9.80.196.127])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3KHN67Y025934; Wed, 20 Apr 2016 11:23:08 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 243E22298E45; Wed, 20 Apr 2016 10:22:47 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: johnhcwang <hsienchiang@gmail.com>
Subject: Re: [PATCH skeleton v6 17/20] Generate thermaltrip event
In-Reply-To: <1460703717-23960-18-git-send-email-openbmc-patches@stwcx.xyz>
References: <1460703717-23960-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1460703717-23960-18-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 20 Apr 2016 10:22:47 -0700
Message-ID: <87r3e0kxeg.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16042017-0009-0000-0000-00002176392D
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
X-List-Received-Date: Wed, 20 Apr 2016 17:23:14 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: johnhcwang <hsienchiang@gmail.com>
>
> Keep the original design from v2.10
[ 12 more citation lines. Click/Enter to show. ]
> ---
>  objects/info.c | 121
> ++++++++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 26 deletions(-)
>
> diff --git a/objects/info.c b/objects/info.c
> index 8e08974..386133c 100644
> --- a/objects/info.c
> +++ b/objects/info.c
> @@ -6,9 +6,37 @@
>  #include "i2c-dev.h"
>  #include "log.h"
>  
> +
> +#define NUM_CPU_CORE	12

It would be much better to detect this at runtime. There's likely to at
some point exist a chip with >12 cores.

>  const char *gService = "org.openbmc.Sensors";
> -const char *gObjPath = "/org/openbmc/sensors/temperature/cpu0/core0";
> -const char *gObjPath_o = "/org/openbmc/sensors/host/OccStatus";
> +const char *gCPU0ObjPath[NUM_CPU_CORE] =
> {"/org/openbmc/sensors/temperature/cpu0/core0",

Why not construct with snprintf() at runtime?

> +		if(HighestCPUtemp >= 90) {

Why is this hardcoded here?


-- 
Stewart Smith
OPAL Architect, IBM.
