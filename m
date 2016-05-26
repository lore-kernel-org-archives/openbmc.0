Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFY0H0PvvzDqPP
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 12:25:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3rFY0G5dBpz9sCj;
 Thu, 26 May 2016 12:25:34 +1000 (AEST)
Subject: Re: [PATCH openpower-host-ipmi-oem v2] Fix endianness issue5
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <20160526020044.1213-1-openbmc-patches@stwcx.xyz>
 <20160526020044.1213-2-openbmc-patches@stwcx.xyz>
Cc: Nan Li <bjlinan@cn.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <57465E9E.2000502@ozlabs.org>
Date: Thu, 26 May 2016 10:25:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20160526020044.1213-2-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 26 May 2016 02:25:35 -0000

Hi Nan,

You seem to have a minor typo in the commit title there.

> -	// TODO: Issue 5: This is not endian-safe.
> -	short *recid  =  (short*) &reqptr->selrecordls;
> -	short *offset =  (short*) &reqptr->offsetls;
> +
> +	unsigned short recid  =  ((unsigned short) reqptr->selrecordms) << 8 + reqptr->selrecordls;
> +	unsigned short offset =  ((unsigned short) reqptr->offsetms) << 8 + reqptr->offsetls;

That won't do the endian conversion correctly. Can you use one of the
existing endian conversion functions?

The le16toh() function is probably what you want here, from endian.h.

Also, be careful of the change from 'short' to 'unsigned short'.

Regards,


Jeremy
