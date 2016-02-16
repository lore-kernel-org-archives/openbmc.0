Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6B1B31A0329
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 18:35:52 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 16 Feb 2016 00:35:49 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 16 Feb 2016 00:35:47 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id A65B81FF0028
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 00:23:56 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1G7Zku929098142
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 00:35:46 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1G7Zkf4003460
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 00:35:46 -0700
Received: from birb.localdomain ([9.83.1.95])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1G7ZbWE002965; Tue, 16 Feb 2016 00:35:45 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id D4A902286E20; Tue, 16 Feb 2016 18:35:35 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Jeremy Kerr <jk@ozlabs.org>, andrew@aj.id.au,
 Chris Austen <austenc@us.ibm.com>
Cc: openbmc@lists.ozlabs.org, openbmc-patches@stwcx.xyz
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
In-Reply-To: <56BD5140.5010409@ozlabs.org>
References: <87io1vq04t.fsf@linux.vnet.ibm.com>
 <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
 <201602110544.u1B5ilIu004589@d03av01.boulder.ibm.com>
 <87vb5vne33.fsf@linux.vnet.ibm.com> <1455232163.2576.27.camel@aj.id.au>
 <56BD5140.5010409@ozlabs.org>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 16 Feb 2016 18:35:35 +1100
Message-ID: <87io1pkszc.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021607-8236-0000-0000-00001627D0C6
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
X-List-Received-Date: Tue, 16 Feb 2016 07:35:53 -0000

Jeremy Kerr <jk@ozlabs.org> writes:
>> Maybe this should be a separate thread, but anyway: I find the mailing
>> -list/github split a little awkward - is there a way we can improve
>> this? Use one xor the other?
>
> I'd love to move to single option too - to keep to our
> open-source-project roots, my vote is for using the mailing list.
>
> However, the roadblock here is that our developers would need to be able
> to email patches in an acceptable format, and I don't think many of our
> contributors have to tools and/or infrastructure to do that at the
> moment. If that were to be addressed, I think mailing-list based
> workflow would be a great benefit to the project.

LTC IMAP accounts should be available to everyone - if they put
OpenBMC/OpenPower in their BluePages profile, the LTC IMAP admins should
approve it.

You can, of course, not use IBM Verse corporate email, because it's
broken and when I file bugs they refuse to fix them or string us along
for (literally) years.

-- 
Stewart Smith
OPAL Architect, IBM.
