Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ywhcV1YbszDqvN
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 12:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="GzSrb2CT"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3ywhcT1DSWz9t3V;
 Tue, 12 Dec 2017 12:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1513041113; bh=GrdmjH3wQiQTk4Z+/7QIuIANwjrAh5W35Hj0i0RUsMs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GzSrb2CT3UGZZA0cQurt73rAQTynak1/Gh7u6N61Qw57fw6qJc8N4MDk1p1QxkFK9
 6QDX3chvYiNY+KvzGqHa+lLf5SjgD/yJ7JbWA2my+2IYiGR+ZWsQ3E1RsC38BzPNED
 /JIRAHuerYeXptpLsQL/E0o0lO3NyCvpXwEK6lcNolvwCva8DJ6+sPNcP3X1uJsVLT
 UtdMdKtW0y7Hum68KtYfCAeSou5TL/fMzcbjKA5B+9wNym9UDGFDaanMXkFhm/N3sD
 W7W2ATo+viTYsqzdaj2WGyAYK9aDV6SBl28CM4BK1xEZMKRkAEyKnvdzFftfRkEueR
 ac8Syej4UGsAw==
Subject: Re: Video vs Serial for BMC based host console
To: Adi Gangidi <adi.gangidi@rackspace.com>, Jeremy Kerr
 <jmkerr@au1.ibm.com>, "anoo@us.ibm.com" <anoo@us.ibm.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "ryan.dc.yu@foxconn.com" <ryan.dc.yu@foxconn.com>
Cc: Brad DeBauche <brad.debauche@RACKSPACE.COM>,
 Chad Somerlot <chad.somerlot@RACKSPACE.COM>,
 Kenneth Wilke <kenneth.wilke@RACKSPACE.COM>
References: <DM5PR2001MB10183C72B6C4FE55827529E7E3370@DM5PR2001MB1018.namprd20.prod.outlook.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <46ea39a9-8211-7466-cca1-d951c478d9d6@ozlabs.org>
Date: Tue, 12 Dec 2017 09:11:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <DM5PR2001MB10183C72B6C4FE55827529E7E3370@DM5PR2001MB1018.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2017 01:11:54 -0000

Hi Adi,

> This coincides with Rackspace internal ask for a video based console
> ultimately via openBMC Web UI instead of serial console. To start with I
> want to work on patches for just the availability of feature and later
> worry about integrating into the UI.

I've been thinking about this one for a while, glad you asked :)

I think it boils down to this, at the core - is your underlying
requirement here:

 a) remote graphics for your server; or
 b) having an easy way to access the server's console over the web UI?

Keep in mind that they're somewhat orthogonal, and (b) does not
specifically require graphics support.

If I had a bit of spare time, this is what I'd do:

 1) Add a handler to obmc-console-server to expose its data over a
    simple websocket

 2) Find a javascript-based terminal emulator under an appropriate
    licence (like the one used by jslinux perhaps...)

 3) Add an interface in the web UI to present that terminal emulator,
    connected to the websocket from (1).

This way, we'd have an in-browser connection to the serial console,
without requiring any additional dependencies on the client machine
(like Java or a vnc viewer).

This means:

  - we'd get output much earlier than anything graphics-based
  - we don't have to pipe nearly as much data to the client's viewer
  - the user experience is entirely in-browser

Of course, if you are running an actual graphical environment on your
server, then this wouldn't be suitable. In that case, we would need
actual graphics support, which would require a bit more work. The rough
plan for that would be something like:

  - add kernel support to present the host VGA device's framebuffer data
    to userspace

  - compress that data into a format suitable for transmission to client

  - implement a network service to expose that compressed data, and
    allow input events to be returned (there'd likely be an existing
    standard for that, but we'd need to ensure it's suitable)

  - finding a suitable client - ideally javascript, but we could use a
    separate Java process, or require plain vnc. Hopefully we wouldn't
    need to implement this ourselves, but I'm not aware of existing
    solutions, other than a standard VNC client. Or something based on
    the spice work perhaps?

  - implement virtual keyboard and mouse USB devices for the BMC

  - develop an input layer between the client protocol and those
    virtual devices

In answer to your questions:

> a) Is this in your plan to implement in the near future ? If so, when ?

The graphical support isn't in my plan, but I can't speak for everyone
here :) The text-console-to-web-UI is something I'd like to do, but I do
have other priorities at the moment.

If the text-console-to-web-UI solution is something you'd be looking at,
I could certainly look at part of the above plan, particularly (1).

> b) Has any progress made this implementation easier by someone else? 

Not that I know of. However, other folks on the list may well have made
progress already.

> c) If answer is no to above questions, can one of you, please let us
> know steps in which we should go through about adding this feature, from
> scratch?

The above should cover that; if not, let me know.

Regards,


Jeremy
