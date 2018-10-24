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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42g9Jw6KSszDrDf
 for <openbmc@lists.ozlabs.org>; Wed, 24 Oct 2018 23:57:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 2BDF86DC97;
 Wed, 24 Oct 2018 08:57:33 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: New Repo Request: google-ipmi-i2c
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notx4Csmkf8f-PkrTST4kKu_petj4+CF4f_oC4venws2FXA@mail.gmail.com>
Date: Wed, 24 Oct 2018 08:57:32 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Peter Hanson <peterh@google.com>
Content-Transfer-Encoding: 7bit
Message-Id: <A943BC2A-1FB4-49E0-ACA1-174AE684BC10@fuzziesquirrel.com>
References: <CAO=notx4Csmkf8f-PkrTST4kKu_petj4+CF4f_oC4venws2FXA@mail.gmail.com>
To: Patrick Venture <venture@google.com>
X-Mailer: Apple Mail (2.3445.100.39)
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
X-List-Received-Date: Wed, 24 Oct 2018 12:57:37 -0000


> On Oct 7, 2018, at 6:25 PM, Patrick Venture <venture@google.com> wrote:
> 
> After reviewing the use cases, this extension to IPMI may belong as
> part of the google suite of openbmc customizations we want to publish.
> 
> I request a new repository: google-ipmi-i2c
> Maintainer permissions list group thing: the same as meta-google**

Sorry Patrick I had forgotten about this.  Created.

-brad
