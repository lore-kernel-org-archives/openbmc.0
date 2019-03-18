Return-Path: <vernon.mauery@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NPrx5p1PzDqHw
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 05:31:11 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Mar 2019 11:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,494,1544515200"; d="scan'208";a="143060315"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga002.jf.intel.com with ESMTP; 18 Mar 2019 11:31:08 -0700
Date: Mon, 18 Mar 2019 11:31:08 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Message-ID: <20190318183108.GE44612@mauery.jf.intel.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
 <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
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
X-List-Received-Date: Mon, 18 Mar 2019 18:31:15 -0000

On 16-Mar-2019 01:04 PM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
>Hi Vernon,
>
>Thank you for providing a new filtering mechanism that looks very flexible=
, but I have a question.
>I have tried the filter that allows filtering of commands by whitelistFilt=
er, but the channel of request must be channelSystemIfac to check the conte=
nts of the whitelist.
>What puzzles me is why channelSystemIfac is in the constraint? This constr=
aint will cause the whitelist to fail when the user calls the IPMI command =
via the LAN.
>If the user wants to use the whitelist vis the LAN, is there a better way =
except for removing the channelSystemIfac restriction?
>Do I need to create another whitelist filter for the LAN?

The whitelist filter I implemented was just one to replace the original=20
filter that was there before the architecture changes. The restriction=20
about the incoming interface is something that was already there and=20
somebody at IBM might be a better resource for the 'why' question. At=20
some point, I would like to make it an optional part of the build=20
because it may not be something that everyone needs. But it is a good=20
starting place for how to write a filter.

You can feel free to write a new filter as part of a 'provider' library=20
just like you write ipmi command handlers and register them, you can=20
write a filter and register it.

--Vernon

>Regards,
>PK
>
>> On Feb 23, 2019, at 04:05, Vernon Mauery <vernon.mauery@linux.intel.com>=
 wrote:
>>
>> On 22-Feb-2019 03:03 AM, P. K. Lee (=E6=9D=8E=E6=9F=8F=E5=AF=AC) wrote:
>>> Hi,
>>>
>>> Does anyone know how to restrict the IPMI command execution via out-of-=
band?
>>>
>>> I know that the IPMI commands via in-band can use the whitelist mechani=
sm to restrict whether the commands can access the BMC, but I can't use thi=
s for the out-of-band.
>>>
>>> If there is currently no restriction mechanism for the out-of-band, I w=
ill try to add the whitelist function for it just like the in-band.
>>
>> There is a mechanism in the works for this already. It is a generic filt=
er provider that allows filtering of commands based on any criteria. See ht=
tps://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/13896 for =
the current implementation.
>>
>> --Vernon
>
