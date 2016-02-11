Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C73861A0018
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 09:24:15 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Feb 2016 15:24:13 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 15:24:11 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 033811FF001E
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 15:12:20 -0700 (MST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BMOA4235782838
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 22:24:10 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BMOAGa032100
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 17:24:10 -0500
Received: from birb.localdomain ([9.83.0.6])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1BMNwdI031023; Thu, 11 Feb 2016 17:24:09 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 3DC8D2286E20; Fri, 12 Feb 2016 09:23:56 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2 v2] serial/aspeed-vuart: Only disable host tx discard
 when serial port is in use
In-Reply-To: <1455179366-13956-1-git-send-email-jk@ozlabs.org>
References: <1455179165-13252-1-git-send-email-jk@ozlabs.org>
 <1455179366-13956-1-git-send-email-jk@ozlabs.org>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 12 Feb 2016 09:23:56 +1100
Message-ID: <87bn7mophf.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021122-0021-0000-0000-000016F944A9
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
X-List-Received-Date: Thu, 11 Feb 2016 22:24:16 -0000

Jeremy Kerr <jk@ozlabs.org> writes:
> OpenPOWER firmware doesn't like it when the host-side of the VUART's
> FIFO is not drained. This change only disables host TX discard mode when
> the port has been opened.

Do we have what's arguably a bug somewhere?

-- 
Stewart Smith
OPAL Architect, IBM.
