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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44TrGh22crzDqMM
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 01:38:52 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 27 Mar 2019 10:39:26 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Message-ID: <20190327143926.rix43miyfilbfrwp@thinkpad.dyn.fuzziesquirrel.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
 <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 27 Mar 2019 14:38:52 -0000

On Sat, Mar 16, 2019 at 01:04:53PM +0000, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=
=AF=AC) wrote:
>Hi Vernon,
>
>Thank you for providing a new filtering mechanism that looks very
>flexible, but I have a question.  I have tried the filter that allows
>filtering of commands by whitelistFilter, but the channel of request
>must be channelSystemIfac to check the contents of the whitelist.  What
>puzzles me is why channelSystemIfac is in the constraint? This
>constraint will cause the whitelist to fail when the user calls the
>IPMI command via the LAN.  If the user wants to use the whitelist vis
>the LAN,=20

Hi P.K.

If I understand correctly, you want to have a system that operates in
one of two modes - restricted or un-restricted.  When the system is in
restricted mode, only whitelisted commands will be processed from _any_
channel.  Do I understand correctly?

How do you restore the system to unrestricted mode?  Some side-band (non
IPMI) mechanism?

If you are able to share, I'm curious to know more about the usage
pattern driving the need for this.
