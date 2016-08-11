Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 82172 seconds by postgrey-1.35 at bilbo;
 Thu, 11 Aug 2016 22:14:42 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b=epFtFMLz; dkim-atps=neutral
Received: from forwardcorp1o.cmail.yandex.net (forwardcorp1o.cmail.yandex.net
 [37.9.109.47])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s96QV6yXTzDqCb
 for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2016 22:14:42 +1000 (AEST)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1o.cmail.yandex.net (Yandex) with ESMTP id 81C392067D;
 Thu, 11 Aug 2016 15:14:37 +0300 (MSK)
Received: from webcorp01g.yandex-team.ru (webcorp01g.yandex-team.ru
 [87.250.230.44])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 joCq0trLKZ-Eb3uPbDF; Thu, 11 Aug 2016 15:14:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1470917677; bh=qabihKEnzjsPPeZDA8fQZZVE1VF4K0xBEICUuw0iS3I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=epFtFMLzx24ern8nBCJKvz7IJ5ENF19qy59/oRraJaEvRHm6nzBabSfpj8KjOVEKj
 ci0VOo1A01D644jeKQKq4crDpVOfhawVa8gmYHOUX1D1+dEyWweveO0CNaR9a/14VD
 ZfKNDehNgHiXLbB8w1ERlC4aamrsaV46ZbKs5vlU=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01g.yandex-team.ru with HTTP;
 Thu, 11 Aug 2016 15:14:37 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <20160810191513.fdpyo36eihkqg6fx@asimov>
References: <97341470823017@webcorp01g.yandex-team.ru>
 <20160810191513.fdpyo36eihkqg6fx@asimov>
Subject: Re: OpenBMC on the OpenWRT
MIME-Version: 1.0
Message-Id: <291061470917677@webcorp01g.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 11 Aug 2016 15:14:37 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2016 12:14:44 -0000

10.08.2016, 22:15, "Patrick Williams" <patrick@stwcx.xyz>:
> On Wed, Aug 10, 2016 at 12:56:57PM +0300, Anton D. Kachalov wrote:
>>  Hello everybody.
>
> Hi Anton. Thank you for connecting with us.
>
>>  I'm working on a separate project for rack solution which utilize many portions of OpenBMC:
>>
>>     https://github.com/ya-mouse/openbmc-target
>
> I would certainly be interested to understand the use-cases you are
> solving. Our intention is that this OpenBMC code base can be used not
> only for typical servers but also storage / network controllers or
> blade chassis. Right now we are focused on a standard server but we are
> trying not to design ourselves into a dead-end.

We're wokring on Rack control solution: several boards that talks to nodes (BMC),
collect sensors, drive fans wall and do rack power capping.
As a further move – replace BMC,but it is more difficult task.
There are BIOS integration and ME interaction. KVM part is solvable: virtual USB hub + usb gadgets
and Spice server with Aspeed video frames decoder.

>
>>  As a system base we choose OpenWRT (flexible kernel-style configurations, package manager,
>>  wide and experienced support for embedded systems with limited resources).
>
> Is there a technical advantage that you see by using OpenWRT for your
> project or just a familiarity? A few of us have worked on another
> project that used Buildroot which is very similar to OpenWRT, but
> settled on Yocto for this project. Yocto certainly has a steeper
> learning curve, but it has much better support for "overlays" than
> Buildroot/OpenWRT; that solves a major problem we had collaborating with
> others on the Buildroot-based project.

I found it more intuitive as a build system. Very flexible and a number of makefile helpers
to extend functionality. Also, there is out-of-the box an user Web interface (LuCI).
We mostly focused on target system size and minimum system processes.
Current installation takes just 5M (kmods, ipmitool, nginx, lua, memcached) + kernel (2.5M).

What are the issues with overlays in OpenWRT comparing to Yocto?

>>  4. LuaJIT + Nginx as a HTTP API backend instead of python/micropython.
>>      We're on internal dissccusion of the API as a mainstream replacement for IPMB/IPMI.
>>      We use local memcached for fast serving data.
>
> Our current API is REST-based but it is a simple introspection of the
> dbus objects presented by our userspace applications. All interprocess
> communication is done through well-defined dbus interfaces and we simply
> expose those out to the user via REST.

We're going to expose ubus methods via HTTP. Registered modules (also written in Lua) expose
their methods to the ubus. Events such as Node replacement or other are going through the ubus.

> We also intended for this to be a replacement for IPMI, but there seems
> to be a lot of resistance to that due to Redfish being very similar in
> goals.

From the first look Redfish feels like a WBEM/CIM but use JSON instead of XML.
Too much overloaded to make simple requests.
API have to be kept simple as much as possible.

> We are not necessarily stuck on the python implementation, but would
> need to understand the CPU vs flash space trade-off. Most server BMCs
> have very limited flash space (32MB of NOR flash) so that is our largest
> constraint.

Python waste the space dramatically (not fit 16M).
LuaJIT is only 340k + 340k lib. Plus several bin OpenWRT modules (~100k).
We fit 16M and have several free megs in overlay JFFS2 part.
Lua is a tradeoff between low-level languages such as C (and very easy to write bindings via FFI)
and scripting languages with ability to modify-and-run during development on the target system.

> Your use of memcached does spark an interesting optimization in my mind
> for our dbus-based REST server though. We could do something similar to
> cache the state of internal dbus objects and flush the cache based on
> the object-changed dbus signals.

Yeap. On node replace we're flushing records belongs to the node. All software that need current
sensors data have to request them from memcached instead of directly poll the sensors.

> That sounds significantly more performant. Do you happen to know the
> disk space requirements of this config?

Nginx+LuaJIT takes 860k + 340k shared luajit lib, libpcre (240k), libcrypto (1M) for SSL.
On compressed FS (squashfs + lzma) it takes much less.

-- 
Anton D. Kachalov
