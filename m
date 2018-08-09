Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41mcY85pg3zDqBy
 for <openbmc@lists.ozlabs.org>; Fri, 10 Aug 2018 04:41:45 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2018 11:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,215,1531810800"; d="scan'208";a="61950022"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2018 11:41:35 -0700
Subject: Re: Phosphor Web-ui: Server unreachable
To: openbmc@lists.ozlabs.org
References: <CAE33tLFQ6v2n2tBavZVJmHdYK1cFmFFhKRb9_8RG3xS4xzr6ug@mail.gmail.com>
 <25bebbd3-7df8-f396-ef62-0b846e3435aa@intel.com>
 <CAE33tLHsd5HwrCS9qLXO6Mo_gzka1Mrv7vs3Ofy0AF=YRJdT1w@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E821699345827A58@ORSMSX114.amr.corp.intel.com>
 <CAE33tLGtRSdcYgvavfR2Ezkk7XduS9jEkJuez5WYBiLe-AHN2A@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169934582EA93@ORSMSX114.amr.corp.intel.com>
 <CAE33tLGu+TqAnZfG73tPpL=oH+Bk_g4T7a5vE5Rean8DENk_=g@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <f7c65c06-8e0d-c21e-2c8a-8b9719887e00@intel.com>
Date: Thu, 9 Aug 2018 11:43:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAE33tLGu+TqAnZfG73tPpL=oH+Bk_g4T7a5vE5Rean8DENk_=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Aug 2018 18:41:49 -0000

> gives error in compilation of bmcweb. The following are some error 
> messages I got.

I had a minor transcription typo in what I said in my email, and it 
looks like chrome must've increased their security threshold since the 
last time I tried this.  I've done this the right way, and added these 
headers (and a couple other things) under the 
BMCWEB_INSECURE_DISABLE_XSS_PREVENTION option flag.  To develop this way.

Check out this code review.
https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/11887

and add this to the bottom of bmcweb.bb

EXTRA_OECMAKE += "-DBMCWEB_INSECURE_DISABLE_XSS_PREVENTION=ON"

This can also be done in a bmcweb.bbappend file if you want to check it 
into some kind of development meta layer.

That should build you a copy of bmcweb into your system image with the 
XSS protections disabled, and the correct header responses for 
developing phosphor-webui this way.  I tried locally on my machine, 
using the "npm run-script server" and it seemed to work correctly, 
although I didn't poke too hard at it, so there may still be bugs here 
or there.

If this works for you, it would be great if you could add your comments 
to the code review above.
