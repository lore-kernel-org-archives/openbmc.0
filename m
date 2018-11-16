Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42xXp437nRzDqfd
 for <openbmc@lists.ozlabs.org>; Sat, 17 Nov 2018 09:24:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Nov 2018 14:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,241,1539673200"; d="scan'208";a="106966940"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga004.fm.intel.com with ESMTP; 16 Nov 2018 14:24:02 -0800
Subject: Re: Submit board schematics to OpenBMC docs repo
To: openbmc@lists.ozlabs.org
References: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <1bf30dfc-cc55-649d-3b0a-1cf29355daf9@intel.com>
Date: Fri, 16 Nov 2018 14:26:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CABoTLcSpcTKHJu5xwWx4TQr1_5FjLvb9QsOAYQhCfMaQwQ5qug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 16 Nov 2018 22:24:13 -0000

On 11/16/18 11:58 AM, Oskar Senft wrote:
> Is there a good place in OpenBMC to post that? Maybe the docs repo?
> It's 4 PDF files with < 10 MiB in total. Having this information
> publicly posted by them would make development much easier.

One thing I wonder is whether or not we (the OpenBMC project) wants to
be in the business of hosting hardware schematics.  It feels a little
bit out of our wheelhouse.  It seems like a much better thing for an
organization like OCP to manage, who deals in a lot of open physical
hardware, and understands the licenses and subtleties around hosting
that kind of documentation.

For example, is the company planning on releasing the schematics with a
creative commons, Apache, or MIT license?  I have no idea the subtleties
of that when it comes to hardware schematics, but maybe someone else
does?  Does posting the schematics with that license open the
possibility of someone copying the hardware?

Maybe it makes more sense to post it somewhere outside the OpenBMC
project (the companies website perhaps) then post a link to it to the
mailing list?

I'm mostly just thinking out loud at this point.



As far as where we put it if we do decide to host it, I don't think a
git repo is the right choice.  Schematics aren't likely to be source
controlled (given that they're going to be board files and PDFs, not
editable schematics) so some kind of file drop seems like a better
choice than the docs repository.


PS, What company/board is it?
