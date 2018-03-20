Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4059062k2lzF1Tw
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 21:58:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="eoynMRXw"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 4059051V49z9sCD;
 Tue, 20 Mar 2018 21:58:29 +1100 (AEDT)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1521543509; bh=qqi+y0tng9eeai0aWVcLS71oYurwOdxqeh7BmWCMav0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=eoynMRXwMoB+mNdYYdj3FGsLrujFX72TSqjRjpBUNW4bmjz/0wJrhFJIEGpK1eENP
 wEvYTLFUrqrRPnHvQiyLDFdPimw/Ez9fgDB2EST/Kg6BUtN8hQ1TRZflWAJ0M73YKt
 uJjOts7sGYLJD1++ue2LTw5oTGR0Htyz3/PBzqr42dBAtWSF92qzCohz4oV4BWxvct
 OlcGriHhBr7IlWf5eDZuTOAXDkCiKpK4WZM13tfqdpS6EtlfuSfJI0/ErPTHyqK2Bc
 zHMI/zx/Ql6BMStOb+3PPYgX37xsHGfrOz7CXuWQWD4QtwMytAZk+eAM9nYhPMk6n7
 jr5rJERqZgkrA==
Subject: Re: IPMI SOL performance
To: Tom Joseph <tomjose@linux.vnet.ibm.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <32dafbf5-2568-a85a-ad3b-abd8242bf251@ozlabs.org>
 <f1d1091d-6019-1839-ad61-148c69b32b16@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <66e35c0d-4baa-e7c7-87db-60a6edd77bc3@ozlabs.org>
Date: Tue, 20 Mar 2018 18:58:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f1d1091d-6019-1839-ad61-148c69b32b16@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2018 10:58:32 -0000

Hi Tom,

> The accepted character count field in the SOL payload is what the
> client(ipmitool) uses to acknowledge to BMC.
> Since this is a 1 byte field, so the maximum SOL character data is
> restricted to 255.

Yep, but are you sure you're sending packets of the maximum size?

> Is it guaranteed that the Petitboot menu option will be shown only after
> the obmc-console-server,
> reads it from the VUART?

Not at all. The petitboot process has no idea what's happening on the
BMC. Same with all other console-based processes on the host system.

> When does the petitboot menu timeout begin?

As soon as the first default-bootable option is found.

> One possible option is to put a limit on the buffer size and read from
> the socket only when the buffer is within that limits.

Yep, there's no real need for the IPMI SoL infrastructure to do any
output buffering at all. If your maximum packet size is 255 bytes, just
read a maximum of 255 bytes from the obmc-console socket.

However, we should still see what's slowing down the IPMI SoL data.
10-15 minutes for it to drain is *very* slow.

> The trade-off
> would be ssh based console would output at the speed of IPMI.

That would only be a concern if:

 - both IPMI and SSH clients are connected to the unix domain socket at
   the same time (does the IPMI SoL process connect to the obmc-console
   socket if no clients are connected over the network?)

   and

 - we've filled up the 16kB burst-buffer in the obmc-console-server
   process

So, I'd say we're fine there.

Regards,


Jeremy
