Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B94A41A003D
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 16:36:44 +1100 (AEDT)
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Feb 2016 00:36:42 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 00:36:39 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id DB5CE38C8026
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 00:36:38 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1B5acjI34209794
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 05:36:38 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1B5acak004427
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 00:36:38 -0500
Received: from birb.localdomain ([9.83.0.6])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1B5aQIL003881; Thu, 11 Feb 2016 00:36:37 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 777552286E20; Thu, 11 Feb 2016 16:36:18 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: andrew@aj.id.au, OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
In-Reply-To: <1455152677.3153.81.camel@aj.id.au>
References: <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Thu, 11 Feb 2016 16:36:18 +1100
Message-ID: <87io1vq04t.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021105-0057-0000-0000-00000364AFD0
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
X-List-Received-Date: Thu, 11 Feb 2016 05:36:45 -0000

Andrew Jeffery <andrew@aj.id.au> writes:
> I realise this has already been merged, but I feel like I should point
> out some issues below for future improvements.

Perhaps unreviewed code shouldn't be merged. Especially considering that
there's been so many comments on so many patches in this project.

-- 
Stewart Smith
OPAL Architect, IBM.
