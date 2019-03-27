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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Tr881XByzDqMM
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 01:33:11 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 27 Mar 2019 10:33:44 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Message-ID: <20190327143343.v45cm5j5dc2y2yth@thinkpad.dyn.fuzziesquirrel.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
 <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
 <20190318183108.GE44612@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20190318183108.GE44612@mauery.jf.intel.com>
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
X-List-Received-Date: Wed, 27 Mar 2019 14:33:12 -0000

On Mon, Mar 18, 2019 at 11:31:08AM -0700, Vernon Mauery wrote:
>On 16-Mar-2019 01:04 PM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
>>Hi Vernon,
>>
>>Thank you for providing a new filtering mechanism that looks very flexi=
ble, but I have a question.
>>I have tried the filter that allows filtering of commands by whitelistF=
ilter, but the channel of request must be channelSystemIfac to check the =
contents of the whitelist.
>>What puzzles me is why channelSystemIfac is in the constraint? This con=
straint will cause the whitelist to fail when the user calls the IPMI com=
mand via the LAN.
>>If the user wants to use the whitelist vis the LAN, is there a better w=
ay except for removing the channelSystemIfac restriction?
>>Do I need to create another whitelist filter for the LAN?
>
>The whitelist filter I implemented was just one to replace the=20
>original filter that was there before the architecture changes. The=20
>restriction about the incoming interface is something that was already=20
>there and somebody at IBM might be a better resource for the 'why'=20
>question.

We implemented this at the request of a bare metal hosting provider.
Their setup consisted of a trusted (by the provider) management LAN
connected to all the BMCs, and untrusted host firmware.

While the system was being provisioned, they needed unrestricted access
to the BMC, from the host over the unauthenticated in-band channels.
Once the system was provisioned and turned over to the customer, the
provider only wanted to allow whitelisted commands to flow over those
channels as the host firmware/os is not trusted at that point.  The
provider still wanted unrestricted access via the authenticated channels
on their management network connected to the bmcs.

>At some point, I would like to make it an optional part of the build
>because it may not be something that everyone needs. But it is a good
>starting place for how to write a filter.
>
>You can feel free to write a new filter as part of a 'provider' library
>just like you write ipmi command handlers and register them, you can
>write a filter and register it.

Could it be as simple as a configure option that switches between the
two behaviors?  Or maybe the configure option selects the channels to
apply the filtering to?

>
>--Vernon
