Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdLfn6sM6zDsWf
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 08:49:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=lPsaQXw9; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C661C641138;
 Mon, 19 Sep 2016 17:49:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id tOVstRggF17y; Mon, 19 Sep 2016 17:49:13 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3745E6410D5;
 Mon, 19 Sep 2016 17:49:13 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 3745E6410D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474325353; bh=21awb+OfuG0EIkC5/8VSEnMPgSv93XigsMoRnEEXZV8=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=lPsaQXw9ir9Xg9TCWU3IepH/jJTG0G74dC8kZZ42QfwBH0cwtIeRLjI9p5/nct+v3
 DS6wL0WaFXSI5TemggDI9LG1tpLPre4fL9KuYlSpP/4wPExdwOUtgTYmaSwC3AsJKH
 1+EoeQJsqB760345zv5AJS+WWOwGbR+PALrUlEqM=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RIFvasWT56kk; Mon, 19 Sep 2016 17:49:12 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id CEA0B641064;
 Mon, 19 Sep 2016 17:49:12 -0500 (CDT)
Message-ID: <57E06B68.6080205@raptorengineeringinc.com>
Date: Mon, 19 Sep 2016 17:49:12 -0500
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
X-List-Received-Date: Mon, 19 Sep 2016 22:49:22 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/18/2016 07:51 PM, Andrew Jeffery wrote:

I'm going to manually re-send this.  git send-email was the problem.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX4GtmAAoJEK+E3vEXDOFbOucIAJfGO7qJULaG1hMhHOZmFI+2
axC2eMgGKVAbCMVlcRpfiPH9ekKvQTrIdhdDheOVuOkliLPoxSlJWTMXFwfZuA2q
REGT93tJNASxjSyuHKOIAXi+DON8t5NF4sQpdpZ5yiQm6vmwjplGstuNRTStaf2Z
SznyxvEvhpdmg/0TleqFnZ6qFspjWMe26VXX36emupakf7Rbn3Z5gpa2J9CKUhNP
ETXdXGryQqXMenZBbzCBMLWK/L/56jGF+Py+zgPA64TGlNxTgWA9eE1qXCFl0zV1
z8lRocXLNmxk9Q6IkmzYaiuECL5+i93H+mJNP87aY7g0I6MmXjWQamTkf+1gmNg=
=BG38
-----END PGP SIGNATURE-----
