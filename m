Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B55591A0050
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2016 11:58:16 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 11 Jan 2016 17:58:14 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 11 Jan 2016 17:58:12 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id AA4F719D8047
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 17:46:13 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u0C0wBu828704900
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 17:58:11 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0C0wBmd015185
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2016 17:58:11 -0700
Received: from birb.localdomain ([9.83.3.215])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u0C0w0aT014580; Mon, 11 Jan 2016 17:58:10 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 1F7EC22B7CFE; Tue, 12 Jan 2016 11:57:56 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Subject: Re: DBUS interface documentation
In-Reply-To: <569357BE.1030403@ozlabs.org>
References: <569357BE.1030403@ozlabs.org>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 12 Jan 2016 11:57:56 +1100
Message-ID: <8737u3fwbv.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011200-0029-0000-0000-00000F8A1BF7
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
X-List-Received-Date: Tue, 12 Jan 2016 00:58:17 -0000

Jeremy Kerr <jk@ozlabs.org> writes:
> We're building up quite a collection of dbus interfaces for OpenBMC, but 
> our interface documentation is disappointingly sparse:
>
>    https://github.com/openbmc/docs/blob/master/dbus-interfaces.md
>
> If you've implemented (or are implementing) a DBUS API, could you also 
> submit a pull request to update this document with the new API?
>
> This will also allow us to have a bit of a review of the new interfaces 
> before they're committed.

I'd suggest automatic NACK for anything that doesn't extend docs and add
a decent test suite of new calls.

-- 
Stewart Smith
OPAL Architect, IBM.
