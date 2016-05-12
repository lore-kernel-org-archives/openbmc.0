Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r56KQ6CnBzDqCm
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 18:56:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3r56KQ32H5z9sds;
 Thu, 12 May 2016 18:56:10 +1000 (AEST)
Subject: Re: [PATCH docs] Take a stab at a proper DBUS API document.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <1462996814-824-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1462996814-824-2-git-send-email-openbmc-patches@stwcx.xyz>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Andrew Jeffery <andrew@aj.id.au>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <57344529.8020901@ozlabs.org>
Date: Thu, 12 May 2016 16:56:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462996814-824-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 12 May 2016 08:56:10 -0000

Hi Brad,

This is awesome, thanks for taking the time and writing up the proper
content here.

Since your change will establish a few conventions around how the
interfaces will be properly documented, I'm being extra-nitpicky about
this, so have a few changes listed below. If you'd prefer, I can do this
reformatting myself, but we should still address this somehow, before
merging.


> +# OpenBMC DBUS API

Most of the other docs use the ====/---- style of for level 1 & level 2
headers, as it makes the text version of the markdown look more like a
header.

> +The Phosphor distibution provides sample applications that implement off all the interfaces and objects listed below.  Alternative or more feature complete applications are possible by implementing parts of this DBUS API.

Can we wrap at 80 columns, where it makes sense? Things that *need* to
be wider are fine, but this makes things readable for folks who use
80-cols by default.

> +| name         | in signature | out signature | description                              |
> +| ------------ | ------------ | ------------- | ---------------------------------------- |
> +| sendMessage  | yyyyyay      | x             | Send an IPMI message to the host processor firmware. |

Should we backtick-escape these names (and paths)? It'll also avoid any
issues with inline < and > characters (which Chris picked up in his
review).

Looks like this table format is also compatible with the pandoc markdown
implementation, which is great news if/when we want to create a PDF
document including this.

Speaking of which, pandoc also supports a few different methods of doing
tables, some of which allow us to break long lines (which may make the
text-format of the doc easier to read):

  http://pandoc.org/README.html#tables

However, if we do end up using one of these, we'll need to check that it
still renders correctly in github.

Cheers,


Jeremy
