Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B50AC1A0023
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 16:52:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 8A71C140D72
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2015 16:52:30 +1100 (AEDT)
Subject: Re: [PATCH rest-dbus] Add supporting files
To: openbmc@lists.ozlabs.org
References: <1444262679-18773-1-git-send-email-patches@stwcx.xyz>
 <1444262679-18773-2-git-send-email-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <5616049D.8090804@ozlabs.org>
Date: Thu, 8 Oct 2015 13:52:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1444262679-18773-2-git-send-email-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8; format=flowed
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
X-List-Received-Date: Thu, 08 Oct 2015 05:52:30 -0000

Hi Brad,

> +PACKAGE=rest-dbus
> +
> +prefix?=/usr/local
> +bin=$(prefix)/usr/bin
> +share=$(prefix)/usr/share/$(PACKAGE)
> +srv=$(prefix)/lib/systemd/system/

We have /usr/ duplicated there in $(bin) and $(share).

You probably want this to work with

  make prefix=/usr libdir=/lib

and so using standard path names, this would be

  prefix ?= /usr/local
  bindir ?= $(prefix)/bin
  libdir ?= $(prefix)/lib
  datarootdir ?= $(prefix)/share
  pkgdatarootdir ?= $(prefix)/share/$(PACKAGE)
  servicedir ?= $(libdir)/systemd/system/

> -    resource_base = 'resources'
> +    resource_base = '/usr/share/rest-dbus/resources'

.. but this breaks if we use a different prefix. How about:

resource_base = os.path.join(os.path.dirname(__file__),
         os.pardir, 'share', 'resources')

- which still depends on pkgdatarootdir & bindir, but they're much less 
likely to be altered than prefix.

Also: generally, the systemd service definitions are part of the 
distribution, rather than upstream. Should we be putting that in the 
recipe instead?

Cheers,


Jeremy
