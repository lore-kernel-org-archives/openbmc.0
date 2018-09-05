Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 424l2C6LLWzF13P
 for <openbmc@lists.ozlabs.org>; Wed,  5 Sep 2018 10:29:19 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2018 17:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,331,1531810800"; d="scan'208";a="68413467"
Received: from hades.jf.intel.com (HELO [10.54.51.77]) ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2018 17:29:15 -0700
Subject: Re: SOL Logging
To: openbmc@lists.ozlabs.org
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <8ec90e03-10ed-a052-7a0b-328d7c6cde64@yadro.com>
 <CABzWfrmvR=qHQBgi8m6m5Zp0wGDc2--AcY1ZTTp+WfiC8cFFKg@mail.gmail.com>
 <CAJoAoZnqL2yy3aYWqvL-FRxLtpcjuyAhFOER5ZSd=WAA9LmJfg@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <3d11886a-a3c7-37a0-f836-1f1eb64b1a46@intel.com>
Date: Tue, 4 Sep 2018 17:30:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZnqL2yy3aYWqvL-FRxLtpcjuyAhFOER5ZSd=WAA9LmJfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 05 Sep 2018 00:29:24 -0000

On 09/04/2018 05:07 PM, Emily Shaffer wrote:
> I wonder if there's a different and more useful way we can provide the 
> console scrollback. Thinking about this, it's not just a GUI issue, 
> right - we deliver our console over TCP to a client elsewhere and would 
> have the same dedupe issues if we needed to start providing backlog.  

Correct, this isn't _just_ a webui issue.  It happens on all the 
available interfaces (SSH, HTML5, and obmc-console-client)

> Speaking with almost no experience implementing server-side sockets, is 
> it possible for us to keep that ring buffer in the console socket as well?

obmc-console already keeps a ring-buffer style log of all the previous 
characters.  The easiest to implement answer, which is probably good 
enough for most cases, would be to simply make obmc-console barf up the 
saved console log ring buffer when any new client connects.  This will 
have problems if your control characters have run off the end of the 
buffer, and the console would appear to quickly replay your last X 
characters worth of interactions, which isn't desired.

I could also imagine a case where this isn't the desired behavior if 
you're using automation to interact with SSH/SOL, so it might need to be 
selectable by the client or have some kind of reasonable workaround.

I'm fairly certain there's some buffering routines we can steal from 
screen and/or tmux that would just track the screen state, and blast the 
minimum character sets to each client on reconnect, but I haven't looked 
into it too deeply.

> 
> I'm also interested in how you all are getting the console over to 
> webui.  Is it delivered via Redfish? (This is totally different from 
> what we are doing, so apologies if that's a fundamental question, but 
> I'm certainly keen to know now :) )
> 

Today the console is being dumped to a dumb websocket that just mirrors, 
encodes, and encrypts the traffic to the browser using websocket frames. 
  On the browser side, we pipe that console into hterm, which turns the 
raw characters into a reasonably correct console.

https://chromium.googlesource.com/apps/libapps/+/master/hterm

At some point there was talk of moving the html5 stuff over to xterm, to 
support more encoding styles, but I don't think anyone has started that 
work.
