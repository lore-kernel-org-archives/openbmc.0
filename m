Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43BQnm50PJzF0QS
 for <openbmc@lists.ozlabs.org>; Sat,  8 Dec 2018 08:38:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Dec 2018 13:38:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,327,1539673200"; d="scan'208";a="105787345"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 07 Dec 2018 13:38:30 -0800
Subject: Re: How to enable bmcweb in openbmc
To: "Yuan, Yao" <yao.yuan@hxt-semitech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <b5a3f14c40c04288ab7347f707904f3c@HXTBJIDCEMVIW02.hxtcorp.net>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <31e4f1a6-2e90-8dbf-4261-13d6827e0d8a@intel.com>
Date: Fri, 7 Dec 2018 13:40:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b5a3f14c40c04288ab7347f707904f3c@HXTBJIDCEMVIW02.hxtcorp.net>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Fri, 07 Dec 2018 21:38:37 -0000


On 12/7/18 12:36 AM, Yuan, Yao wrote:
>
> Hi all,
>
>  
>
> I’m new here and want to enable openbmc on my server.
>
>  
>
At this point, bmcweb is not the default implementation for the
project.  Based on the discussions with other people, making it the
default implementation seems to be the direction we're heading, but
there are a few roadblocks to get through before we can make that a reality.

For the moment, there are a few different ways to run bmcweb, each have
their benefits and pitfalls.

1. Standalone, as a replacement for phosphor-rest.

    This is the option I generally choose, given it's the simplest from
a configuration perspective.  Adding it to your build can be
accomplished temporarily by adding the below line to your
build/conf/local.conf file

IMAGE_INSTALL_append = " bmcweb"

For compatibility with phosphor-rest, by default this will launch bmcweb
on port 883.  If you'd like to launch it on port 443, which is more
standard, override or replace this file here:

https://github.com/openbmc/openbmc/blob/298c4328fd20fcd7645da1565c143b1b668ef541/meta-phosphor/recipes-phosphor/interfaces/bmcweb/bmcweb.socket#L5

And remove phosphor-rest from your build by either commenting it out here:

https://github.com/openbmc/openbmc/blob/298c4328fd20fcd7645da1565c143b1b668ef541/meta-phosphor/recipes-phosphor/packagegroups/packagegroup-obmc-apps.bb#L40

Or add the line:

IMAGE_INSTALL_remove " phosphor-rest" to your local.conf

On the next boot after loading this, bmcweb should generate self-signed
keys and boot up.  If you still have troubles, running the command
"journalctl -u bmcweb" might give you some hints as to whats wrong.


2. The second option is to run bmcweb behind an nginx reverse proxy. 
This is how the IBM systems are set up currently.  In essence, bmcweb is
proxied behind nginx for all urls matching the /redfish routes.  BMCweb
is launched in http mode (not https) and all things are routed through
nginx.  If you want to go this route, I'd recommend taking a look at the
meta-ibm layer, in the nginx and bmcweb folders.


If you need more help in closer-to-realtime, there are several of us
that know this stuff pretty well that hang out in the IRC channel.

Good luck, and let us know if you need any more help.

-Ed
