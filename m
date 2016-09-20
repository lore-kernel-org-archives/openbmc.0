Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdQcS5bsCzDsfd
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 11:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=dVYWBlOm; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5CC076410C6;
 Mon, 19 Sep 2016 20:47:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nqhWzj6kuwYC; Mon, 19 Sep 2016 20:47:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8B9A064113E;
 Mon, 19 Sep 2016 20:47:31 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 8B9A064113E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474336051; bh=/40wjgUX7ccsrQlRQtHt5ZIhBN+7eIjz4iSlro/0JjQ=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=dVYWBlOm9rmUbO6NdHxcL5ZD80Gkl7nIDogSBCQKLbFa6rEZbbsgRcIPT+atvnPJp
 rK5XvLKxuI1RJhIw+WDQ1aIiFQUpx/XuQia5mKtdH9k/Thoe9GcKX+x6/GdFMXMqHh
 fwWXEbST+f0yJWd6dreAuvUh9/IhhZqysD4oH0S8=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id icYSkk5P2DJP; Mon, 19 Sep 2016 20:47:31 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 23B74640F6D;
 Mon, 19 Sep 2016 20:47:31 -0500 (CDT)
Message-ID: <57E09533.9020702@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 20:47:31 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Andrew Jeffery <andrew@aj.id.au>
CC: openbmc@lists.ozlabs.org
Subject: Re: [PATCH 03/19] Ensure that the old style MDIO interface is active
References: <1035223108.1714.1474325416863.JavaMail.zimbra@raptorengineeringinc.com>
 <1474331367.13249.72.camel@aj.id.au>
In-Reply-To: <1474331367.13249.72.camel@aj.id.au>
X-Enigmail-Version: 1.1.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2016 01:47:37 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/19/2016 07:29 PM, Andrew Jeffery wrote:
> I've had a look at this patch from your git repo on github. Whilst git-
> send-email is changing the patch in ways you're not expecting, it's
> because your commit message isn't formatted in the manner expected by
> git's tools. Your object looks like:
> 
>     ftgmac100: Enable old-style MDIO interface
> 

Good catch.  Today was fairly hectic on this end and I had a grand total
of a couple of minutes to look into the problem. :-)

> Separately, I had some questions on the v1 of the patch. Can you
> pleaserespond to those?

Sure!  From a high level, this driver does not support anything other
than the old-style MDIO interface.  The hardware sets the new-style bit
when support is available, so the driver itself should be able to
determine which style of interface to use at runtime (in theory).

> Hope that helps,
> 
> Andrew



- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4JUzAAoJEK+E3vEXDOFbmKoH/Ay2cGaQ4U9VlayODUiqUrcY
RAyG6iC1iHFxooPKKWqZiNMPcbey+Of1Eq+t2jKn0P5RDRo/8nwXiakJrkr+NmJc
j+nM96i9eTbg4bA3cdk7aGaVd7jjmAeoqK3Fz64ansYYD55rlynfrCZli1zYZgkC
3rf22JP6A6H/ibshLHjjawZF5mU9p+ngv0iYMyryK5sBzXWGXrZAfc7xmBR9fXpA
yZbhFzwL4CnbLSclWvx/wMoTMejrDe3V4n/7XGrNZFspt6jt1WkjrmMIDQcJUPnq
PYqZmBowsi9EsAMufUKhZ4WQcHfJKMMFG90m3PXdkJyD85qX3c5PvJ77aZYa4sQ=
=vN3E
-----END PGP SIGNATURE-----
