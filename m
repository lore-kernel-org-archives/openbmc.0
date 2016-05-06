Return-Path: <benh@au1.ibm.com>
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r1D3z6w30zDq5m
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 11:01:03 +1000 (AEST)
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Fri, 6 May 2016 11:01:02 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 6 May 2016 11:01:00 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: benh@au1.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 138242CE8059
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 11:01:00 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4610qGt64946364
 for <openbmc@lists.ozlabs.org>; Fri, 6 May 2016 11:01:00 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4610RR4008591
 for <openbmc@lists.ozlabs.org>; Fri, 6 May 2016 11:00:27 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4610Q6M007758; Fri, 6 May 2016 11:00:27 +1000
Received: from pasglop.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 36D00A023F;
 Fri,  6 May 2016 11:00:02 +1000 (AEST)
Message-ID: <1462496402.20290.49.camel@au1.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Joel Stanley <joel@jms.id.au>, Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Gavin Shan
 <gwshan@linux.vnet.ibm.com>
Date: Fri, 06 May 2016 11:00:02 +1000
In-Reply-To: <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050601-1618-0000-0000-000045A82DE7
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
X-List-Received-Date: Fri, 06 May 2016 01:01:04 -0000

On Thu, 2016-05-05 at 22:55 +0930, Joel Stanley wrote:
> On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com>
> wrote:
> > 
> > From: Gavin Shan <gwshan@linux.vnet.ibm.com>
> > 
> > I don't know the specific PHY model deployed on Firestone BMC, but
> > currently used one (PHY_ID_BCM54210E) isn't correct. BCM54210E
> > supports 1000base-T but the PHY on Firestone BMC shouldn't support
> > that mode as uboot uses 100base-T mode.
> > 
> > When exposing 1000base-T capability, the MAC is forced to have the
> > same mode though the PHY is working in 100base-T mode in fact. It
> > causes the mode mismatch between PHY/MAC and the ethernet network
> > doesn't work.
> > 
> > It's a temporary fix. After the PHY model is confirmed, we need
> > to enable the correct PHY driver instead current one for BCM54210E.
> > 
> > Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> > 
> > [Cyril]
> > The plot thickens, it does appear that this IS the correct PHY on
> > firestones. This patch is definitely required for networking to be
> > functional though.
> We should get someone in Austin to boot a firestone without this
> patch
> and see what it does. You shouldn't need a pdu as long as you get it
> right the first time :)

The MAC in the ast2400 is a gigabit MAC. So it should all work normally
at 1000bT. If not, then something is wrong that needs to be
investigated:

	- Either the interface between MAC and PHY isn't wired
correctly (RGMII vs. RMII, RGMII uses more pins and a diff. clock)

	- Or we don't set a setting or strap somewhere to switch
between those modes (hardware strapping bit[7:6], SCU[A0], ...)

	- Both ?

If we are indeed limited to 100bT, then we should expose that one way
or another in the device-tree in order to limit the advertized speed in
the PHY driver.

Cheers,
Ben.
