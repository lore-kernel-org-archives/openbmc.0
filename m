Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DCDE41A009B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 14:56:07 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 23 Nov 2015 20:56:05 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 23 Nov 2015 20:56:04 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 6884F19D8040
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:44:10 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id tAO3u3x223134412
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:56:03 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tAO3u33t001037
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:56:03 -0700
Received: from oc8180480414.ibm.com ([9.190.177.199])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tAO3u2qq000996; Mon, 23 Nov 2015 20:56:03 -0700
Received: by oc8180480414.ibm.com (Postfix, from userid 500)
 id 6B5605763; Tue, 24 Nov 2015 14:56:01 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event v3 1/3] Add delete for error logs
In-Reply-To: <1448331022-8770-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448331022-8770-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448331022-8770-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.18+16~gec02089 (http://notmuchmail.org) Emacs/23.1.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 24 Nov 2015 14:56:01 +1100
Message-ID: <m3io4soxta.fsf@oc8180480414.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15112403-0017-0000-0000-00000FC38DD0
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
X-List-Received-Date: Tue, 24 Nov 2015 03:56:08 -0000

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Chris Austen <austenc@us.ibm.com>
>
> This supports both deleting individual logs
> and all logs
> ---
>  Makefile         |   1 +
>  event_messaged.c | 175 +++++++++++++++++++++++++++++++------------------------
>  list.c           |  75 ++++++++++++++++++++++++
>  list.h           |  23 ++++++++

Don't invent a new linked list, we already have CCAN list, and the
approvals to use it (we ship it in skiboot).

The CCAN list provides useful iterators and is inline with the
structure, which is much more efficient.
