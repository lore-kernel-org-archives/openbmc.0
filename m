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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mcBs3T4GzF36d
 for <openbmc@lists.ozlabs.org>; Fri,  2 Nov 2018 20:26:13 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 1FB4D6DC86;
 Fri,  2 Nov 2018 05:26:10 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: The Great Recipe Rename of 2018
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notx84Tdf4VPZ1pBHpDtvjmUgtDDVqYJRKpkJLyCpNQD35A@mail.gmail.com>
Date: Fri, 2 Nov 2018 05:26:09 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: 7bit
Message-Id: <F617D21F-D401-48DC-864C-811280521390@fuzziesquirrel.com>
References: <CAO=notx84Tdf4VPZ1pBHpDtvjmUgtDDVqYJRKpkJLyCpNQD35A@mail.gmail.com>
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
X-List-Received-Date: Fri, 02 Nov 2018 09:26:13 -0000

Hi Patrick

> On Oct 26, 2018, at 1:13 PM, Patrick Venture <venture@google.com> wrote:
> 
> The great recipe rename of 2018 is nearly at an end.  If you're a
> downstream maintainer like myself, when you rebase onto this you'll
> have quite a few local items to fix.  For any recipe that is bbappend
> on a git recipe, you can use the version wildcard approach to solve
> the mismatch "recipe_%.bbappend"
> 
> At this point, I haven't touched a few recipes:
> meta-openpower/recipes-bsp/pdbg/pdbg_1.0.bb <-- versioned, so ok.
> meta-phosphor/recipes-devtools/iotools/iotools_1.6.bb <-- versioned, so ok.
> 
> And I haven't yet addressed a recipe inclusing the skiboot.inc for its
> source***I may still do this.
> 
> Patrick

Just wanted to say thanks for helping to get these fixed up properly!

-brad
