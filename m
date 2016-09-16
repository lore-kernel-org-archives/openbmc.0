Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbGxp5hLYzDscK
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 23:55:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=Vcp8Z2v3; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4CF2E6403C4;
 Fri, 16 Sep 2016 08:55:07 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id j5vICZLx0nWo; Fri, 16 Sep 2016 08:55:05 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9043264100A;
 Fri, 16 Sep 2016 08:55:05 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com 9043264100A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474034105; bh=aUuCcOdSK5sE0m4zR7uOjEfB5MyVTr8ritdW5fYIKcE=;
 h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
 Content-Transfer-Encoding;
 b=Vcp8Z2v3yNTRkOaQ4sM9fuDlZYmi6CVH/9jn2UqbTyrkFfyU7GnUlYsdaEYjUBhc2
 BXFJcIMmJiSOreLvumziDUvcQgoyU6tBkP+WwE77rR/hQMVYjLToheFmtCh8y84Ikw
 1ZqLp2Z3Ji/jNE3d5MykSvg9JGh0+wF6kneJBsGs=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id n3QllUNl1Alz; Fri, 16 Sep 2016 08:55:05 -0500 (CDT)
Received: from [192.168.3.54] (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id ED47B6403C4;
 Fri, 16 Sep 2016 08:55:04 -0500 (CDT)
Message-ID: <57DBF9B8.7010006@raptorengineeringinc.com>
Date: Fri, 16 Sep 2016 08:55:04 -0500
From: Timothy Pearson <tpearson@raptorengineering.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
 rv:1.9.2.9) Gecko/20100922 Thunderbird/3.1.4
MIME-Version: 1.0
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 01/16] phy/broadcom: Add support for the BCM54210E
References: <1494847539.194617.1473971583386.JavaMail.zimbra@raptorengineeringinc.com>
 <CACPK8XcGEsqscPuEFdB++6RO5RL-6StDs7f3WkzsE00gZO_zuQ@mail.gmail.com>
In-Reply-To: <CACPK8XcGEsqscPuEFdB++6RO5RL-6StDs7f3WkzsE00gZO_zuQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Sep 2016 13:55:11 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09/15/2016 08:36 PM, Joel Stanley wrote:
> Is this the patch that I authored? If you have confirmed that it
> works, I will send it upstream.

Yes it is.  My GIT Email workflow didn't preserve the authorship
information, but the correct authors are indicated on the GitHub branch
these patches were pulled from.  I have since been informed on the
correct way to indicate authorship and will be updating the workflow to
match.

- -- 
Timothy Pearson
Raptor Engineering
+1 (415) 727-8645 (direct line)
+1 (512) 690-0200 (switchboard)
https://www.raptorengineering.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJX2/m2AAoJEK+E3vEXDOFbgG8H/ivEq/4S+SV+zudFV2xCDXb+
tVyJoruDhMmFrnR2PAv/WZ00Vnczil4/l0KF1kpaTPub/0gpmxgL1TP94FK090Oh
DZ8vmNZ4L+KtmW8Q2jN2zpDkf2Y3uR9Ss7vwCo5vOjJOoV04hpdQvTNSBB58swqD
lj4iNfO6BU9pJ/cisjPpW6bFLH4I5nDz2NobhFMINk44L1NZT8j43maY4PYeDJkN
ti/22T5RIFfvjrJld4JgCPA69Qlqycv/ohLYJc8ofsFa8ThQt78sxB01LbxXqPPM
vkWc3pxHIfAYOrCfXDfjwjg0IEYEdlX3NVdtQTKtIqA+q51fbZIRXr4TqC/QASE=
=48e0
-----END PGP SIGNATURE-----
