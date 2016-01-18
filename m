Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 34EAC1A18A9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jan 2016 11:51:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id CC48D140662;
 Mon, 18 Jan 2016 11:51:58 +1100 (AEDT)
Subject: Re: [PATCH docs] Add dbus method cold_reset() for bmc dbus object
To: openbmc@lists.ozlabs.org, adamliyi@msn.com
References: <1452868210-23453-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1452868210-23453-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <569C372C.7020605@ozlabs.org>
Date: Mon, 18 Jan 2016 08:51:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452868210-23453-2-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Mon, 18 Jan 2016 00:51:59 -0000

Hi,

Thanks for your update to the docs repository, this is great to have.

A couple of points for general OpenBMC contributions though:

 - Can you use your real name as the author of this patch? If you
   set your git user.name config variable, your commits will
   have the correct info set:

      git config --global user.name "Your Name"

   Then, you can update this commit with:

      git commit --amend --author='Your Name <adamliyi@msn.com>'


 - We'll need a 'Signed-off-by:' line to indicate that your
   contributions are okay to include in the open-source projects
   used in OpenBMC. This will be something like:

     Signed-off-by: Your Name <adamliyi@msn.com>

   Same as above: you can add this to your existing commit
   using `git commit --amend`.

These are in the (new) contribution guidelines, up at:

  https://github.com/openbmc/docs/blob/master/contributing.md

Cheers,


Jeremy


On 15/01/16 22:30, OpenBMC Patches wrote:
> From: adamliyi <adamliyi@msn.com>
> 
> ---
>  dbus-interfaces.md | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/dbus-interfaces.md b/dbus-interfaces.md
> index 28fe410..7dee30f 100644
> --- a/dbus-interfaces.md
> +++ b/dbus-interfaces.md
> @@ -151,4 +151,11 @@ properties:
>  
>    *  `state`
>  
> +# BMC
> +
> +## `/org/openbmc/control/bmc/bmc0`
> +
> +methods:
> +
> +  *  `cold_reset()`
>  
> 
