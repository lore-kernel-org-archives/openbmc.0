Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6107F1A0038
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 17:35:49 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Feb 2016 01:35:47 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 01:35:44 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 65916C9003E
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 01:35:41 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1B6Zhqh29753406
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 06:35:43 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1B6Zhvq032509
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 01:35:43 -0500
Received: from birb.localdomain ([9.83.0.6])
 by d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1B6ZVrt031764
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 01:35:42 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 561312286E20; Thu, 11 Feb 2016 17:35:29 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Redfish or Irrelevance?
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 11 Feb 2016 17:35:29 +1100
Message-ID: <87a8n7pxe6.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021106-0045-0000-0000-0000034D0FE1
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
X-List-Received-Date: Thu, 11 Feb 2016 06:35:50 -0000

So, it seems that the standard RESTful API to BMCs is RedFish. With HP,
Intel, Dell and others on board (with at least HP iLO shipping product).

There's already an OpenStack Ironic driver for Redfish and a bunch of
other tooling.

It feels that not going this route would paint us into a corner of
irrelevance and being the tricky platform to deal with.

See https://www.dmtf.org/standards/redfish

thoughts?
-- 
Stewart Smith
OPAL Architect, IBM.
