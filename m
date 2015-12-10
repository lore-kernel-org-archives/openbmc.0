Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 996D61A0F5E
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 14:16:15 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Wed, 9 Dec 2015 20:16:12 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Dec 2015 20:16:10 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 440633E4003B
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2015 20:16:10 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id tBA3GArD30539976
 for <openbmc@lists.ozlabs.org>; Wed, 9 Dec 2015 20:16:10 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBA3G9P0025675
 for <openbmc@lists.ozlabs.org>; Wed, 9 Dec 2015 20:16:09 -0700
Received: from birb.localdomain ([9.83.0.8])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 tBA3FwrV025123; Wed, 9 Dec 2015 20:16:08 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 0014022BBC0B; Thu, 10 Dec 2015 14:15:53 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: Re: [PATCH btbridge] Add timestamps to output messages
In-Reply-To: <1449615608-22161-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449615608-22161-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1449615608-22161-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 10 Dec 2015 14:15:53 +1100
Message-ID: <87k2onat92.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121003-0009-0000-0000-0000106F703A
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
X-List-Received-Date: Thu, 10 Dec 2015 03:16:16 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:
> From: Cyril Bur <cyril.bur@au1.ibm.com>
>
> ---
>  btbridged.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

Looks like a relatively sane way to do it.

Acked-by: Stewart Smith <stewart@linux.vnet.ibm.com>
