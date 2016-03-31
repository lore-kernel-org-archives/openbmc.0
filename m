Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qbghB1y8nzDq6y
 for <openbmc@lists.ozlabs.org>; Fri,  1 Apr 2016 10:29:14 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 31 Mar 2016 17:29:11 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 31 Mar 2016 17:29:09 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 298F83E4003F
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 17:29:09 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id u2VNT8iT40239290
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 16:29:09 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2VNT89g013542
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2016 17:29:08 -0600
Received: from birb.localdomain ([9.83.7.76])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u2VNSvFl013177; Thu, 31 Mar 2016 17:29:07 -0600
Received: by birb.localdomain (Postfix, from userid 1000)
 id 56A5D2298E5D; Fri,  1 Apr 2016 10:28:53 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: Re: obmcutil is slow, nonsensical output
In-Reply-To: <1459433964519.44939@RACKSPACE.COM>
References: <87wpojtcb4.fsf@birb.au.ibm.com>
 <1459433964519.44939@RACKSPACE.COM>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 01 Apr 2016 10:28:53 +1100
Message-ID: <874mbmtefe.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16033123-8236-0000-0000-00001C422718
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
X-List-Received-Date: Thu, 31 Mar 2016 23:29:14 -0000

Kenneth Wilke <kenneth.wilke@RACKSPACE.COM> writes:
> We see the same behavior on the Barreleye servers, the obmcutil is
> quite slow but we've gotten used to it. The poweron and poweroff
> commands usually return either this message or a python backtrace if
> the backend dbus services are still warming up.

Python backtrace isn't very elegant :(

-- 
Stewart Smith
OPAL Architect, IBM.
