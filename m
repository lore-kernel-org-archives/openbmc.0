Return-Path: <benh@au1.ibm.com>
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3jxx5wS5zDq9s
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 12:34:29 +1000 (AEST)
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Tue, 10 May 2016 12:34:27 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 May 2016 12:34:25 +1000
X-IBM-Helo: d23dlp03.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 85A943578057
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 12:34:24 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4A2YGok4850036
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 12:34:24 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4A2XpLp029718
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 12:33:51 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4A2Xp22028883; Tue, 10 May 2016 12:33:51 +1000
Received: from pasglop.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EF2FEA0257;
 Tue, 10 May 2016 12:33:26 +1000 (AEST)
Message-ID: <1462847606.20290.137.camel@au1.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Cyril Bur <cyrilbur@gmail.com>, Sertac Cakici <cakici@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Raguraman Tumaati-Krishnan
 <ragu@us.ibm.com>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>, benh@ozlabs.au.ibm.com
Date: Tue, 10 May 2016 12:33:26 +1000
In-Reply-To: <20160510103800.730f98fa@camb691>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com> <20160506113218.4adf5db7@camb691>
 <1462578052.20290.61.camel@au1.ibm.com>
 <201605091951.u49Jp4Yc017604@d03av05.boulder.ibm.com>
 <20160510103800.730f98fa@camb691>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051002-0017-0000-0000-00000483B4E0
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
X-List-Received-Date: Tue, 10 May 2016 02:34:29 -0000

On Tue, 2016-05-10 at 10:38 +1000, Cyril Bur wrote:
> I got access to fr112 and only managed to get tftp booting going on it
> yesterday, all good though, I've tested what I need. Interestingly on that
> machine networking behaves as we expected and Gavins workaround isn't needed.
> 
> I know this is a long shot but do you know how our firestones in Canberra (which
> are clearly pre GA) might differ?

Cyril, could it just be a different uBoot messing with the pin/strap
config ?

Ben.
