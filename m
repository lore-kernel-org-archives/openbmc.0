Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r1Tph6w7hzDq5f
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 21:20:28 +1000 (AEST)
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Fri, 6 May 2016 21:20:27 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 6 May 2016 21:20:25 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 95D9F2BB0054
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 21:20:24 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u46BKGJW2359706
 for <openbmc@lists.ozlabs.org>; Fri, 6 May 2016 21:20:24 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u46BJpsw030298
 for <openbmc@lists.ozlabs.org>; Fri, 6 May 2016 21:19:52 +1000
Received: from gwshan ([9.192.181.66])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u46BJp6g030036; Fri, 6 May 2016 21:19:51 +1000
Received: by gwshan (Postfix, from userid 1000)
 id CEEF2942BE3; Fri,  6 May 2016 21:19:34 +1000 (AEST)
Date: Fri, 6 May 2016 21:19:34 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
Message-ID: <20160506111934.GA9580@gwshan>
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462496402.20290.49.camel@au1.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050611-0013-0000-0000-0000050F5C0B
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
X-List-Received-Date: Fri, 06 May 2016 11:20:29 -0000

On Fri, May 06, 2016 at 11:00:02AM +1000, Benjamin Herrenschmidt wrote:
>On Thu, 2016-05-05 at 22:55 +0930, Joel Stanley wrote:
>> On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com>
>> wrote:
>> > 
>> > From: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> > 
>> > I don't know the specific PHY model deployed on Firestone BMC, but
>> > currently used one (PHY_ID_BCM54210E) isn't correct. BCM54210E
>> > supports 1000base-T but the PHY on Firestone BMC shouldn't support
>> > that mode as uboot uses 100base-T mode.
>> > 
>> > When exposing 1000base-T capability, the MAC is forced to have the
>> > same mode though the PHY is working in 100base-T mode in fact. It
>> > causes the mode mismatch between PHY/MAC and the ethernet network
>> > doesn't work.
>> > 
>> > It's a temporary fix. After the PHY model is confirmed, we need
>> > to enable the correct PHY driver instead current one for BCM54210E.
>> > 
>> > Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
>> > 
>> > [Cyril]
>> > The plot thickens, it does appear that this IS the correct PHY on
>> > firestones. This patch is definitely required for networking to be
>> > functional though.
>> We should get someone in Austin to boot a firestone without this
>> patch
>> and see what it does. You shouldn't need a pdu as long as you get it
>> right the first time :)
>
>The MAC in the ast2400 is a gigabit MAC. So it should all work normally
>at 1000bT. If not, then something is wrong that needs to be
>investigated:
>
>	- Either the interface between MAC and PHY isn't wired
>correctly (RGMII vs. RMII, RGMII uses more pins and a diff. clock)
>
>	- Or we don't set a setting or strap somewhere to switch
>between those modes (hardware strapping bit[7:6], SCU[A0], ...)
>
>	- Both ?
>
>If we are indeed limited to 100bT, then we should expose that one way
>or another in the device-tree in order to limit the advertized speed in
>the PHY driver.
>

Ben, thanks for review. Yeah, it's a temporary (tentative) fixup. The
BCM54210E driver isn't used by farady driver only, it's not reasonable
to limit the capability in the PHY driver as it's going to affect other
driver. As you suggested in another thread, the best option would be
removing the 1000BASE-T capability in farady driver after the PHY is
probed, before it's started (connected) when it's asked by device tree.

I will investigate it when getting a chance. It seems Pin multiplexing
isn't configured correctly for RGMII in uboot. I dumped the MAC control
register (offset: 0x50). We have 100Mb mode there in uboot.

Thanks,
Gavin

>Cheers,
>Ben.
>
