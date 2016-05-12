Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r53FN3K3wzDqCQ
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 16:37:28 +1000 (AEST)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Thu, 12 May 2016 16:37:27 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 12 May 2016 16:37:25 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 145342CE805F
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 16:37:14 +1000 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4C6b0bE61079770
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 16:37:08 +1000
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4C6a8Gl016119
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 16:36:08 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4C6a81A014700; Thu, 12 May 2016 16:36:08 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id ADACBA0330;
 Thu, 12 May 2016 16:34:56 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 54C36E3A65;
 Thu, 12 May 2016 16:34:46 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 093D39404ED; Thu, 12 May 2016 16:34:45 +1000 (AEST)
Date: Thu, 12 May 2016 16:34:45 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 0/8] NSCI Improvement
Message-ID: <20160512063445.GA8400@gwshan>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8Xf3-THRo2bj-+kd8-oU-qqwt=TR=KSV_sdoDj1t7ZPb_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf3-THRo2bj-+kd8-oU-qqwt=TR=KSV_sdoDj1t7ZPb_A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051206-1618-0000-0000-000045BCC6C3
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
X-List-Received-Date: Thu, 12 May 2016 06:37:28 -0000

On Wed, May 11, 2016 at 03:13:40PM +0930, Joel Stanley wrote:
>On Mon, May 9, 2016 at 11:17 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>> This series bases on branch dev-4.4. Couple of things are improved as below:
>>
>>    * Remove netlink stuff as nobody starts to use it. Lets focus on the core
>>      for now.
>>    * The available packages and channels are enumerated for once when user
>>      brings up the network interface for the first time. Afterwords, less
>>      time (3 to 4 seconds) are reduced to bring up the interface.
>>    * Explicitly enable AEN that is disabled by default.
>>    * The LSC (Link Status Change) AEN handler helps switching active channel
>>      properly after the packet can be received without problem. In order to
>>      listen for ingress AEN packet, the MAC has to be ready for reception
>>      after the interface is brought up.
>>
>> This series is to fix the bug: https://github.com/openbmc/linux/issues/61
>> With this series applied (based on dev-4.4), it should fix the issue. Note
>> that I had the test on palm4-bmc.
>>
>>    * From uboot, download the kernel image;
>>    * Unplug the ethernet cable;
>>    * From uboot, boot the kernel image;
>>    * Configure the ethernet interface when the kernel boots up completely.
>>      The NCSI interface should be down;
>>    * Plug the cable, the NCSI interface is up automatically. The interface
>>      is pingable from external.
>
>Great work Gavin. Thanks for getting to the bottom of this and testing
>the patches.
>
>I've applied them to dev-4.4 and tagged a release that includes your changes:
>
> https://github.com/openbmc/linux/releases/tag/openbmc-20160511-1
>

Thanks, Joel. Note that I had no chance to test it out on barreleye where
the issue was reported. I cannot find a barreleye BMC in local lab. could
you please tell if I can access any one of this kind of machine in case
you know one?

Thanks,
Gavin

>Cheers,
>
>Joel
>
