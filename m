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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44DW0n3dQVzDqBZ
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 08:55:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Tue, 5 Mar 2019 16:56:04 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Kun Yi <kunyi731@gmail.com>, 
 Natarajan Gurumoorthy <natg@google.com>,
 Benjamin Fair <benjaminfair@google.com>
Subject: Re: new repo request
Message-ID: <20190305215604.tyyu6yz7ospzxmi7@thinkpad>
References: <CAO=notzgE0XdR_paQsbzbS7jfoshdT=pti3kMZ0wObb7q6hU0g@mail.gmail.com>
 <CAO=notwZ0RX2WeqyEFgNBYYaYL_eMXjZzknpfwwGuanT1WpwrQ@mail.gmail.com>
 <CAO=notwHkTs1NhWLOu22vjcQuXkOaHOAi1A7ZodgtPFKkNfkdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAO=notwHkTs1NhWLOu22vjcQuXkOaHOAi1A7ZodgtPFKkNfkdQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 21:55:38 -0000

On Tue, Mar 05, 2019 at 01:23:12PM -0800, Patrick Venture wrote:
>On Mon, Mar 4, 2019 at 11:33 AM Patrick Venture <venture@google.com> wrote:
>>
>> On Mon, Mar 4, 2019 at 10:12 AM Patrick Venture <venture@google.com> wrote:
>> >
>> > Brad,
>> >
>> > Please create a repo: ipmi-blob-tool (or) phosphor-blob-tool (at your
>> > discretion).
>>
>> This codebase is meant to run on the host and not the BMC, but will be
>> specifically used by other host-tools talking to OpenBMC.
>>
>> >
>> > I'm going to write up the blob tool as a library and then a small
>> > utility, and then use that in phosphor-ipmi-flash so that we can have
>> > other blob tools more easily.  There are a few other use-cases we've
>> > run into, and the core blob code for the tool currently lives in
>> > phosphor-ipmi-flash, which is sub-ideal.
>> >
>> > Patrick
>
>Thanks!

Np.  You asked for this some weeks back in a different thread and I
forgot.  Sorry ABT.

-brad
