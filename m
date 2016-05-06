Return-Path: <benh@au1.ibm.com>
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r1pGD0ynGzDq6B
 for <openbmc@lists.ozlabs.org>; Sat,  7 May 2016 09:41:55 +1000 (AEST)
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Sat, 7 May 2016 09:41:54 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sat, 7 May 2016 09:41:51 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id B3FC52CE8054
 for <openbmc@lists.ozlabs.org>; Sat,  7 May 2016 09:41:49 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u46Nff0538928404
 for <openbmc@lists.ozlabs.org>; Sat, 7 May 2016 09:41:49 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u46NfH7a031140
 for <openbmc@lists.ozlabs.org>; Sat, 7 May 2016 09:41:17 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u46NfGme030775; Sat, 7 May 2016 09:41:17 +1000
Received: from pasglop (unknown [9.192.180.145])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D377BA0117;
 Sat,  7 May 2016 09:40:51 +1000 (AEST)
Message-ID: <1462578052.20290.61.camel@au1.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, Sertac Cakici <cakici@us.ibm.com>
Date: Sat, 07 May 2016 09:40:52 +1000
In-Reply-To: <20160506113218.4adf5db7@camb691>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com> <20160506113218.4adf5db7@camb691>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050623-0033-0000-0000-000005CD2170
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2016 23:41:56 -0000

On Fri, 2016-05-06 at 11:32 +1000, Cyril Bur wrote:
> 
> This is something I'm trying to confirm. The firestones I and Gavin
> have access to appear to be prerelease, so anythings possible.
>
> I am struggling to get access to a release firestone, when I do I'll
> check if Gavins patch is necessary there. If so, then we'll have to
> start asking those sorts of questions.

So I talked to Sertac and he'll get you access to a GA level Firestone
next week. It should be wired as proper RGMII, ie, it shoul work...

Cheers,
Ben.
