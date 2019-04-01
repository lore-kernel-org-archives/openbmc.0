Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Y2jf1vRNzDqKK
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 06:39:48 +1100 (AEDT)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Apr 2019 12:39:45 -0700
X-IronPort-AV: E=Sophos;i="5.60,297,1549958400"; d="scan'208";a="132051470"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2019 12:39:45 -0700
Date: Mon, 1 Apr 2019 12:39:44 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Message-ID: <20190401193944.GB15959@mauery.jf.intel.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
 <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
 <20190327143926.rix43miyfilbfrwp@thinkpad.dyn.fuzziesquirrel.com>
 <3B56B3FD-0A20-4D51-8BCA-5F1637307ED9@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3B56B3FD-0A20-4D51-8BCA-5F1637307ED9@quantatw.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
X-List-Received-Date: Mon, 01 Apr 2019 19:39:51 -0000

On 28-Mar-2019 02:33 PM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
>
>
>> On Mar 27, 2019, at 22:39, Brad Bishop <bradleyb@fuzziesquirrel.com> wro=
te:
>>
>> On Sat, Mar 16, 2019 at 01:04:53PM +0000, P. K. Lee (=E6=9D=8E=E6=9F=8F=
=E5=AF=AC) wrote:
>>> Hi Vernon,
>>>
>>> Thank you for providing a new filtering mechanism that looks very
>>> flexible, but I have a question.  I have tried the filter that allows
>>> filtering of commands by whitelistFilter, but the channel of request
>>> must be channelSystemIfac to check the contents of the whitelist.  What
>>> puzzles me is why channelSystemIfac is in the constraint? This
>>> constraint will cause the whitelist to fail when the user calls the
>>> IPMI command via the LAN.  If the user wants to use the whitelist vis
>>> the LAN,
>>
>> Hi P.K.
>>
>> If I understand correctly, you want to have a system that operates in
>> one of two modes - restricted or un-restricted.  When the system is in
>> restricted mode, only whitelisted commands will be processed from _any_
>> channel.  Do I understand correctly?
>
>Yes, we need to use the whitelist mechanism to restrict IPMI commands
>from any channel.
>
>> How do you restore the system to unrestricted mode?  Some side-band (non
>> IPMI) mechanism?
>
>For us, it can use the REST to change the restriction mode as well.
>
>> If you are able to share, I'm curious to know more about the usage
>> pattern driving the need for this.
>
>I thought that the configuration can be modified the format of
><NetFn>:<Command>:<Channel> to apply the whitelist with multiple channels,
>where <Channel> uses 2 bytes to map the channel using a bit array.
>
>For example:
>0x06:0x01:0xFFFE  // The 0xFFFE is used 2 bytes to represent the channel 1=
~15
>
>However, in order to be compatible with the current design, the <NetFn>:<C=
ommand> still only uses the system interface.

This is a reasonable mechanism to extend the whitelist to multiple=20
interfaces for a fixed setup. Is there a need to make the filtering more=20
flexible, like runtime changing which commands are available? If so,=20
does the layout of the IPMI2.0 firmware firewall work?

--Vernon
