Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 265D71A0007
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 14:32:47 +1100 (AEDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 18 Nov 2015 20:32:44 -0700
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 18 Nov 2015 20:32:44 -0700
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id D6A456E803F
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 22:20:52 -0500 (EST)
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tAJ3WgBS55902352
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2015 03:32:42 GMT
Received: from d01av02.pok.ibm.com (localhost [127.0.0.1])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAJ3WgV3017672
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 22:32:42 -0500
Received: from oc8180480414.ibm.com ([9.81.199.205])
 by d01av02.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 tAJ3WXv3017217; Wed, 18 Nov 2015 22:32:41 -0500
Received: by oc8180480414.ibm.com (Postfix, from userid 500)
 id CF736575C; Thu, 19 Nov 2015 14:32:31 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Initial autotools support
In-Reply-To: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447902029-2805-1-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.18+16~gec02089 (http://notmuchmail.org) Emacs/23.1.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 19 Nov 2015 14:32:31 +1100
Message-ID: <m3vb8yslyo.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15111903-0033-0000-0000-000006E65811
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
X-List-Received-Date: Thu, 19 Nov 2015 03:32:48 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> This switches us over to use autotools rather than custom makefiles.
> This brings us into line with the defacto standard for building
> userspace.

I haven't converted everything yet, and I've really only started to poke
at what makes sense for the current structure of everything.

There's a magic thing we could use for plugins too, which allows in tree
and out of tree, and I haven't started using it.
See https://autotools.io/libtool/plugins.html

But first I wanted to raise the possibility of autotools and what it
kind of looks like.

We should also move to explicit exposure of symbols rather than
exporting everything.

thoughts?
