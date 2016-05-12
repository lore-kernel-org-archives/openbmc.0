Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r545g1zS1zDqBs
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:15:51 +1000 (AEST)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 12 May 2016 17:15:49 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 May 2016 17:15:46 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id D29A02CE8085
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:15:15 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4C7Evnl42074220
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:15:05 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4C7EIDk009311
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:14:18 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4C7EIlP008701; Thu, 12 May 2016 17:14:18 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 276FBA0330;
 Thu, 12 May 2016 17:12:48 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id E626FE3A65;
 Thu, 12 May 2016 17:12:47 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 9A144940558; Thu, 12 May 2016 17:12:47 +1000 (AEST)
Date: Thu, 12 May 2016 17:12:47 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 0/8] NSCI Improvement
Message-ID: <20160512071247.GA12372@gwshan>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xf3-THRo2bj-+kd8-oU-qqwt=TR=KSV_sdoDj1t7ZPb_A@mail.gmail.com>
 <20160512063445.GA8400@gwshan>
 <CACPK8XeTVbarxS5+ujEKt2yVvP5kjeChOPXaRH6sysQBr5y+-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XeTVbarxS5+ujEKt2yVvP5kjeChOPXaRH6sysQBr5y+-A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051207-1618-0000-0000-000045BD0CD6
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
X-List-Received-Date: Thu, 12 May 2016 07:15:51 -0000

On Thu, May 12, 2016 at 04:32:26PM +0930, Joel Stanley wrote:
>On Thu, May 12, 2016 at 4:04 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> Thanks, Joel. Note that I had no chance to test it out on barreleye where
>> the issue was reported. I cannot find a barreleye BMC in local lab. could
>> you please tell if I can access any one of this kind of machine in case
>> you know one?
>
>Currently the only ones we have access to are in a lab at IBM in
>Austin. I'll send you the details.
>
>I think we should have another go at sending the patches upstream. Can
>you create a series against 4.6? I'm looking in to finding us some
>reviewers; I'll let you know when I hear something.
>

Sure, I will do that after finishing the PCI hotplug stuff at hand.
Thanks for your helps (machine access & code review), Joel.

Thanks,
Gavin
