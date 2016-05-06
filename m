Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r1DmG5jVRzDq5m
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2016 11:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=l1ffoQ6+; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id i5so9397636pag.3
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2016 18:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDJhUonZ3xh6gbo+wkiRH7qNgVV9fkNb42L0F0mopSI=;
 b=l1ffoQ6+m25GU8CgF++NLNWVHFSK6U98H/wJFstig3US5FhmgCjPh2VKYZwKeWcwpg
 moE3R0QzbWCTesQBkHkj5WeTUCKInCQby+GoeD397/MZ9XNuH2gkCFpS/tUveE4tl66Q
 G3IJAtwagM6JAYP758lgVjWxvs8Q/qO4qqje3l7OvlI7H0diMgHaBv4Fmx0S3CWL38Ej
 ogphc9O37oCfaq6tEHaDkDrccPimEE/jXPZujk2U3NMq3WKTT4fJu2YWoI2BoScxqVfZ
 zt5fl/FH0hbVOpmZ/o5q1HBM8gbuDjdCfNmSQNNBK137xDPNiih83borN3UHZsmdDGBK
 1LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDJhUonZ3xh6gbo+wkiRH7qNgVV9fkNb42L0F0mopSI=;
 b=P62hpqSxKqBorA6umQi0aLGWy7Scl0/vQgHT5iYtJnhXs8EyXOBw13qBm+qo0QqLnC
 lZciV1XR8VDokoIaP9UXa8R4sIQSaQQBiQgpEXbPR2FJlpxLeYTe47o3rW9CoqGCVd8m
 1inOV/9sfTTA2Pd1H8HbUZMVhtRYztTKbBKp3tMV7+hsk6PLwkSiI4lmEkpLIk64lQp+
 p0SGN874Zb8KJTGjDAQz8rzvCnB69c6JJNnGG7k4ITIRxomYujx8fPQZ6BpqOQ9rcjqg
 j4zA7TxK6fyVVIURmWZtHQ6j3SaM1aBvjCmP9ZHL/lCGJhN3ToupBIp0xezrwG7Ygtv5
 qLyg==
X-Gm-Message-State: AOPr4FXkI5PFEYSzuy0W9EgZJfIRaLRu/OKKHxjGRuLi2C9q/GMevNRl1+6Q6F0HjivpAQ==
X-Received: by 10.66.26.43 with SMTP id i11mr25286387pag.58.1462498348952;
 Thu, 05 May 2016 18:32:28 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id k65sm16440584pfj.31.2016.05.05.18.32.26
 (version=TLSv1/SSLv3 cipher=OTHER);
 Thu, 05 May 2016 18:32:28 -0700 (PDT)
Date: Fri, 6 May 2016 11:32:18 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Gavin Shan  <gwshan@linux.vnet.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
Message-ID: <20160506113218.4adf5db7@camb691>
In-Reply-To: <1462496402.20290.49.camel@au1.ibm.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 06 May 2016 01:32:31 -0000

On Fri, 06 May 2016 11:00:02 +1000
Benjamin Herrenschmidt <benh@au1.ibm.com> wrote:

> On Thu, 2016-05-05 at 22:55 +0930, Joel Stanley wrote:
> > On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com>
> > wrote:  
> > > 
> > > From: Gavin Shan <gwshan@linux.vnet.ibm.com>
> > > 
> > > I don't know the specific PHY model deployed on Firestone BMC, but
> > > currently used one (PHY_ID_BCM54210E) isn't correct. BCM54210E
> > > supports 1000base-T but the PHY on Firestone BMC shouldn't support
> > > that mode as uboot uses 100base-T mode.
> > > 
> > > When exposing 1000base-T capability, the MAC is forced to have the
> > > same mode though the PHY is working in 100base-T mode in fact. It
> > > causes the mode mismatch between PHY/MAC and the ethernet network
> > > doesn't work.
> > > 
> > > It's a temporary fix. After the PHY model is confirmed, we need
> > > to enable the correct PHY driver instead current one for BCM54210E.
> > > 
> > > Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>
> > > 
> > > [Cyril]
> > > The plot thickens, it does appear that this IS the correct PHY on
> > > firestones. This patch is definitely required for networking to be
> > > functional though.  
> > We should get someone in Austin to boot a firestone without this
> > patch
> > and see what it does. You shouldn't need a pdu as long as you get it
> > right the first time :)  
> 
> The MAC in the ast2400 is a gigabit MAC. So it should all work normally
> at 1000bT. If not, then something is wrong that needs to be
> investigated:
> 
> 	- Either the interface between MAC and PHY isn't wired
> correctly (RGMII vs. RMII, RGMII uses more pins and a diff. clock)
> 
> 	- Or we don't set a setting or strap somewhere to switch
> between those modes (hardware strapping bit[7:6], SCU[A0], ...)
> 
> 	- Both ?
> 

This is something I'm trying to confirm. The firestones I and Gavin have access
to appear to be prerelease, so anythings possible.

I am struggling to get access to a release firestone, when I do I'll check if
Gavins patch is necessary there. If so, then we'll have to start asking those
sorts of questions.

> If we are indeed limited to 100bT, then we should expose that one way
> or another in the device-tree in order to limit the advertized speed in
> the PHY driver.
> 

That is probably going to be the way to go if it turns out there's this issue
on all firestones.


Thanks,

Cyril

> Cheers,
> Ben.
> 
