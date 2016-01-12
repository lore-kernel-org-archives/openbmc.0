Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 764951A06BB
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 15:17:05 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jan 2016 21:17:03 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 21:16:57 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 6F3823E40030
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 21:16:57 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C4GvrU28180732
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 21:16:57 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C4Gvub026364
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 21:16:57 -0700
Received: from birb.localdomain (birb.au.ibm.com [9.185.120.230])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0C4GmkE025948; Mon, 11 Jan 2016 21:16:56 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 7476222B7CFE; Tue, 12 Jan 2016 15:16:47 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] support for W25Q256BV
In-Reply-To: <1452529251-12764-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452529251-12764-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452529251-12764-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jan 2016 15:16:47 +1100
Message-ID: <87egdne8k0.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011204-0029-0000-0000-00000F8AF0D3
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
X-List-Received-Date: Tue, 12 Jan 2016 04:17:06 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
>  objects/pflash/libflash/libflash.c | 1 +

We should also *really* stop the stupidity of having a copy of pflash
laying around.

Just this week we're dealing with someone using an ancient pflash that
they got from who-knows-where with a bunch of known bugs.

Versions of software from random git revisions during development from
6+ months ago isn't a good thing.

-- 
Stewart Smith
OPAL Architect, IBM.
