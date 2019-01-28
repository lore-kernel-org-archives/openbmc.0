Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pK3V1V8zzDqNk
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 06:10:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2019 11:10:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,534,1539673200"; d="scan'208";a="295135588"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga005.jf.intel.com with ESMTP; 28 Jan 2019 11:10:56 -0800
From: Ed Tanous <ed.tanous@intel.com>
Subject: WebUI Fonts
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <3e45eb7b-a689-4b25-3bb9-ae8bb5761e62@intel.com>
Date: Mon, 28 Jan 2019 11:13:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 28 Jan 2019 19:11:03 -0000

Let’s continue the discussion we had on the call with the list, and see
if there’s anyone else interested in the topic.

From my understanding, there are two issues here at play in the webui:

1. Should we be consistent about SVG icons versus font icons?  Which
should we use?
My take on this is that we should do whatever is easiest to maintain.
Today we use both custom SVGs inline in the nav bar, as well as some
font icons from the glyficons pack.  There were some concerns about
accessibility on font icons that we should open a bug up on github and
understand.  I would really like if that bug led to some documentation
about how we handle accessibility, and what we would like to see from
patchsets going forward in clear and concise rules, and a patchset to
make the UI as it stands consistent in this regard.
The solution I would like to see long term is to pull in a single font
file, or single svg sprite file, and utilize webpacks built in tree
shaking to keep it small.

With that said, my opinions between the two aren't that strong, as I
believe functionally both options can achieve the same result.  Anyone
that’s willing to push patches enabling one or another without breaking
something, or effecting our build stats would be appreciated by me.  I
could certainly be convinced that inline SVG, using the webpack backend
was the better option, but I would really like to see some numbers on
checked-in code size, final rootfs size, or start-up performance
(preferably all 3).

An example of setting of webpack up for fontawesome font tree shaking:
https://fontawesome.com/how-to-use/with-the-api/other/tree-shaking

An example of using fontawesome with SVG sprites:
https://fontawesome.com/how-to-use/on-the-web/advanced/svg-sprites

I think the important thing we need to be clear on and document is why
we're making the change we're making.  Today the webui uses inline svg
for the navbar icons;  Because the way it's built, those are required at
initial page load, and we don't want to hold up the initial page load
while we incur another round trip time to query the BMC for all of the
icons.  The glyficons are loaded after the user is logged in.  Doing
this spreads out the BMC load in the most common case, and doesn't incur
a large payload download for loading the login page.

One thing to be careful of with inline SVG:  Some of the SVG keywords
will trigger the browsers content security policy.  Because SVG icons
are read in as XML, things like "style" keywords need to be removed,
similar to this review.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/16949

2. Should we allow library icons?
This one is important to me.  To highlight the importance, let me lay
out a hypothetical scenario.
Developer X wants to build a new page on the webui to allow the BMC to
tweet system failures (side note, this would be an awesome way to
implement a hosted logger in the cloud for free).  Said developer is not
a visual designer, nor has the ability to build icons.  They pull in the
various buttons, textboxes, and forms from throughout the webui to build
their UI, following the style guide while they do it with the existing
CSS.  For their navbar icon, they pull in the twitter icon here:
https://fontawesome.com/icons/twitter?style=brands
The icon is responsive, uses vector graphics, is properly sized, and
adds a negligible size to the final rootfs.

Do we reject their code because they didn't create their own icon?

I would advocate the answer is no.  I'm having trouble getting a read on
this, but it sounds like the answer that is being proposed is that we
should start enforcing icon style before merge for "consistency", but
I'm not really following the end goal.  If someone is wanting to remove
pages because the icon doesn't have a consistent style, that is easy
enough to do in a config in the per-machine/per-company repositories.
If someone wants to make the style more consistent, they can certainly
push new custom icons to do that.  I think master branch of the webui
needs to point at a web page that enables as much functionality as we
can.  Having to create custom icons is one more reason for people to
fork the codebase and not contribute back, and we want to avoid that as
much as possible.

Said another way, I would much rather have a first class UI feature with
a stock icon, than no feature at all.

-Ed
