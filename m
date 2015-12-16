Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A69451A0B9B
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 17:23:10 +1100 (AEDT)
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 15 Dec 2015 23:23:08 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 Dec 2015 23:23:07 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id B293D19D8026
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:11:11 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBG6N6lV26083532
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:23:06 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBG6N6in017101
 for <openbmc@lists.ozlabs.org>; Tue, 15 Dec 2015 23:23:06 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBG6N5e9017056; Tue, 15 Dec 2015 23:23:06 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 9F75F2286E32; Wed, 16 Dec 2015 17:23:04 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: kenneth-wilke <kenneth.wilke@rackspace.com>
Subject: Re: [PATCH openbmc] Added ubuntu dependencies to readme
In-Reply-To: <1450218041-11964-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218041-11964-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450218041-11964-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Wed, 16 Dec 2015 17:23:04 +1100
Message-ID: <87si327vzr.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121606-0005-0000-0000-00001AAAC15C
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
X-List-Received-Date: Wed, 16 Dec 2015 06:23:11 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: kenneth-wilke <kenneth.wilke@rackspace.com>
> ---
>  README.md | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/README.md b/README.md
> index 49d4f94..0df0ad4 100644
> --- a/README.md
> +++ b/README.md
> @@ -8,9 +8,15 @@ OpenBMC uses Yocto/Open-Embedded for a build system, which supports an
>  out-of-tree build.  It is recommended that you create an empty directory
>  somewhere to hold the build.  This directory will get big.
>  
> +On Ubuntu 14.04 the following packages are required to build the default target
> +```
> +sudo apt-get install -y git build-essential libsdl1.2-dev texinfo gawk chrpath diffstat
> +```
> +
>  To start a build:
>  
> +```
>      cd <builddir>
>      . <repodir>/openbmc-env
>      bitbake obmc-phosphor-image
> -
> +```

(not saying you have to do this)

But i've been experimenting with including a skeleton Dockerfile in
projects to say "here are the build deps on platform X" which is then
programatically testable.

Might be worth it here too.
