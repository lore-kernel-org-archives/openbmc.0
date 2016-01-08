Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BF4861A01E3
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2016 15:41:41 +1100 (AEDT)
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 7 Jan 2016 21:41:39 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 7 Jan 2016 21:41:37 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 3D70D19D804C
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 21:29:39 -0700 (MST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u084fapT31654108
 for <openbmc@lists.ozlabs.org>; Fri, 8 Jan 2016 04:41:36 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u084fabE022830
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 23:41:36 -0500
Received: from birb.localdomain ([9.81.192.176])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u084fOuU021990; Thu, 7 Jan 2016 23:41:35 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 4F162229EAAE; Fri,  8 Jan 2016 15:41:22 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Peng Fei BG Gou <shgoupf@cn.ibm.com>
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid v5] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <201601070708.u0778aOd023530@d23av05.au.ibm.com>
References: <201601070708.u0778aOd023530@d23av05.au.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 08 Jan 2016 15:41:22 +1100
Message-ID: <87k2nkhedp.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16010804-0025-0000-0000-0000202EB0FC
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
X-List-Received-Date: Fri, 08 Jan 2016 04:41:42 -0000

Peng Fei BG Gou <shgoupf@cn.ibm.com> writes:

> Thanks Stewart for your comments.
> Please see my answers starting with >>>> [pengfei]:

It'd be better to configure your mail client to do proper internet style
replies, although I see "X-Mailer: Lotus Domino Web Server Build
V851SAAS_12072015_FP3 December 17, 2015" - which likely means you are
using IBM Verse. IBM Verse is not suitable for open source work - you'll
have to get an IBM LTC IMAP account (which has its own problems on still
reyling on some IBM mail infrastructure) or sign up for GMail.

Although, since you're in China, signing up for something like GMail may
be problematic.

>     > --- a/chassishandler.h
>     > +++ b/chassishandler.h
>     > @@ -3,21 +3,39 @@
>     > 
>     > #include <stdint.h>
>     > 
>     > +// TODO: Petitboot requires 8 bytes of response
>     > +// however only 5 of them are used. The remaining
>     > +// 3 bytes are not used in petitboot and the value
>     > +// of them are all zero.
>     
>     where? why? why will it never change?
>     
>     
>     >>>> [pengfei]: Currently the target of this patch is to add
>     support for what the current petitboot requires, so I don't
>     believe we need to do things beyond that with this patch.

What if we update petitboot? AT least historically, BMC and host
firmware have not always been updated in tandem.

-- 
Stewart Smith
OPAL Architect, IBM.
