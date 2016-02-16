Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4BF1A000B
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 18:34:04 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 16 Feb 2016 00:34:01 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 16 Feb 2016 00:33:58 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 4C0DD19D803E
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 00:21:55 -0700 (MST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1G7XqsS27853054
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 07:33:52 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1G7ULl1026255
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 02:30:22 -0500
Received: from birb.localdomain ([9.83.1.95])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1G7U9RS025953; Tue, 16 Feb 2016 02:30:20 -0500
Received: by birb.localdomain (Postfix, from userid 1000)
 id 472E92286E20; Tue, 16 Feb 2016 18:33:37 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Chris Austen <austenc@us.ibm.com>, "andrew\@aj.id.au" <andrew@aj.id.au>
Cc: openbmc-patches <openbmc-patches@stwcx.xyz>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
In-Reply-To: <201602120312.u1C3CHwh000341@d01av01.pok.ibm.com>
References: <201602120312.u1C3CHwh000341@d01av01.pok.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Tue, 16 Feb 2016 18:33:37 +1100
Message-ID: <87lh6lkt2m.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021607-0013-0000-0000-00001CE62A6B
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
X-List-Received-Date: Tue, 16 Feb 2016 07:34:04 -0000

Chris Austen <austenc@us.ibm.com> writes:
> Would it make sense to integrate gerrit?

Do you have a place to run it publicly on the internet?

This is the sticking point in any discussion on self-hosting such tools.

review on the list does work, as does patchwork, and it requires no
special tools for people doing review that require a working internet
connection. It would also be consistent with similar open source
projects (e.g. skiboot, linux, buildroot, petitboot) so we wouldn't end
up with too much excessive variation on developer workflow.

While I do understand that IBM does not like to provide people with
standards compliant internet email... this shouldn't be a driving
factor on process, it should be a driving factor for people to get
actual internet email accounts though.

-- 
Stewart Smith
OPAL Architect, IBM.
