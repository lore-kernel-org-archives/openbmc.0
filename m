Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FXJZ6kkqzDqC9
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 00:57:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 7 Mar 2019 08:58:22 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Mazur, Marta" <marta.mazur@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: bashisms in meta-phosphor scripts
Message-ID: <20190307135822.4l4pxg2hfmpbslep@thinkpad.dyn.fuzziesquirrel.com>
References: <57D4E00C36C60342B4DF4D5243A0FFBF4F8E41A1@IRSMSX103.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <57D4E00C36C60342B4DF4D5243A0FFBF4F8E41A1@IRSMSX103.ger.corp.intel.com>
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
X-List-Received-Date: Thu, 07 Mar 2019 13:57:51 -0000

On Tue, Feb 19, 2019 at 07:08:00PM +0000, Mazur, Marta wrote:
>Hi all,
>
>We have to cut out bash from our system and use busybox ash as the only shell. I found several scripts in the meta-phosphor layer that are not POSIX compliant and therefore are unusable without bash.
>
>Has anyone run into this problem? Does anyone have plans to remove bash dependencies from this layer?

No plans that I am aware of, but I am in favor of being bash-free.
Thanks!
>
>Or maybe we could patch those scripts and submit the patches to upstream? It should increase portability to systems with any POSIX shell.

That would be great!  Do you plan to work on this?  While not required,
if you open a github issue for it and tag it with a release, we can 
note that this work occurred in the release notes.

You might also consider adding something to the docs/anti-patterns.md
for this to really solidify that we want to be POSIX compliant in
meta-phosphor.

Thanks!

-brad
