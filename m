Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdBz30qwQzDsd9
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 03:02:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=JDUL1Dse; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3D856641116;
 Mon, 19 Sep 2016 12:02:49 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id zTdtlyU2ik6C; Mon, 19 Sep 2016 12:02:48 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DE591641135;
 Mon, 19 Sep 2016 12:02:47 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com DE591641135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474304567; bh=U+uSucmXy9TUXlUfcYE0Qz6ZFr4Y21Z/9Nk1YW0uzvM=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=JDUL1Dseb224XMiG+0YrwJX5KGHSJE0/yuNQJP1tWVGYfLIZ+RTm/J2DfKV6BP78a
 5ssp3IQLwBm7ktjcFiMSjInqQ5zrZ7g643dTW8EbB0PlWRJPio6WxSC3Nr58njSK00
 J0lqksxDCl+KtIFZj1YPkbAFiFC5C3T5154uMnuo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NzUOG2IEFn2K; Mon, 19 Sep 2016 12:02:47 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 5D380640E72;
 Mon, 19 Sep 2016 12:02:47 -0500 (CDT)
Message-ID: <57E01A37.7060103@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 12:02:47 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Andrew Jeffery <andrew@aj.id.au>
CC: openbmc@lists.ozlabs.org
Subject: Re: [PATCH 03/17] Ensure that the old style MDIO interface is active
 before registering the MDIO bus on Faraday style MACs. Without this
 patch
 the hardware may continue to expect new style commands, yielding MDIO timeouts
 and general lack of communication with the MII.
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>	
 <1474058133-27363-4-git-send-email-tpearson@raptorengineering.com>
 <1474246308.13249.46.camel@aj.id.au>
In-Reply-To: <1474246308.13249.46.camel@aj.id.au>
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
X-List-Received-Date: Mon, 19 Sep 2016 17:02:56 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/18/2016 07:51 PM, Andrew Jeffery wrote:
> It looks like your entire commit message went into the subject...

That's what I get for using git format-patch and git send-email.  I
can't wait to find out how those tools managed to mess this one up...

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4BozAAoJEK+E3vEXDOFbqXgIAItU2ZYI+pgsGQbyGYpX2z6T
dhKgJVnu+giiShEUTt9v5Jf/bhqSyjlZ+IL0tcHOmu8jpw93/JXIUTfAUxEM3j2a
T4SlWJxBhCSyDy2ppJK4DMuoyung1DBWYV0M3nq3H+C87Zv6rMBzfEGKCX5DN7oV
k4jjN9m+V1QM5hdgxQkGNfpN8pnr/q11Ao0a+birGWXA/zmovkhSNWf4Mia3rmG4
jkkzQYWJ0xd/t/GvTaAJIIVKN/Uxa14iX85XLLjiqG2LcB6NS9DyCylCM/+UqDx3
J+L9IhoiTss/56cyHkutaGwtKFMDiMPtUA87YwR9m4kSLPlrhUFTKyVuDCsTVME=
=A33o
-----END PGP SIGNATURE-----
