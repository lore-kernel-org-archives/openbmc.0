Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q1nR54tTzDqGq
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 09:46:18 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2019 14:46:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,538,1539673200"; d="scan'208";a="139899150"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2019 14:46:13 -0800
Subject: Re: WebUI Fonts
To: openbmc@lists.ozlabs.org
References: <CAOUmYFTGSMQy2-C6xphK1=-ecVAsb-0WSnB89rcBFBm15QPZcw@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <8ed86145-296c-72b6-2fd2-989629533d59@intel.com>
Date: Tue, 29 Jan 2019 14:48:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAOUmYFTGSMQy2-C6xphK1=-ecVAsb-0WSnB89rcBFBm15QPZcw@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Jan 2019 22:46:20 -0000


On 1/29/19 2:21 PM, Derick wrote:
> 
> 
> I have an accessibility audit of our icons on a todo list and I'd love
> to create the documentation to help make the 
> application more inclusive! I just need to prioritize the time with
> another project.
I didn't mean to call you out.  I realize we're all busy :)

> 
> small. We can test that, but the SVG icons have been typically smaller
> than font icons. 
That sounds like a great reason to use SVG over fonts.  If we can show
that in a meaningful way, I'm happy to support moving the UI over to SVG.

> 
> 
> The SVG sprite example above is exactly what I'm referring to. And the
> icomoon tool (I refer to 
> that below in point #2 I have been using provides all the code,
> including the SVG sprite.  
The first hit I get what I search "webpack icomoon" is a link to a stack
overflow with the title "webpack with icomoon does not work".  That's
not a great sign, although I haven't dug into the details yet.

Webpack also has some built-in capabilities for SVG sprites that I
haven't had time to look at.  It sounds like that is the current
best-practice for webpack.
https://github.com/kisenka/svg-sprite-loader

If we're looking at dropping webpack, or doing a two stage build
(icomoon then webpack) that's something that needs a longer discussion.
Alternatively webpack is open source, we could certainly just go fix
icomoon support.

> 
> 
> I like the idea of using an SVG sprite. Using the <use> element (which
> would required a small polyfill for IE 11) 
> the implementation is as simple as using font icons. We would only have
> the icons we needed to use and the file size 
> (which we can test and evaluate) would be small since we don't need to
> include the entire font-awesome library.
> 
> Some reasons I prefer the SVG sprite is:
> 1. It would allow for easy conversion downstream for anyone that wants
> to use a different icon set
> 2. Implementation is consistent and can be easily documented

This is exactly the kind of background I was looking for on why this
change is worth it, as well as trade offs and things that are required.

> 
> We can keep the login icons inlined to minimize the load if we think
> loading the SVG sprite is too much of a load.

I think a single SVG sprite doesn't add too much load.  It's when we're
pulling 12 different icons separately that we need to pay attention.
Today, rendering the initial login page load requires 4 files, one of
which is already an SVG (the openbmc logo), and 276KB of payload.   If
we go to svg sprites, presumably the SVG file just gets bigger, but
we're still requesting the same number of resources.  We should be in
good shape.

> 
> 
> Using an SVG sprite would make it easy to simply update the downstream
> SVG sprite without
> having to update any code.
>  

Say more on this point......  I'm not sure I understand.  Wont people
always have to override some file to update icons?
> 
>  
> I agree with the use of a consistent and open icon set, like font
> awesome. I have been using
> a great tool called icomoon (free), https://icomoon.io/ to manage my
> icon sets. It's fantastic
> because we can use font awesome and can import icons if needed. The icon
> set can be 
> saved as a JSON file and even added to the repository if needed, so that
> anyone could
> import it to icomoon and add or update icons using font awesome or any
> number of other
> free icon sets and then have an updated SVG sprite generated, as well as
> downloading
> the updated icon set config. 


My preference would be to use the built-in webpack sprite loader, under
the assumption that it works better, and will be easier to maintain long
term, but I'm happy to support icomoon if it's a better tool.




Moving the webui to SVG sprites sounds like a positive thing to do, and
has my support.  Looking forward to seeing the patchsets.

-Ed
