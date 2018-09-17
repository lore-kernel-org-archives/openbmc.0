Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42DSXG0qyHzF1RG
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 00:03:41 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id C62ECE2698;
 Mon, 17 Sep 2018 10:03:37 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: New repository Request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxkKpZMyPktPjJ+HeYYuOnwcGMvV6ewdEvdMBUqioLvGg@mail.gmail.com>
Date: Mon, 17 Sep 2018 10:03:37 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <62B77266-3919-48A4-91E1-BF6EACDC4E47@fuzziesquirrel.com>
References: <CAO=notxkKpZMyPktPjJ+HeYYuOnwcGMvV6ewdEvdMBUqioLvGg@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.9.1)
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
X-List-Received-Date: Mon, 17 Sep 2018 14:03:42 -0000



> On Sep 14, 2018, at 7:57 PM, Patrick Venture <venture@google.com> wrote:
> 
> Brad;
> 
> Please create: google-ipmi-sys -- this is to hold OEM IPMI commands we
> want to share with the community and vendors, but dont' expect to be
> picked up by OpenBMC at large, similar to intel-ipmi-oem.

All the existing OEM IPMI repositories end with -ipmi-oem.  Does that not
make sense here?
