Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 994E21A0190
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2016 19:59:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 5670014076B;
 Mon,  8 Feb 2016 19:59:40 +1100 (AEDT)
Subject: Re: [PATCH openbmc] qemu-native: fix build on Ubuntu 15.10
To: openbmc@lists.ozlabs.org
References: <1453854621-15030-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1453854621-15030-2-git-send-email-openbmc-patches@stwcx.xyz>
Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <56B858FB.1070704@ozlabs.org>
Date: Mon, 8 Feb 2016 16:59:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453854621-15030-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Feb 2016 08:59:40 -0000

Hi Ed,

> From: Ed Bartosh <ed.bartosh@linux.intel.com>
> 
> Build of qemu-native on Ubuntu 15.10 fails on configure step.
> The reason for this is that system dbus version is higher than
> oe dbus version and system pulseaudio libraries require newer dbus.
> 
> It causes configure to break with a lot of errors similar to this:
>   libpulsecommon-6.0.so: undefined reference to dbus_watch_get_enabled@LIBDBUS_1_3
> 
> Fixed by building qemu-native with the system dbus on Ubuntu 15.10

Awesome, thanks for chasing this up - mush less hassle to build now!

Cheers,


Jeremy
