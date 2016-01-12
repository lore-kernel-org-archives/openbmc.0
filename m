Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C7DDD1A06BB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 16:11:41 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jan 2016 22:11:39 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 22:11:37 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 213BD1FF0046
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 21:59:47 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C5Ba4l24576136
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 22:11:36 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C5Barv017358
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 22:11:36 -0700
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.230])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C5BRZ6016744; Mon, 11 Jan 2016 22:11:36 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id BD9EC22B7CFE; Tue, 12 Jan 2016 16:11:25 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH openbmc] pflash and linux updates
In-Reply-To: <1452531631-14153-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452531631-14153-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452531631-14153-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jan 2016 16:11:25 +1100
Message-ID: <87oacrcrgi.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011205-0009-0000-0000-00001153B45D
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
X-List-Received-Date: Tue, 12 Jan 2016 05:11:42 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
>  meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb  | 2 +-

I'm not sure what part of this pulls in pflash - but unless it's from
the skiboot repo, please don't do it :)

>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> index 8958215..a898c78 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
>  LINUX_VERSION ?= "4.3"
>  LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
>  
> -SRCREV="openbmc-20151210-1"
> +SRCREV="openbmc-20151217-1"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> index 28ed2d2..87327be 100644
> --- a/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> +++ b/meta-phosphor/common/recipes-phosphor/skeleton/skeleton.bb
> @@ -16,7 +16,7 @@ DEPENDS += "glib-2.0"
>  RDEPENDS_${PN} += "python-subprocess python-tftpy"
>  SRC_URI += "git://github.com/openbmc/skeleton"
>  
> -SRCREV = "14caa527e0b10e0aece119693bf003ec95929370"
> +SRCREV = "08b2b46a6df8b5cf93fcd17453072a2ddb48b598"
>  
>  S = "${WORKDIR}"
>  
> -- 
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

-- 
Stewart Smith
OPAL Architect, IBM.
