Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdRGJ703BzDsTW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 12:16:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=I8nYeV9X; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8159464114A;
 Mon, 19 Sep 2016 21:16:54 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id E20Tn7vTHT9R; Mon, 19 Sep 2016 21:16:53 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8F1C16410BB;
 Mon, 19 Sep 2016 21:16:53 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 8F1C16410BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474337813; bh=4NyGvBuAReVw9cK9klQGyJK7ahBLomfFMWaqGnCxGIA=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=I8nYeV9XWYkqNr+fjiEoGmWZxrM9m8tSITJ0TB0YfMO1zvzi57hcij25qC4VELSq1
 Jpkw52OiEaSy8NwM1TJmFospoBK/RaG9/58NNo5PZJxNBMFqGGJTnGecSFhgzk3Z9a
 y8gkR3A/5ZnJ/R9Iq00MrEiIYNya1zQv0xghbg7I=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7637MEXNc5-Y; Mon, 19 Sep 2016 21:16:53 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 1FF81640BC6;
 Mon, 19 Sep 2016 21:16:53 -0500 (CDT)
Message-ID: <57E09C15.7030501@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 21:16:53 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Andrew Jeffery <andrew@aj.id.au>
CC: openbmc@lists.ozlabs.org
Subject: Re: [PATCH 03/19] Ensure that the old style MDIO interface is active
References: <1035223108.1714.1474325416863.JavaMail.zimbra@raptorengineeringinc.com>	
 <1474331367.13249.72.camel@aj.id.au>	
 <57E09533.9020702@raptorengineeringinc.com>
 <1474337647.13249.76.camel@aj.id.au>
In-Reply-To: <1474337647.13249.76.camel@aj.id.au>
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
X-List-Received-Date: Tue, 20 Sep 2016 02:16:57 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/19/2016 09:14 PM, Andrew Jeffery wrote:
> Yes, so if we continue down this road we can remove the hack in the
> board file for the ast2500 evb. I guess that can be a separate patch
> dependent on this series. Then if/when we add support to the driver for
> the new MDIO interface we can add a new compatible string.
> 
> Andrew

Sounds reasonable to me.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4JwSAAoJEK+E3vEXDOFbICsIALB6VDRdAdPfUp78x9eNhTGY
n/iyDINqMfWeJjuqTXqwydHbOZ6LTa5RxoozZ4vV4KyZCpLXllkULacDN14uQ+a3
mC3+F8DMJ+4fkveK9lRu/BbHF15itwfJouOevLWwd7bGIphL3Un2nZHvZXd2uU1u
n0gn3UaO0dgc4T7EZOGYUXN4ghb9HG3UMol2u2ywLv4aFBafWggrffNKLANxiRDD
E4ZJfENvjXuDuuTEiuMsZ0KcHTm5cASi7SnOmPKsnrRQA+jUZ893Czzmls0vAqTl
92bl5r/mOhs/ogrMA+shPbh2HCI+YvNknuEPfsq2odiQ/UeQ5su2T6oLF/yG2Os=
=3wac
-----END PGP SIGNATURE-----
