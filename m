Return-Path: <supreeth.venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 42wmH51mcQzF3dQ
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 02:58:05 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC8280D;
 Thu, 15 Nov 2018 07:58:03 -0800 (PST)
Received: from supven01-VirtualBox (unknown [10.119.49.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 57B593F5BD;
 Thu, 15 Nov 2018 07:58:03 -0800 (PST)
Message-ID: <b7b03cc813e875ba8ae63f868f30058c00dbe579.camel@arm.com>
Subject: Re: MCTP protocol support in OpenBMC?
From: Supreeth Venkatesh <supreeth.venkatesh@arm.com>
To: Jeremy Kerr <jk@ozlabs.org>, David Thompson <dthompson@mellanox.com>, 
 "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Emily Shaffer <emilyshaffer@google.com>
Cc: Dong Wei <Dong.Wei@arm.com>
Date: Thu, 15 Nov 2018 09:57:59 -0600
In-Reply-To: <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
References: <HE1PR0501MB2666721F6FF033CA4B94D754DD340@HE1PR0501MB2666.eurprd05.prod.outlook.com>
 <799b6a6f-992c-200e-c42c-35d469f696b9@ozlabs.org>
 <AM4PR08MB2788ACA6457591EF7862078880C30@AM4PR08MB2788.eurprd08.prod.outlook.com>
 <7abd75b4-aea0-e08c-126a-582afe4d26c7@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 15:58:09 -0000

On Thu, 2018-11-15 at 09:44 +0800, Jeremy Kerr wrote:
> Hi all,
> 
> > We (@ arm) are also interested in contributing MCTP to OpenBMC.
> 
> OK, super!
> 
> > We would like to collaborate with OpenBMC folks  who are interested
> > in this topic. (maybe form a Workgroup to discuss this).
> 
> Personally, I'd prefer *not* to form a workgroup at the moment; we
> can 
> discuss things here on the list, rather than separating those 
> conversations from the rest of the OpenBMC community. I also don't
> think 
> we need any of the formality of a workgroup at this stage.
No Strong opinion. Lets start with the list and if the discussion gets
unmanageable using list and we can always have this option. 
> 
> Essentially, forming a WG just means we'd have meetings and a
> separate 
> mailing list. The former means that some attendees of the WG have to 
> have late nights to attend, and the latter separates the MCTP 
> discussions from the rest of OpenBMC.
:)
> 
> However, we can certainly revisit this if conditions warrant it.
> 
> Let me know if you have any strong opinions one way or the other.
> 
> With that in mind, and since a few folks have expressed interest,
> I'll 
> share some of my initial sketches to this list soon. I'll be sure to 
> include MCTP in the subject to make things findable.
Thanks. Appreciate it. I will look for it and can provide feedback.

> 
> Cheers,
> 
> 
> Jeremy
