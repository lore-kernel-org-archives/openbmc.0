Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTh3x1KqnzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 16:25:32 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 21 Mar 2016 23:25:30 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 Mar 2016 23:25:28 -0600
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id B651819D8045
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2016 23:13:20 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2M5PQYm30474268
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2016 22:25:26 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2M5PP2b019193
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2016 23:25:26 -0600
Received: from birb.localdomain (birb.au.ibm.com [9.185.16.180])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2M5PPhV019149; Mon, 21 Mar 2016 23:25:25 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 7FDC7229EAA0; Tue, 22 Mar 2016 16:25:21 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Chris Austen <austenc@us.ibm.com>, openbmc@lists.ozlabs.org,
 Gus Schlachter <gussch@us.ibm.com>, Russel L Young <youngr1@us.ibm.com>
Subject: Re: Event Log parser
In-Reply-To: <201603220522.u2M5Mn0f014732@d01av04.pok.ibm.com>
References: <201603220522.u2M5Mn0f014732@d01av04.pok.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 22 Mar 2016 16:25:21 +1100
Message-ID: <8760wfytha.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16032205-0009-0000-0000-000016432447
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
X-List-Received-Date: Tue, 22 Mar 2016 05:25:33 -0000

Chris Austen <austenc@us.ibm.com> writes:
> Here's a first pass at the event log parser. It has the stuff for the
> BMC viewer, the eSEL for (not sure really) and the Debug Data is a
> good old fashion PEL. Thoughts?

Using opal-elog-parse to parse the PEL?

-- 
Stewart Smith
OPAL Architect, IBM.
